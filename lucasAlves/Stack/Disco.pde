public class Disco{
  float x, y;
  float size;
  int estaca;
  
  public Disco(int index, float size, int estaca){
    this.size = size;
    this.estaca = estaca;
    this.x = (((width*0.225)*(estaca+1))+estacaW*estaca)-(size/2);
    this.y = height - (index*0.1*height);

  } 
  
  void drawDisco(){
    fill(100);
    rect(x, y, size, -0.1*width);
  }
}
