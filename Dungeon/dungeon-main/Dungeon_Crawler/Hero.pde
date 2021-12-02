ArrayList<barrier> barrierinv = new ArrayList<barrier>();
ArrayList<friendTurrets> turretinv = new ArrayList<friendTurrets>();

class Hero extends GameObject {  

  float speed;
  Weapon shooty;
  int immunity = 60;

  Hero() {
    super();
    hp = 5;
    size = 40;
    speed = 5;
    roomX = 1;
    roomY = 1;
    shooty = new Shotgun();
  }  

  void show() {

    //immunity timer
    immunity ++;

    if (immunity > 60) fill (green);
    else fill (darkGreen);
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

      if (isCollidingWith(obj)) {

        if (obj instanceof eBullet && immunity > 60) { 
          hp --;
          obj.hp = 0;
          immunity = 0;
          createParticles(obj, 1, red);
        } else if (obj instanceof chaser && immunity > 60) {
          hp --;
          immunity = 0;
          createParticles(obj, 1, red);
        } else if (obj instanceof barrier) { //picking barrier pickups up
          barrier b = (barrier) obj;
          if (!b.isDeployed) {
            o.remove(obj);
            barrierinv.add(b);
          }
        } else if (obj instanceof friendTurrets) { //picking barrier pickups up
          friendTurrets t = (friendTurrets) obj;
          if (!t.isDeployed) {
            o.remove(obj);
            turretinv.add(t);
          }
        }
      }
    }
  }
}
