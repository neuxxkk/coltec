Platform paddleIA;
Ball ball;

final int LARGURA_PLATFORM = 10;
final int ALTURA_PLATFORM = 70;
final float VELOCIDADE_PLATFORM = 1.5;
final float speed = 5;
final float RAIO_BALL = 20;
final int simulacoes = 1000000;


int total;
int pontuacaoMax;

boolean fimDeJogo, acertou;

Jogo jogo;


ArrayList<Integer> pontuacoes;

boolean isGraph;
float graphOffset = 0;
float graphOffsetScale = 10;
float graphScale = 10;

color bgColor = #16212E;
color graphColor = #447BC1;

int qt_pontos = 1;
int simulacaoAtual = 0;

// Mini Pong
int mp_pontMaq = 0,mp_pontPla = 0;
int mp_pyMaq = 0,mp_pyPla = 0;
int mp_pxBal = -1,mp_pyBal=0,mp_vxBal=0,mp_vyBal=0;

boolean rodarCarregamento = true;
boolean showObjects = true;

void carregamento(){
  noStroke();
  background(#FFBA39);

  // Escrita
  String texto1 = "Simulando "+String.format("%,d",simulacoes).replace(",",".")+" de jogos ";
  String texto2 = texto1;
  for (int i = 0;i<qt_pontos;i++){
    texto2 += ".";
  }
  int tamanhoFonte = 50;
  textSize(tamanhoFonte);
  fill(#000000);
  text(texto2,width/2-textWidth(texto1)/2,height/2-100);

  // Progresso
  int tamanhoBarra = 500;
  int espessuraBarra = 20;
  int ultimoPercento = 0;
  for (int i = 1;i<=100;i++){
    fill(#ffffff);
    if (i<=((float) (simulacaoAtual+1)/simulacoes)*100){
      fill(#4BFF00);
      ultimoPercento = i;
    }
    rect((width-tamanhoBarra)/2+(i-1)*tamanhoBarra/100,height/2-65,tamanhoBarra/100,espessuraBarra);
  }

  // Porcentagem
  fill((int) (75/100*ultimoPercento),(int) (255/100*ultimoPercento),0);
  tamanhoFonte = 25;
  textSize(tamanhoFonte);
  String texto = ultimoPercento+"%";
  text(texto,(width-tamanhoBarra)/2+(tamanhoBarra/100)*ultimoPercento-textWidth(texto)/2,height/2-65+espessuraBarra-textAscent()-5);

  // Mini pong
  miniPong();
  //
  delay(50);
}

void miniPong(){
  // mapa
  int compPong = width*4/10; // default 400
  int largPong = height*2/5; // default 200
  int compBarra = 20,largBarra = 40;
  fill(#1C5AFF);
  int initPx = width/2-compPong/2;
  int initPy = height/2;
  int spaceGoal = 40;
  rect(width/2-compPong/2,height/2,compPong,largPong);
  // barras
  fill(#AEC0F2);
  rect(initPx+spaceGoal-compBarra,initPy+mp_pyMaq,compBarra,largBarra); // maquina
  rect(initPx+compPong-spaceGoal,initPy+mp_pyPla,compBarra,largBarra); // player

  // movimento
  mp_pyPla = mouseY-initPy-largBarra/2;
  mp_pyMaq = mp_pyBal-largBarra/2;
  if (mp_pyMaq<0) mp_pyMaq=0;
  if (mp_pyMaq+largBarra>largPong) mp_pyMaq = largPong-largBarra;
  if (mp_pyPla<0) mp_pyPla=0;
  if (mp_pyPla+largBarra>largPong) mp_pyPla = largPong-largBarra;
  
  // bolinha
  int velBase = 10 ,raioBola = 9; // velBase > raioBola
  if (mp_pxBal == -1){
    mp_pxBal=compPong/2;mp_pyBal=0;
    mp_vxBal=(velBase)*((random(1)>0.5)?1:-1);mp_vyBal=velBase;
    println(mp_vxBal);
  }
  mp_pxBal+=mp_vxBal;mp_pyBal+=mp_vyBal;

  // bate nas paredes
  if (mp_pyBal+raioBola>=largPong||mp_pyBal-raioBola<=0) mp_vyBal*=-1;

  // soma os pontos ou rebate
  if (mp_pxBal+raioBola>=compPong-spaceGoal){
    if (mp_pyBal>=mp_pyPla&&mp_pyBal<=mp_pyPla+largBarra) mp_vxBal*=-1;
    else {mp_pontMaq+=1;mp_pxBal=-1;}
  }else if (mp_pxBal-raioBola<=spaceGoal){
    if (mp_pyBal>=mp_pyMaq&&mp_pyMaq<=mp_pyMaq+largBarra) mp_vxBal*=-1;
    else {mp_pontPla+=1;mp_pxBal=-1;}
  }

  // desenha bolinha
  fill(#B538FA);
  circle(initPx+mp_pxBal,initPy+mp_pyBal,raioBola);

  // Placar
  fill(#000000);
  textSize(25);
  String texto = "Maquina: "+mp_pontMaq+" | Perdedor: "+mp_pontPla;
  text(texto,initPx+compPong/2-textWidth(texto)/2,initPy-5);

  // linhas imaginárias
  stroke(1);
  fill(#000000);
  line(initPx+compPong-spaceGoal,initPy,initPx+compPong-spaceGoal,initPy+largPong);
  line(initPx+spaceGoal,initPy,initPx+spaceGoal,initPy+largPong);
  noStroke();

}

void rodarSimulacoes(){
  jogo = new Jogo();
  pontuacoes = new ArrayList<Integer>();
  showObjects = false;
  for (int i = 0; i < simulacoes; i++) {
    jogo.atualizar();
    if (fimDeJogo) {
      jogo.atualizar();
      pontuacoes.add(jogo.pontuacao);
      total += jogo.pontuacao;
      pontuacaoMax = max(pontuacaoMax, jogo.pontuacao);
      jogo.reiniciar();
    }
    simulacaoAtual = i;
  }
  println(pontuacaoMax);
  delay(4*1000);
  showObjects = true;
  rodarCarregamento = false;
}

void showGraph() {
  //float l = width/(float)pontuacoes.size();
  graphScale = width/(float)pontuacoes.size();
  stroke(graphColor);
  strokeWeight(1);
  fill(#447BC1);
  //beginShape();
  //vertex(0, height);
  for (int i = 0; i < pontuacoes.size()-1; ++i) {
    line(graphScale*i-graphOffset, height/1.5-pontuacoes.get(i)*10, graphScale*(i+1)-graphOffset, height/1.5-pontuacoes.get(i+1)*10);
  }
  //ellipse(width-l, height/2.0-pontuacoes.get(pontuacoes.size()-1)*10, 5, 5);
  int mx = round(mouseX/graphScale);
  if (mouseX>=width/100.0 && mouseX<width-width/100.0) {
    fill(255);
    noStroke();
    ellipse(graphScale*mx, height/1.5-pontuacoes.get(mx+round(graphOffset/graphScale))*10, 5, 5);
    textSize(10);
    text(pontuacoes.get(mx+round(graphOffset/graphScale)), graphScale*mx, height/1.5-pontuacoes.get(mx+round(graphOffset/graphScale))*10+10);
    //vertex(width, height/2.0+pontuacoes.get(pontuacoes.size()-1)*10);
    //vertex(width, height);
    //endShape();
  }
}

void keyReleased() {
  switch(key) {
  case 'b':
    ball.vel = new PVector(constrain(random(-1, 1)*10, -1, 1), constrain(random(-1, 1)*10, -1, 1));
    break;
  case 'g':
    if (isGraph) isGraph = false;
    else isGraph = true;
    break;
  case 'r':
    setup();
    break;
  }
}

void keyPressed() {
  switch(keyCode) {
  case RIGHT:
    if (isGraph) graphOffset+=graphOffsetScale;
    break;
  case LEFT:
    if (isGraph) graphOffset-=graphOffsetScale;
    break;
  }
  
  switch(key) {
  case '-':
    //if (isGraph) graphScale = constrain(graphScale-graphScale/10.0, 0.001, width);
    break;
  case '=':
    //if (isGraph) graphScale = constrain(graphScale+graphScale/10.0, 0.001, width);
    break;
  }
}

void setup() {
  size(1000, 500);
  rodarCarregamento = true;
  thread("rodarSimulacoes");
}

void draw() {
  if (rodarCarregamento){
    carregamento();
    qt_pontos += (qt_pontos < 5) ? 1 : -4;
    // println(simulacaoAtual);
  }else{
    background(bgColor);
    jogo.atualizar();
    jogo.desenhar();
    if (isGraph) showGraph();

    if (fimDeJogo) {
      jogo.atualizar();
      pontuacoes.add(jogo.pontuacao);
      pontuacaoMax = max(pontuacaoMax, jogo.pontuacao);
      println(jogo.pontuacao);
      jogo.reiniciar();
    }
  }
}
