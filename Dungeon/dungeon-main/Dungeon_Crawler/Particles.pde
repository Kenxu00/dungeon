class Particles extends GameObject {

  int t;
  color part;

  Particles(GameObject obj, color c) {
    hp = 1;
    size = int(random(2, 5));
    t = int(random(200, 255));
    velocity = new PVector(0, 5);
    location = obj.location.copy();
    velocity.rotate(random(0, PI * 2));
    part = c;
    roomX = h.roomX;
    roomY = h.roomY;
  }

  void show() {
    noStroke();
    fill(part);
    circle(location.x, location.y, size);
  }

  void act() {
    super.act();
    t -= 10;
    if (t <= 0) hp = 0;
  }
}

void createParticles(GameObject a, int particleNo, color c) {

    for(int i = 0; i <= int(random(1, particleNo)); i++) {
      o.add(new Particles(a, c));
    
    }
}
