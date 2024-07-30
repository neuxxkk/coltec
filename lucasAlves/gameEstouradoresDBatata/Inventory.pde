import java.util.Arrays;
class Item {
  String tipo;
  int valor;
  PImage icon;
  float x;
  float y;
  int index;

  public Item(String tipo, int valor, PImage icon, int index, float x, float y){
    this.tipo=tipo;
    this.valor=valor;
    this.icon=icon;
    this.index = index;
    this.x = x;
    this.y = y;
 }
 
}

class Foice extends Item {
 public Foice(float x, float y) {
   super("Foice", 6, imagens[0], 2, x, y);  
 }
}

class Espada extends Item {
 public Espada(float x, float y) {
   super("Espada", 8, imagens[1], 3, x, y);
 }
}

class Escudo extends Item {
 public Escudo(float x, float y) {
   super("Escudo", 10, imagens[2],4, x, y);
 }
}

class Carne extends Item {
 public Carne(float x, float y) {
   super("Carne", 3, imagens[3],5, x, y);
 }
}

class Arco extends Item {
 public Arco(float x, float y) {
   super("Arco", 7, imagens[4],6, x, y);
 }
}

class Flecha extends Item {
 public Flecha(float x, float y) {
   super("Flecha", 2, imagens[5],7, x, y);
 }
}

class Pocao extends Item {
 public Pocao(float x, float y) {
   super("Poção", 5, imagens[6],8, x, y);
 }
}

class Martelo extends Item {
 public Martelo(float x, float y) {
   super("Martelo", 9, imagens[7],9, x, y); 
 }
}

class Tocha extends Item {
 public Tocha(float x, float y) {
   super("Tocha", 4, imagens[8],10, x, y);        
 }
}

class Capacete extends Item {
 public Capacete(float x, float y) {
   super("Capacete", 1, imagens[9],11, x, y);
 }
}

// Crie arrays para cada subclasse de Item
Foice[] foiceArray;
Espada[] espadaArray;
Escudo[] escudoArray;
Carne[] carneArray;
Arco[] arcoArray;
Flecha[] flechaArray;
Pocao[] pocaoArray;
Martelo[] marteloArray;
Tocha[] tochaArray;
Capacete[] capaceteArray;

// Crie uma matriz de arrays de itens
Item[][] itens = {
 foiceArray,
 espadaArray,
 escudoArray,
 carneArray,
 arcoArray,
 flechaArray,
 pocaoArray,
 marteloArray,
 tochaArray,
 capaceteArray
};

Item[][] inventario = {
 foiceArray,
 espadaArray,
 escudoArray,
 carneArray,
 arcoArray,
 flechaArray,
 pocaoArray,
 marteloArray,
 tochaArray,
 capaceteArray
};

PImage definetamanhos(int i){
  
  PImage img = imagens[i+16];
  
  if(inventario[i][0].valor == 6){
  img.resize(floor(50*0.7), 0);
  }
  else if(inventario[i][0].valor == 8){
    img.resize(floor(50*0.55), 0);
  }
  else if(inventario[i][0].valor == 10){
    img.resize(floor(50*0.9), 0);
  }
  else if(inventario[i][0].valor == 3){
    img.resize(floor(50*0.8), 0);
  }
  else if(inventario[i][0].valor == 7){
    img.resize(floor(50*0.6), 0);
  }
  else if(inventario[i][0].valor == 2){
    img.resize(floor(50*0.6), 0);
  }
  else if(inventario[i][0].valor == 5){
    img.resize(floor(50*0.6), 0);
  }
  else if(inventario[i][0].valor == 9){
    img.resize(floor(50*0.6), 0);
  }
  else if(inventario[i][0].valor == 4){
    img.resize(floor(50*0.3),0);
  }
  else if(inventario[i][0].valor == 1){
    img.resize(floor(50*0.7),0);
  }
  
  return img;
}

void pause(){
  pausa = true;
  image(bg, 0, 0);
  image(imagens[15], 75, 170);
  
  // Criar uma lista para armazenar os índices dos itens no inventário
  ArrayList<Integer> indices = new ArrayList<Integer>();
  
  // Adicionar os índices dos itens não nulos ao ArrayList
  for(int i = 0; i < inventario.length; i++){
    if(inventario[i] != null){
      indices.add(i);
    }
  }
  
  // Ordenar os índices com base na quantidade de cada item
  indices.sort((a, b) -> Integer.compare(inventario[b].length, inventario[a].length));
  
  // Desenhar os itens em ordem de quantidade
  int x = 125;
  int y = 245;
  int p = 0;
  for(Integer i : indices){
    if(inventario[i][0]!=null){
      String quantidade = String.format("%d", inventario[i].length);
      image(definetamanhos(i), x + (p * 70) - 3, y - 7);
      textSize(20);
      text(quantidade, x + 20 + (p * 70), y + 30);
      p++;
      if(p == 5){
        y = 315;
        p = 0;
      }
    }
  }
  
  int textSize = 20;
  float sc = textSize * 8;
  
  fill(255);
  textSize(textSize);
  text("Score: " + score, width - sc, textSize);
  
  fill(255);
  textSize(20);
  text("RESTART", botaoSx, botaoSy);
  
}



