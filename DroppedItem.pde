class DroppedItem extends GameObject{
  
  DroppedItem(float x, float y, int rx, int ry, int item){
    type=item;
    hp=1;
    loc = new PVector (x,y);
    vel = new PVector (0,0);
    size=20;
    roomx=rx;
    roomy=ry;
    c=yellow;
  }
  
  void show(){
   stroke(black);
   strokeWeight(2);
   fill(c);
   circle(loc.x, loc.y, size);
  }
}
