int cells[][];
int scale = 3;
int size;
int count;

void setup() {
  size(600, 600);
  size = width/scale;
  background(255);
  frameRate(100);
  
  cells = new int[size][size];
  
  for (int i=0; i<size; i++) {
    for (int j=0; j<size; j++) {
       float p= random(1);
       if (p<=0.5) cells[i][j] = 0;
       else if (p>0.5 && p<=0.75) cells[i][j] = 1;
       else cells[i][j] = 2;
    }
  }
  
}

void drawCells() {
  stroke(200);
  for (int i=0; i<size; i++) {
    for (int j=0; j<size; j++) {
        if (cells[i][j]==0){ fill(255);}
        else if (cells[i][j]==1) fill(#228b22);
        else fill(#22228b);
        rect(i*scale, j*scale, scale, scale);
    }
  }
}

int checkLiving(int i, int j){
  int differentNeighbors = 0;
  for (int ki = -1; ki < 2; ki++) {
    for (int kj = -1; kj < 2; kj++) {
      if (cells[(i + ki + size) % size][(j + kj + size) % size] == cells[i][j]) differentNeighbors++;
    }
  }  
  return differentNeighbors-1;
}




void cycleOfLife() {
  count=0;
  int ln=0;
  int[][] newG = new int[size][size];
  
  for (int i = 0; i < size; i++) {
    for (int j = 0; j < size; j++) { 
      
      if (cells[i][j]!=0) {
        ln = checkLiving(i, j);
        if (ln < 4) { //insatisfeito
          count++;
          newG[i][j] = 0;
          while(true){
            int fi = (int)random(size); 
            int fj = (int)random(size);
            if (cells[fi][fj]==0 && newG[fi][fj]==0){
              newG[fi][fj] = cells[i][j];
              break;
            }
          }
        }else{
          newG[i][j] = cells[i][j];
        }
      }
    }
  }
  cells=newG;
  println(count);
}

void draw() {
  drawCells();
  cycleOfLife();
  if(mousePressed) setup();
  }
