class AnimatedGIF {

  PImage[] pics;
  int currentFrame;
  int numFrames;
  float x, y, w, h, s;
  int time;

  AnimatedGIF(int nf, String pre, String post, float f) {
    x = width/2;
    y = height/2;
    w = width;
    h = height;
    s = f;
    time = 0;
    numFrames = nf;
    pics = new PImage[numFrames];
    for (int i = 0; i < numFrames; i++) {

      if (i < 10) pics[i] = loadImage(pre+ "0" + i +post);
      else pics [i] = loadImage(pre + i + post);
    }
    currentFrame = 0;
  }

  AnimatedGIF(int nf, String pre, String post, float _x, float _y, float _w, float _h, float f) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    s = f;
    time = 0;
    numFrames = nf;
    pics = new PImage[numFrames];
    for (int i = 0; i < numFrames; i++) {

      if (i < 10) pics[i] = loadImage(pre+ "0" + i +post);
      else pics[i] = loadImage(pre + i + post);
    }
    currentFrame = 0;
  }



  void show() {
    imageMode(CENTER);
    time++;
    if (time % s == 0) {
      currentFrame++;
      if (currentFrame == numFrames) currentFrame = 0;
      image(pics[currentFrame], x, y, w, h);
      time = 0;
    }
  }
}
