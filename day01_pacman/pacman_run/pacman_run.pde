/*created by Aven on July 4th
for Go beyond classics: Bring video game into real world
pac man basic, how to make a pacman
*/
int x = 0;
int pacSize = 50;
float angle = 0;
float anglePlus = 0.05;
float xPlus = 1.0;
int test = 0;
void setup() {
  size(800, 100);
}

void draw() {
  background(0);
  //arc(x, height/2, pacSize, pacSize, PI/6, PI*11/6);
  arc(x, height/2, pacSize, pacSize, angle, 2*PI-angle);
  angle += anglePlus;
  if (angle < 0 || angle > PI/6) {
    anglePlus *= -1;
  }
  x+= xPlus;
  if (x > width + pacSize/2) {
    x = - pacSize/2;
  } 
  
//----------------keyPressed in draw loop----------------
  if (keyPressed) {
    if (keyCode == SHIFT) {
      xPlus += 0.1;
      test ++;
      println("test" + ":" + test);
    }
  }
//----------------keyPressed in draw loop---------------- 
}

//-----keyPressed() function, run once when key is pressed----------------
void keyPressed() {
  if (keyCode == SHIFT) {
    xPlus += 0.1;
    test ++;
    println("test" + ":" + test);
  }
}
//-----keyPressed() function, run once when key is pressed----------------

void keyReleased() {
  if (keyCode == SHIFT) {
    xPlus = 1;
  }
}