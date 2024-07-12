int cliques = 0;
ArvoreBinaria arv = new ArvoreBinaria();

void setup(){
   size(600, 600); 
}

void draw(){
  background(255);  
  arv.mostrar();
}

void mouseClicked() {
  cliques++;
  arv.insere((int)random(1000)); 
  arv.ordenar(2);
} 
