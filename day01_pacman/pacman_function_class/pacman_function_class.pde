/* Created by Aven on July 4th
for Go beyond classics: Bring video game into real world
demo on class/object
*/
float pacSize = 50;
float x = 0;
float y = 0;
float init_spd = 2;
float speed = init_spd;
float xPlus = 0;
float yPlus = 0;
int direct = 0;
void setup() {
  //size(800, 100);
  size(800, 800);
}

void draw() {
  background(0);
  //pacDisplay(x, height/2, pacSize);
  pacDisplay(x, y, pacSize);
  //x++;
  pacMove();
}


void pacDisplay(float x, float y, float pacSize) {
  fill(#EAF20F);
  float angle = abs(sin(frameCount/5))*PI/5;
  arc(x, y, pacSize, pacSize, direct*PI/2+angle, direct*PI/2+2*PI-angle);
  println("speed" + ":" +speed+ "  " + "xPlus" +":"+xPlus+ "  "  + "yPlus"+":"+ yPlus);
}

void pacMove() { 
  if (keyPressed) { //KEY CONTROL
    //----------------SPEED UP------------------------------------

    if (keyCode == SHIFT) { //shift key pressed down
      xPlus *= 1.05; 
      yPlus *= 1.05;// speed increasing
      speed *= 1.05;
    }
    //----------------SPEED UP------------------------------------
    //----------------DIRECTION------------------------------------
    if (keyCode == RIGHT) {
      direct = 0;
      xPlus = speed;
    }
    if (keyCode == DOWN) {
      direct = 1;
      yPlus = speed;
    }
    if (keyCode == LEFT) {
      direct = 2;
      xPlus = -speed;
    }
    if (keyCode == UP) {
      direct = 3;
      yPlus = -speed;
    }
    //----------------DIRECTION------------------------------------
  }
  x += xPlus;//move
  y += yPlus;
  //---------------go beyond screen--------------------------------
  if (x > width+pacSize/2) x = -pacSize/2;
  if (x< -pacSize/2) x = width+pacSize/2;
  if (y > height+pacSize/2) y = -pacSize/2;
  if (y<-pacSize/2) y = height+pacSize/2;
  //---------------go beyond screen--------------------------------
}
void keyReleased() {
  xPlus = 0;
  yPlus = 0;
  speed = init_spd;
}