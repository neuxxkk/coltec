import java.util.*;

int chunkSize = 100;
int tileSize = 20;
boolean dragging = false;
int onRoute = 0; // Route status, 0 - off, 1 - ON, 2 - haveOrigin, 3 - haveDestiny, 4 - chose Dijstraka or A*, 5 - execute
int [][] routePos = new int[2][2];
int startPos = chunkSize * 10;
int xT, yT; //cheat

Map map;
Trigger trigger;
Player player;
Route route;

void setup() {
  size(800, 800);
  map = new Map(chunkSize, tileSize);
  trigger = new Trigger();
  player = new Player(startPos,startPos);
  map.reset(startPos, startPos);
}

void draw() {
  background(0);
  map.display();
  if (route != null) route.display();   
  player.update();
  trigger.display();
}

void mouseDragged() {
    dragging = true;
    map.drag(mouseX - pmouseX, mouseY - pmouseY);
    
}

void mouseReleased() {
  if(!dragging){
    
    if (trigger.btnTrigger(mouseX, mouseY));
    else{
      int xM = map.gridPosX(mouseX);
      int yM = map.gridPosY(mouseY);
      xT = xM; yT = yM;
      if (onRoute == 1){
        player.posX = xM;
        player.posY = yM;
        routePos[0][0] = xM;
        routePos[0][1] = yM; //origin
        onRoute = 2;
      }else if(onRoute == 2 || onRoute == 3){
        routePos[1][0] = xM;
        routePos[1][1] = yM; //goal
        onRoute = 3;
      }
    
      int v = map.getTileValue(xM, yM);
      String block = "";
      println("valor: " + xM + ", " + yM);
      switch(v) {
            case 0: // água
              block = "água";
              break;
            case 1: // grama
              block = "grama";
              break;
            case 2: // areia
              block = "areia";
              break;
            case 3: // coral
              block = "coral";
              break;
            case 4: // pedra
              block = "pedra";
              break;
            case 5: // cacto
              block = "cacto";
              break;
            case 6: // boat
              block = "boat";
              break;
      }
      if (onRoute == 2) trigger.origB = block;
      else if (onRoute == 3) trigger.destB = block;
      println(block);
    }
  }else dragging = false;
}

void keyPressed() {
  
  if (key == 'g' && onRoute == 3) onRoute = 4; //confirm points
  if (key == '5' && onRoute == 4)  route = new Route(routePos[0], routePos[1], 'd'); //choose algorithm
  if (key == '8' && onRoute == 4)  route = new Route(routePos[0], routePos[1], 'a');
  
  if (key == 'r'){ //choose route
    if (onRoute == 0){
      print("OnRoute");
      onRoute = 1;
    }else{
      print("OffRoute");
      route.off();
    }
  }
  if (key == 'p' || key == 'P') map.reset(player.posX,player.posY); //centralize
  
  if (key == 't'){ //cheat
    player.posY = yT;
    player.posX = xT;
    }
  if ((key == 'w' || key == 'W') && player.allowedTiles.contains(map.getTileValue(player.posX, player.posY-1))) player.move(1);
  if ((key == 's' || key == 'S') && player.allowedTiles.contains(map.getTileValue(player.posX, player.posY+1))) player.move(-1);
  if ((key == 'a' || key == 'A') && player.allowedTiles.contains(map.getTileValue(player.posX-1, player.posY))) player.move(2);
  if ((key == 'd' || key == 'D') && player.allowedTiles.contains(map.getTileValue(player.posX+1, player.posY))) player.move(-2);
}
