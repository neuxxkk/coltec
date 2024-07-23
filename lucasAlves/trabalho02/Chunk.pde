class Chunk {
  int chunkX, chunkY;
  int[][] tiles;
  int boatTileX;
  int boatTileY;

  Chunk(int x, int y) {
    chunkX = x;
    chunkY = y;
    tiles = new int[chunkSize / tileSize][chunkSize / tileSize];
    boatTileX = (map.chunks.size() == map.boatChunk)? int(random(4)) : -1;
    boatTileY = (map.chunks.size() == map.boatChunk)? int(random(4)) : -1; 
    generateChunk();
  }

  void generateChunk() {
    for (int x = 0; x < chunkSize / tileSize; x++) {
      for (int y = 0; y < chunkSize / tileSize; y++) {
        float noise = noise((chunkX * chunkSize + x * tileSize) * 0.01, (chunkY * chunkSize + y * tileSize) * 0.01);
        if (x == boatTileX && y == boatTileY){
          tiles[x][y] = 6; // boat
        } else if (noise < 0.3 && map.chunks.size() != map.playerChunk && map.chunks.size() != map.boatChunk) {
          tiles[x][y] = 0; // água
        } else if (noise < 0.6) {
          tiles[x][y] = 1; // grama
        } else {
          tiles[x][y] = 2; // areia
        }

        // Adicionar obstáculos
        if (random(1) < 0.005 && map.chunks.size()!=map.playerChunk && map.chunks.size()!=map.boatChunk) {
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
    for (int x = 0; x < chunkSize / tileSize; x++) {
      for (int y = 0; y < chunkSize / tileSize; y++) {
        float screenX = chunkX * chunkSize + x * tileSize + offsetX;
        float screenY = chunkY * chunkSize + y * tileSize + offsetY;

        if (screenX + tileSize < 0 || screenX > width || screenY + tileSize < 0 || screenY > height) {
          continue;
        }

        switch(tiles[x][y]) {
          case 0: // água
            fill(50, 50, 200);
            break;
          case 1: // grama
            fill(0, 255, 0);
            break;
          case 2: // areia
            fill(255, 255, 50);
            break;
          case 3: // coral
            fill(200, 0, 255);
            break;
          case 4: // pedra
            fill(128);
            break;
          case 5: // cacto
            fill(0, 128, 0);
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
