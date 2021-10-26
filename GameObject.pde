class GameObject{
  PVector loc, vel;
  int hp, size;
  GameObject(){
    
  }
  void show(){
    
  }
  void act(){
    loc.add(vel);
  }
}
