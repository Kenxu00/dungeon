  class DarknessCell {

  float opacity;
  float x, y, size;
  
  DarknessCell (float _x, float _y, float s) {
    size = s;
    x = _x;
    y = _y;
    
  }

  void show() {
    
    noStroke();
    //opacity = pow(1.1, dist(x, y, h.location.x, h.location.y)*0.2);
    opacity = 0.3 * dist(x, y, h.location.x, h.location.y);
    fill(0, opacity);
    rect(x, y, 10, 10);
  }
}
