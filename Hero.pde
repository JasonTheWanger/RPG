class Hero extends GameObject{
  float speed;
  Weapon weapon;
  Hero(){
   super();
   speed=5.5;
   roomx=1;
   roomy=1;
   size=40;
   weapon=new glock_18();
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
    if(gun1&&switched){
     weapon=new glock_18(); 
     hero.speed=5.5;
    }
    else if(gun2&&switched){
      weapon=new mp5();
      hero.speed=4.5;
    }
    else if(gun3&&switched){
      weapon=new m1_garand();
      hero.speed=3.75;
    }
    else if(gun4&&switched){
      weapon=new sawed_off();
      hero.speed=3;
    }
    else if(gun5&&switched){
     weapon=new awp();
     hero.speed=2.5;
    }
    else if(gun6&&switched){
     weapon=new m249(); 
     hero.speed=1.75; 
    }
    weapon.update();
    if(spacekey){
     weapon.shoot(); 
    }
  }
}
