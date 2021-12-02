class Bullet extends GameObject{
  
  int timer = 500;
  boolean friendly;
  int size, damage;
  
  Bullet() {}
  
  Bullet(PVector p, int speed, int s, int d) {
    hp = 1;
    location = new PVector(h.location.x, h.location.y);
    velocity = p;
    velocity.setMag(speed);
    size = s;
    friendly = true;
    roomX = h.roomX;
    roomY = h.roomY;
    damage = d;
  }
  
  Bullet(float a, float b, float c, float d) {
    hp = 1;
    friendly = true;
    location = new PVector(a, b);
    velocity = new PVector(c - a, d - b);
    velocity.setMag(10);
    size = 10;
    roomX = h.roomX;
    roomY = h.roomY;
    damage = 5;
  }
  
  void show() {
  
    super.show();
    fill(0);
    ellipse(location.x, location.y, size, size);  
    
  }
  
  void act() {
    
    super.act();

      }
}


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
