class Chunk {
  int chunkX, chunkY;
  String key;
  int[][] tiles;
  boolean playerChunk, boatChunk;
  int boatTileX, boatTileY;

  Chunk(int x, int y) {
    chunkX = x;
    chunkY = y;
    key = x + "," + y;
    tiles = new int[chunkSize / tileSize][chunkSize / tileSize];
    
    playerChunk = (key.equals(map.playerKey)) ? true : false;
    boatChunk = (key.equals(map.boatKey)) ? true: false;
    boatTileX = (boatChunk)? int(random(chunkSize/tileSize)) : -1;
    boatTileY = (boatChunk)? int(random(chunkSize/tileSize)) : -1;
    
    generateChunk();
  }

  void generateChunk() {
    for (int x = 0; x < chunkSize / tileSize; x++) {
      for (int y = 0; y < chunkSize / tileSize; y++) {
        float noise = noise((chunkX * chunkSize + x * tileSize) * 0.002, (chunkY * chunkSize + y * tileSize) * 0.002);
        if (x == boatTileX && y == boatTileY){
          tiles[x][y] = 6; // boat
        } else if (noise < 0.4 && !playerChunk && !boatChunk) {
          tiles[x][y] = 0; // água
        } else if (noise < 0.7) {
          tiles[x][y] = 1; // grama
        } else {
          tiles[x][y] = 2; // areia
        }

        if (random(1) < 0.005 && !playerChunk && !boatChunk) {
          if (tiles[x][y] == 0) tiles[x][y] = 3; // coral
          else if (tiles[x][y] == 1) tiles[x][y] = 4; // pedra
          else if (tiles[x][y] == 2) tiles[x][y] = 5; // cacto
        }
      
      }
    }
  }
  
  int getTile(int localX, int localY) {
    if (localX >= 0 && localX < tiles.length && localY >= 0 && localY < tiles[0].length) {
      return tiles[localX][localY];
    } else {
      return -1;
    }
  }

  void display(float offsetX, float offsetY) {
    noStroke();
    for (int x = 0; x < chunkSize / tileSize; x++) {
      for (int y = 0; y < chunkSize / tileSize; y++) {
        float screenX = chunkX * chunkSize + x * tileSize + offsetX;
        float screenY = chunkY * chunkSize + y * tileSize + offsetY;

        if (screenX + tileSize < 0 || screenX > width || screenY + tileSize < 0 || screenY > height) {
          continue;
        }

        switch(tiles[x][y]) {
          case 0: // água
            fill(#42a5f5);
            break;
          case 1: // grama
            fill(#99ff88);
            break;
          case 2: // areia
            fill(#ffd780);
            break;
          case 3: // coral
            fill(200, 0, 255);
            break;
          case 4: // pedra
            fill(#a7b1c1);
            break;
          case 5: // cacto
            fill(#55cc44);
            break;
          case 6: // boat
            if(!player.boat) fill(151,51,0);
            else tiles[x][y] = int(random(1,3));
            break;
          case 9:// cacto
            fill(0);
            break;
        }

        rect(screenX, screenY, tileSize, tileSize);
      }
    }
  }
}
