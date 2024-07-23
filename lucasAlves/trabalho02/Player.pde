import java.util.ArrayList;
import java.util.Arrays;

class Player{
  int moving;
  int posX, posY; //grid
  float screenPosX, screenPosY;
  float vel;
  float offsetX, offsetY;
  ArrayList<Integer> allowedTiles = new ArrayList<Integer>(), movs = new ArrayList<Integer>();
  boolean boat;
  
  public Player(int x, int y){
    allowedTiles.add(1);
    allowedTiles.add(2);
    allowedTiles.add(6);
    this.posX = x;
    this.posY = y;
    this.screenPosX = map.screenPosX(x);
    this.screenPosY = map.screenPosX(y);
    boat = false;
    atualizaPlayer();
  }
  
  void atualizaPlayer(){
    this.drawPlayer();
    
    if (!movs.isEmpty()) movePlayer();
    if (moving !=0) move(moving);
    
    if (map.renderized)
      switch (map.getTileValue(posX, posY)){ //breca a verificação de chunkPlayer
        case 0:
          this.vel = 2;
          break;
          
        case 1:
          this.vel = 1;
          break;
          
        case 2:
          this.vel = 0.5;
          break;
          
        case 6:
          boat = true;
          allowedTiles.add(0);
          break;
      }
    }
  
  void drawPlayer(){
    fill(255,10,10);
    ellipse(map.screenPosX(posX) + offsetX, map.screenPosY(posY) + offsetY, 12, 12);
  }
  
  void move(ArrayList <Integer> movs){
    this.movs = movs;
    moving = 0;
  }
  
  void movePlayer(){ 
    if (moving == 0 && !movs.isEmpty()){
      moving = movs.get(0)*-1;
      movs.remove(0);
    }
    
    float off = (vel/frameRate) * tileSize * 2;
    switch (moving){
      case 1: //up
        offsetY -= off;
        break;
      case -1: //down
        offsetY += off;
        break;
      case 2: //left
        offsetX -= off;
        break;
      case -2: //right
        offsetX += off;
        break;
    }
    
    if (abs(offsetY) >= tileSize){
      int newY = posY += offsetY/abs(offsetY);
      if(allowedTiles.contains(map.getTileValue(posX, newY))) posY = newY;
      moving = 0;
      offsetY = 0;
    }
    
    if (abs(offsetX) >= tileSize){
      int newX = posX += offsetX/abs(offsetX);
      if(allowedTiles.contains(map.getTileValue(newX, posY))) posX = newX;
      moving = 0;
      offsetX = 0;
    }
    
  }
  
  void move(int direction){ 
    if (moving == 0) moving = direction;
    float off = (vel/frameRate) * tileSize * 2;
    switch (direction){
      case 1: //up
        offsetY -= off;
        break;
      case -1: //down
        offsetY += off;
        break;
      case 2: //left
        offsetX -= off;
        break;
      case -2: //right
        offsetX += off;
        break;
    }
    
    if (abs(offsetY) >= tileSize){
      int newY = posY += offsetY/abs(offsetY);
      if(allowedTiles.contains(map.getTileValue(posX, newY))) posY = newY;
      moving = 0;
      offsetY = 0;
    }
    
    if (abs(offsetX) >= tileSize){
      int newX = posX += offsetX/abs(offsetX);
      if(allowedTiles.contains(map.getTileValue(newX, posY))) posX = newX;
      moving = 0;
      offsetX = 0;
    }
    
  }
  
}
