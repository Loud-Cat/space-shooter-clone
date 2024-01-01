
int PLR_MAX_HEALTH = 100;
int PLR_FIRE_INTERVAL = 1000 / 5;

// Player gets immunity after gettig hit
int DAMAGE_COOLDOWN = 500;

class Player {
  PImage img;
  int iw, ih;
  
  float x, y;
  int health;
  
  ArrayList<Bullet> bullets;
  int lastFired = -1;
  int lastDamage = -1;
  
  int score = 0;
  
  Player(PImage img) {
    setImage(img);
    
    x = 50;
    y = height/2 - ih/2;
    
    health = PLR_MAX_HEALTH;
    
    bullets = new ArrayList<>();
  }
  
  void setImage(PImage img) {
    this.img = img.copy();
    iw = img.width * 75/100;
    ih = img.height * 75/100;
  }
  
  void display() {
    displayShip();
    displayBullets();
    displayInfo();
  }
  
  void displayShip() {
    noStroke();
    image(img, x, y, iw, ih);
  }
  
  void displayBullets() {
    for (int i = bullets.size() - 1; i >= 0; i--) {
      Bullet bullet = bullets.get(i);
      
      bullet.display();
      bullet.update();
      
      boolean collide = false;
      for (int j = enemies.size() - 1; j >= 0; j--) {
        Enemy enemy = enemies.get(j);
        
        if ( enemy.isColliding(bullet.x, bullet.y) ) {
          enemies.remove(j);
          collide = true;
          score++;
          break;
        }
      }
      
      if (bullet.x > width || collide)
        bullets.remove(i);
    }
  }
  
  void displayInfo() {
    int barHeight = 150;
    
    noStroke();
    fill(255, 0, 0);
    rect(10, 10, 25, barHeight);
    
    int damage = PLR_MAX_HEALTH - health;
    float by = map(damage, 0, PLR_MAX_HEALTH, 10, 10 + barHeight);
    float bh = map(health, 0, PLR_MAX_HEALTH, 0, barHeight);
    
    fill(0, 255, 0);
    rect(10, by, 25, bh);
    
    textSize(16);
    noStroke();
    fill(255);
    
    textAlign(CENTER, TOP);
    text(health, 22, 10 + barHeight + 5);
     
    textAlign(LEFT, BOTTOM);
    text(score, 10, height - 10);
  }
  
  void listenKey() {
    int w = int('w');
    int s = int('s');
    
    if (keyCodes.contains(w) || keyCodes.contains(UP))
      y -= 5;
    else if (keyCodes.contains(s) || keyCodes.contains(DOWN))
      y += 5;
    
    y = constrain(y, -ih/2, height - ih/2);
    
    if ( keyCodes.contains(32) ) {
      Bullet b = new Bullet(x + iw, y + ih/2, 10, PLR_BULLET);
      int m = millis();
      
      if (lastFired == -1 || (m - lastFired) >= PLR_FIRE_INTERVAL) {
        bullets.add(b);
        lastFired = m;
      }
    }
  }
  
  boolean isColliding(float x, float y) {
    boolean cx = (x > this.x && x < this.x + iw);
    boolean cy = (y > this.y && y < this.y + ih);
    boolean out = (cx && cy);
    
    if (out) {
      int m = millis();
      if (lastDamage == -1 || (m - lastDamage) > DAMAGE_COOLDOWN) {
        lastDamage = m;
        health = max(0, health - 5);
        
        if (health == 0)
          gameOver();
      }
    }
    
    return out;
  }
}
