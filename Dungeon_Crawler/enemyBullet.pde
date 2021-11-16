class eBullet extends Bullet {  


  eBullet(float x, float y, int speed, float vx, float vy) {
    hp = 1;
    location = new PVector(x, y);
    velocity = new PVector (vx - x, vy - y);
    velocity.setMag(speed);
    size = 10;
    friendly = false;
    roomX = h.roomX;
    roomY = h.roomY;
    damage = 1;
  }
  
}
