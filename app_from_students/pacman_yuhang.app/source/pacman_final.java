import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class pacman_final extends PApplet {

/*Final project, Created by Yuhang on July 7th,
 for class "Go Beyond Classics: Bring Video Game into Real World"
 live coding
 */
int cherryCount = 0;
int saveTime;
int totalTime = 10000;
Pacman pacman;
Cherry cherry;
int gameMode;
PImage [] images;
PImage baigong;
String [] texts;
public void setup() {
  
  //fullScreen(1);
  //fullScreen(SPAN);


  pacman = new Pacman(random(200, 600), random(200, 600), 100, 8);
  cherry = new Cherry(random(20, width-20), random(20, height-20), 40);
  gameMode = 0;
  saveTime = millis();
  println(width, height);
  images = new PImage[4];  
  images[0]= loadImage("aa.png");
  images[1]= loadImage("aaa.png");
  images[2]= loadImage("aaaa.png");
  images[3]= loadImage("aaaaa.png");
  baigong= loadImage("baigong.png");
  texts = new String[4];
  texts[0] = "We are going to make America great again!";
  texts[1] = "We\u2019re going to beat China, Japan. We\u2019re going to beat Mexico with trade";
  texts[2] = "An \u2018extremely credible source\u2019 has called my office and told me that Barack Obama\u2019s birth certificate is a fraud";
  texts[3] = "I will build a great, great wall on our southern border, and I will make Mexico pay for that wall. Mark my words.";
}

public void draw() {
  //gameMode;
  textSize(12);
  switch (gameMode) {

  case 0:
    startScreen();
    break;
  case 1:
    gameMode1();
    break;
  case 2:
    loseGame();
    break;
  case 3:
    winGame();
    break;
  case 4:
    gameMode2();
    break;
    //case 5:
    //  setupcolor();
    //  break;
  }
}
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

  public void run() {
    check();
    display();
  }
  
  public void secondrun(){
    
    check();
    seconddisplay();
    
    
  }
  
  public void display() {
    //if(status==true){
    //  image(cherry, x, y, cSize, cSize);
    //}
    imageMode(CENTER);
    if (status)image(images[index], x, y, 2*cSize, 2*cSize);
    
    
  }
   public void seconddisplay() {
    //if(status==true){
    //  image(cherry, x, y, cSize, cSize);
    //}
    imageMode(CENTER);
    if (status)image(xilali, x, y, cSize, cSize);
  }
  
  
  
  
  public void check() {
    float dist = dist(x, y, pacman.x, pacman.y);
    if (dist< 0.8f*(pacman.pacSize/2+cSize/2)) status = false;
  }
}
  
  
  
  
  
  
  
  
  
  
  
  
class Button {
  boolean status, mouseHover;
  float bx, by, bh, bw, textW;
  int bcolor;
  String str;
 Button(String string, float x, float y, float h) {
    str = string;
    bx = x;
    by = y;
    bh = h;
    textSize(0.8f*bh);
    textW = textWidth(str);
    bw = textW + 0.2f*bh;
  }


  public void run() {
    check();
    display();
  }


  public void check() {

    if (mouseX<bx+bw&&mouseX>bx&& mouseY < by+bh && mouseY > by) {

      bcolor = 0xffBFDAFF;
      mouseHover = true;
    } else {
      bcolor = 0xff4C7A7E;
      mouseHover = false;
    }
    if (mouseHover && mousePressed) {
      status = true;
      bcolor = 0xff0E3236;
    } else status = false;
  }



  public void display() {
    fill(bcolor);
    noStroke();
    textAlign(LEFT, TOP);
    rect(bx, by, bw, bh);
    fill(255);
    text(str, bx+0.1f*bh, by);
  }
}

public void startScreen() {//case 0
  imageMode(CENTER);
  PImage background = loadImage("background.jpg");
  image(background, width/2, height/2, width, height);
  Button startPlay =new Button("Start", width/4, 2*height/3, 20);

  startPlay.run();
  //click on startPlay to jump to gameMode1

  if (startPlay.status) {
    gameMode = 1;
    saveTime = millis();
  }
  Button exit = new Button("Exit", 3*width/4, 2*height/3, 20);
  exit.run();
  if (exit.status) exit();


  /*Button setupcolor= new Button("Color", 2*width/4, 2*height/3, 20);
  setupcolor.run();
  if (setupcolor.status) {
    gameMode =5;
  }*/
}


