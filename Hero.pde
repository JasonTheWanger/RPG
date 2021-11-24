class Hero extends GameObject {
  float speed;
  Weapon weapon, weapon1, weapon2, weapon3, weapon4, weapon5, weapon6;
  Hero() {
    super();
    speed=7;
    roomx=1;
    roomy=1;
    size=40;
    weapon=weapon1=new glock_18();
    weapon2=new mp5();
    weapon3=new m1_garand();
    weapon4=new sawed_off();
    weapon5=new awp();
    weapon6=new m249(); 
    hp=5;
    immuned=100;
    loc.x=250;
    loc.y=250;
  }

  void show() {
    noFill();
    if (immuned<=0) {
      stroke(0);
    } else
      stroke(0, 255, 0);
    strokeWeight(2);
    circle(loc.x, loc.y, size);
  }

  void act() {
    super.act();
    immuned--;
    if (wkey) {
      vel.y=-speed;
    } else if (skey) {
      vel.y=speed;
    } else {
      vel.y=0;
    }
    if (akey) {
      vel.x=-speed;
    } else if (dkey) {
      vel.x=speed;
    } else {
      vel.x=0;
    }
    if (vel.mag()>=speed) {
      vel.setMag(speed);
    }
    if (nroom!=#FFFFFF&& loc.y<=height*0.1&&loc.x>=width/2-50&&loc.x<=width/2+50) {
      roomy-=1;
      loc=new PVector(width/2, height*0.9-10);
    }
    if (eroom != #FFFFFF && loc.x >=width*0.9 && loc.y>=height/2-50 && loc.y<=height/2 +50) {
      roomx+=1; 
      loc = new PVector(width*0.1+10, height/2);
    }
    if (sroom!=#FFFFFF&& loc.y>=height*0.9&&loc.x>=width/2-50&&loc.x<=width/2+50) {
      roomy+=1;
      loc=new PVector(width/2, height*0.1+10);
    }
    if (wroom!=#FFFFFF&& loc.x<=width*0.1&&loc.y>=height/2-50&&loc.y<=height/2+50) {
      roomx-=1;
      loc=new PVector(width*0.9, height/2);
    }
    if (loc.x>=width-50-size/2) {
      loc.x=width-50-size/2;
    }
    if (loc.x<=size/2+50) {
      loc.x=size/2+50;
    }
    if (loc.y>=height-50-size/2) {
      loc.y=height-size/2-50;
    }
    if (loc.y<=size/2+50) {
      loc.y=size/2+50;
    }
    if (gun1&&switched) {
      weapon=weapon1;
      hero.speed=7;
    } else if (gun2&&switched) {
      weapon=weapon2;
      hero.speed=4.5;
    } else if (gun3&&switched) {
      weapon=weapon3;
      hero.speed=3.75;
    } else if (gun4&&switched) {
      weapon=weapon4;
      hero.speed=3;
    } else if (gun5&&switched) {
      weapon=weapon5;
      hero.speed=2.5;
    } else if (gun6&&switched) {
      weapon=weapon6;
      hero.speed=1.75;
    }
  //  for (int i=0; i<object.size(); i++) {
  //  GameObject GB = object.get(i);
  //  if (GB instanceof DroppedItem)
  //  if(withHero(GB) && collidingWith(GB)) {
  //    if(GB.type==GUN){
  //      int rnd = int(random(1,5));
  //      switch(rnd){
  //       case 1: haveW2=true;
  //       break;
  //       case 2: haveW4=true;
  //       break;
  //       case 3: haveW5=true;
  //       break;
  //       case 4: haveW6=true;
  //       break;
  //      }
  //      GB.hp--;
  //    }
  //    if (GB.hp<=0) {
  //      object.remove(i);
  //      i--;
  //    }
  //  }
  //}
    if (spacekey) {
      weapon.shoot();
    }
  }
}
