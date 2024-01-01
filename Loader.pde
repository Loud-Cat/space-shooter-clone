
Table scores;
PImage[] icons, ships, foes;

void loadScene() {
  scores = loadTable("scores.csv", "header");
  scores.setColumnType("SCORE", Table.INT);
  
  keyCodes = new ArrayList<>();
  
  int gap = 25;
  int fullwidth = (width - 525 - gap * 2) - (gap * 2);
  int btnwidth = fullwidth / 3;
  
  loadImages();
  
  shipBtns = new Button[3];
  for (int i = 0; i < 3; i++) {
    float x = (500 + 25) + (btnwidth + gap) * i;
    shipBtns[i] = new Button(icons[i], x, 150, btnwidth, btnwidth);
  }
  
  shipBtns[0].outline = SHIP_SELECT;
  
  ship = 0;
  player = new Player(ships[0]);
  enemies = new ArrayList<>();
  
  playBtn = new Button("PLAY", 500, height - 100, width - 525, 75);
  menuBtn = new Button("Main Menu", width/2 - 200, height/2 - 50, 400, 100);
  
  playBtn.disabled = true;
}

void loadImages() {
  icons = new PImage[3];
  ships = new PImage[3];
  foes = new PImage[3];
  
  String[] colors = {"red", "green", "blue"};
  for (int i = 0; i < 3; i++) {
    String iconFile = String.format("images/icon-%s.png", colors[i]);
    String shipFile = String.format("images/ship-%s.png", colors[i]);
    String foeFile  = String.format("images/enemy-%s.png",  colors[i]);
    
    icons[i] = loadImage(iconFile);
    ships[i] = loadImage(shipFile);
    foes[i]  = loadImage(foeFile);
  }
}
