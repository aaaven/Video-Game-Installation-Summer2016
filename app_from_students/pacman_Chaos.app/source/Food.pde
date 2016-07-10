class Cherry {
  float x, y, cSize;
  boolean status =true;
  PImage cherry=loadImage("cherry.jpg");
  Cherry(float  cx, float cy, float cherrySize) {
    x=cx;
    y=cy;
    cSize=cherrySize;
  }

  void run() {
    display();
    check();
  }

  void display() {
    imageMode(CENTER);
    if(status)image(cherry, x, y, cSize, cSize);
  }
  void check() {
    float dist=dist(x,y,pac.x,pac.y);
    if(dist<pac.pacSize)status=false;
  }
}