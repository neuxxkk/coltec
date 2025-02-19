int cells[][];
int scale = 3;
int size;

void setup() {
  size(600, 600);
  size = width/scale;
  background(255);
  frameRate(60);
  
  cells = new int[size][size];
  
  for (int i=0; i<size; i++) {
    for (int j=0; j<size; j++) {
      cells[i][j] = (int) random(2);
    }
  }
  
}

void drawCells() {
  stroke(200);
  for (int i=0; i<size; i++) {
    for (int j=0; j<size; j++) {
        fill(cells[i][j] == 1 ? 0 : 255);
        rect(i*scale, j*scale, scale, scale);
    }
  }
}

int checkLiving(int i, int j){
  int livingNeighbors = 0;
  for (int ki = -1; ki < 2; ki++) {
    for (int kj = -1; kj < 2; kj++) {
      livingNeighbors += cells[(i + ki + size) % size][(j + kj + size) % size];
    }
  }
  return livingNeighbors-cells[i][j];
}




void cycleOfLife() {
  int[][] newG = new int[size][size];
  
  for (int i = 0; i < size; i++) {
    for (int j = 0; j < size; j++) {
      int ln = checkLiving(i, j); 
      
      if (cells[i][j]!=0) {
        if (ln < 2 || ln>3) {
          newG[i][j] = 0;
        }else newG[i][j] = 1;
      }else if(ln==3) newG[i][j] = 1;
    }
  }
  cells=newG;
}

void draw() {
  drawCells();
  cycleOfLife();
  if(mousePressed) setup();
  }
