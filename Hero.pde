class Hero extends GameObject{
  float speed;
  int roomx, roomy;
  
  Hero(){
   super();
   speed=5;
   roomx=1;
   roomy=1;
   size=40;
  }
  
  void show(){
   noFill();
   stroke(0);
   strokeWeight(2);
   circle(loc.x, loc.y, size);
  }
  
  void act(){
    super.act();
    if(wkey){
     vel.add(0,-1); 
    }
    else if(skey){
     vel.sub(0,-1); 
    }
    else{
     vel.y=0; 
    }
    if(akey){
     vel.add(-1,0); 
    }
    else if(dkey){
     vel.sub(-1,0); 
    }
    else{
     vel.x=0; 
    }
    if(vel.mag()>=6.5){
    vel.setMag(6.5);
    }
    if(loc.x>=width-50-size/2){
     loc.x=width-50-size/2; 
    }
    if(loc.x<=size/2+50){
     loc.x=size/2+50; 
    }
    if(loc.y>=height-50-size/2){
     loc.y=height-size/2-50; 
    }
    if(loc.y<=size/2+50){
     loc.y=size/2+50; 
    }
  }
}
