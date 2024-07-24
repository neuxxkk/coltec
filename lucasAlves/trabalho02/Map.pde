class Map {
  boolean renderized = false;
  int chunkSize, tileSize;
  float offsetX, offsetY;
  HashMap<String, Chunk> chunks;
  int boatChunk = 0, playerChunk;

  Map(int chunkSize, int tileSize) {
    this.chunkSize = chunkSize;
    this.tileSize = tileSize;
    this.offsetX = 0;
    this.offsetY = 0;
    this.chunks = new HashMap<String, Chunk>();
    playerChunk = (width / chunkSize * 7) - 1;
    while((boatChunk % 10 != 3 && boatChunk % 10 != 4 && boatChunk % 10 != 5 && boatChunk % 10 != 6 && boatChunk % 10 != 7)) boatChunk = int(random(playerChunk - (chunkSize/tileSize*5), playerChunk + (chunkSize/tileSize*5)))-1;
  }
  
  void display() {
    //noStroke();
    int startX = floor(-offsetX / chunkSize) - 1;
    int startY = floor(-offsetY / chunkSize) - 1;
    int endX = startX + ceil(width / chunkSize) + 2;
    int endY = startY + ceil(height / chunkSize) + 2;
  
    for (int x = startX; x < endX; x++) {
      for (int y = startY; y < endY; y++) {
        String key = x + "," + y;
        if (!chunks.containsKey(key)) {
          chunks.put(key, new Chunk(x, y));          
        }else renderized = true;
        chunks.get(key).display(offsetX, offsetY);
        //if(chunks.size() == 56) for (int r=0;r<5;r++)for (int t=0;t<5;t++)chunks.get(key).tiles[r][t] = 9; //chunk rastreator
      }
    }
  }

  void drag(float _offsetX, float _offsetY) {
    if(this.gridPosX(0) < 0 || this.gridPosY(0) < 0){
      if(_offsetX <= 0 && _offsetY<=0){
            offsetX += _offsetX;
            offsetY += _offsetY;
      }
    }else{
      offsetX += _offsetX;
      offsetY += _offsetY;
    }
  }

  void reset() {
      offsetX = -width / 2;
      offsetY = -height / 2;
  }
  
  void reset(int gridX, int gridY) {
        offsetX = width / 2 - gridX * tileSize;
        offsetY = height / 2 - gridY * tileSize;
  }
  
  int gridPosX(int xScreen){
    return floor((-offsetX + xScreen) / tileSize);
  }
  
  int gridPosY(int yScreen){
    return floor((-offsetY + yScreen) / tileSize);
  }
  
  int screenPosX(int gridX) {
    return (gridX * tileSize + (int)offsetX) + tileSize/2;
  }
  
  int screenPosY(int gridY) {
    return (gridY * tileSize + (int)offsetY) + tileSize/2;
  }
  
  int getTileValue(int gridX, int gridY) {
    int chunkX = floor(gridX * tileSize / (float) chunkSize);
    int chunkY = floor(gridY * tileSize / (float) chunkSize);
    String key = chunkX + "," + chunkY;
    
    if (!chunks.containsKey(key)) {
      chunks.put(key, new Chunk(chunkX, chunkY));
    }
      Chunk chunk = chunks.get(key);
      int localX = gridX % (chunkSize / tileSize);
      int localY = gridY % (chunkSize / tileSize);
      return chunk.getTile(localX, localY);
  }
  
  
}
