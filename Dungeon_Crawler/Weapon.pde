class Weapon {

  int shotTimer, threshold, bulletSpeed, damage, size;
  float accuracy;


  Weapon(int s, int b, int d, float a, int bs) {

    shotTimer = 0;
    threshold = s;
    bulletSpeed = b;
    damage = d;
    accuracy = a;
    size = bs;
    
  }


  void update() {
    shotTimer++;
  }

  void shoot() {
    if (shotTimer >= threshold) {
      PVector aimVector = new PVector(mouseX - h.location.x, mouseY - h.location.y);
      aimVector.rotate(random(-accuracy, accuracy));
      aimVector.setMag(bulletSpeed);
      o.add(new Bullet(aimVector, bulletSpeed, size, damage));
      shotTimer = 0;
     
      
    }
  }
}
