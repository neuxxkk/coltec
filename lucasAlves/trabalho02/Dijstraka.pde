//class Route{
//    void dijstraka(int origem, int destino){
//    int [] dist = new int[numVertices];
//    int [] anterior = new int[numVertices];
//    for (int v = 0; v < numVertices; v++){
//      dist[v] = 100000000;
//      anterior[v] = -1;
//    }
  
//    dist[origem] = 0;
//    int[] Q = new int[numVertices];
//    for (int k = 0; k<numVertices; k++){
//      int u=-1;
//      int udist = 10000000;
//      for (int v = 0; v < numVertices; v++){
//        if(Q[v] == 0 && dist[v] < udist){
//          u = v;
//          udist = dist[v];
//        }
//      }
      
//      Q[u] = 1;
      
//      for (int v = 0; v < numVertices; v++){
//        if(u==v || matrizAdj[u][v] == 0) continue;
        
//        int alt  = udist + matrizAdj[u][v];
        
//        if(alt < dist[v]){
//          dist[v] = alt;
//          anterior[v] = u;
//        }
//      }
//    }
//  ArrayList<Integer> ordem = new ArrayList<Integer>();
//  ordem.add(destino);
//  int f = anterior[destino];
//  do{
//    ordem.add(f);
//    f = anterior[f];
//  }while (f >= 0);
//  Collections.reverse(ordem);
//  this.desenhar(ordem);
//}
//}
