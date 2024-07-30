Timer tempo;
boolean jogar = false;
boolean pausa = false;
PFont font;

void setup() {
  size(600, 600);
  MenuInicial();
  tempo = new Timer();
}

void draw() {
  if(jogar == false){
  MenuInicial();
  }else{
    if (pausa == false){
      
      if(tempo.minutes == 2){
          pause();
      }
      
      image(imagens[fundo], 0,0);
      stroke(0);
      mostraGrid();
      tempo.timer();

     showItem();

    }else{
      pause();
    }
  }
}
