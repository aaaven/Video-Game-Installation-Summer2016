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