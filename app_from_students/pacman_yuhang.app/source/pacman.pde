//--------pacman class-------------


class Pacman {

  float x, y, pacSize, initSize, initSpd;
  int direction = 0;
  float xPlus, yPlus, speed;
  int textKey = 0;
  Pacman(float init_x, float init_y, float pacmanSize, float initSpeed) {
    x = init_x;
    y = init_y;
    initSize=pacmanSize;
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

    PImage trumpchi = loadImage("trumpchi.png");
    arc(x, y, pacSize-2, pacSize-2, direction* PI/2+angle, direction* PI/2+2*PI-angle);
    pushMatrix();
    translate(x,y);
    rotate(direction* PI/2);
    image(trumpchi, 0, 0, pacSize, pacSize);
    //text("hahahahahaha",-1.5*pacSize,-pacSize/2);
    
    text(texts[textKey],-0.5*pacSize-textWidth(texts[textKey]),-pacSize/2);
    popMatrix();
  }
  void move() {
    x += xPlus;
    y += yPlus;
    //println("xPlus   "+ xPlus + "  yPlus   "+ y+ "   speed   "+speed);
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
    if (x> width) x = 0;
    if (x< 0) x = width;
    if (y> height) y = 0;
    if (y< 0)y = height;
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