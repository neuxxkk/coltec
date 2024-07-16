import java.util.ArrayList;

class Player{
  int posX, posY;
  int velX, velY;
  ArrayList<Integer> allowedTiles = new ArrayList<Integer>();
  boolean boat;
  
  public Player(){
    allowedTiles.add(1);
    allowedTiles.add(2);
    allowedTiles.add(6);
    this.posX = xP;
    this.posY = yP;

    boat = false;
  }
  
  void atualizaPlayer(){
    this.drawPlayer();
    if (map.getTileValue(posX, posY) == 6){
      boat = true;
      allowedTiles.add(0);
    }
  }
  
  void drawPlayer(){
    this.posX = xP;
    this.posY = yP;
    fill(255,0,0);
    ellipse(map.screenPosX(posX), map.screenPosY(posY), 10, 10);
  }
  
}
