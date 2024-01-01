
enum Screen {
  TITLE,
  GAME,
  GAME_OVER
};

Screen screen = Screen.TITLE;

void displayScreen() {
  switch (screen) {
    case TITLE:
      displayTitle();
      break;
    case GAME:
      displayGame();
      break;
    case GAME_OVER:
      displayGameOver();
      break;
  }
}
