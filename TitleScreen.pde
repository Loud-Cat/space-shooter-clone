
Button playBtn;
Button[] shipBtns;

char[] initials = new char[3];
int cursor = 0;

int BLINK_INTERVAL = 500;

void displayTitle() {
  textAlign(CENTER, TOP);
  textSize(65);
  
  fill(255);
  noStroke();
  text("SPACE SHOOTER", width/2, 25);
  
  int x = 25;
  int y = 80;
  
  int w = 450;
  int h = 145;
  
  drawInstructions(x, y, w, h);
  drawLeaderboard(x, y + h + 25, w, 400);
  
  drawContainer("CHOOSE YOUR SHIP", 500, y, width - 525, 285);
  drawInitials(500, y + 285 + 25, width - 525, 160);
  
  playBtn.display();
  playBtn.listenMouse();
  
  for (Button btn : shipBtns) {
    btn.display();
    btn.listenMouse();
  }
}

void drawInstructions(int x, int y, int w, int h) {
  drawContainer("INSTRUCTIONS", x, y, w, h);
  
  textSize(30);
  textAlign(LEFT);
  
  text("Press W/S or UP/DOWN to move", x + 25, y + 85);
  text("Press SPACE to fire", x + 25, y + 120);
}

void drawLeaderboard(int x, int y, int w, int h) {
  drawContainer("LEADERBOARD", x, y, w, h);
  
  textSize(40);
  
  textAlign(LEFT);
  text("NAME", x + 50, y + 85);
  
  textAlign(RIGHT);
  text("SCORE", x + w - 50, y + 85);
  
  textAlign(CENTER);
  
  textSize(30);
  scores.sortReverse("SCORE");
  for (int i = 0; i < scores.getRowCount(); i++) {
    TableRow row = scores.getRow(i);
    String name = row.getString("NAME");
    int score = row.getInt("SCORE");
    
    int ty = y + 120 + (30 * i);
    text(name, x + 100, ty);
    text(score, x + 345, ty);
  }
}

void drawInitials(int x, int y, int w, int h) {
  drawContainer("ENTER YOUR INITIALS", x, y, w, h);
  
  int gap = 25;
  int fullwidth = (width - 525 - gap * 2) - (gap * 2);
  int linewidth = fullwidth / 3;
  
  strokeWeight(3);
  
  textSize(60);
  textAlign(CENTER, BOTTOM);
  
  int m = millis();
  for (int i = 0; i < 3; i++) {
    float lx = (500 + 25) + (linewidth + gap) * i;
    float ly = y + h - 25;
    
    if (i == cursor && (m / BLINK_INTERVAL) % 2 == 0)
      stroke(0, 255, 255);
    else
      stroke(255, 255, 0);
    
    line(lx, ly, lx + linewidth, ly);
    
    if (i < cursor) {
      noStroke();
      fill(255, 255, 0);
      text(initials[i], lx + linewidth/2, ly - 5);
    }
  }
}

void drawContainer(String title, int x, int y, int w, int h) {
  noFill();
  strokeWeight(2);
  stroke(255, 255, 0);
  rect(x, y, w, h, 25);
  
  fill(255);
  noStroke();
  textSize(45);
  textAlign(CENTER, TOP);
  text(title, x + w/2, y + 15);
}
