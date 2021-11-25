class spawnPool extends Enemy {
  int roomx, roomy;
  spawnPool(int x, int y) {
    super(500, 50, x, y);
    threshold=300;
    timer=threshold-1;
    roomx=x;
    roomy=y;
  }
  void show() {
    stroke(black);
    strokeWeight(2);
    fill(brown);
    circle(loc.x, loc.y, size);
    fill(black);
    textSize(20);
    text(hp, loc.x, loc.y);
  }
  void act() {
    timer++;
    super.act();
    if (timer==threshold)
      object.add(new Follower(32, 35, roomx, roomy, 500));
    if (timer==threshold+50)
      object.add(new Follower(32, 35, roomx, roomy, 500));
    if (timer==threshold+100)
      object.add(new Follower(32, 35, roomx, roomy, 500));
    if (timer==threshold+150)
      object.add(new Follower(32, 35, roomx, roomy, 500));
    if (timer==threshold+200){
      object.add(new Follower(32, 35, roomx, roomy, 500));
    timer=0;
    }
  }
}