public void gameMode1() { //case 1


  image(baigong, width/2, height/2, 2*width, height);
  //cp5.hide();    
  int passTime = millis()-saveTime;
  
  pacman.run();
  cherry.run();
  if (!cherry.status) {
    cherry = new Cherry(random(20, width-20), random(20, height-20), random(30,60));
    cherryCount++;
    pacman.pacSize+=10;
    pacman.textKey = PApplet.parseInt(random(0,4));
    //println("cherryCount    "+ cherryCount);
  }
  if (passTime > totalTime) {
    pacman.pacSize=pacman.initSize;

    //time is up
    if (cherryCount < 3) {
      gameMode = 2;
      println("lose");
    } else {
      gameMode = 3;
      println("win");
    }
    cherryCount = 0;
    saveTime = millis();//restart timer
  }
  //println(saveTime);
}

public void loseGame() { //2
  imageMode(CENTER);
  PImage fired = loadImage("fired.png");
  image(fired, width/2, height/2, width, height);

  Button restart = new Button("Restart", width/5, 4*height/5, 20);
  restart.run();
  //click jump to gameMode1
  if (restart.status) {
    gameMode = 1;
    saveTime = millis();
  }
  Button mainScrn = new Button("Main Screen", 4*width/5, 4*height/5, 20);
  mainScrn.run();
  //click jump to startScreen
  if (mainScrn.status)gameMode = 0;
}

public void winGame() {//3
  imageMode(CENTER);
  PImage good = loadImage("good.jpg");
  image(good, width/2, height/2, width, height);
  Button level2 = new Button("Level 2", width/5, 4*height/5, 20);
  level2.run();
  //click jump to gameMode2
  if (level2.status) {
    gameMode = 4;
    saveTime = millis();
  }
  Button mainScrn = new Button("Main Screen", 4*width/5, 4*height/5, 20);
  mainScrn.run();
  //click jump to start Screen
  if (mainScrn.status)gameMode = 0;
}

/*void setupcolor() { //5
  background(0);
  Button play = new Button("play", 3*width/4, 2*height/3, 20);
  play.run();
  //cp5 = new ControlP5( this );
  //cp5.addColorWheel("c", 250, 10, 200 ).setRGB(color(128, 0, 255));
  noStroke();
  int c = color(100);
  if (play.status) {
    gameMode=1;
    //int c =100;
    fill( c );
    saveTime = millis();
   // cp5.hide();
  }
}*/





public void gameMode2() {
  int passTime = millis()-saveTime;
  background(79, 192, 196);
  pacman.run();
  cherry.secondrun();
  if (!cherry.status) {
    cherry = new Cherry(random(20, width-20), random(20, height-20), 40);
    cherryCount++;
    pacman.pacSize+=10;
    //println("cherryCount    "+ cherryCount);
  }
  if (passTime > totalTime) {
    pacman.pacSize=pacman.initSize;

    //time is up
    if (cherryCount < 3) {
      gameMode = 2;
      println("lose");
    } else {
      gameMode = 3;
      println("win");
    }
    cherryCount = 0;
    saveTime = millis();//restart timer
  }
  //println(saveTime);
}
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

  public void run() {
    speedUp();
    directCheck();
    boudryCheck();
    move();
    display();
    //keyReleased();
  }

  
  public void display() {
    float angle = abs(sin(frameCount/6))*PI/6;
    fill(255);

    PImage trumpchi = loadImage("trumpchi.png");
    arc(x, y, pacSize-2, pacSize-2, direction* PI/2+angle, direction* PI/2+2*PI-angle);
    pushMatrix();
    translate(x,y);
    rotate(direction* PI/2);
    image(trumpchi, 0, 0, pacSize, pacSize);
    //text("hahahahahaha",-1.5*pacSize,-pacSize/2);
    
    text(texts[textKey],-0.5f*pacSize-textWidth(texts[textKey]),-pacSize/2);
    popMatrix();
  }
  public void move() {
    x += xPlus;
    y += yPlus;
    //println("xPlus   "+ xPlus + "  yPlus   "+ y+ "   speed   "+speed);
  }  
  public void directCheck() {

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

  public void speedUp() {
    if (keyPressed) {
      //--------speed up ---------------
      if (keyCode == SHIFT) {
        speed *= 1.05f;
        xPlus *= 1.05f;
        yPlus *= 1.05f;
      }
      //--------speed up ---------------
    }
  }
  public void boudryCheck() {
    //--------boundries ---------------
    if (x> width) x = 0;
    if (x< 0) x = width;
    if (y> height) y = 0;
    if (y< 0)y = height;
    //--------boundries ---------------
  }
  public void keyReleased() {
    xPlus = 0;
    yPlus = 0;
    speed = initSpd;
  }
}
//------------weird solution-----------
public void keyReleased() {
  pacman.keyReleased();
}
//------------weird solution-----------
  public void settings() {  size(800, 800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "pacman_final" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
