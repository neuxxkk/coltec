import java.util.Collections;

class Route{
  int lines = height/tileSize + 1, cols = width/tileSize + 1; //quantidade de blocos em uma linha/coluna + 1
  int numVertices = lines*cols; //quantidade de blocos presentes na tela
  float[][] matrizAdj;
  int destinyV, originV;
  ArrayList<Integer> route;
  ArrayList<Integer> movs = new ArrayList<>();
  
  public Route(int[] origin, int[] destiny){
    this.route = new ArrayList<Integer>();
    traceRoute(origin, destiny);
  }
  
  void traceRoute(int[] origin, int[] destiny){
    if (player.allowedTiles.contains(map.getTileValue(origin[0], origin[1])) && player.allowedTiles.contains(map.getTileValue(destiny[0], destiny[1]))){
      setMatrizAdj(origin, destiny);
      generateMatrizAdj();
      dijstraka(originV, destinyV);
      //makeWay();
    }else{
      println("Block not allowed! Try again");
      println("OffRoute");
      onRoute = 0;      
    }
  }
  
  int getVertice(int gridX, int gridY){
    int startX = map.gridPosX(width/2)-width/tileSize/2;
    int startY = map.gridPosY(height/2)-height/tileSize/2;
    return  (gridX - startX) + ((gridY - startY)*cols);
  }
  
  int getGridX(int vertice){
    int startX = map.gridPosX(width/2)-width/tileSize/2;
    return startX + vertice%cols;
  }
  
  int getGridY(int vertice){
    int startY = map.gridPosY(height/2)-height/tileSize/2;
    return startY + int(vertice/cols);
  }
  
  void setMatrizAdj(int[] origin, int[] destiny){
    this.matrizAdj = new float[numVertices][numVertices];
    this.originV = getVertice(origin[0], origin[1]);
    this.destinyV = getVertice(destiny[0], destiny[1]);
  }
  
  void generateMatrizAdj(){    
    for (int i=0; i<numVertices; i++){
      for (int j=0; j<numVertices; j++){
        float vi = map.getTileValue(getGridX(i), getGridY(i));
        float vj = map.getTileValue(getGridX(j), getGridY(j)); //cálculo para obter elemento em grid a partir de um valor iterador
        vi = (vi==6) ? 1 : vi;
        vj = (vj==6) ? 1 : vj;
        if (((abs(getGridX(i) - getGridX(j)) == 1 && getGridY(i) - getGridY(j) == 0) || (abs(getGridY(i) - getGridY(j)) == 1 && getGridX(i) - getGridX(j) == 0) ) && matrizAdj[i][j]==0 && (player.allowedTiles.contains(int(vi)) && player.allowedTiles.contains(int(vj)))){ //ligação entre mesmo elemento, vizinhos, se for agua tem q ter barco
          matrizAdj[i][j] = ((vi + vj) / 2) + 1; //média dos pesos de dois vértices gera peso de aresta, TileValue+1
          matrizAdj[j][i] = matrizAdj[i][j];        
        }
      }
    }
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

    route.add(destino);
    int f = anterior[destino];
    do{
      route.add(f);
      f = anterior[f];
    }while (f >= 0);
    Collections.reverse(route);
  }

  void drawRoute(){
    fill(255, 100, 100);
    for (int i : route){
      int screenX = map.screenPosX(getGridX(i)), screenY =map.screenPosY(getGridY(i));
      float xCenter = screenX;
      float yCenter = screenY;
      float rectWidth = 5;
      float rectHeight = 20;
      if (i!=destinyV) ellipse(screenX, screenY, 5, 5);
      else if(i==destinyV){
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
  
  void makeWay(){
      int m=0;
    for (int i=0; i < route.size(); i++){
      int nowX = getGridX(route.get(i)), nowY = getGridY(route.get(i));
      int lastX = (i > 0) ? getGridX(route.get(i-1)) : -1, lastY = (i > 0) ? getGridY(route.get(i-1)) : 0;
      if (lastX == nowX) m = nowY - lastY;
      else if (lastY == nowY) m = (nowX - lastX) * 2;
      if (i > 0) movs.add(m);
    }
    player.move(movs);
  }
  
}
