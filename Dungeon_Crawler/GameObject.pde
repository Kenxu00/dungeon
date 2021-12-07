class GameObject {

  int hp, size, roomX, roomY;
  PVector location, velocity;

  GameObject() {
    location = new PVector(width/2, height/2);
    velocity = new PVector (0, 0);
  }


  void show() {
    stroke(255);
    strokeWeight (2);
  }
  void act() {

    location.add(velocity);

    //check for hitting walls
    if (!(this instanceof Bullet)) {
      if (location.x < width * 0.15) location.x = width * 0.15;
      if (location.x > width * 0.85) location.x = width * 0.85;    
      if (location.y < height* 0.15) location.y = height * 0.15;
      if (location.y > height* 0.85) location.y = height * 0.85;
    } else {
      if (location.x < width * 0.12 || location.x > width * 0.88 || location.y < height* 0.12 || location.y > height* 0.88) {
        this.hp--;
        createParticles(this, 3, 0);
      }
    }
  }

  boolean isCollidingWith (GameObject obj) {

    if (this.roomX == obj.roomX && this.roomY == obj.roomY) {
      float d = dist(this.location.x, this.location.y, obj.location.x, obj.location.y);
      if (d <= (this.size/2 + obj.size/2)) {
        return true;
      }
    } 
    return false;
  }
}
