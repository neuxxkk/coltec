int chunkSize = 100;
int tileSize = 20;
boolean dragging = false;
int onRoute = 0; // Route status, 0 - off, 1 - getOrigin, 2 - getDestiny
int [][] routePos = new int[2][2];

Map map;
Player player;
Route route;

int s = 1000;

void setup() {
  size(800, 800);
  map = new Map(chunkSize, tileSize);
  map.reset(s, s);
  player = new Player(s, s);
}

void draw() {
  background(0);
  map.display();
  if (route != null) route.drawRoute();   
  player.atualizaPlayer();
}

void mouseDragged() {
    dragging = true;
    map.drag(mouseX - pmouseX, mouseY - pmouseY);
    
}

void mouseReleased() {
  if(!dragging){
    int xM = map.gridPosX(mouseX);
    int yM = map.gridPosY(mouseY);
    
    if (onRoute == 1){
      player.posX = xM;
      player.posY = yM;
      routePos[0][0] = xM;
      routePos[0][1] = yM;
      onRoute = 2;
    }else if(onRoute == 2){
      routePos[1][0] = xM;
      routePos[1][1] = yM;
      route = new Route(routePos[0], routePos[1]);
    }
    
    int v = map.getTileValue(xM, yM);
    println("valor: " + xM + ", " + yM);
    switch(v) {
          case 0: // água
            println("água");
            break;
          case 1: // grama
            println("grama");
            break;
          case 2: // areia
            println("areia");
            break;
          case 3: // coral
            println("coral");
            break;
          case 4: // pedra
            println("pedra");
            break;
          case 5: // cacto
            println("cacto");
            break;
          case 6: // boat
            println("boat");
            break;
    }
  }
  else dragging = false;
}

void keyPressed() {
  
  if (key == 'g'){
    println(onRoute == 2);
    if (onRoute == 2){
      println(9);
      route.makeWay();
    }
  }
  
  if (key == 'r'){
    if (onRoute == 0){
      print("OnRoute");
      onRoute = 1;
    }else{
      print("OffRoute");
      onRoute = 0;
      route = null;
    }
  }
  if (key == 'p' || key == 'P') map.reset(player.posX,player.posY);
  
  if ((key == 'w' || key == 'W') && player.allowedTiles.contains(map.getTileValue(player.posX, player.posY-1))) player.move(1);
  if ((key == 's' || key == 'S') && player.allowedTiles.contains(map.getTileValue(player.posX, player.posY+1))) player.move(-1);
  if ((key == 'a' || key == 'A') && player.allowedTiles.contains(map.getTileValue(player.posX-1, player.posY))) player.move(2);
  if ((key == 'd' || key == 'D') && player.allowedTiles.contains(map.getTileValue(player.posX+1, player.posY))) player.move(-2);
}
