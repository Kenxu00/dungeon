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
    friendly = false;
    location = new PVector(a, b);
    velocity = new PVector(c - a, d - b);
    velocity.setMag(3);
  
  }
  
  void show() {
  
    super.show();
    fill(0);
    ellipse(location.x, location.y, size, size);  
    
  }
  
  void act() {
    
    super.act();


    
    //collisions
    //for (int i = 0; i < o.size(); i++){
    //  GameObject obj = o.get(i);
    //  if (!(obj instanceof Hero) && friendly == true){
    //    if (dist(location.x, location.y, obj.location.x, obj.location.y) < (size/2 + obj.size/2)){
    //      obj.hp--;
    //      hp = 0; 
    //      createParticles(obj, 10, red);
    //  }
        
        
        
      //} else if (obj instanceof Hero && enemy == true) {
      //    //if (!((Hero)obj).immune())
      //  if (dist(location.x, location.y, obj.location.x, obj.location.y) < (size/2 + obj.size/2)){
      //    obj.hp--;
      //    //((Hero)obj).resetImmune();    
      //    hp--;
      }
}
