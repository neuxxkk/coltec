public class Disco{
  float x, y;
  float size;
  int estaca;
  
  public Disco(int index, float size, int estaca){
    this.size = size;
    this.estaca = estaca;
    this.x = estacaX.get(estaca)-(size/2);
    this.y = height - (index*0.05*height);

  } 
  
  void drawDisco(){
    fill(100);
    rect(x, y, size+estacaW, -0.05*width);
  }
}
