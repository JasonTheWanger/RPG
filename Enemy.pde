class Enemy extends GameObject {

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
    vel = new PVector (0,0);
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
          hp-=int(GB.vel.mag());
          GB.hp--;
        }
      }
    }
  }
}
