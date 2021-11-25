class Follower extends Enemy {
  int lurkD;
  Follower(int x, int y) {
    super(100, 50, x, y);
    lurkD=350;
  }
  Follower(int _hp, int s, int x, int y, int d) {
    super(_hp, s, x, y);
    lurkD=d;
  }
  void show() {
    stroke(black);
    strokeWeight(2);
    fill(blue);
    circle(loc.x, loc.y, size);
    fill(black);
    textSize(20);
    text(hp, loc.x, loc.y);
  }
  void act() {
    super.act();
    if (dist(loc.x, loc.y, hero.loc.x, hero.loc.y)<=lurkD) {
      vel = new PVector(hero.loc.x-loc.x, hero.loc.y-loc.y);
      vel.setMag(random(2, 4));
    } else
      vel.setMag(0);
  }
}
