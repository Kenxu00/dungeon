boolean up, down, left, right, space = false;

void keyPressed() {

  if (key == 'w' || key == 'W') up = true;
  if (key == 's' || key == 'S') down = true;
  if (key == 'a' || key == 'A') left = true;
  if (key == 'd' || key == 'D') right = true;
  if (key == ' ') space = true;
}

void keyReleased () {

  if (key == 'w' || key == 'W') up = false;
  if (key == 's' || key == 'S') down = false;
  if (key == 'a' || key == 'A') left = false;
  if (key == 'd' || key == 'D') right = false;
  if (key == ' ') space = false;
  if (key == 'b' || key == 'B') {
    if (barrierinv.size() == 0) System.out.println("You don't have any barriers");

    else {
      barrier b = barrierinv.get(0);
      barrierinv.remove(b);
      b.isDeployed = true;
      b.location.x = h.location.x;
      b.location.y = h.location.y;
      b.roomX = h.roomX;
      b.roomY = h.roomY;
      o.add(b);
    }
  }
  if (key == 't' || key == 'T') {
    if (turretinv.size() == 0) System.out.println("You don't have any turrets");

    else {
      friendTurrets t = turretinv.get(0);
      turretinv.remove(t);
      t.isDeployed = true;
      t.location.x = h.location.x;
      t.location.y = h.location.y;
      t.roomX = h.roomX;
      t.roomY = h.roomY;
      o.add(t);
    }
  }
}
