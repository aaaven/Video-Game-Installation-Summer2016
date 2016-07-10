class Cherry {
  float x, y, cSize;
  boolean status = true;
  //PImage aa = loadImage("aa.jpg");
  //PImage aaa = loadImage("aaa.jpg");
  //PImage aaaa = loadImage("aaaa.jpg");
  //PImage aaaaa = loadImage("aaaaa.jpg");
  PImage xilali = loadImage("xilali.png"); 
  //PImage [] images = new PImage[4];  
  //images[0]= loadImage("aa.jpg");
  //images[1]=aaa;
  //images[2]=aaaa;
  //images[3]=aaaaa;
  int index = (int)random(0,4);
  
  
  
  Cherry(float cx, float cy, float cherrySize) {
    x = cx;
    y = cy;
    cSize = cherrySize;
  }

  void run() {
    check();
    display();
  }
  
  void secondrun(){
    
    check();
    seconddisplay();
    
    
  }
  
  void display() {
    //if(status==true){
    //  image(cherry, x, y, cSize, cSize);
    //}
    imageMode(CENTER);
    if (status)image(images[index], x, y, 2*cSize, 2*cSize);
    
    
  }
   void seconddisplay() {
    //if(status==true){
    //  image(cherry, x, y, cSize, cSize);
    //}
    imageMode(CENTER);
    if (status)image(xilali, x, y, cSize, cSize);
  }
  
  
  
  
  void check() {
    float dist = dist(x, y, pacman.x, pacman.y);
    if (dist< 0.8*(pacman.pacSize/2+cSize/2)) status = false;
  }
}
  
  
  
  
  
  
  
  
  
  
  
  