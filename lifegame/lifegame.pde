int cells[][];
int scale = 6;
int size;

void setup() {
  size(600, 600);
  size = width/scale;
  background(255);
  frameRate(10);
  
  cells = new int[size][size];
  
  for (int i=0; i<size; i++) {
    for (int j=0; j<size; j++) {
      cells[i][j] = (int) random(3);
    }
  }
  
}

void drawCells() {
  stroke(200);
  for (int i=0; i<size; i++) {
    for (int j=0; j<size; j++) {
        if (cells[i][j]==0) fill(255);
        else if (cells[i][j]==1) fill(#228b22);
        else fill(#22228b);
        rect(i*scale, j*scale, scale, scale);
    }
  }
}

int checkLiving(int i, int j){
  int livingNeighbors = 0;
  for (int ki = -1; ki < 2; ki++) {
    for (int kj = -1; kj < 2; kj++) {
      livingNeighbors += (cells[(i + ki + size) % size][(j + kj + size) % size]==cells[i][j]) ? 1 : 0;
    }
  }
  return livingNeighbors-1;
}




void cycleOfLife() {
  int[][] newG = new int[size][size];
  
  for (int i = 0; i < size; i++) {
    for (int j = 0; j < size; j++) {
      int ln = checkLiving(i, j); 
      
      if (cells[i][j]>0) {
        if (ln < 4) {
          newG[i][j] = 0;
          while(true){
            int n = (int)random(size); 
            int m = (int)random(size);
            if (cells[n][m]==0 && newG[n][m]==0){
              newG[m][n] = cells[i][j];
              break;
            }
          }
        }else newG[i][j] = cells[i][j];
      }
    }
  }
  cells=newG;
}

void draw() {
  drawCells();
  cycleOfLife();
  if(mousePressed) setup();
  }
