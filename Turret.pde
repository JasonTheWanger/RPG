class Turret extends Enemy{
 
  Turret(int x, int y){
    super(500,50,x,y);
    threshold=80;
    timer=0;
    bulletSpeed=10;
  }
   void show() {
    stroke(black);
    strokeWeight(2);
    fill(yellow);
    circle(loc.x, loc.y, size);
    fill(black);
    textSize(20);
    text(hp, loc.x, loc.y);
  }
  void act(){
    timer++;
    super.act();
    if(timer>=threshold){
     PVector aimVector = new PVector(hero.loc.x-loc.x, hero.loc.y-loc.y);
     aimVector.setMag(bulletSpeed);
     object.add(new EnemyBullet(aimVector, white, 15));
     timer=0;
    }
  }
}
