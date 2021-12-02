class Sniper extends Weapon {
  Sniper() {
    super(90, 20, 20, 0, 10);
  }
}

class autoPistol extends Weapon {

  autoPistol() {
    super(10, 5, 2, 0.1, 10);
  }
}

class Shotgun extends Weapon {
  Shotgun() {
    super(0, 7, 2, 0.15, 10);
  }

  void shoot() {
    if (shotTimer >= 90) {
      for (int i = 0; i < 15; i++) {
        super.shoot();
      }
    }
  }
}

class assaultRifle extends Weapon { 
  int counter;
  boolean b = false;
  int i = 0;

  assaultRifle () {
    super(0, 8, 3, 0.05, 10);
  }

  void update() {
    shotTimer++;
    if (b) {
      i ++;
      if (i % 5 == 0) super.shoot();
      if (i > 15) {
        i = 0;
        b = false;
      }
    }
  }
  void shoot() {
    if (shotTimer >= 30) {
      b = true;
    }
  }
}
