/*Created by Aven on July 8th 
 for Go beyond classics: Bring video game into real world
 live Demo on ks stone, turn PImage from lapop screen into mapping mode
 laptop is connecting to sharp projector when the code is running
 */

import deadpixel.keystone.*;
Keystone ks;
CornerPinSurface surfaceA;
CornerPinSurface surfaceB;
CornerPinSurface surfaceC;
CornerPinSurface surfaceD;

int mainWidth = 800;
int mainHeight = 600;
int Width = 1280;
int Height = 800;
void setup() {
  fullScreen(P3D, SPAN);
  //fullScreen(2);
  println(width, height);
  //projection screen: 800*600
  //laptop screen: 1280*800
  //display arrangement Tips:

  //----------keystone---------
  ks = new Keystone(this);
  surfaceA = ks.createCornerPinSurface(Width/2, Height/2, 20);
  surfaceB = ks.createCornerPinSurface(Width/2, Height/2, 20);
  surfaceB.moveTo(mainWidth/2, 0);
  surfaceC = ks.createCornerPinSurface(Width/2, Height/2, 20);
  surfaceC.moveTo(0, mainHeight/2);
  surfaceD = ks.createCornerPinSurface(Width/2, Height/2, 20);
  surfaceD.moveTo(mainWidth/2, mainHeight/2);
  //----------keystone---------
}


void draw() {
  background(0);
  //fill(255, 0, 0);
  //rect(100, 100, 600, 400);
  fill(0, 255, 0);
  rect(900, 100, 1080, 600);
  //---get divided screens from laptop screen and store in PImage
  PImage a = get(mainWidth, 0, Width/2, Height/2); 
  PImage b = get(mainWidth + Width/2, 0, Width/2, Height/2);
  PImage c = get(mainWidth, Height/2, Width/2, Height/2); 
  PImage d = get(mainWidth + Width/2, Height/2, Width/2, Height/2);
  //------get divided screens
  /*
  //------draw divided screens(from laptop screen) on projector screen
   image(a, -20, 0, mainWidth/2, mainHeight/2);
   image(b, mainWidth/2, 0, mainWidth/2, mainHeight/2);
   image(c, -20, mainHeight/2+20, mainWidth/2, mainHeight/2);
   image(d, mainWidth/2, mainHeight/2+20, mainWidth/2, mainHeight/2);
   */
  //----------keystone---------
  surfaceA.render(a);
  surfaceB.render(b);
  surfaceC.render(c);
  surfaceD.render(d);
  //----------keystone---------
}

//----------keystone---------
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
//----------keystone---------