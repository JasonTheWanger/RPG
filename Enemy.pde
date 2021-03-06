class Enemy extends GameObject {
  int threshold, timer;
  float bulletSpeed;
  Enemy () {
    loc =new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hp=100;
    roomx=1;
    roomy=1;
    size=50;
  }

  Enemy (int _hp, int s, int x, int y) {
    loc = new PVector(width/2, height/2);
    vel = new PVector (0, 0);
    hp= _hp;
    size =s;
    roomx=x;
    roomy=y;
  }

  void show() {
    stroke(black);
    strokeWeight(2);
    fill(green);
    circle(loc.x, loc.y, size);
    fill(black);
    textSize(20);
    text(hp, loc.x, loc.y);
  }

  void act() {
    super.act();

    for (int i=0; i<object.size(); i++) {
      GameObject GB= object.get(i);
      if (GB instanceof Bullet) {
        float d = dist(GB.loc.x, GB.loc.y, loc.x, loc.y);
        if (d<=size/2 +GB.size/2) {
          if (gun1)
            hp-=int(GB.vel.mag()*0.44)*(1+dmgLvl*0.1);
          else if (gun2)
            hp-=int(GB.vel.mag())*2/6*(1+dmgLvl*0.1);
          else if (gun3)
            hp-=int(GB.vel.mag())*6/5*(1+dmgLvl*0.1);
          else if (gun4)
            hp-=int(GB.vel.mag())*17/15*(1+dmgLvl*0.1);
          else if (gun5)
            hp-=int(GB.vel.mag())*6.25*(1+dmgLvl*0.1);
          else if (gun6)
            hp-=int(GB.vel.mag())*15/20*(1+dmgLvl*0.1);
          else
            hp-=int(GB.vel.mag())*(1+dmgLvl*0.1);
          GB.hp--;
        }
      }
    }
    if (collidingWith(this)&&hero.immuned<=0) {

      hero.hp-=18;
      hero.immuned=150;
    }
    if (hp<=0) {
      for (int i=0; i<30; i++) {
        object.add(new BulletParticles(loc, black));
      } 
      if (size>=50) {
        object.add(new DroppedItem(loc.x, loc.y, roomx, roomy, int(random(1, 3))));
        hero.exp++;
        object.add(new Message("+EXP", loc.x, loc.y));
      }
    }
  }
}
