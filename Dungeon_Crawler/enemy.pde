class Enemy extends GameObject {

  Enemy() {
    location = new PVector (width/2, height/2);
    velocity = new PVector (0, 0);
    hp = 100;
    roomX = 1;
    roomY = 1;
    size = 50;
  }

  Enemy(int health, int s, float x, float y, int rx, int ry) {
    location = new PVector (x, y);
    velocity = new PVector (0, 0);
    hp = health;
    size = s;
    roomX = rx;  
    roomY = ry;
  }

  void show() {
    stroke(0);
    strokeWeight(2);
    fill(red); 
    circle (location.x, location.y, size);
    fill(255);
    textFont (neatFont);
    textSize(20);
    text(hp, location.x, location.y);
  }


  void act() {
    super.act();
    for (int i = 0; i < o.size(); i++) {
      GameObject obj = o.get(i);
      if (obj instanceof Bullet) {
        Bullet b = (Bullet) obj;
        if (b.friendly && isCollidingWith(obj)) {
          hp -= b.damage;
          obj.hp = 0;
          createParticles(obj, 1, red);
        }
      }
    }
  }
}
