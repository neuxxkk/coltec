class Platform {
  PVector pos;
  float vel;
  float size;
  boolean up, down;
  
  Platform(float x, float y, float size) {
    pos = new PVector(x, y);
    this.size = size;
  }
  
  void update(){
    vel*=.95;
    pos.y = constrain(pos.y+vel, 0, height);
  }
  
  void show() {
    rectMode(CENTER);
    noStroke();
    fill(255);
    rect(pos.x, pos.y, 10, size);
  }
}
