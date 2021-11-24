class GameObject{
  int roomx, roomy;
  PVector loc, vel;
  int hp, size;
  int immuned;
  color c;
  int type;
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
