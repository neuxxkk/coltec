class Jogo {
  AgenteRL agente;
  
  float velocidadePlatform = 5;
  PVector velocidadeBall = new PVector(-1,1);
  
  int pontuacao;
  boolean fimDeJogo;
  int quadroAtual;
  int quadroUltimaAcao;
  String estadoUltimaAcao; 
  int ultimaAcao;
  
  Jogo() {
    platform = new Platform(20, height / 2.0, 50);
    ball = new Ball(width/2, height/2, 10, 10);
    agente = new AgenteRL(0.1, 0.99, 1.0, 0.01, 0.001);
    reiniciar();
  }
  
  void reiniciar() {
    platform = new Platform(20, height / 2.0, 50);
    ball = new Ball(width/2, height/2, 10, 10);
    pontuacao = 0;
    fimDeJogo = false;
    quadroAtual = 0;
    quadroUltimaAcao = 0;
    estadoUltimaAcao = obterEstado();
    ultimaAcao = 0;
  }
  
  String obterEstado() {
    int ballX =  round(map(ball.pos.x, 0, width, 0, 10));
    int aberturaErro = round(map(ball.pos.y - platform.pos.y, 0, height, 0, 20));
    return  ballX + "," + aberturaErro;
  }
  
  void atualizar() {
    quadroAtual++;
    
    // Ação do RL
    if (quadroAtual - quadroUltimaAcao >= 5) {
      
      // Atualizar valor Q após a ação
      float recompensa = fimDeJogo ? -100 : 1;
      String estadoAtual = obterEstado();
      agente.atualizarValorQ(estadoUltimaAcao, ultimaAcao, recompensa, estadoAtual);
      
      ultimaAcao = agente.escolherAcao(estadoAtual);
      if (ultimaAcao == 1) platform.vel = -velocidadePlatform; // Up
      else if (ultimaAcao == 2) platform.vel = velocidadePlatform; // Down
      
      estadoUltimaAcao = estadoAtual;
      quadroUltimaAcao = quadroAtual;  
    }
    
    platform.update();
    ball.update();
    
    // Verifica colisão
    if (ball.pos.x - (ball.size/2) <= 0)
      fimDeJogo = true;
    
      pontuacao++;
  }
  
  void desenhar() {
    background(135, 206, 235);
    surface.setTitle(estadoUltimaAcao);
    
    ball.show();
    platform.show();
    
    // Exibe pontuação
    fill(0);
    textSize(32);
    text("Pontuação: " + pontuacao, 10, 40);
    
    if (fimDeJogo) {
      text("Fim de Jogo", width/2 - 70, height/2);
    }
  }
}
