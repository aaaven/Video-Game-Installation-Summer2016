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

  void display() {
    float angle = abs(sin(frameCount/8))*PI/6;
    fill(255, 255, 0);
    noStroke();
    arc(x, y, pacSize, pacSize, direction*PI/2 +angle, direction*PI/2 +2*PI-angle);
    //filter(POSTERIZE, 4);
  }
  void run() {
    directCheck();
    speedUp();
    display();
    move();
  }

  void move() {
    x += xPlus;
    y += yPlus;
  }

  void directCheck() {
    if (keyPressed) {
      switch(keyCode) {
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
    }
    if (x > width) x=0; 
    if (x<0) x = width;
    if (y > height) y=0;
    if (y<0) y = height;
  }

  void speedUp() {
    if (keyPressed) {
      if (keyCode == SHIFT) {
        speed *= 1.05;
        xPlus *= 1.05;
        yPlus *= 1.05;
      }
    }
  }

  void keyReleased() {
    xPlus = 0;
    yPlus = 0;
    speed = initSpd;
  }
}