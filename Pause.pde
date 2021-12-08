void Pause(){
  click();
  background(yellow);
  textAlign(CENTER);
  fill(0);
  text("Hero Speed lvl: " +speedLvl, width/4, height*1/5);
  text("Hero Max hp lvl: " +hpLvl, width/4, height/2);
  text("All Weapon damage lvl: " +dmgLvl, width/4, height*4/5);
  text("Your remaining EXP: " +hero.exp, width/2, height*1/7);
  blueSpeedButton.show();
  if (blueSpeedButton.clicked&&hero.exp>=1) {
     speedLvl++;
     hero.exp--;
  }
  greenHpButton.show();
  if (greenHpButton.clicked&&hero.exp>=1) {
     hpLvl++;
     hero.maxHp+=10;
     hero.exp--;
  }
  redDmgButton.show();
  if (redDmgButton.clicked&&hero.exp>=1) {
     dmgLvl++;
     hero.exp--;
  }

}
