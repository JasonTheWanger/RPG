class EnemyBullet extends GameObject {
  color fill;
  EnemyBullet(PVector bs, color c, int s) {
    hp =1;
    for (int i=0; i<object.size(); i++) {
      GameObject GB = object.get(i);
      if (GB instanceof Turret) {
        loc=new PVector(GB.loc.x, GB.loc.y);
      }
    }

    vel=bs;
    vel.x+=hero.vel.x*1.25;
    vel.y+=hero.vel.y*1.25;
    vel.setMag(7.5);
    size=s;
    fill=c;
    roomx=hero.roomx;
    roomy=hero.roomy;
  }
  void show() {
    fill(fill);
    circle(loc.x, loc.y, size);
  }

  void act() {
    super.act();
    if (loc.x>=width-50||loc.x<=50||loc.y>=height-50||loc.y<=50) {
      hp--;
      for (int i=0; i<15; i++) {
        object.add(new BulletParticles(loc, white));
      }
    }
   
      if (collidingWith(this)&&hero.immuned<=0) {
        hero.hp-=int(vel.mag()*2.25);
        hero.immuned=150;
        hp--;
        for (int i=0; i<15; i++) {
          object.add(new BulletParticles(loc, white));
        }
      }
  }
}
