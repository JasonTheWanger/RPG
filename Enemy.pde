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
            hp-=int(GB.vel.mag()*0.55);
          else if (gun2)
            hp-=int(GB.vel.mag())*2/6;
          else if (gun3)
            hp-=int(GB.vel.mag())*6/5;
          else if (gun4)
            hp-=int(GB.vel.mag())*17/15;
          else if (gun5)
            hp-=int(GB.vel.mag())*6.25;
          else if (gun6)
            hp-=int(GB.vel.mag())*15/20;
          else
            hp-=int(GB.vel.mag());
          GB.hp--;
        }
      }
    }
    if (collidingWith(this)&&hero.immuned<=0){

        hero.hp--;
        hero.immuned=150;
    }
    if(hp<=0){
     for (int i=0; i<30; i++){
       object.add(new BulletParticles(loc, black)); 
      } 
      object.add(new DroppedItem(loc.x, loc.y, roomx, roomy,GUN));
    }
    //if (withHero(this)&&hero.immuned<=0)
    //  if (dist(loc.x, loc.y, hero.loc.x, hero.loc.y)<=hero.size/2+size/2) {
    //    hero.hp--;
    //    hero.immuned=100;
    //  }
  }
}
