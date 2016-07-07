/*Created by Aven on July 7th
 for Go Beyond Classics: Bring Video Game into Real World
 In class live coding
 */
float angle = 0;
float anglePlus = 0.05;
float x = 0;
float xPlus = 1;
void setup() {
  size(800, 100);
}
void draw() {
  background(0);
  fill(255);
  arc(x, height/2, 50, 50, angle, 2*PI-angle);
  //angle = angle + anglePlus;
  angle += anglePlus;
  //x = x + 1;
  x+= xPlus;
  //if(angle > PI/6){
  //anglePlus = -0.05;
  //}
  //if(angle < 0){
  // anglePlus = 0.05; 
  //}
  if (angle > PI/6 || angle < 0) anglePlus *= -1;
  if (x> width) x=0;
  if(keyPressed){
    if(keyCode == SHIFT){
     xPlus ++; 
    }   
  }
  println(xPlus);
}

void keyReleased(){
  xPlus = 1;
}