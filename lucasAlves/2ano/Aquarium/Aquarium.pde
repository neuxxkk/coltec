int a=1;
Peixe[] peixes;

void setup() {
  size(800, 600);
  peixes = new Peixe[50];
  for (int i = 0; i < peixes.length; i++) {
    peixes[i] = new Peixe(random(width), random(height), color(random(255), random(255), random(255)));
  }
}

void draw() {
  background(100, 150, 255);
  
  for (int i = 0; i < peixes.length; i++) {
    peixes[i].Move();
    peixes[i].Desenha();
  }
}

class Peixe {
  float x, y;
  float vx, vy;
  int cor;
  int contador;
  
  Peixe(float x, float y, int cor) {
    this.x = x;
    this.y = y;
    this.cor = cor;
    vx = random(-5, 5);
    vy = random(-5, 5);
    contador = 0;
  }
  
  void Move() {
    x += vx;
    y += vy;
    contador++;
    
    if (contador >= 600) {
      vx = random(-2, 2);
      vy = random(-2, 2);
      contador = 0;
    }
    
    if (x <= 0 || x >= width) {
      vx *= -1;
    }
    
    if (y <= 0 || y >= height) {
      vy *= -1;
    }
  }
  
  void Desenha() {
    float angle = atan2(vy, vx); // Angle between velocity vector and x-axis
    float aheadX = x + 20 * cos(angle); // Point slightly ahead in the direction of motion
    float aheadY = y + 20 * sin(angle); // Point slightly ahead in the direction of motion
    
    pushMatrix();
    translate(x, y);
    rotate(atan2(aheadY - y, aheadX - x)); // Adjusted rotation calculation
    
    fill(cor);
    
    // Desenha o corpo do peixe (triângulo)
    beginShape();
    vertex(-67, 11);  // Começa no final da elipse
    vertex(-67, -11); // Modificamos as coordenadas dos vértices da cauda
    vertex(-40, 0);    // Modificamos as coordenadas dos vértices da cauda
    endShape(CLOSE);
    
    // Desenha a cabeça do peixe (elipse)
    ellipse(-20, 0, 50, 20); // Desenhamos a elipse um pouco à esquerda do centro para que a cabeça seja o ponto de referência
    
    popMatrix();
  }
}
