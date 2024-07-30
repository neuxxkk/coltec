//INICIAÇÃO DE VARIÁVEIS

//globais
int obstaculo;
int fundo;
int skin;

//Coordenadas botoes e textos
float mapX, mapY, mapRX, mapRY, skinRX, skinRY, skinX, skinY, botaoJw, botaoJh, botaoJx, botaoJy, botaoSw, botaoSh, botaoSx, botaoSy, botaoaX, botaobX, botaocX, botaodX, botaoeX, botaoaH, botaoaW, map1X, map1Y, map2X, map2Y, map3X, map3Y, skin1X, skin1Y, skin2X, skin2Y, skin3X, skin3Y;

//Verificadores para animação
int epam = 0, epas = 0, epag=0;

//Cores/Cores para animação
color strokeA = color(180,180,180), strokeB = color(180,180,180), strokeC = color(180,180,180), strokeD = color(180,180,180), strokeE = color(180,180,180), mapColor = color(150, 200, 150), skinColor = mapColor, strokeS = color(200,150,150), strokeJ=color(150,150,200);

//Tamanhos para animação
int tamanho, m1 =170, m2=m1, m3=m1, s1 = 100, s2=50, s3=s1;

//imagens temporarias
PImage map1, map2, map3, skin1, skin2, skin3, bg;

void set(){
  //Carrega imagens do menu
  map1 = loadImage("imgs/map1.png");
  map2 = loadImage("imgs/map2.png");
  map3 = loadImage("imgs/map3.png");
  skin1 = loadImage("imgs/skin1.png");
  skin2 = loadImage("imgs/skin2.png");
  skin3 = loadImage("imgs/skin3.png");
  bg = loadImage("imgs/bg.jpg");
  bg.resize(width, height);
  
  //Configura Fonte
  font = createFont("font.TTF", 30);
  textFont(font);
    

  //define coordenadas dos Textos
  //coordenadas
  mapX = width*0.02;
  mapY = height*0.25;
  skinX = mapX;
  skinY = mapY+height*0.35;
  //Width(RX) e Height(RY)
  mapRX = mapX+90;
  mapRY = mapY-30;
  skinRX = skinX+90;
  skinRY = skinY-30;
  
  //Define coordenadas de botoes de JOGAR e SAIR
  //coordenada
  botaoJx = width/6;
  botaoJy =  height*0.95;
  botaoSx = 5;
  botaoSy = height*0.99;
  //Width e Height
  botaoJw = 290;
  botaoJh = 130;
  botaoSw = 100;
  botaoSh = 20;
  
  //Define coordernadas de Botoes de tamanho de mapa
  //coordenada
  botaobX = botaoaX *1.6;
  botaocX = botaoaX *2.2;
  botaodX = botaoaX *2.8;  
  botaoeX = botaoaX *3.5;  
  botaoaX = mapX*12;
  //Width e Height
  botaoaW = 40;
  botaoaH = 20;
  
  //Define coordernadas de Botoes dos MAPAS e SKINS, width e height das proprias imagens
  //coordenada
  map1X = mapX+15;
  map1Y = mapY+10;
  map2X = map1X*8;
  map2Y = map1Y;
  map3X = map1X*15;
  map3Y = map1Y;
  skin1X = skinX+25;
  skin1Y = skinY+15;
  skin2X = skin1X * 7;
  skin2Y = skin1Y-15;
  skin3X = skin2X * 1.8;
  skin3Y = skin1Y-5; 

  
  //seta fundo de tela
  image(bg,0,0);
  
  //escreve textos
  fill(255);
  textSize(35);
  text("ESTOURADORES DE",30 , 50);
  text("BATATA's GAME",width/4,100);
  
  textSize(30);
  fill(mapColor);
  text("MAP:", mapX, mapY);//A
  
  fill(strokeA);
  textSize(20);
  text("10", botaoaX, mapY);
  fill(strokeB);
  text("20", botaobX, mapY);
  fill(strokeC);
  text("30", botaocX, mapY);
  fill(strokeD);
  text("40", botaodX, mapY);
  fill(strokeE);
  text("50", botaoeX, mapY);
  
  fill(skinColor);
  text("SKIN", skinX, skinY);
  
  textSize(90);
  fill(strokeJ);
  text("JOGAR", botaoJx, botaoJy);
  
  textSize(20);
  fill(strokeS);
  text("SAIR", botaoSx, botaoSy);
  


  //Desenha mapas e skins para seleção
  map1.resize(m1,0);
  image(map1, map1X, map1Y);
  map2.resize(m2,0);
  image(map2, map2X, map2Y);
  map3.resize(m3,0);
  image(map3, map3X, map3Y);
 
  skin1.resize(s1,0);
  image(skin1, skin1X, skin1Y);
  skin2.resize(s2,0);
  image(skin2,skin2X, skin2Y);
  skin3.resize(s3,0);
  image(skin3, skin3X, skin3Y);
}

