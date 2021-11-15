class awp extends Weapon {

  awp() {
    super(180, 40);
  }
}

class glock_18 extends Weapon {

  glock_18() {
    super(30, 8.2);
  }
  void shoot() {
    if (timer>=threshold) {
        PVector aimVector = new PVector(mouseX-hero.loc.x, mouseY-hero.loc.y);
        aimVector.rotate(random(PI/30-PI/10, PI*5/30-PI/10));
        aimVector.setMag(bulletSpeed);
        object.add(new Bullet(aimVector, black, 7));
        timer=0;
    }
  }
}

class sawed_off extends Weapon {

  sawed_off() {
    super(120, 10.1);
  }

  void shoot() {
    if (timer>=threshold) {
      for (int  i = 0; i< 10; i++) {
        PVector aimVector = new PVector(mouseX-hero.loc.x, mouseY-hero.loc.y);
        aimVector.rotate(random(PI/15-PI/5, PI*5/15-PI/5));
        aimVector.setMag(bulletSpeed);
        object.add(new Bullet(aimVector, black, 10));
        timer=0;
      }
    }
  }
}

class m249 extends Weapon{
  m249(){
   super(8, 20);
  }
  void shoot() {
    if (timer>=threshold) {
        PVector aimVector = new PVector(mouseX-hero.loc.x, mouseY-hero.loc.y);
        aimVector.rotate(random(PI/39.6-PI/13.2, PI*5/39.6-PI/13.2));
        aimVector.setMag(bulletSpeed);
        object.add(new Bullet(aimVector, black, 7));
        timer=0;
    }
  }
}

class m1_garand extends Weapon{
 m1_garand(){
  super(40, 25.1); 
 }
 void shoot() {
    if (timer>=threshold) {
        PVector aimVector = new PVector(mouseX-hero.loc.x, mouseY-hero.loc.y);
        aimVector.rotate(random(PI/144-PI/48, PI*5/144-PI/48));
        aimVector.setMag(bulletSpeed);
        object.add(new Bullet(aimVector, black, 7));
        timer=0;
    }
  }
}
