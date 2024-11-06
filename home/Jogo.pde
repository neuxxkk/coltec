class Jogo {
  AgenteRL agente;

  float velocidadePlatform = 5;
  PVector velocidadeBall = new PVector(-1, 1);

  int pontuacao;
  int quadroAtual;
  int quadroUltimaAcao;
  String estadoUltimaAcao;
  int ultimaAcao;

  Jogo() {
    platform = new Platform(20, height / 2.0, 50);
    ball = new Ball(width/2, height/2, 10, speed);
    //agente = new AgenteRL(.1, .95, 0.8, .001, .001);
    agente = new AgenteRL(0.386, .8, 0.4, 0.01, 0.5);
    //agente = new AgenteRL(random(1), random(1), random(1), random(1), random(1));
    //agente = new AgenteRL(96, 81, 38, 54, 26);
    //agente = new AgenteRL(0.1, 0.6, 0.001, 0.5, 0.05);
    println(agente.taxaAprendizagem, agente.fatorDesconto, agente.taxaExploracaoInicial, agente.taxaExploracaoMinima, agente.decaimentoExploracao);
    reiniciar();
  }

  void reiniciar() {

    platform = new Platform(20, height / 2.0, 50);
    ball = new Ball(width/2, height/2, 10, speed);
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


      float recompensa;

      if (fimDeJogo) {
        recompensa = -1000;
      } else {
        recompensa = pontuacao+1;
      }
      
      String estadoAtual = obterEstado();
      agente.atualizarValorQ(estadoUltimaAcao, ultimaAcao, recompensa, estadoAtual);

      ultimaAcao = agente.escolherAcao(estadoAtual);
      //velocidadePlatform = abs(ball.pos.y-platform.pos.y)/100.0*speed;
      if (ultimaAcao == 1) platform.vel -= velocidadePlatform; // Up
      else if (ultimaAcao == 2) platform.vel += velocidadePlatform; // Down
      else if (ultimaAcao == 3) velocidadePlatform+=.0001;
      else if (ultimaAcao == 4) velocidadePlatform-=.0001;

      estadoUltimaAcao = estadoAtual;
      quadroUltimaAcao = quadroAtual;
    }

    platform.update();
    ball.update();

    if (ball.pos.x-ball.size/2.0<platform.pos.x-5) fimDeJogo = true;
    else fimDeJogo = false;
    //pontuacao++;
  }

  void desenhar() {
    //background(bgColor);
    surface.setTitle(estadoUltimaAcao);

    ball.show();
    platform.show();

    // Exibe pontuação
    fill(255);
    textSize(32);
    text("Pontuação: " + pontuacao, 10, 40);

    if (fimDeJogo) {
      text("Fim de Jogo", width/2 - 70, height/2);
    }
  }
}
