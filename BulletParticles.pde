class BulletParticles extends GameObject {
  int t;
  color fill;

  BulletParticles(PVector location, color c) {
    loc=location.copy();
    vel = new PVector(-2, 2);
    vel.rotate(random(-PI, PI));
    vel.setMag(5);
    t=int(random(200, 255));
    size=int(random(2, 6));
    fill=c;
    hp=1;
    roomx=hero.roomx;
    roomy=hero.roomy;
  }
  
  void show() {
    noStroke();
    fill(fill, t);
    circle(loc.x, loc.y, size);
    println(loc);
    if (loc.x>=width-40||loc.x<=40||loc.y>=height-40||loc.y<=40) {
      hp--;
    }
  }
  
  void act() {
    super.act();
    t-=10;
    if (t<=0) {
      hp--;
    }
  }
}
