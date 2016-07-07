/*Created by Aven on July 7th
 for Go Beyond Classics: Bring Video Game into Real World
 In class live coding
 */
//float angle = 0;
//float anglePlus = 0.05;
float initSpd =3;
float speed;
float x = 0;
float xPlus = 0;
float y = 50;
float yPlus = 0;
float pacSize = 50;
float direction= 0;
void setup() {
  size(800, 800);
  speed = initSpd;
}
void draw() {
  background(0);
  pacDisplay(x, y, pacSize);
  pacMove();
}
void pacDisplay(float x, float y, float pacSize) {
  float angle = abs(sin(frameCount/6))*PI/6;
  fill(255);
  arc(x, y, pacSize, pacSize, direction* PI/2+angle, direction* PI/2+2*PI-angle); 
  //angle += anglePlus;
  //if (angle > PI/6 || angle < 0) anglePlus *= -1;
}
void pacMove() {
  x+= xPlus;
  y+= yPlus;

  if (keyPressed) { // some key is pressed down
    //--------speed up ---------------
    if (keyCode == SHIFT) {
      speed ++;
      xPlus *= 1.05;
      yPlus *= 1.05;
    }
    //--------speed up ---------------
    //--------direction ---------------
    /*
    if (keyCode == RIGHT) {// X ++, O
     xPlus = speed;
     direction = 0;
     }
     if (keyCode == DOWN) {//Y++,PI/2
     yPlus = speed;
     direction = 1;
     }
     if (keyCode == LEFT) {//X--,PI
     xPlus = -speed;
     direction = 2;
     }
     if (keyCode == UP) {//Y--,PI*3/2
     yPlus = -speed;
     direction = 3;
     }
     */
    switch (keyCode) {
    case RIGHT:
      xPlus = speed;
      direction = 0;
      break;
    case DOWN:
      yPlus = speed;
      direction = 1;
      break;
    case LEFT:
      xPlus = -speed;
      direction = 2;
      break;
    case UP:
      yPlus = -speed;
      direction = 3;
      break;
    }
    //--------direction ---------------
  }
  //--------boundries ---------------
  if (x> width) x = 0;
  if (x< 0) x = width;
  if (y> height) y = 0;
  if (y< 0)y = height;
  //--------boundries ---------------
  println("xPlus  "+ xPlus + "  yPlus  " + yPlus + "  Speed   " + speed);
}

//--------slow down ---------------
void keyReleased() {
  xPlus = 0;
  yPlus = 0;
  speed = initSpd;
}
//--------slow down ---------------