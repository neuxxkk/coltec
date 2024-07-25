class Route{
  int lines, cols;
  int startX, startY;
  int verticesNum; //quantidade de blocos presentes na tela
  float[][] adjMatrix;
  int destinyV, originV;
  ArrayList<Integer> path;
  
  public Route(int[] origin, int[] destiny, char m){
    this.path = new ArrayList<Integer>();
    setLimits();
    traceRoute(origin, destiny, m);
  }
  
  void setLimits(){
    int fromX = routePos[0][0], toX = routePos[1][0];
    int fromY = routePos[0][1], toY = routePos[1][1];
    int minRange = chunkSize/tileSize;
    
    this.startX = (fromX <= toX) ? fromX - minRange : toX - minRange;
    int lastX = (fromX <= toX) ? toX + minRange : fromX + minRange;
    
    this.startY = (fromY <= toY) ? fromY - minRange : toY - minRange;
    int lastY = (fromY <= toY) ? toY + minRange : fromY + minRange;
    
    this.cols = lastX - this.startX;
    this.lines = lastY - this.startY;
    this.verticesNum = this.lines * this.cols;
    println(startX, startY, cols, lines);
  }
  
  void traceRoute(int[] origin, int[] destiny, char m){
    setAdjMatrix(origin, destiny);
    generateAdjMatrix();
    if (m == 'a') aStar();
    if (m == 'd') dijstraka();
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
  
  void setAdjMatrix(int[] origin, int[] destiny){
    this.adjMatrix = new float[verticesNum][verticesNum];
    this.originV = getVertice(origin[0], origin[1]);
    this.destinyV = getVertice(destiny[0], destiny[1]);
  }
  
  void generateAdjMatrix(){    
    for (int i=0; i<verticesNum; i++){
      for (int j=0; j<verticesNum; j++){
        float vi = map.getTileValue(getGridX(i), getGridY(i));
        float vj = map.getTileValue(getGridX(j), getGridY(j)); //cálculo para obter elemento em grid a partir de um valor iterador
        vi = (vi==6) ? 1 : vi;
        vj = (vj==6) ? 1 : vj;
        if (((abs(getGridX(i) - getGridX(j)) == 1 && getGridY(i) - getGridY(j) == 0) || (abs(getGridY(i) - getGridY(j)) == 1 && getGridX(i) - getGridX(j) == 0) ) && adjMatrix[i][j]==0 && (player.allowedTiles.contains(int(vi)) && player.allowedTiles.contains(int(vj)))){ //ligação entre mesmo elemento, vizinhos, se for agua tem q ter barco
          adjMatrix[i][j] = ((vi + vj) / 2) + 1; //média dos pesos de dois vértices gera peso de aresta, TileValue+1
          adjMatrix[j][i] = adjMatrix[i][j];        
        }
      }
    }
  }

  void dijstraka(){
    float [] dist = new float[verticesNum];
    int [] anterior = new int[verticesNum]; 
    Arrays.fill(dist, Float.POSITIVE_INFINITY); 
    Arrays.fill(anterior, -1);

    dist[originV] = 0;
    float[] Q = new float[verticesNum];
    
    done: for (int k = 0; k<verticesNum; k++){
      int u=-1;
      float udist = Float.POSITIVE_INFINITY;
      
      for (int v = 0; v < verticesNum; v++){
        if(Q[v] == 0 && dist[v] < udist){
          u = v;
          udist = dist[v];
        }
      }
      
      u = abs(u);
      
      Q[u] = 1;
      for (int v = 0; v < verticesNum; v++){
        if(u==v || adjMatrix[u][v] == 0) continue;
        
        float alt  = udist + adjMatrix[u][v];
        
        if(alt < dist[v]){
          dist[v] = alt;
          anterior[v] = u;
          
       if (v == destinyV){
        while (v != -1){
          path.add(v);
          v = anterior[v];
        }
        Collections.reverse(path);
        break done;
      } 
          
        }
      }
    }
  }
  
  void aStar() {
        // lista aberta
        PriorityQueue<float[]> queue = new PriorityQueue<>(Comparator.comparingDouble(a -> a[0]));
        queue.add(new float[]{0, originV});

        float[] dist = new float[verticesNum];
        int[] anterior = new int[verticesNum];
        Arrays.fill(dist, Float.POSITIVE_INFINITY);
        Arrays.fill(anterior, -1);
        
        dist[originV] = 0;
        
        done: while (!queue.isEmpty()) {
            // pega o vertice da queue com menor dist (vertice, dist)
            float[] current = queue.poll();
            int currentNode = (int) current[1];

            // chegou no destinyV
            if (currentNode == destinyV) {
                while (currentNode != -1) {
                    path.add(currentNode);
                    currentNode = anterior[currentNode];
                }
                Collections.reverse(path);
                break done;
            }

            // marca na lista "fechada"
            dist[currentNode] = current[0];

            // itera sobre vizinhos do nó atual
            for (int neighbor = 0; neighbor < verticesNum; neighbor++) {
                if (adjMatrix[currentNode][neighbor] > 0) { // se tiver conexão
                    // calcula tentativa do vizinho até origem, atualDist mais distAtéVizinho
                    float tentativedist = current[0] + adjMatrix[currentNode][neighbor];

                    // se tentativa for menor que vizinhoDist (até origem) atualize
                    if (tentativedist < dist[neighbor]) {
                        dist[neighbor] = tentativedist;
                        anterior[neighbor] = currentNode;
                        queue.add(new float[]{tentativedist + sqrt(pow(getGridX(neighbor) - getGridX(destinyV), 2) + pow(getGridY(neighbor) - getGridY(destinyV),2)), neighbor});
                        // euclidian heuristic
                    }
                }
            }
        }
    }

  void display(){
    fill(255, 100, 100, 230);
    for (int i : path){
      if (i!=destinyV) ellipse(map.screenPosX(getGridX(i)), map.screenPosY(getGridY(i)), tileSize/3, tileSize/3);
    }
  }
  
  void makeWay(){
      ArrayList<Integer> movs = new ArrayList<>();
      int m=0;
    for (int i=0; i < path.size(); i++){
      int nowX = getGridX(path.get(i)), nowY = getGridY(path.get(i));
      int lastX = (i > 0) ? getGridX(path.get(i-1)) : -1, lastY = (i > 0) ? getGridY(path.get(i-1)) : 0;
      if (lastX == nowX) m = lastY - nowY;
      else if (lastY == nowY) m = (lastX - nowX) * 2;
      if (i > 0) movs.add(m);
    }
    player.move(movs);
  }
  
    
  void off(){
    player.stop();
    onRoute = 0;
    routePos = new int[2][2];
    route = null;
    println("OffRoute");
  }
  
}
