
class Enemy {
  PImage img;
  int iw, ih;
  
  float x, y, vel;
  
  ArrayList<Bullet> bullets;
  
  int fireInterval = 1000;
  int lastFired = -1;
  
  Enemy(PImage img) {
    this.img = img.copy();
    iw = img.width * 75/100;
    ih = img.height * 75/100;
    
    x = width;
    y = random(0, height - ih);
    vel = -3;
    
    bullets = new ArrayList<>();
  }
  
  void display() {
    for (int i = bullets.size() - 1; i >= 0; i--) {
      Bullet bullet = bullets.get(i);
      
      bullet.display();
      bullet.update();
      
      if (bullet.x < vel || player.isColliding(bullet.x, bullet.y))
        bullets.remove(i);
    }
    
    noStroke();
    image(img, x, y, iw, ih);
  }
  
  void update() {
    int m = millis();
    
    if (lastFired == -1 || (m - lastFired) > fireInterval) {
      Bullet b = new Bullet(x, y + ih/2, -10, ENEMY_BULLET);
      bullets.add(b);
      
      fireInterval = int( random(100, 1000) );
      lastFired = m;
    }
    
    x += vel;
  }
  
  boolean isColliding(float x, float y) {
    boolean cx = (x > this.x && x < this.x + iw);
    boolean cy = (y > this.y && y < this.y + ih);
    return (cx && cy);
  }
}
