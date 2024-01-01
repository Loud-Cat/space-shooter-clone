
color PLR_BULLET = color(255, 255, 0);
color ENEMY_BULLET = color(255, 0, 255);

class Bullet {
  float x, y, vel;
  color c;
  
  boolean disabled = false;
  
  Bullet(float x, float y, float vel, color c) {
    this.x = x;
    this.y = y;
    this.vel = vel;
    this.c = c;
  }
  
  void display() {
    stroke(c);
    strokeWeight(3);
    line(x, y, x + vel, y);
  }
  
  void update() {
    x += vel;
  }
}
