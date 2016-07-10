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

public class pacman_class_food_timer_own extends PApplet {

//Created by Charles "CHAOS" Wang
//July,10th,2016
//Class: Gamedesign: Go beyond classics: Bring video game into real world
//For WINDOWS/MACOS/LINUX 64bit
Pacman pac;
Cherry cherry;
Button button;
int fCount = 0;
int saveTime;
int totalTime = 8000;
int fCnt = 4;
int gameMode ;
float timeLeft;
public void setup() {
  //size(800, 100);
  
  saveTime = millis();
  pac = new Pacman(width/2, height/2, 4, 50);
  cherry = new Cherry(random(100, 500), random(100, 500), 40);
  gameMode = 0;
  saveTime = millis();
  println(width,height);
  //import controlP5.*;
  
}

public void draw() {
  switch (gameMode) {
  case 0:
    startScreen();
    break;
  case 1:
    GameMode1();
    break;
  case 2:
    loseGame();
    break;
  case 3:
    winGame();
    break;
  }
}
class Button {
  boolean status, mouseHover;
  float bx, by, bh,bw,textW;
  int bcolor;
  String str;
  Button(String string,float x, float y, float h) {
    str = string;
    bx = x;
    by = y;
    bh = h;
    textSize(0.8f*bh);
    textW = textWidth(str);
    bw = textW + 0.2f*bh;
  }
  public void run(){
   check();
   display();
  }
  public void check() {
    if (mouseX <bx+bw && mouseX > bx && mouseY < by+bh && mouseY > by ) {
      //mouse hover
      bcolor = 0xff94ECF5;
      mouseHover = true;
    } else {
      bcolor = 0xff4C7A7E;
      mouseHover = false;
    }
    if (mouseHover && mousePressed) {
      status = true;
      bcolor = 0xff0E3236;
    } else status = false;
    println("buttonStatus" + status + "hover" + mouseHover);
  }
  public void display() {
    fill(bcolor);
    noStroke();
    rect(bx, by, bw, bh);
    fill(255);
    textMode(SHAPE);
    textAlign(LEFT,TOP);
    textSize(0.8f*bh);
    text(str,bx,by);
  }
}
class Cherry {
  float x, y, cSize;
  boolean status =true;
  PImage cherry=loadImage("cherry.jpg");
  Cherry(float  cx, float cy, float cherrySize) {
    x=cx;
    y=cy;
    cSize=cherrySize;
  }

  public void run() {
    display();
    check();
  }

  public void display() {
    imageMode(CENTER);
    if(status)image(cherry, x, y, cSize, cSize);
  }
  public void check() {
    float dist=dist(x,y,pac.x,pac.y);
    if(dist<pac.pacSize)status=false;
  }
}
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
  public void run() {
    move();
    display();
  }
  public void display() {
    fill(0xffFEFF0D);
    float angle=abs(sin(frameCount/6))*PI/6;
    fill(0xffFEFF0D);
    arc(x, y, pacSize, pacSize, direct* PI/2+angle, direct*PI/2+2*PI-angle);
    println("speed" + ":" +speed+ "  " + "xPlus" +":"+xPlus+ "  "  + "yPlus"+":"+ yPlus);
    fill(255);
    text("Time Left:"+"  "+timeLeft,0,0);
    text("YOu NEed TO EAt AT LEast 4 CHerries",0,20);
    text("CHerries YOu HAve EAten:",560,0);
    text(fCount,756,20);
  }
  public void move() {
    if (keyPressed) { 

      if (keyCode == SHIFT) { //shift key pressed down
        xPlus *= 1.05f; 
        yPlus *= 1.05f;// speed increasing
        speed *= 1.05f;
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
  public void keyReleased() {
    xPlus = 0;
    yPlus = 0;
    speed = init_spd;
   
  }
}
public void startScreen() {
  PImage PB=loadImage("pb.png");
  imageMode(CENTER);
  background(PB);
  Button startPlay = new Button("Start", width/4, 2*height/4, 20);
  startPlay.run();
  if (startPlay.status) {
    gameMode = 1;
    saveTime = millis();
  }
  Button exit = new Button("Exit",3*width/4,2*height/3,20);
  exit.run();
  if(exit.status) exit();
}
public void GameMode1() {
  int passTime = millis()-saveTime;
  timeLeft=totalTime-passTime;
  background(0);  
  pac.run();
  cherry.run();
  if (!cherry.status) {
    cherry = new Cherry(random(100, 500), random(100, 500), 40);
    fCount ++;
  }
  if (passTime > totalTime) {
    //restart the game
    if (fCount < fCnt) {//lose 
      gameMode = 2;
    } else {//win 
      gameMode = 3;
    }
    saveTime = millis();
  }
}
  

public void keyReleased() {
  pac.keyReleased();
}

public void winGame() {
  PImage WIN=loadImage("win.jpg");
  imageMode(CORNER);
  image(WIN,0,0,width,height);
  fill(0);
  textSize(30);
  text("Oh Yeah,kimoji b0SS!!!!!!", width/2, height/4*3);
  restartButton();
}

public void loseGame() {
  PImage LOSE=loadImage("lose.jpg");
  imageMode(CORNER);
  image(LOSE,0,0,width,height);
  fill(0);
  textSize(30);
  text("U frickin lame!!!", width/2, height/4);
  restartButton();
}

public void restartButton() {
  Button Restart = new Button("BACK", 100, height -50, 20);
  Restart.run();
  if (Restart.status) {
    gameMode = 0;
    fCount = 0;
  }
}
  public void settings() {  size(768, 540); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "pacman_class_food_timer_own" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
