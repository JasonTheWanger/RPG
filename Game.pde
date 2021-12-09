void Game() {
  drawRoom();
  drawGameObject();
  drawMap();
  println(hero.vel.mag());
}
void drawRoom() {
  background(#DE7F02);
  stroke(brown);
  strokeWeight(4);
  line(0, 0, width, height);
  line(width, 0, 0, height);

  nroom=map.get(hero.roomx, hero.roomy-1);
  eroom=map.get(hero.roomx+1, hero.roomy);
  sroom=map.get(hero.roomx, hero.roomy+1);
  wroom=map.get(hero.roomx-1, hero.roomy);

  noStroke();
  fill(black);
  if (nroom != white) {
    ellipse(width/2, height*0.1, 100, 100);
  }
  if (eroom != white) {
    ellipse(width*0.9, height/2, 100, 100);
  }
  if (sroom != white) {
    ellipse(width/2, height*0.9, 100, 100);
  }
  if (wroom != white) {
    ellipse(width*0.1, height/2, 100, 100);
  }
  rectMode(CENTER);
  stroke(black);
  fill(brown);
  rect(width/2, height/2, width-100, height-100);
}
void drawGameObject() {
  for (int i=0; i<object.size(); i++) {
    GameObject GB = object.get(i);
    if (GB.roomx==hero.roomx&&GB.roomy==hero.roomy) {
      GB.show();
      GB.act();
      if (GB.hp<=0) {
        object.remove(i);
        i--;
      }
    }
  }
  for (int i =0; i<darkness.size(); i++) {
    darkness.get(i).show();
  }
}
void drawMap() {
  rectMode(CENTER);
  int x=0, y=0, size=10;
  while (y<map.height) {
    color c = map.get(x, y);
    fill(c, 144);
    square(x*10+58, y*10+58, size);
    x++;
    if (x>=map.width) {
      y++;
      x=0;
    }
  }
  fill(255, 0, 0, 144);
  square(hero.roomx*10+58, hero.roomy*10+58, size);
}
