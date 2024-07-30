PImage[] imagens;
void resize(PImage []imgs){
    cellSize = width/s;
  imgs[0].resize(floor(cellSize*0.7), 0);//
  imgs[1].resize(floor(cellSize*0.55), 0);
  imgs[2].resize(floor(cellSize*0.9), 0);
  imgs[3].resize(floor(cellSize*0.8), 0);
  imgs[4].resize(floor(cellSize*0.6), 0);
  imgs[5].resize(floor(cellSize*0.6), 0);
  imgs[6].resize(floor(cellSize*0.6), 0);
  imgs[7].resize(floor(cellSize*0.6), 0);//
  imgs[8].resize(floor(cellSize*0.3), 0);// 
  imgs[9].resize(floor(cellSize*0.7), 0);//
  
  //SKINS
  imgs[11].resize(floor(cellSize), 0);// 
  imgs[31].resize(floor(cellSize*0.7), 0);// 
  imgs[32].resize(floor(cellSize*1.2), 0);// 
  
  //MAPS
  imgs[27].resize(width, height);// 
  imgs[28].resize(imgs[28].width, imgs[28].height);// 
  
  imgs[29].resize(width, height);// 
  imgs[30].resize(imgs[30].width, imgs[30].height);// 
  
  imgs[12].resize(width, height);// 
  imgs[13].resize(imgs[13].width, imgs[13].height);// 
}

PImage[] loadImages() {
  PImage[] imgs = new PImage[40]; // Declare the image array


  // Load images
  imgs[0] = loadImage("imgs/foice.png");
  imgs[1] = loadImage("imgs/espada.png");
  imgs[2] = loadImage("imgs/escudo.png");
  imgs[3] = loadImage("imgs/carne.png");
  imgs[4] = loadImage("imgs/arco.png");
  imgs[5] = loadImage("imgs/flecha.png");
  imgs[6] = loadImage("imgs/pocao.png");
  imgs[7] = loadImage("imgs/martelo.png");
  imgs[8] = loadImage("imgs/tocha.png");
  imgs[9] = loadImage("imgs/capacete.png");
  imgs[10] = loadImage("imgs/bg.jpg");
  
  imgs[15] = loadImage("imgs/inventariomenu.png");
   
  imgs[16] = loadImage("imgs/foice.png");
  imgs[17] = loadImage("imgs/espada.png");
  imgs[18] = loadImage("imgs/escudo.png");
  imgs[19] = loadImage("imgs/carne.png");
  imgs[20] = loadImage("imgs/arco.png");
  imgs[21] = loadImage("imgs/flecha.png");
  imgs[22] = loadImage("imgs/pocao.png");
  imgs[23] = loadImage("imgs/martelo.png");
  imgs[24] = loadImage("imgs/tocha.png");
  imgs[25] = loadImage("imgs/capacete.png");
  imgs[26] = loadImage("imgs/map1.png");
  
  
  imgs[12] = loadImage("imgs/grassBg.jpg");
  imgs[13] = loadImage("imgs/tree.png");
  
  imgs[27] = loadImage("imgs/iceBg.jpg");
  imgs[28] = loadImage("imgs/ice.png");
  
  imgs[29] = loadImage("imgs/sandBg.jpg");
  imgs[30] = loadImage("imgs/vulcan.png");
  
  imgs[11] = loadImage("imgs/skin1.png");
  imgs[31] = loadImage("imgs/skin2.png");
  imgs[32] = loadImage("imgs/skin3.png");
  
  resize(imgs);

  return imgs;
}
