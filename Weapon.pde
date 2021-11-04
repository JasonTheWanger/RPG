class Weapon{
  int timer, threshold, bulletSpeed;
 Weapon(){
   timer=0;
   threshold=30;
   bulletSpeed=5;
 }
 Weapon(int thr, int bs){
  timer=0;
  threshold=thr;
  bulletSpeed=bs;
 }
 
 void update(){
   timer++;
 }
 
 void shoot(){
   if(timer>=threshold){
    PVector aimVector = new PVector(mouseX-hero.loc.x, mouseY-hero.loc.y);
    aimVector.setMag(bulletSpeed);
    object.add(new Bullet(aimVector, black, 10));
    timer=0;
   }
 }
}
