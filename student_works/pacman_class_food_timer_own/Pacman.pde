class Pacman {
  float pacSize, x, y,init_spd; 
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
    fill(#FEFF0D);
    float angle=abs(sin(frameCount/6))*PI/6;
    fill(#FEFF0D);
    arc(x, y, pacSize, pacSize, direct* PI/2+angle, direct*PI/2+2*PI-angle);
    println("speed" + ":" +speed+ "  " + "xPlus" +":"+xPlus+ "  "  + "yPlus"+":"+ yPlus);
    fill(255);
    text("Time Left:"+"  "+timeLeft,0,0);
    text("YOu NEed TO EAt AT LEast 4 CHerries",0,20);
    text("CHerries YOu HAve EAten:",560,0);
    text(fCount,756,20);
  }
  void move() {
    if (keyPressed) { 

      if (keyCode == SHIFT) { //shift key pressed down
        xPlus *= 1.05; 
        yPlus *= 1.05;// speed increasing
        speed *= 1.05;
      }
      
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
     
    }
    x += xPlus;//move
    y += yPlus;
    
    if (x > width+pacSize/2) x = -pacSize/2;
    if (x< -pacSize/2) x = width+pacSize/2;
    if (y > height+pacSize/2) y = -pacSize/2;
    if (y<-pacSize/2) y = height+pacSize/2;
    
  }
  void keyReleased() {
    xPlus = 0;
    yPlus = 0;
    speed = init_spd;
   
  }
}