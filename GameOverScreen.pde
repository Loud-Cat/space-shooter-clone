
Button menuBtn;

void displayGameOver() {
  textSize(75);
  textAlign(CENTER);
  fill(255, 0, 0);
  
  text("GAME OVER", width/2, 100);
  
  textSize(50);
  text("You killed " + player.score + " enemies", width/2, 150);
  
  menuBtn.display();
  menuBtn.listenMouse();
}

void gameOver() {
  screen = Screen.GAME_OVER;
  
  TableRow score = scores.addRow();
  score.setString("NAME", new String(initials));
  score.setInt("SCORE", player.score);
  
  scores.sortReverse("SCORE");
  if (scores.getRowCount() > 10)
    scores.removeRow(10);
}
