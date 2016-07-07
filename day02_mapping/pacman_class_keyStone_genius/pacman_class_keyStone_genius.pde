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
CornerPinSurface surfaceC;
CornerPinSurface surfaceD;
//----------keystone-------

void setup() {
  //size(800, 800);
  //fullScreen(1);
  fullScreen(OPENGL, SPAN);
  pacman = new Pacman(random(200, 600), random(200, 600), 100, 8);
  cherry = new Cherry(random(20, Width-20), random(20, Height-20), 40);
  gameMode = 0;
  saveTime = millis();
  println(Width, Height);
  //----------keystone-------
  ks = new Keystone(this);
  surfaceA = ks.createCornerPinSurface(Width/2, Height/2, 20);
  surfaceB = ks.createCornerPinSurface(Width/2, Height/2, 20);
  surfaceB.moveTo(mainWidth/2, 0);
  surfaceC = ks.createCornerPinSurface(Width/2, Height/2, 20);
  surfaceC.moveTo(0, mainHeight/2);
  surfaceD = ks.createCornerPinSurface(Width/2, Height/2, 20);
  surfaceD.moveTo(mainWidth/2, mainHeight/2);
  //----------keystone-------
}

void draw() { //gameMode;
  background(0);
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
  //imageMode(CORNER);
  //image(a,0,0);
  PImage a = get(mainWidth, 0, Width/2, Height/2);
  PImage b = get(mainWidth+Width/2, 0, Width/2, Height/2);
  PImage c = get(mainWidth, Height/2, Width/2, Height/2);
  PImage d = get(mainWidth+Width/2, Height/2, Width/2, Height/2);
  surfaceA.render(a);
  surfaceB.render(b);
  surfaceC.render(c);
  surfaceD.render(d);
  //----------keystone-------
}


//----------keystone-------
void keyPressed() {
  background(0);
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