import java.util.*;
// Definição da classe Grafo
class Grafo {
  ArrayList path;
  color colors[];
  int numVertices;
  PVector[] posicoes; // Posições das partículas (nós do grafo)
  HashSet<PVector> arestas; // Posições das partículas (nós do grafo)
  double density;
  PVector[] velocidades; // Velocidades das partículas
  final float raio = 10; // Raio dos nós
  final float k = 0.01; // Constante da mola para a atração
  final float c = 3000; // Constante de repulsão
  
  // Construtor da classe Grafo
  Grafo(int numVertices, double density) {
    this.numVertices = numVertices;
    this.density = density;
    posicoes = new PVector[numVertices];
    arestas = new HashSet<PVector>();
    velocidades = new PVector[numVertices];
    path = new ArrayList<Integer>();
    inicializarArestas();
    inicializarPosicoes();
    colors = guloso();
  }

  // Adiciona uma aresta entre dois vértices
  boolean adicionarAresta(int i, int j) {
    int [] ar = {i,j};
    Arrays.sort(ar);
    PVector arestaTmp = new PVector(i,j);
    if (!arestas.contains(arestaTmp) && i != j){
      arestas.add(arestaTmp);
      return true;
    }else return false;
  }

  // Inicializa as posições das partículas em um círculo
  void inicializarArestas() {
    for (int i=0; i<numVertices; i++){     
      while (!adicionarAresta(i, int(random(0, numVertices+1))));
      for (int j=0; j<numVertices; j++)if (random(1) <= density) adicionarAresta(i,j);
    }
  }
  
  // Inicializa as posições das partículas em um círculo
  void inicializarPosicoes() {
    float angulo = TWO_PI / (numVertices - 1);
    float raioCirculo = min(width, height) / 3;
    for (int i = 1; i < numVertices; i++) {
      float x = width / 2 + raioCirculo * cos((i - 1) * angulo);
      float y = height / 2 + raioCirculo * sin((i - 1) * angulo);
      posicoes[i] = new PVector(x, y);
      velocidades[i] = new PVector(0, 0);
    }
    // Posição fixa do vértice 0
    posicoes[0] = new PVector(width / 2, height / 2);
    velocidades[0] = new PVector(0, 0);
  }
  
  void atualizar() {
    for (int i = 1; i < numVertices; i++) {
      PVector forca = new PVector(0, 0);
      
      // Força de repulsão
      for (int j = 0; j < numVertices; j++) {
        if (i != j) {
          PVector direcao = PVector.sub(posicoes[i], posicoes[j]);
          float distancia = direcao.mag();
          if (distancia > 0) {
            direcao.normalize();
            float forcaRepulsao = c / (distancia * distancia);
            direcao.mult(forcaRepulsao);
            forca.add(direcao);
          }
        }
      }

      // Força de atração
      for (int j = 0; j < numVertices; j++) {
        PVector arestaTmp = new PVector(i,j);
        if (arestas.contains(arestaTmp)) {
          PVector direcao = PVector.sub(posicoes[j], posicoes[i]);
          float distancia = direcao.mag();
          direcao.normalize();
          float forcaAtracao = k * (distancia - raio);
          direcao.mult(forcaAtracao);
          forca.add(direcao);
        }
      }

      velocidades[i].add(forca);
      posicoes[i].add(velocidades[i]);

      // Reduz a velocidade para estabilizar a simulação
      velocidades[i].mult(0.5);

      // Mantém as partículas dentro da tela
      if (posicoes[i].x < 0 || posicoes[i].x > width) velocidades[i].x *= -1; 
      if (posicoes[i].y < 0 || posicoes[i].y > height)velocidades[i].y *= -1;
     
    }
  }
  
  color[] guloso(){
    color[] colors = new color[numVertices];
    color[] gula = new color[numVertices];
    
    int[] cores = new int[numVertices];
    boolean[] coresDisponiveis = new boolean[numVertices];
    
    Arrays.fill(cores, -1);

    // Iterar sobre todos os vértices
    for (int v = 0; v < numVertices; v++) {
        // Gerar uma cor aleatória e atribuir ao vértice
        colors[v] = color(random(0, 256), random(0, 256), random(0, 256));
        Arrays.fill(coresDisponiveis, true); // Resetar disponibilidade de cores

        // Iterar sobre todas as arestas
        for (PVector ar : arestas) {
            int u = -1;
            if (ar.x == v) u = int(ar.y);
            else if (ar.y == v) u = int(ar.x);

            if (u >= 0 && u < numVertices)
                if (cores[u] != -1)
                    coresDisponiveis[cores[u]] = false;
        }
        
        for (int corEscolhida = 0; corEscolhida < numVertices; corEscolhida++)
            if (coresDisponiveis[corEscolhida]) {
                cores[v] = corEscolhida;
                gula[v] = colors[cores[v]];
                break;
            }
    }
    return gula;
  }

  boolean temAresta(int v){
    for (int i=0; i<numVertices; i++) if (temAresta(i,v)) return true;
    return false;
  }
  
  boolean temAresta(int i, int j){
    int [] a = {i, j};
    Arrays.sort(a);
    PVector e = new PVector(a[0], a[1]);
    return arestas.contains(e);
  }

  void dijstraka(int origem, int destino){
    int [] dist = new int[numVertices];
    int [] anterior = new int[numVertices];
    
    Arrays.fill(dist, MAX_INT);
    Arrays.fill(anterior, -1);
  
    dist[origem] = 0;
    int[] Q = new int[numVertices];
    for (int k = 0; k<numVertices; k++){
      int u=-1;
      int udist = MAX_INT;
      for (int v = 0; v < numVertices; v++){
        if(Q[v] == 0 && dist[v] < udist){
          u = v;
          udist = dist[v];
        }
      }
      
      if (u >= 0){
        Q[u] = 1;
        
        for (int v = 0; v < numVertices; v++){
          if(!temAresta(u, v)) continue;
          
            int alt  = udist + 1;
          
            if(alt < dist[v]){
              dist[v] = alt;
              anterior[v] = u;
            }
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
    path = ordem;
  }
  
  void desenhar(){
    desenhar(path);
  }

  // Desenha o grafo
  void desenhar(ArrayList red) {
    //for(int j:red){println("**/**" + j);}
    textAlign(CENTER);
    // Desenha as arestas
    stroke(0);
    strokeWeight(1);
    for (int i = 0; i < numVertices; i++) {
      for (int j = i + 1; j < numVertices; j++) {
        PVector aresta = new PVector(i, j);
        stroke(0);
        if (red.contains(i) && red.contains(j)) stroke(255,0,0);
        if (arestas.contains(aresta)){
          strokeWeight(3);
          line(posicoes[i].x, posicoes[i].y, posicoes[j].x, posicoes[j].y);
        }
      }
    }
    // Desenha os nós
    fill(255);
    stroke(0);
    strokeWeight(1);
    for (int i = 0; i < numVertices; i++) {
      fill(colors[i]);
      ellipse(posicoes[i].x, posicoes[i].y, raio * 2, raio * 2);
      fill(0);
      text(str(i), posicoes[i].x, posicoes[i].y+4);
    }
  }
}
