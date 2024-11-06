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
    pos.y = constrain(pos.y+vel, size/2.0, height-size/2.0);
  }
  
  void show() {
    rectMode(CENTER);
    noStroke();
    fill(255);
    rect(pos.x, pos.y, 10, size);
  }
}
