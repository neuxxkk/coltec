import java.util.Collections;
class Route{
  float[][] matrizAdj;
  int origX, origY; //grid
  int destX, destY; //grid
  boolean checkData = false;
  int startX, startY, endX, endY;
  int lines, cols;
  int numVertices;
  
  public Route(){
    
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
      generatematrizAdj();
      print("OffRoute");
    }
  }
  
  int getVertice(int gridX, int gridY){
    return  (gridX - startX) + ((gridY - startY)*(cols+1));
  }
  
  int getGridX(int vertice){
    return startX + vertice%cols;
  }
  
  int getGridY(int vertice){
    return startY + int(vertice/cols);
  }
  
  void generatematrizAdj(){
    startX = origX-3;//width/tileSize/2;
    startY = origY-3;//height/tileSize/2; //origin(clique) - numero de tiles aparentes na tela
    endX = origX+3;//height/tileSize/2;
    endY = origY+3;//height/tileSize/2;
    lines = endY - startY;
    cols = endX - startX;
    numVertices = lines*cols;
    
    int fromV = getVertice(origX, origY);
    int toV = getVertice(destX, destY);
    
    matrizAdj = new float[numVertices][numVertices];
    
    for (int i=0; i<lines*cols; i++){
      for (int j=0; j<lines*cols; j++){
        int vi = map.getTileValue(startX + i%cols, startY + int(i/cols));
        int vj = map.getTileValue(startX + j%cols, startY + int(j/cols)); //cálculo para obter elemento em grid a partir de um valor iterador
        if ((abs(i-j)==1 || abs(i-j)==cols+1) && matrizAdj[i][j]==0 && (player.allowedTiles.contains(int(vi)) && player.allowedTiles.contains(int(vj)))){ //ligação entre mesmo elemento, vizinhos, se for agua tem q ter barco
          matrizAdj[i][j] = ((vi + vj) / 2) + 1; //média dos pesos de dois vértices gera peso de aresta
          matrizAdj[j][i] = matrizAdj[i][j];
          
          /*fill(0, 105, 0);
          rect(map.screenPosX(startX + i%cols), map.screenPosY(startY + int(i/cols)), 10, 10);
          println("vi = (", startX + i%cols, ", ", startY + int(i/cols),")");
          println("vj = (", startX + j%cols, ", ", startY + int(j/cols),")");
          println("(",i,",",j,") = ", matrizAdj[i][j]); 
          */
        }
      }
      //println(".");// start: superior esquerdo 
    }
    //dijstraka(fromV, toV);
    println("FV: ",toV,"\ndX: ", destX, "\ndY: ", destY, "Sx: ", startX);
  }

    void dijstraka(int origem, int destino){
    float [] dist = new float[numVertices];
    int [] anterior = new int[numVertices];
    for (int v = 0; v < numVertices; v++){
      dist[v] = 100000000;
      anterior[v] = -1;
    }
  
    dist[origem] = 0;
    float[] Q = new float[numVertices];
    for (int k = 0; k<numVertices; k++){
      int u=-1;
      float udist = 10000000;
      for (int v = 0; v < numVertices; v++){
        if(Q[v] == 0 && dist[v] < udist){
          u = v;
          udist = dist[v];
          //println(u);
        }
      }
      
      if (u>=0) Q[u] = 1;
      else u =0;
      
      for (int v = 0; v < numVertices; v++){
        if(u==v || matrizAdj[u][v] == 0) continue;
        
        float alt  = udist + matrizAdj[u][v];
        
        if(alt < dist[v]){
          dist[v] = alt;
          anterior[v] = u;
        }
      }
    }
  ArrayList<Integer> ordem = new ArrayList<Integer>();
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
}
