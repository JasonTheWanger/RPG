class GameObject{
  PVector loc, vel;
  int hp, size;
  GameObject(){
    loc=new PVector (width/2, height/2);
   vel=new PVector (0,0);
   hp=1;
  }
  void show(){
    
  }
  void act(){
    loc.add(vel);
  }
}
