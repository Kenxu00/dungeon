//Mode Framework
int mode = 1;
final int intro = 1;
final int game = 2;
final int pause = 3; 
final int gameOver = 4;

//Color Pallete
color brown = #FFCD00;
color red = #FF1A00;
color orange = #F0AB16;
color yellow = #F6FF00;
color green = #67F539;
color darkGreen = #41B902;
color blue = #023DB9;
color purple = #CE30D1;
color grey = 100;

//Game objects
ArrayList<GameObject> o;
Hero h;

//visuals
AnimatedGIF introScreen;
AnimatedGIF endScreen;
Button introButt;
PFont specialFont; 
PFont neatFont;
PImage map;

//door location
PVector nLoc, sLoc, eLoc, wLoc;

//darkness array
ArrayList<DarknessCell> dark;

//minimap 2D Array



void setup() {

  size(800, 600, FX2D);
  //Alignments
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  imageMode(CENTER);

  //load visuals
  introScreen = new AnimatedGIF(48, "frame_", "_delay-0.12s.gif", width/2, height/2, width, height, 3);
  introButt = new Button("Start Game", width/2, 450, 200, 60, grey, 255);
  specialFont = loadFont("BlackadderITC-Regular-48.vlw");
  neatFont = loadFont("ArialNarrow-48.vlw");
  map = loadImage("map.png");
  //load objects
  o = new ArrayList<GameObject>();
  h = new Hero();
  o.add(h);
  o.add(new turret(width/2, height/2, 2, 1));
  o.add(new spawner(width/2, height/2, 1, 2));
  o.add(new friendTurrets(width/3, height/3, 1, 1));

  //door locationas
  nLoc = new PVector (width/2, height*0.15);
  eLoc = new PVector (width*0.85, height/2);
  sLoc = new PVector (width/2, height*0.85);
  wLoc = new PVector (width*0.15, height/2);

  //create darkness
  dark = new ArrayList<DarknessCell>();

  for (int y = 0; y < height; y+=5) {
    for (int x = 0; x < width; x+=5) {

      DarknessCell d = new DarknessCell (x, y, 5);
      dark.add(d);
    }
  }
}


void draw() {


  if (mode == intro) {
    intro();
    if (introButt.clicked) mode = game;
  } else if (mode == game) {
    game();
    //System.out.println(barrierinv.size());
  } else if (mode == pause) {
  } else if (mode == gameOver) {
  }
}
