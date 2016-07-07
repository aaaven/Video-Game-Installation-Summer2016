//--------pacman class-------------
class Pacman {
  float x, y, pacSize, initSpd;
  int direction = 0;
  float xPlus, yPlus, speed;
  Pacman(float init_x, float init_y, float pacmanSize, float initSpeed) {
    x = init_x;
    y = init_y;
    pacSize = pacmanSize;
    initSpd = initSpeed;
    speed = initSpd;
  }

  void run() {
    speedUp();
    directCheck();
    boudryCheck();
    move();
    display();
    //keyReleased();
  }

  void display() {
    float angle = abs(sin(frameCount/6))*PI/6;
    fill(255);
    arc(x, y, pacSize, pacSize, direction* PI/2+angle, direction* PI/2+2*PI-angle);
  }
  void move() {
    x += xPlus;
    y += yPlus;
    println("xPlus   "+ xPlus + "  yPlus   "+ y+ "   speed   "+speed);
  }  
  void directCheck() {

    if (keyPressed) { // some key is pressed down
      //--------direction ---------------
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

  }

  void speedUp() {
    if (keyPressed) {
      //--------speed up ---------------
      if (keyCode == SHIFT) {
        speed *= 1.05;
        xPlus *= 1.05;
        yPlus *= 1.05;
      }
      //--------speed up ---------------
    }
  }
  void boudryCheck() {
    //--------boundries ---------------
    if (x> Width) x = 0;
    if (x< 0) x = Width;
    if (y> Height) y = 0;
    if (y< 0)y = Height;
    //--------boundries ---------------
  }
  void keyReleased() {
    xPlus = 0;
    yPlus = 0;
    speed = initSpd;
  }
}
//------------weird solution-----------
void keyReleased() {
  pacman.keyReleased();
}
//------------weird solution-----------