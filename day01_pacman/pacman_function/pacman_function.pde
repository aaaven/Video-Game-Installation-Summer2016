/* Created by Aven on July 4th
for Go beyond classics: Bring video game into real world class
demo on define function
*/
float pacSize = 50;
float x = 0;
float y = 0;
float Plus =1;
int direct = 0;
void setup() {
  //size(800, 100);
  size(800,800);
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
  //----------------Direction------------------------------------ 
  //arc(x, y, pacSize, pacSize, angle, 2*PI-angle);
  arc(x, y, pacSize, pacSize, direct*PI/2+angle, direct*PI/2+2*PI-angle);
}

void pacMove() { 
  if (keyPressed) {
    //----------------SPEED UP------------------------------------

    if (keyCode == SHIFT) { //shift key pressed down
      Plus += 0.5; // speed increasing
    }
    //----------------SPEED UP------------------------------------
    /*
    //----------------Direction------------------------------------ 
     switch(keyCode) {
     case RIGHT :
     direct = 0;
     x += Plus;
     break;
     case DOWN :
     direct = 1;
     y += Plus;
     break;
     case LEFT : 
     direct = 2;
     x -= Plus;
     break;
     case UP :
     direct = 3;
     y -= Plus;
     break;
     }
     //----------------Direction------------------------------------
     */
    if (keyCode == RIGHT) {
      direct = 0;
      x += Plus;
    }
    if (keyCode == DOWN) {
      direct = 1;
      y += Plus;
    }
    if (keyCode == LEFT) {
      direct = 2;
      x -= Plus;
    }
    if (keyCode == UP) {
      direct = 3;
      y -= Plus;
    }
  }
  //x+=xPlus;
}
void keyReleased() {
  Plus = 1;
}