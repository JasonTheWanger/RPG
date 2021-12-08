class Message extends GameObject {
  String text;
  int t;
  Message(String sentence, float x, float y) {
    hp=1; 
    loc.x=x;
    loc.y=y;
    text=sentence;
    t=255;
    print(1);
    roomx=hero.roomx;
    roomy=hero.roomy;
  }
  void show() {
    fill(0, t);
    textAlign(CENTER);
    text(text, loc.x, loc.y-15);
  }
  void act() {
    t--;
    if (t<=0) {
      hp--;
    }
  }
}
