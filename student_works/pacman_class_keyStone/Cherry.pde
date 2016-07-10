class Cherry {
  float x, y, cSize;
  boolean status = true;
  PImage cherry = loadImage("cherry.png");
  Cherry(float cx, float cy, float cherrySize) {
    x = cx;
    y = cy;
    cSize = cherrySize;
  }

  void run() {
    check();
    display();
  }

  void display() {
    //if (status == true) {
    //  image(cherry, x, y, cSize, cSize);
    //}
    imageMode(CENTER);
    if (status) image(cherry, x, y, cSize, cSize);
  }
  void check() {
    float dist = dist(x, y, pacman.x, pacman.y);
    if (dist < pacman.pacSize) status = false;
  }
}