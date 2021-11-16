class Hero extends GameObject {  

  float speed;
  Weapon shooty;

  Hero() {
    super();
    hp = 3;
    size = 40;
    speed = 5;
    roomX = 1;
    roomY = 1;
    shooty = new Shotgun();
  }  

  void show() {
    fill (green);
    stroke(255);
    strokeWeight(2);
    
    circle(location.x, location.y, 40);

    shooty.update();
    if (space) shooty.shoot();
  }

  void act() {

    super.act();

    if (up) velocity.y = -speed;
    if (down) velocity.y = speed;
    if (left) velocity.x = -speed;
    if (right) velocity.x = speed;

    if (velocity.mag() > speed) velocity.setMag(speed);

    if (!up && !down) velocity.y *= 0.9;
    if (!left && !right) velocity.x *= 0.9;

    //check exits
    if (north != #ffffff) { 
      if (location.y == nLoc.y && nLoc.x - 50 <= location.x && location.x <= nLoc.x + 50) {
        roomY--;
        location = new PVector(sLoc.x, sLoc.y - 5);
      }
    }
    if (east != #ffffff) { 
      if (location.x == eLoc.x && eLoc.y - 50 <= location.y && location.y <= eLoc.y + 50) {
        roomX++;
        location = new PVector(wLoc.x + 5, wLoc.y);
      }
    }
    if (south != #ffffff) { 
      if (location.y == sLoc.y && sLoc.x - 50 <= location.x && location.x <= sLoc.x + 50) {
        roomY++;
        location = new PVector(nLoc.x, nLoc.y + 5);
      }
    }
    if (west != #ffffff) { 
      if (location.x == wLoc.x && wLoc.y - 50 <= location.y && location.y <= wLoc.y + 50) {
        roomX--;
        location = new PVector(eLoc.x - 5, eLoc.y);
      }
    }

    for (int i = 0; i < o.size(); i++) {
      GameObject obj = o.get(i);
      if (obj instanceof eBullet) {
        eBullet b = (eBullet) obj;
        float d = dist(location.x, location.y, obj.location.x, obj.location.y);
        if (d <= (size/2 + obj.size/2)) {
          hp -= b.damage;
          obj.hp = 0;
          createParticles(obj, 1, red);
        }
      }
    }
  }
}
