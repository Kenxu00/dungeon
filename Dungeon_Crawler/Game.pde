void game() {

  drawRoom();
  drawGameObj();
  drawDarkness();
  drawMinimap();
}

//doors
color north, south, east, west;

void drawRoom() {

  background(100);

  //walls
  stroke(0);
  strokeWeight(4);
  line(0, 0, 800, 600);
  line (800, 0, 0, 600);

  north = map.get(h.roomX, h.roomY - 1);
  east = map.get(h.roomX + 1, h.roomY);
  south = map.get(h.roomX, h.roomY + 1);
  west = map.get(h.roomX - 1, h.roomY);

  //doors
  noStroke();
  fill(0);

  if (north != #ffffff) {
    ellipse(width/2, height*0.12, 100, 100);
  }
  if (east != #ffffff) {
    ellipse(width*0.87, height/2, 100, 100);
  }
  if (south != #ffffff) {
    ellipse(width/2, height*0.87, 100, 100);
  }
  if (west != #ffffff) {
    ellipse(width*0.12, height/2, 100, 100);
  }


  //floor
  fill(200);
  rect(400, 300, 600, 450);
}

void drawGameObj() {

  for (int i = 0; i < o.size(); i++) {
    GameObject obj = o.get(i);
    if (obj.roomX == h.roomX && obj.roomY == h.roomY) {
      obj.show();
      obj.act();
    }
    if (obj.hp <= 0) {
      o.remove(i);
      i--;
    }
  }
}

void drawDarkness() {

  for (int i = 0; i < dark.size(); i++) {
    DarknessCell d = dark.get(i);
    d.show();
  }
}

void drawMinimap() {

  for (int y = 0; y < map.height; y++) {
    for (int x = 0; x < map.width; x++) {
      color c = map.get(x, y);
      noStroke();   

      if (x == h.roomX && y == h.roomY)  fill(purple);
      else  fill (c);

      rect(x * 10 + 50, y * 10 + 50, 10, 10);
    }
  }
}
