
int ENEMY_SPAWN_RATE = 2000;
int lastEnemy = -1;

int ship;
Player player;

ArrayList<Enemy> enemies;

void resetGame() {
  screen = Screen.GAME;
  
  player.setImage( ships[ship] );
  player.health = PLR_MAX_HEALTH;
  player.score = 0;
  
  enemies.clear();
}

void displayGame() {
  for (int i = enemies.size() - 1; i >= 0; i--) {
    Enemy enemy = enemies.get(i);
    
    enemy.display();
    enemy.update();
    
    if (enemy.x < -enemy.iw + 2)
      enemies.remove(i);
  }
  
  player.display();
  player.listenKey();
  
  int m = millis();
  if (lastEnemy == -1 || (m - lastEnemy) > ENEMY_SPAWN_RATE) {
    int i = int( random(0, 3) );
    Enemy e = new Enemy(foes[i]);
    enemies.add(e);
    
    lastEnemy = m;
  }
}
