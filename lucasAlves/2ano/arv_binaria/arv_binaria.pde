class No {
  int valor;
  color cor;
  No esq;
  No dir;

  No(int valor) {
    this.valor = valor;
    this.cor = 255;
    esq = null;
    dir = null;
  }
}

class ArvoreBinaria {
  No raiz;

  ArvoreBinaria() {
    raiz = null;
  }

  void insere(int valor) {
    raiz = insereRec(raiz, valor);
  }

  private No insereRec(No raiz, int valor) {
    if (raiz  == null){
      raiz = new No(valor);
      return raiz;
    }
    
    if (valor < raiz.valor){
      if (raiz.esq == null){
        raiz.esq = new No(valor);
      }else{
        insereRec(raiz.esq, valor);
      }
    }else if(valor > raiz.valor){
      if (raiz.dir == null){
        raiz.dir = new No(valor);
      }else{
        insereRec(raiz.dir, valor);
      }
    }
    
    return raiz;
  }
  
  

  void mostrar() {
    mostrarArvore(raiz, width / 2, 40, width / 4);
  }

  private void mostrarArvore(No raiz, float x, float y, float xOffset) {
    if (raiz != null) {

      if (raiz.esq != null) {
        line(x, y, x - xOffset, y + 60);
        mostrarArvore(raiz.esq, x - xOffset, y + 60, xOffset / 2);
      }

      if (raiz.dir != null) {
        line(x, y, x + xOffset, y + 60);
        mostrarArvore(raiz.dir, x + xOffset, y + 60, xOffset / 2);
      }
      
      stroke(0);
      fill(raiz.cor);
      ellipse(x, y, 30, 30);
      fill(0);
      textAlign(CENTER, CENTER);
      text(raiz.valor, x, y);
    }
  }
  
  int count;
  void setOrder(No r, int co){
    print(" " + r.valor);
    float cc = (255/cliques) * co;
    r.cor = color(250,cc,cc);
    count++;
  }
  
  void ordenar(int opt){
    count = 0;
    println();
    switch (opt){
      case 1:
        preOrdem(raiz);
        break;
      case 2:
        emOrdem(raiz);
        break;
      case 3:
        posOrdem(raiz);
        break;
    }
  }
  
  void preOrdem(No raiz){
    if (raiz == null) return;
    setOrder(raiz, count);
    preOrdem(raiz.esq);
    preOrdem(raiz.dir);
  }
  
  void emOrdem(No raiz){
    if (raiz == null) return;
    emOrdem(raiz.esq);
    setOrder(raiz, count);
    emOrdem(raiz.dir);
  }
  
  void posOrdem(No raiz){
    if (raiz == null) return;
    posOrdem(raiz.esq);
    posOrdem(raiz.dir);
    setOrder(raiz, count);
  }
  
}
