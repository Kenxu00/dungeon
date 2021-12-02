class turret extends Enemy {

  int shotTimer = 0;
  int threshold = 6;

  turret (float x, float y, int rx, int ry) {
    super (100, 50, x, y, rx, ry);
  }

  void act() {
    super.act();
    shotTimer++;

    if (shotTimer > threshold) {
      o.add(new eBullet (location.x, location.y, 3, h.location.x, h.location.y));
      shotTimer = 0;
    }
  }
}

class chaser extends Enemy {

  chaser (int hp, float x, float y, int rx, int ry) {
    super (hp, 30, x, y, rx, ry);
  }

  void act () {
    super.act();
    velocity = new PVector(h.location.x - this.location.x, h.location.y - this.location.y);
    velocity.setMag(3);
  }
}


class spawner extends Enemy {

  int spawnTimer = 0;
  int threshold = 60;

  spawner (float x, float y, int rx, int ry) {
    super (50, 70, x, y, rx, ry);
  }

  void act() {
    super.act();
    spawnTimer++;

    if (spawnTimer > threshold) {
      o.add(new chaser (30, location.x, location.y, this.roomX, this.roomY));
      spawnTimer = 0;
    }
  }
}
