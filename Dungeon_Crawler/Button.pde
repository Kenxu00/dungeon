boolean mouseReleased;
boolean hadPressed;

class Button {

  int x, y, w, h, textsize;
  boolean clicked;
  color highlight, normal;
  String text;

  Button(String t, int _x, int _y, int _w, int _h, color norm, color high, int ts) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    text = t;
    highlight = high;
    normal = norm;
    clicked = false;
    textsize = ts;
  }

  void show() {
    //rectangle
    rectMode(CENTER);
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      fill(highlight);
    } else {
      fill(normal);
    }
    stroke(0);
    strokeWeight(4);
    rect(x, y, w, h, 30);

    //text label
    textAlign(CENTER, CENTER);
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      fill(normal);
    } else {
      fill(highlight);
    }
    textSize(textsize);
    
    text(text, x, y);

    if (mouseReleased && mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      clicked  = true;
    } else {
      clicked = false;
    }
  }
}

void bFunction() {
  if (mousePressed) hadPressed = true;
  if (hadPressed && !mousePressed) {
    mouseReleased = true;
    hadPressed = false;
  } else mouseReleased = false;
}