int setItem(float x, float y, Item[][] itens, int itemIndex){ //redimensiona matriz de Item[][], inventario e itens
 
 switch (itemIndex){
   
 case 0:
   if (itens[itemIndex] != null){
       Foice[] it = new Foice[itens[itemIndex].length + 1];
       arrayCopy(itens[itemIndex], it);
       it[itens[itemIndex].length] = new Foice(x, y);
       itens[itemIndex] = it;
   } else {
     itens[itemIndex] = new Foice[1];
     itens[itemIndex][0] = new Foice(x, y);
   }
   break;
 case 1:
   if (itens[itemIndex] != null){
       Espada[] it = new Espada[itens[itemIndex].length + 1];
       arrayCopy(itens[itemIndex], it);
       it[itens[itemIndex].length] = new Espada(x, y);
       itens[itemIndex] = it;
   } else {
     itens[itemIndex] = new Espada[1];
     itens[itemIndex][0] = new Espada(x, y);
   }
   break;
 case 2:
   if (itens[itemIndex] != null){
       Escudo[] it = new Escudo[itens[itemIndex].length + 1];
       arrayCopy(itens[itemIndex], it);
       it[itens[itemIndex].length] = new Escudo(x, y);
       itens[itemIndex] = it;
   } else {
     itens[itemIndex] = new Escudo[1];
     itens[itemIndex][0] = new Escudo(x, y);
   }
   break;
 case 3:
   if (itens[itemIndex] != null){
       Carne[] it = new Carne[itens[itemIndex].length + 1];
       arrayCopy(itens[itemIndex], it);
       it[itens[itemIndex].length] = new Carne(x, y);
       itens[itemIndex] = it;
   } else {
     itens[itemIndex] = new Carne[1];
     itens[itemIndex][0] = new Carne(x, y);
   }
   break;
 case 4:
   if (itens[itemIndex] != null){
       Arco[] it = new Arco[itens[itemIndex].length + 1];
       arrayCopy(itens[itemIndex], it);
       it[itens[itemIndex].length] = new Arco(x, y);
       itens[itemIndex] = it;
   } else {
     itens[itemIndex] = new Arco[1];
     itens[itemIndex][0] = new Arco(x, y);
   }
   break;
 case 5:
   if (itens[itemIndex] != null){
       Flecha[] it = new Flecha[itens[itemIndex].length + 1];
       arrayCopy(itens[itemIndex], it);
       it[itens[itemIndex].length] = new Flecha(x, y);
       itens[itemIndex] = it;
   } else {
     itens[itemIndex] = new Flecha[1];
     itens[itemIndex][0] = new Flecha(x, y);
   }
   break;
 case 6:
   if (itens[itemIndex] != null){
       Pocao[] it = new Pocao[itens[itemIndex].length + 1];
       arrayCopy(itens[itemIndex], it);
       it[itens[itemIndex].length] = new Pocao(x, y);
       itens[itemIndex] = it;
   } else {
     itens[itemIndex] = new Pocao[1];
     itens[itemIndex][0] = new Pocao(x, y);
   }
   break;
 case 7:
   if (itens[itemIndex] != null){
       Martelo[] it = new Martelo[itens[itemIndex].length + 1];
       arrayCopy(itens[itemIndex], it);
       it[itens[itemIndex].length] = new Martelo(x, y);
       itens[itemIndex] = it;
   } else {
     itens[itemIndex] = new Martelo[1];
     itens[itemIndex][0] = new Martelo(x, y);
   }
   break;
 case 8:
   if (itens[itemIndex] != null){
       Tocha[] it = new Tocha[itens[itemIndex].length + 1];
       arrayCopy(itens[itemIndex], it);
       it[itens[itemIndex].length] = new Tocha(x, y);
       itens[itemIndex] = it;
   } else {
     itens[itemIndex] = new Tocha[1];
     itens[itemIndex][0] = new Tocha(x, y);
   }
   break;
 case 9:
   if (itens[itemIndex] != null){
       Capacete[] it = new Capacete[itens[itemIndex].length + 1];
       arrayCopy(itens[itemIndex], it);
       it[itens[itemIndex].length] = new Capacete(x, y);
       itens[itemIndex] = it;
   } else {
     itens[itemIndex] = new Capacete[1];
     itens[itemIndex][0] = new Capacete(x, y);
   }
   break;
 }
 
 return itemIndex;
 
}

void newItem() {
  int x, y;
  boolean itemPresente;
  
  do {
    do{
    x = int(random(s));
    y = int(random(s));
    }while(grid[y][x] != 0);
    //println("x: " + x + " y: " + y + " g: " + grid[y][x]);
    
    // Verifica se já existe um item presente na posição (x, y) ou se é a posição do player
    itemPresente = false;
    for (Item[] linha : itens) {
      if (linha != null) {
        for (Item item : linha) {
          if (item != null && item.x == x * cellSize && item.y == y * cellSize || grid[y][x] != 0) {
            itemPresente = true;
            break;
          }
        }
      }
      if (itemPresente) break;
    }
  } while (itemPresente || (x == playerX && y == playerY));
  
  int itemIndex = int(random(10));
  setItem(x * cellSize, y * cellSize, itens, itemIndex);
 
}

int i = 0;
int j = 0;

void showItem() {
  
    for (int i = 0; i < itens.length; i++) {
        if (itens[i] != null) {
          for (int j = 0; j < itens[i].length; j++) {
             if (itens[i] != null && itens[i][j] != null && itens[i][j].icon != null) {
            // Anima item
            float offsetY = 0;
            offsetY = 5 * sin(frameCount * 0.1);
            //imagens = loadImage,();
            image(itens[i][j].icon, itens[i][j].x + 0.2*cellSize, itens[i][j].y + offsetY*0.8);

          }
        }
      }      
    }
}
