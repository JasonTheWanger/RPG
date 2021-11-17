import processing.javafx.*;
int mode;
final int intro=0;
final int game=1;
final int pause=2;
final int gameover=3;
boolean mouseReleased;
boolean wasPressed;

Button blueButton, greenButton, pinkButton, blackButton, yellowButton;
color bkg;

//color pallette
color blue   = #28E7ED;
color green  = #CEF255;
color pink   = #F76DDC;
color darkYellow = #BC8B28;
color yellow = #F7E516;
color black  = #000000;
color white  = #FFFFFF;
color brown  = #795040;
boolean wkey, akey, skey, dkey, spacekey, gun1, gun2, gun3, gun4, gun5, gun6, switched, immuned;
ArrayList<GameObject> object;
ArrayList<DarknessCell> darkness;
Hero hero;
AnimatedGIF gif;
PImage map;
color nroom, eroom, sroom, wroom;
void setup(){
  size(800,800, FX2D);
  gif = new AnimatedGIF(120,"frame_", "_delay-0.07s.png",0,0,width, height);
  map=loadImage("map1.png");
  mode=intro;
  bkg = white;
  yellowButton  = new Button("Start",  400, 650, 600, 200, darkYellow,  white);
  hero=new Hero();
  gun1=true;
  object = new ArrayList<GameObject>();
  object.add(hero);
  int roomX=0, roomY=0;
  while(roomX<10&& roomY<10){
   if(map.get(roomX,roomY)==green)
    object.add(new Enemy(1000,75,roomX,roomY));
   if(map.get(roomX,roomY)==blue)
   object.add(new Follower(roomX,roomY));
   if(map.get(roomX,roomY)==yellow)
   object.add(new Turret(roomX,roomY));
   if(map.get(roomX,roomY)==brown)
     object.add(new spawnPool(roomX,roomY));
     roomX++;
   if(roomX==9){
    roomY++;
    roomX=0;
   }
  }
  darkness = new ArrayList<DarknessCell>(1000);
  float size =4;
  rectMode(CENTER);
  float x=0, y=0;
  while(x<=width&& y<=height){
   darkness.add(new DarknessCell(x,y,size)); 
   x=x+size;
   if(x==width){
    y=y+size;
    x=0;
   }
  }
}

void draw(){
  if (mode==intro) {
    Intro();
  } else if (mode==game) {
    Game();
  } else if (mode== pause) {
    Pause();
  } else if (mode==gameover) {
    Gameover();
  }
}

void keyPressed(){
  if(keyCode=='W'||keyCode=='w'){
   wkey=true; 
  }
  if(keyCode=='A'||keyCode=='a'){
   akey=true; 
  }
  if(keyCode=='S'||keyCode=='s'){
   skey=true; 
  }
  if(keyCode=='D'||keyCode=='d'){
   dkey=true; 
  }
  if(keyCode==' '){
   spacekey=true; 
  }
  if(keyCode=='1'){
   gun1=true; 
   gun2=false;
   gun3=false; 
   gun4=false;
   gun5=false;
   gun6=false;
   switched=true;
  }
  if(keyCode=='2'){
   gun2=true; 
   gun1=false;
   gun3=false; 
   gun4=false;
   gun5=false;
   gun6=false;
   switched=true;
  }
   if(keyCode=='3'){
   gun3=true; 
   gun2=false;
   gun1=false; 
   gun4=false;
   gun5=false;
   gun6=false;
   switched=true;
  }
   if(keyCode=='4'){
   gun4=true; 
   gun2=false;
   gun3=false; 
   gun1=false;
   gun5=false;
   gun6=false;
   switched=true;
  }
   if(keyCode=='5'){
   gun5=true; 
   gun2=false;
   gun3=false; 
   gun4=false;
   gun1=false;
   gun6=false;
   switched=true;
  }
  if(keyCode=='6'){
   gun5=false; 
   gun2=false;
   gun3=false; 
   gun4=false;
   gun1=false;
   gun6=true;
   switched=true;
  }
}

void keyReleased(){
  if(keyCode=='W'||keyCode=='w'){
   wkey=false; 
  }
  if(keyCode=='A'||keyCode=='a'){
   akey=false; 
  }
  if(keyCode=='S'||keyCode=='s'){
   skey=false; 
  }
  if(keyCode=='D'||keyCode=='d'){
   dkey=false; 
  }
  if(keyCode==' '){
   spacekey=false; 
  }
  if(keyCode=='1'||keyCode=='2'||keyCode=='3'||keyCode=='4'||keyCode=='5'||keyCode=='6')
  switched=false;
}
boolean withHero(GameObject GB){
    if (GB.roomx==hero.roomx&&GB.roomy==hero.roomy) {
     return true;
    }
    else
    return false;
}
