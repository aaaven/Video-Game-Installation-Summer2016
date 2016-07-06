/* Created by Aven on July 5th
for Go beyond classics: Bring video game into real world class
got food in pacman
*/

Pacman pac;
Food foo;
int fCount = 0;
void setup() {
  //size(800, 100);
  size(800, 800);
  pac = new Pacman(width/2, height/2, 4, 30);
  foo = new Food(random(100, 500), random(100, 500), 10);
}

void draw() {
  background(0);
  pac.run();
  //pac.keyReleased();
  foo.run();
  if (!foo.fStatue) {
    foo = new Food(random(100, 500), random(100, 500), 10);
    fCount ++;
    println(fCount);
  }
}

void keyReleased() {
  pac.keyReleased();
}

class Pacman {
  float pacSize, x, y, init_spd; 
  int direct = 0;
  float xPlus = 0; 
  float yPlus = 0; 
  float speed = init_spd;
  Pacman(float init_x, float init_y, float init_speed, float pacmanSize) {
    x = init_x;
    y = init_y;
    init_spd = init_speed;
    pacSize = pacmanSize;
  }
  void run() {
    move();
    display();
  }
  void display() {
    fill(#EAF20F);
    float angle = abs(sin(frameCount/5))*PI/5;
    arc(x, y, pacSize, pacSize, direct*PI/2+angle, direct*PI/2+2*PI-angle);
    //println("speed" + ":" +speed+ "  " + "xPlus" +":"+xPlus+ "  "  + "yPlus"+":"+ yPlus);
  }
  void move() {
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
    println("key released");
  }
}
/*
void keyReleased() {
 pac.xPlus = 0;
 pac.yPlus = 0;
 pac.speed = init_spd;
 println("key released");
 }
 */

class Food {
  float x, y, fSize;
  boolean fStatue = true;
  Food(float fx, float fy, float foodSize) {
    x = fx;
    y = fy;
    fSize = foodSize;
  }
  void run() {
    check();
    display();
  }
  void display() {
    if (fStatue) ellipse(x, y, fSize, fSize);
  }
  void check() {
    float fDist = dist(x, y, pac.x, pac.y);
    if (fDist < pac.pacSize) fStatue = false;
  }
}