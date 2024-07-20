import java.util.Collections;
class Route{
  float[][] matrizAdj;
  int origX, origY; //grid
  int destX, destY; //grid
  boolean checkData = false;
  int startX, startY, endX, endY;
  int lines, cols;
  int numVertices;
  int toV, fromV;
  ArrayList<Integer> ordem;
  
  public Route(){
    ordem = new ArrayList<Integer>();
  }
  
  void getXY(int x, int y){
    if (!checkData){
      origX = x;
      origY = y;
      checkData = true;
    }else{
      destX = x;
      destY = y;
      onRoute = false;
      generateMatrizAdj();
      print("OffRoute");
    }
  }
  
  int getVertice(int gridX, int gridY){
    return  (gridX - startX) + ((gridY - startY)*cols);
  }
  
  int getGridX(int vertice){
    return startX + vertice%cols;
  }
  
  int getGridY(int vertice){
    return startY + int(vertice/cols);
  }
  
  void generateMatrizAdj(){
    startX = origX-width/tileSize/2;
    startY = origY-height/tileSize/2; //origin(clique) - numero de tiles aparentes na tela
    endX = origX+height/tileSize/2;
    endY = origY+height/tileSize/2;
    lines = endY - startY + 1;
    cols = endX - startX + 1;
    numVertices = lines*cols;
    
    fromV = getVertice(origX, origY);
    toV = getVertice(destX, destY);
    
    print(getGridX(fromV), getGridY(fromV));
    
    matrizAdj = new float[numVertices][numVertices];
    
    for (int i=0; i<numVertices; i++){
      for (int j=0; j<numVertices; j++){
        float vi = map.getTileValue(getGridX(i), getGridY(i));
        float vj = map.getTileValue(getGridX(j), getGridY(j)); //cálculo para obter elemento em grid a partir de um valor iterador
        if (((abs(i-j)==1 && !(((j+1)%cols == 0 && i%(cols+1) == 0) || (i+1)%cols == 0 && j%cols == 0)) || abs(i-j)==cols) && matrizAdj[i][j]==0 && (player.allowedTiles.contains(int(vi)) && player.allowedTiles.contains(int(vj)))){ //ligação entre mesmo elemento, vizinhos, se for agua tem q ter barco
          matrizAdj[i][j] = ((vi + vj) / 2) + 1; //média dos pesos de dois vértices gera peso de aresta, TileValue+1
          matrizAdj[j][i] = matrizAdj[i][j];
          
          fill(0, 105, 0);
          rect(getGridX(i), getGridY(i), 10, 10);
          println("vi = (", getGridX(i), ", ", getGridY(i),") - ", vi);
          println("vj = (", getGridX(j), ", ", getGridY(j),") - ", vj);
          println("(",i,",",j,") = ", matrizAdj[i][j]); 
          
        }
      }
      //println(".");// start: superior esquerdo 
    }
    print(numVertices);
    dijstraka(fromV, toV);
    //println("FV: ",toV,"\ndX: ", destX, "\ndY: ", destY, "Sx: ", startX);
  }

    void dijstraka(int origem, int destino){
    float [] dist = new float[numVertices];
    int [] anterior = new int[numVertices];
    for (int v = 0; v < numVertices; v++){
      dist[v] = 1000000;
      anterior[v] = -1;
    }
  
    dist[origem] = 0;
    float[] Q = new float[numVertices];
    for (int k = 0; k<numVertices; k++){
      int u=-1;
      float udist = 1000000;
      for (int v = 0; v < numVertices; v++){
        if(Q[v] == 0 && dist[v] < udist){
          u = v;
          udist = dist[v];
        }
      }
      u = abs(u);
      Q[u] = 1;
      
      for (int v = 0; v < numVertices; v++){
        if(u==v || matrizAdj[u][v] == 0) continue;
        
        float alt  = udist + matrizAdj[u][v];
        
        if(alt < dist[v]){
          dist[v] = alt;
          anterior[v] = u;
        }
      }
    }

  ordem.add(destino);
  int f = anterior[destino];
  do{
    ordem.add(f);
    f = anterior[f];
  }while (f >= 0);
  Collections.reverse(ordem);
  for (int i : ordem){
    println(i);
    
  }
}

void drawRoute(){
  fill(255, 100, 100);
  for (int i: ordem){
    int screenX = map.screenPosX(getGridX(i)), screenY =map.screenPosY(getGridY(i));
    float xCenter = screenX;
    float yCenter = screenY;
    float rectWidth = 5;
    float rectHeight = 20;
    if (i!=fromV && i!=toV) ellipse(screenX, screenY, 5, 5);
    else if(i==toV){
      pushMatrix();
      translate(xCenter, yCenter);
      rotate(radians(45));
      rect(-rectWidth/2, -rectHeight/2, rectWidth, rectHeight);
      popMatrix();
      
      // Desenhar segunda linha diagonal do X
      pushMatrix();
      translate(xCenter, yCenter);
      rotate(radians(-45));
      rect(-rectWidth/2, -rectHeight/2, rectWidth, rectHeight);
      popMatrix();
    }
  }
}

}
