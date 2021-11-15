class Bullet extends GameObject{
  color fill;
 Bullet(PVector bs, color c, int s){
   hp =1;
   loc=new PVector(hero.loc.x, hero.loc.y);
   vel=bs;
   size=s;
   fill=c;
   roomx=hero.roomx;
   roomy=hero.roomy;
 }
 void show(){
   fill(fill);
   circle(loc.x,loc.y,size);
 }
 
 void act(){
   super.act();
   if(loc.x>=width-50||loc.x<=50||loc.y>=height-50||loc.y<=50){
     hp--; 
    //bparticle
   }

 }
}
