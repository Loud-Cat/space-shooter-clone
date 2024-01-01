
ArrayList<Integer> keyCodes;

void mouseClicked() {
  switch (screen) {
    case TITLE:
      checkShipButtons();
      
      if (playBtn.active)
        resetGame();

      break;
    case GAME_OVER:
      if (menuBtn.active)
        screen = Screen.TITLE;
      
      break;
  }
}

void keyPressed() {
  int k = int(key);
  
  if ( Character.isAlphabetic(key) ) {
    if ( !keyCodes.contains(k) )
      keyCodes.add(k);
  }
  else if ( !keyCodes.contains(keyCode) )
    keyCodes.add(keyCode);
  
  if (screen == Screen.TITLE)
    enterInitial();
}

void keyReleased() {
  int k = int(key);
  
  if ( keyCodes.contains(k) )
    keyCodes.remove( Integer.valueOf(k) );
  else if ( keyCodes.contains(keyCode) )
    keyCodes.remove( Integer.valueOf(keyCode) );
}

void checkShipButtons() {
  for (int i = 0; i < 3; i++) {
    Button btn = shipBtns[i];
    
    if (btn.active)
      ship = i;
    else
      btn.outline = BTN_OUTLINE;
  }
  
  shipBtns[ship].outline = SHIP_SELECT;
}

void enterInitial() {
  if ( Character.isAlphabetic(key) ) {
    if (cursor < 3) {
      initials[cursor] = Character.toUpperCase(key);
      cursor++;
    }
  }
  else if (keyCode == BACKSPACE) {
    if (cursor > 0) {
      cursor--;
      initials[cursor] = 0;
    }
  }
  
  boolean hasAll = (cursor == 3);
  playBtn.active = hasAll;
  playBtn.disabled = !hasAll;
}
