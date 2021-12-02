class Pickup extends GameObject {

  String type;
  boolean isDeployed = false;
  int counter = 0;

  Pickup(int hp, float x, float y, int rx, int ry) {
    location = new PVector (x, y);
    velocity = new PVector (0, 0);
    size = 25;
    roomX = rx;  
    roomY = ry;
    this.hp = hp;
  }

  void show (color c) {
    stroke(0);
    strokeWeight(2);
    fill(c);
    circle (location.x, location.y, size);
  }

  void act() {
    if (isDeployed) counter++;

    if (counter > 60) {
      hp--;
      counter = 0;
    }
  }
}
