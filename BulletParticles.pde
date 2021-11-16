class BulletParticles extends GameObject{
  int t;
  color fill;
  
 BulletParticles(PVector location, color c){
   loc=location;
   vel = new PVector(-2,2);
    vel.rotate(random(-PI,PI));
    vel.setMag(5);
   t=int(random(200,255));
   size=int(random(2,6));
   fill=c;
   hp=1;
   roomx=hero.roomx;
   roomy=hero.roomy;
 }
 void show(){
   noStroke();
    fill(fill,t);
  circle(loc.x, loc.y, size);
  if(loc.x>=width-50||loc.x<=50||loc.y>=height-50||loc.y<=50){
     hp--; 
   }
 }
 void act(){
  super.act();
  t-=10;
  if(t<=0){
   hp--; 
  }
 }
}