void MenuInicial(){
  set();
  //Botoes tamanhos de mapa
  if (mouseX >= botaoaX && mouseX <= botaoaX + botaoaW &&
      mouseY <= mapY && mouseY >= mapY - botaoaH) {
    strokeA = 255;
    } 
  else  if(epag==0){
    strokeA = color(180,180,180);
  }
  
  if (mouseX >= botaobX && mouseX <= botaobX + botaoaW &&
      mouseY <= mapY && mouseY >= mapY - botaoaH) {
    strokeB = 255;
    } 
  else if(epag==0){
    strokeB = color(180,180,180);
  }
  
  if (mouseX >= botaocX && mouseX <= botaocX + botaoaW &&
      mouseY <= mapY && mouseY >= mapY - botaoaH) {
    strokeC = 255;
    } 
  else if(epag==0){
    strokeC = color(180,180,180);
  }
  
  if (mouseX >= botaodX && mouseX <= botaodX + botaoaW &&
      mouseY <= mapY && mouseY >= mapY - botaoaH) {
    strokeD = 255;
    } 
  else if(epag==0){
    strokeD =color(180,180,180);
  }
  
  
  if (mouseX >= botaoeX && mouseX <= botaoeX + botaoaW &&
      mouseY <= mapY && mouseY >= mapY - botaoaH) {
    strokeE = 255;
    } 
  else if(epag==0){
    strokeE =color(180,180,180);
  }
    
    
  //Botoes estilos de mapa
  if (mouseX >= map1X && mouseX <= map1X+map1.width &&
    mouseY >= map1Y && mouseY <= map1Y+map1.height){
    m1 = 180;
  }
  else if(epam==0){
    m1 = 170;
  }
  
  if (mouseX >= map2X && mouseX <= map2X+map1.width &&
    mouseY >= map2Y && mouseY <= map2Y+map1.height){
    m2 = 180;
  }
  else if(epam==0){
    m2 = 170;
  }
  
  if (mouseX >= map3X && mouseX <= map3X+map1.width &&
    mouseY >= map3Y && mouseY <= map3Y+map1.height){
    m3 = 180;
  }
  else if(epam==0){
    m3 = 170;
  }
  
  
  //Botoes Skins
  if (mouseX >= skin1X && mouseX <= skin1X+skin1.width &&
    mouseY >= skin1Y && mouseY <= skin1Y+skin1.height){
    s1 = 110;
  }
  else if(epas==0){
    s1 = 100;
  }
  
  if (mouseX >= skin2X && mouseX <= skin2X+skin1.width &&
    mouseY >= skin2Y && mouseY <= skin2Y+skin1.height){
    s2 = 60;
  }
  else if(epas==0){
    s2 = 50;
  }
  
  if (mouseX >= skin3X && mouseX <= skin3X+skin1.width &&
    mouseY >= skin3Y && mouseY <= skin3Y+skin1.height){
    s3 = 110;
  }
  else if(epas==0){
    s3 = 100;
  }


  //Botão Sair
  if (mouseX >= botaoSx && mouseX <= botaoSx + botaoSw &&
      mouseY <= botaoSy && mouseY >= botaoSy - botaoSh){
    strokeS = color(255,150,150);
  }
  else{
    strokeS = color(200,150,150);
  }
  
  //Botao Jogar
  if (mouseX >= botaoJx && mouseX <= botaoJx + botaoJw &&
      mouseY <= botaoJy && mouseY >= botaoJy - botaoJh){
    strokeJ = color(150,150,255);
  }
  else{
    strokeJ = color(150,150,200);
  }
  
}



