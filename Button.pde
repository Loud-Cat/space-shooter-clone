
color BTN_INACTIVE = color(225);
color BTN_ACTIVE   = color(200);
color BTN_CLICK    = color(175);
color BTN_OUTLINE  = color(255);
color SHIP_SELECT  = color(0, 255, 255);

class Button {
  String content;
  PImage icon;
  
  // x, y, button-width, button-height
  float x, y, bw, bh;
  
  color outline = BTN_OUTLINE;
  boolean active = false, disabled = false;
  
  Button(String content, float x, float y, int bw, int bh) {
    this.content = content;
    this.x = x;
    this.y = y;
    this.bw = bw;
    this.bh = bh;
  }
  
  Button(PImage icon, float x, float y, int bw, int bh) {
    this("", x, y, bw, bh);
    this.icon = icon;
  }
  
  void display() {
    if (disabled)
      fill(200, 150, 150);
    else if (active)
      fill(mousePressed ? BTN_CLICK : BTN_ACTIVE);
    else
      fill(BTN_INACTIVE);
    
    strokeWeight(3);
    stroke(outline);
    rect(x, y, bw, bh, 25);
    
    if ( !content.isEmpty() ) {
      fill(0);
      noStroke();
      textSize(50);
      textAlign(CENTER, CENTER);
      text(content, x + bw/2, y + bh/2);
    }
    else if (icon != null) {
      push();
      imageMode(CENTER);
      image(icon, x + bw/2, y + bh/2);
      pop();
    }
  }
  
  void listenMouse() {
    if (disabled)
      return;
    
    boolean mx = (mouseX > x && mouseX < x + bw);
    boolean my = (mouseY > y && mouseY < y + bh);
    active = (mx && my);
  }
}
