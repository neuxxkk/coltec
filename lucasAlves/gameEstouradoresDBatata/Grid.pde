int [][] grid;
int s =15;
int cellSize;
int playerX, playerY;

int[][] criaGrid() {
  int[][] m = new int[s][s];

  for (int i = 0; i < s; i++) {
    for (int j = 0; j < s; j++) {
      m[i][j] = (random(1) > 0.9) ? 1 : 0; // 10% de chance de nascer um obstáculo
      if(i==s/2&&j==s/2)m[i][j] =0; // não pode ser a posição do player
    }
  }
  playerX = s/2;
  playerY = s/2;
  return m;
}


void mostraGrid() {
  float l = width / (float) s;
  float h = height / (float) s;
  for (int i = 0; i < s; i++) {
    for (int j = 0; j < s; j++) {
      if (grid[i][j] == 1) {
         image(imagens[obstaculo], j * l, i * h, l, h);
     }
     noStroke();
     noFill();
     rect(j * l, i * h, l, h);
    }
}

  // Anima o player
  int playerRotate = frameCount % 320; //velocidade do balanço
  pushMatrix();
  translate(playerX * l + l / 2, playerY * h + h / 2); //coloca eixo de rotação no centro
  float mappedRot = map(playerRotate, 0, 320, 0, PI); 
  mappedRot = sin(mappedRot * PI) * 0.03 * PI + 6.2; //6.2 == angulo central 
  rotate(mappedRot);  
  image(imagens[skin], -imagens[skin].width / 2, -imagens[skin].height / 2); // Desenha a imagem do jogador
  popMatrix();
}

void keyPressed() {
  int newPlayerX = playerX;
  int newPlayerY = playerY;
  
  if (pausa == false && jogar == true){
    if ((keyCode == UP || key == 'w' || key == 'W') && playerY > 0 && grid[playerY - 1][playerX] != 1) {
      newPlayerY--;
    } else if ((keyCode == DOWN || key == 's' || key == 'S') && playerY < s - 1 && grid[playerY + 1][playerX] != 1) {
      newPlayerY++;
    } else if ((keyCode == LEFT || key == 'a' || key == 'A') && playerX > 0 && grid[playerY][playerX - 1] != 1) {
      newPlayerX--;
    } else if ((keyCode == RIGHT || key == 'd' || key == 'D') && playerX < s - 1 && grid[playerY][playerX + 1] != 1) {
      newPlayerX++;
    }
    // Verifica se o novo bloco contém um item
    for (int i = 0; i < itens.length; i++) {
      if (itens[i] != null) {
        for (int j = 0; j < itens[i].length; j++) {
          if (itens[i][j] != null && itens[i][j].x == newPlayerX * cellSize && itens[i][j].y == newPlayerY * cellSize) {
  
            score+=itens[i][j].valor;
            setItem(0,0,inventario,itens[i][j].index-2);
                      
            itens[i][j] = null;
          }
        }
      }
    }
  
    // Atualiza a posição do jogador se não houver item ou obstáculo no novo bloco
      if (grid[newPlayerY][newPlayerX] == 0) {
        playerX = newPlayerX;
        playerY = newPlayerY;
      }
  }
  
    if ((keyCode == 'F')){
    if(pausa == true){
      pausa = false;
    }
    else{
      pausa = true;
    }
  }
  
}
