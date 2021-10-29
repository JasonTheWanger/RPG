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
   float d=dist(hero.loc.x, hero.loc.y, width/2, height/2);
   opacity = map(d, 0, 100, 0, 255);
   fill(0,opacity);
   square(x,y,size);
  }
}
