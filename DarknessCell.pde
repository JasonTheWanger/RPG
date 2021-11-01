class DarknessCell{
  float opacity;
  float x, y, size;
  DarknessCell(float _x, float _y, float _s){
    size=_s;
    x=_x;
    y=_y;
    opacity = 0;
  }
  
  void show(){
   float d=dist(hero.loc.x, hero.loc.y, x,y);
   opacity = map(d, 0, 800, 0, 255);
   fill(0,opacity);
   rectMode(CENTER);
   noStroke();
   square(x,y,size);
  }
}
