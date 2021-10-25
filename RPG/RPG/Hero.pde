class Hero extends GameObject{
  float speed;
  int roomx, roomy;
  
  Hero(){
   loc=new PVector (width/2, height/2);
   vel=new PVector (0,0);
   hp=1;
   speed=5;
   roomx=1;
   roomy=1;
  }
  
  void show(){
   noFill();
   stroke(0);
   strokeWeight(2);
   circle(loc.x, loc.y, 40);
  }
  
  void act(){
    super.act();
    if(wkey){
     vel.add(0,-1); 
    }
    if(skey){
     vel.sub(0,-1); 
    }
    if(akey){
     vel.add(-1,0); 
    }
    if(dkey){
     vel.sub(-1,0); 
    }
    
    if(vel.mag()>=5){
    vel.setMag(5);
    }
  }
}
