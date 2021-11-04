class BulletParticles extends GameObject{
  int t;
  color fill;
 BulletParticles(PVector location, color c){
   loc=location;
   vel = new PVector(-5,5);
    vel.rotate(PI+random(-3.14,3.14));
    vel.setMag(5);
   t=int(random(200,255));
   size=int(random(2,6));
   fill=c;
 }
 void show(){
   noStroke();
    fill(fill,t);
  circle(loc.x, loc.y, size);
 }
 void act(){
  super.act();
  t-=10;
  if(t<=0){
   hp--; 
  }
 }
}
