void intro() {

  introScreen.show();
  introButt.show();
  bFunction();
  textFont(specialFont);
  textSize(100);
  fill (brown);
  text("Dungeon Crawler", width/2, 200);
}

void pause() {

  background (grey);
  rectMode(CENTER);
  textFont(neatFont);

  unPause.show();
  bFunction();

  fill(255);
  textSize(50);
  //textMode(CORNER);
  textFont (specialFont);
  text("Upgrade Points: " + h.xp, width/2, height/6);
  text("Health:        " + h.maxHp, width/3, 200);
  text("Speed:         " + h.speed, width/3, 250);
  text("Turret Timer:  " + (30 + tAdded), width/3, 300);
  text("Barrier Health:   " + (100 + bAdded), width/3, 350);

  addHp.show();
  if (addHp.clicked && h.xp > 0){h.maxHp++; h.hp++; h.xp--;}
  
  addSpeed.show();
  if (addSpeed.clicked && h.xp > 0){h.speed++; h.xp--; }
  
  addTurretTimer.show();
  if (addTurretTimer.clicked && h.xp > 0){tAdded += 3; h.xp--;}
  
  addBarrierHp.show();
  if (addBarrierHp.clicked && h.xp > 0){bAdded += 5; h.xp--;}
  
  
}
