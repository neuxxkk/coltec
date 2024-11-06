class Ball {
  PVector pos, vel;
  float size;
  boolean hit;
  int time = 1;

  Ball(float x, float y, float size, float speed) {
    pos = new PVector(x, y);
    //vel = new PVector(constrain(random(-1, 1)*10, -1, 1), constrain(random(-1, 1)*10, -1, 1));
    vel = new PVector(-1, -1);
    vel.mult(speed);
    this.size = size;
  }

  void update() {
    if (pos.x-size/2.0+vel.x<0 || pos.x+size/2.0+vel.x>width) vel.x*=-1;
    if (pos.y-size/2.0+vel.y<0 || pos.y+size/2.0+vel.y>height) vel.y*=-1;

    if (pos.y-size/2.0+vel.y>platform.pos.y-platform.size/2.0 && pos.y+size/2.0+vel.y<platform.pos.y+platform.size/2.0) {
      if (pos.x-size/2.0+vel.y<platform.pos.x+5) {
        vel.x*=-1;
        hit = true;
      }
    }

    if (hit) time++;

    if (time%5==0) {
      ++jogo.pontuacao;
      hit = false;
      time = 1;
    }

    pos.add(vel);
  }

  void show() {

    fill(255);
    ellipse(pos.x, pos.y, size, size);
  }
}
