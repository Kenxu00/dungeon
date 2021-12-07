class XPMessage extends GameObject {

  float x, y; 
  int counter = 300;
  int speed;

  XPMessage (float x, float y, int rx, int ry) {
    hp = 1;
    location.x = x;
    location.y = y;
    roomX = rx;
    roomY = ry;
    if (y < height/2) speed = 1;
    else speed = -1;
  }

  void show() {
    textFont (neatFont);
    textSize(20);
    fill(255, 300);
    text("+1 XP", location.x, location.y);
  }

  void act() {

    location.y += speed;
    counter -= 5;
    if (counter < 0) hp--;
  }
}