void mousePressed(){

  if(jogar==false){
    
    //Seleciona  os Botoes
    
    //Tamanho do mapa
    if (mouseX >= botaoaX && mouseX <= botaoaX + botaoaW &&
        mouseY <= mapY && mouseY >= mapY - botaoaH) {
      epag =1;
      strokeA = 255;
      s = 10;
    }      
    if (mouseX >= botaobX && mouseX <= botaobX + botaoaW &&
        mouseY <= mapY && mouseY >= mapY - botaoaH) {
      strokeB = 255;
      epag =1;
      s = 20;
    }   
    if (mouseX >= botaocX && mouseX <= botaocX + botaoaW &&
        mouseY <= mapY && mouseY >= mapY - botaoaH) {
      strokeC = 255;
      epag =1;
      s = 30;
    }    
    if (mouseX >= botaodX && mouseX <= botaodX + botaoaW &&
        mouseY <= mapY && mouseY >= mapY - botaoaH) {
      strokeD = 255;
      epag =1;
      s = 40;
    }  
    if (mouseX >= botaoeX && mouseX <= botaoeX + botaoaW &&
        mouseY <= mapY && mouseY >= mapY - botaoaH) {
      strokeE = 255;
      epag =1;
      s = 50;
    }
      
      
    //Estilos de mapa
    if (mouseX >= map1X && mouseX <= map1X+map1.width &&
      mouseY >= map1Y && mouseY <= map1Y+map1.height){
      epam =1;
      fundo = 12;
      obstaculo = 13;
      m1 = 180;
    }
    if(mouseX >= map2X && mouseX <= map2X+map1.width &&
      mouseY >= map2Y && mouseY <= map2Y+map1.height){
      epam =1;
      fundo = 27;
      obstaculo = 28;
      m2 = 180;
    }
    if (mouseX >= map3X && mouseX <= map3X+map1.width &&
      mouseY >= map3Y && mouseY <= map3Y+map1.height){
      epam =1;
      fundo =29;
      obstaculo = 30;
      m3 = 180;
    }
    
    
    //Skins
    if (mouseX >= skin1X && mouseX <= skin1X+skin1.width &&
    mouseY >= skin1Y && mouseY <= skin1Y+skin1.height){
      epas =1;
      skin = 11;
      s1 = 110;
    }
    
    if (mouseX >= skin2X && mouseX <= skin2X+skin1.width &&
    mouseY >= skin2Y && mouseY <= skin2Y+skin1.height){
      epas =1;
      skin = 31;
      s2 = 60;
    }
    if (mouseX >= skin3X && mouseX <= skin3X+skin1.width &&
    mouseY >= skin3Y && mouseY <= skin3Y+skin1.height){
      epas =1;
      skin = 32;
      s3 = 110;
    }
    
    
    //Botao Jogar e Sair
    if (mouseX >= botaoJx && mouseX <= botaoJx + botaoJw &&
        mouseY <= botaoJy && mouseY >= botaoJy - botaoJh){
       jogar = true;
       grid = criaGrid();
       cellSize = width/s;
       imagens = loadImages();
     }
    if (mouseX >= botaoSx && mouseX <= botaoSx + botaoSw &&
        mouseY <= botaoSy && mouseY >= botaoSy - botaoSh){
      exit();
    }
  }

  if (pausa){
    
    
    //RESTART not working
     if (mouseX >= botaoSx && mouseX <= botaoSx + botaoSw &&
        mouseY <= botaoSy && mouseY >= botaoSy - botaoSh){
      setup();
      score =0;
      jogar = false;
      pausa = false;
      exit();
    }
  }
  
}
