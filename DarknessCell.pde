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
   if(hero.weapon==hero.weapon1)
   opacity = map(d, 0, 250, 0, 255);
   if(hero.weapon==hero.weapon2)
   opacity = map(d, 0, 350, 0, 255);
   if(hero.weapon==hero.weapon3)
   opacity = map(d, 0, 500, 0, 255);
   if(hero.weapon==hero.weapon4)
   opacity = map(d, 0, 300, 0, 255);
   if(hero.weapon==hero.weapon5)
   opacity = map(d, 0, 800, 0, 255);
   if(hero.weapon==hero.weapon6)
   opacity = map(d, 0, 400, 0, 255);
   fill(0,opacity);
   rectMode(CENTER);
   noStroke();
   square(x,y,size);
  }
}
