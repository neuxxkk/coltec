int chunkSize = 100;
int tileSize = 20;
boolean dragging = false;

Map map;
Player player;

int s = 900;
int x = s, y = s;

void setup() {
  size(800, 800);
  map = new Map(chunkSize, tileSize);
  player = new Player();
  map.reset(s, s);
}

void draw() {
  background(0);
  map.display();
  player.atualizaPlayer();
}

void mouseDragged() {
    dragging = true;
    map.drag(mouseX - pmouseX, mouseY - pmouseY);
    
}

void mouseReleased() {
  if(!dragging){
    int x = map.gridPosX(mouseX);
    int y = map.gridPosY(mouseY);
    int v = map.getTileValue(x, y);
    println("valor: " + x + ", " + y  );
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
    }
  }
  else dragging = false;
}

void keyPressed() {
  if (key == 'c' || key == 'C') map.reset(s,s);
  if ((key == 'w' || key == 'W') && player.allowedTiles.contains(map.getTileValue(x, y-1)) ) y--;
  if ((key == 's' || key == 'S') && player.allowedTiles.contains(map.getTileValue(x, y+1)) ) y++;
  if ((key == 'a' || key == 'A') && player.allowedTiles.contains(map.getTileValue(x-1, y)) ) x--;
  if ((key == 'd' || key == 'D') && player.allowedTiles.contains(map.getTileValue(x+1, y)) ) x++;
}
