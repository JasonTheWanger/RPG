class lightScource extends GameObject{
 
  lightScource(float x, float y){
    loc.x=x;
    loc.y=y;
    size=25;
    roomx=hero.roomx;
    roomy=hero.roomy;
  }
  
  void show(){
    stroke(0);
    fill(yellow);
   circle(loc.x, loc.y, size);
  }
}
