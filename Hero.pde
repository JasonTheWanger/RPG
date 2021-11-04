class Hero extends GameObject{
  float speed;
  int roomx, roomy;
  Weapon weapon;
  Hero(){
   super();
   speed=5;
   roomx=1;
   roomy=1;
   size=40;
   weapon=new Weapon();
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
     vel.y=-speed; 
    }
    else if(skey){
     vel.y=speed; 
    }
    else{
     vel.y=0; 
    }
    if(akey){
     vel.x=-speed; 
    }
    else if(dkey){
     vel.x=speed; 
    }
    else{
     vel.x=0; 
    }
    if(vel.mag()>=speed){
    vel.setMag(speed);
    }
    if(nroom!=#FFFFFF&& loc.y<=height*0.1&&loc.x>=width/2-50&&loc.x<=width/2+50){
     roomy-=1;
     loc=new PVector(width/2, height*0.9-10);
    }
    if(eroom != #FFFFFF && loc.x >=width*0.9 && loc.y>=height/2-50 && loc.y<=height/2 +50){
     roomx+=1; 
     loc = new PVector(width*0.1+10,height/2);
    }
    if(sroom!=#FFFFFF&& loc.y>=height*0.9&&loc.x>=width/2-50&&loc.x<=width/2+50){
     roomy+=1;
     loc=new PVector(width/2, height*0.1+10);
    }
    if(wroom!=#FFFFFF&& loc.x<=width*0.1&&loc.y>=height/2-50&&loc.y<=height/2+50){
     roomx-=1;
     loc=new PVector(width*0.9, height/2);
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
    weapon.update();
    if(spacekey){
     weapon.shoot(); 
    }
  }
}
