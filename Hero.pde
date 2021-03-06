class Hero extends GameObject {
  float speed;
  float bar;
  int exp, maxHp;
  Weapon weapon, weapon1, weapon2, weapon3, weapon4, weapon5, weapon6;
  AnimatedGIF currentAction;
  Hero() {
    super();
    speed=6.5;
    roomx=1;
    roomy=1;
    size=40;
    weapon1=new glock_18();
    weapon2=new mp5();
    weapon3=new m1_garand();
    weapon4=new sawed_off();
    weapon5=new awp();
    weapon6=new m249();
    weapon=weapon1;
    hp=maxHp=100;
    immuned=100;
    loc.x=250;
    loc.y=250;
    currentAction = manDown;
    exp=0;
  }

  void show() {
    currentAction.show(loc.x, loc.y, size/1.5, size);
    noFill();
    if (immuned>0) {
      stroke(0, 255, 0);
      strokeWeight(2);
      circle(loc.x+12.5, loc.y+20, size*1.5);
    }
    rectMode(CENTER);
    stroke(0);
    strokeWeight(2);
    rect(loc.x+12.5, loc.y-20, 35, 5);
    fill(red);
    bar=map(hp, 0, maxHp, 0, 35);
    rectMode(CORNER);
    noStroke();
    rect(loc.x-5, loc.y-22.5, bar, 4.8);
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
      vel.setMag(speed+speedLvl*0.2);
    }
    if (abs(vel.y)> abs(vel.x)) {
      if (vel.y>=0)
        currentAction=manDown;
      else currentAction = manUp;
    } else {
      if (vel.x>0)
        currentAction=manRight;
      else if (vel.x<0)
        currentAction=manLeft;
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
      hero.speed=6.5;
    } else if (gun2&&switched) {
      weapon=weapon2;
      hero.speed=4.75;
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
    for (int i=0; i<object.size(); i++) {
      GameObject GB = object.get(i);
      if (GB instanceof DroppedItem)
        if (withHero(GB) && collidingWith(GB)) {
          if (GB.type==GUN) {
            int rnd = int(random(1, 5));
            switch(rnd) {
            case 1:
              haveW2=true;
              object.add(new Message("Obtained MP9", GB.loc.x, GB.loc.y));
              break;
            case 2:
              haveW4=true;
              object.add(new Message("Obtained Sawed-Off", GB.loc.x, GB.loc.y));
              break;
            case 3:
              haveW5=true;
              object.add(new Message("Obtained AWP", GB.loc.x, GB.loc.y));
              break;
            case 4:
              haveW6=true;
              object.add(new Message("Obtained M249", GB.loc.x, GB.loc.y));
              break;
            }
            GB.hp--;
          } else if (GB.type==MEDKIT) {
            hp+=30;
            object.add(new Message("Obtained MedKit", GB.loc.x, GB.loc.y));
            if (hp>maxHp)
              hp=maxHp;
            GB.hp--;
          }
          if (GB.hp<=0) {
            object.remove(i);
            i--;
          }
        }
    }
    weapon.update();
    if (spacekey) {
      weapon.shoot();
    }
  }
}
