class barrier extends Pickup {

  barrier (float x, float y, int rx, int ry) {

    super (100, x, y, rx, ry);
  }

  void show () {

    if (isDeployed) {
      size = 100;
      stroke(blue);
      strokeWeight(hp / 10);
      noFill();
      circle (location.x, location.y, size);
    } else {
      super.show(blue);
    }
  }

  void act () {

    if (isDeployed) {

      //barrier collisions
      for (int i = 0; i < o.size(); i++) {
        GameObject obj = o.get(i);

        if (isCollidingWith(obj)) {

          if (obj instanceof eBullet) { 
            hp -= 1;
            obj.hp = 0;
            createParticles(obj, 1, blue);
          } else if (obj instanceof chaser) {
            hp --;
            //chasers bouncing off barriers
            obj.velocity.x *= -3;
            obj.velocity.y *= -3;
            createParticles(obj, 1, blue);
          }
        }
      }
    }
  }
}

class friendTurrets extends Pickup {

  int shotTimer = 0;
  int Threshold = 5;

  friendTurrets (float x, float y, int rx, int ry) {

    super (30, x, y, rx, ry);
  }

  void show() {

    if (isDeployed) {
      size = 50;
      stroke(yellow);
      strokeWeight(2);
      fill(yellow);
      circle (location.x, location.y, size);
      textFont (neatFont);
      textSize(20);
      text(hp, location.x, location.y);
    } else {
      super.show(yellow);
    }
  }
  
  void act() {
    shotTimer ++;
    if (shotTimer >= Threshold && space) {
      o.add(new Bullet(location.x, location.y, mouseX, mouseY));
      shotTimer = 0;
    }
  }
}
