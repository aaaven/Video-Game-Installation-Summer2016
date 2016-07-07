/*Created by Aven on July 7th
 for Go Beyond Classics: Bring Video Game into Real World
 In class live coding
 */
int cherryCount = 0;
int saveTime;
int totalTime = 30000;
Pacman pacman;
Cherry cherry;
int gameMode;
int Width = 1280;
int Height = 800;
int mainWidth = 2560;
int mainHeight = 1080;
//----------keystone-------
import deadpixel.keystone.*;
Keystone ks;
CornerPinSurface surfaceA;
CornerPinSurface surfaceB;
//----------keystone-------

void setup() {
  //size(800, 800);
  //fullScreen(1);
  fullScreen(OPENGL,SPAN);
  pacman = new Pacman(random(200, 600), random(200, 600), 100, 8);
  cherry = new Cherry(random(20, Width-20), random(20, Height-20), 40);
  gameMode = 0;
  saveTime = millis();
  println(Width, Height);
  //----------keystone-------
  ks = new Keystone(this);
  surfaceA = ks.createCornerPinSurface(Width/2, Height, 20);
  surfaceB = ks.createCornerPinSurface(Width/2, Height, 20);
  surfaceB.moveTo(mainWidth/2, 0);
  //----------keystone-------
}

void draw() { //gameMode;
  pushMatrix();
  translate(2560, 0);
  switch (gameMode) {
  case 0:
    startScreen();
    break;
  case 1:
    gameMode1();
    break;
  case 2:
    loseGame();
    break;
  case 3:
    winGame();
    break;
  case 4:
    gameMode2();
    break;
  }
  popMatrix();
  //----------keystone-------
  PImage a = get(mainWidth, 0, Width/2, Height);
  //imageMode(CORNER);
  //image(a,0,0);
  PImage b = get(mainWidth+Width/2, 0, Width/2, Height);
  surfaceA.render(a);
  surfaceB.render(b);
  //----------keystone-------
}


//----------keystone-------
void keyPressed() {
  switch(key) {
  case 'c':
    // enter/leave calibration mode, where surfaces can be warped 
    // and moved
    ks.toggleCalibration();
    break;

  case 'l':
    // loads the saved layout
    ks.load();
    break;

  case 's':
    // saves the layout
    ks.save();
    break;
  }
}
//----------keystone-------