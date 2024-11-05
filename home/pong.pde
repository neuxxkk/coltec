Platform platform;
Ball ball;

Jogo jogo;
int pontuacaoMax = 0;

void setup() {
  size(1000,500);
  //frameRate(120);
  jogo = new Jogo();
  
  for(int i = 0; i < 10000000; i++){
    jogo.atualizar();
    if (jogo.fimDeJogo){
      pontuacaoMax = max(pontuacaoMax, jogo.pontuacao);
      jogo.reiniciar();
    }
  }
  println(pontuacaoMax);
  
}

void draw() {
  println(platform.pos.y);
  jogo.atualizar();
  jogo.desenhar();
  
  if (jogo.fimDeJogo) jogo.reiniciar(); 
}
