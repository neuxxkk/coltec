import java.util.ArrayList;

class Player{
  int posX, posY;
  int velX, velY;
  ArrayList<Integer> allowedTiles = new ArrayList<Integer>();
  boolean boat;
  
  public Player(){
    this.posX = map.screenPosX(x);
    this.posY = map.screenPosY(y);
    allowedTiles.add(1);
    allowedTiles.add(2);
    boat = false;
  }
  
  void atualizaPlayer(){
    this.posY = map.screenPosY(y);
    this.posX = map.screenPosX(x);
    this.drawPlayer();
    if (this.boat) allowedTiles.add(0);
    else if(allowedTiles.contains(0)) allowedTiles.remove(0);
  }
  
  void drawPlayer(){
    fill(255,0,0);
    ellipse(posX, posY, 10, 10);
  }
  
}
