/*Created by Aven on July 8th 
for Go beyond classics: Bring video game into real world
live Demo on grap what is going on from laptop screen
laptop is connecting to sharp projector when the code is running
*/
int mainWidth = 800;
int mainHeight = 600;
int Width = 1280;
int Height = 800;
void setup() {
  fullScreen(SPAN);
  //fullScreen(2);
  fill(255, 0, 0);
  rect(100, 100, 600, 400);
  fill(0, 255, 0);
  rect(900, 100, 1080, 600);
  println(width, height);
  //projection screen: 800*600
  //laptop screen: 1280*800
  //display arrangement Tips:
}


void draw() {
  //---get divided screens from laptop screen and store in PImage
  PImage a = get(mainWidth, 0, Width/2, Height/2); 
  PImage b = get(mainWidth + Width/2, 0, Width/2, Height/2);
  PImage c = get(mainWidth, Height/2, Width/2, Height/2); 
  PImage d = get(mainWidth + Width/2, Height/2, Width/2, Height/2);
  //------get divided screens 
  //draw divided screens(got from laptop in advance) on projector screen
  image(a, -20, 0, mainWidth/2, mainHeight/2);
  image(b, mainWidth/2, 0, mainWidth/2, mainHeight/2);
  image(c, -20, mainHeight/2+20, mainWidth/2, mainHeight/2);
  image(d, mainWidth/2, mainHeight/2+20, mainWidth/2, mainHeight/2);
}