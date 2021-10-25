import processing.javafx.*;
int mode;
final int intro=0;
final int game=1;
final int pause=2;
final int gameover=3;
boolean wkey, akey, skey, dkey;
void setup(){
  size(800,800, FX2D);
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
  if(keyCode=='W'&&keyCode=='w'){
   wkey=true; 
  }
  if(keyCode=='A'&&keyCode=='a'){
   akey=true; 
  }
  if(keyCode=='S'&&keyCode=='s'){
   skey=true; 
  }
  if(keyCode=='D'&&keyCode=='d'){
   dkey=true; 
  }
}

void keyReleased(){
  if(keyCode=='W'&&keyCode=='w'){
   wkey=false; 
  }
  if(keyCode=='A'&&keyCode=='a'){
   akey=false; 
  }
  if(keyCode=='S'&&keyCode=='s'){
   skey=false; 
  }
  if(keyCode=='D'&&keyCode=='d'){
   dkey=false; 
  }
}
