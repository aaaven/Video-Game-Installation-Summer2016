import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class pacman_class_keyStone extends PApplet {


//import ddf.minim.analysis.*;
//import ddf.minim.effects.*;
//import ddf.minim.signals.*;
//import ddf.minim.spi.*;
//import ddf.minim.ugens.*;

Minim minim;
AudioPlayer bgSong;
AudioPlayer foodSong;
AudioPlayer winSong;
AudioPlayer loseSong;

Pacman pacman;
Cherry cherry;
//Pacman pacmanStart;
//Cherry cherryStart;
Button restart;

int cherrySize = 200;
int cherryCount = 0;
int saveTime;
int totalTime = 10000;
int gameMode;
float pAngle = PI-HALF_PI*3;

public void setup () {
  
  pacman = new Pacman(random(50, 200), random(50, 200), 50, 10);
  cherry = new Cherry(random(cherrySize/2, width-cherrySize/2), random(cherrySize/2, height-cherrySize/2), 40);
  minim = new Minim(this);
  bgSong = minim.loadFile("bg.wav", 2048);
  bgSong.play();
  gameMode = 0;
  saveTime = millis();
}

public void draw() {
  switch (gameMode) {
  case 0:
    startGame();
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
  }
}

public void gameMode1() {
  int passTime = millis()-saveTime;
  background(20, 0, 80);
  pacman.run();
  cherry.run();

  noFill();
  stroke(200);
  strokeWeight(3);
  rect(width/2-420/2, height/2-420/2, 420, 420);

  textSize(32);
  textAlign(CENTER);
  text(cherryCount, width-30, height-10);
  textSize(18);
  text("Eat 10 cherries in the end of the time to WIN !!", width-300, height-10);

  float t = map(passTime, 0, totalTime, 0, width);
  fill(255);
  noStroke();
  rect(0, 0, t, 10);

  if (passTime > totalTime) {
    if (cherryCount < 10) {
      gameMode = 2;
      loseSong = minim.loadFile("lose.wav", 2048);
      loseSong.play();
      bgSong.pause();
      println("lose");
    } else {
      gameMode = 3;
      winSong = minim.loadFile("win.wav", 2048);
      winSong.play();
      bgSong.pause();
      println("win");
    }
    //cherryCount = 0;
    saveTime = millis();
  }

  if (!cherry.status) {
    cherry = new Cherry(random(cherrySize/2, width-cherrySize/2), random(cherrySize/2, height-cherrySize/2), 40);
    cherryCount ++ ;
    foodSong = minim.loadFile("food.wav", 2048);
    foodSong.play();
    println(cherryCount);
  }
}

public void loseGame() {
  background(200, 0, 0);
  textSize(52);
  textAlign(CENTER);
  text("~YOU LOSE~", width/2, height/2);
  restartButton();
}

public void winGame() {
  background(0, 200, 0);
  textSize(52);
  textAlign(CENTER);
  text("YOU WIN !!", width/2, height/2);
  restartButton();
}

public void startGame() {
  background(20, 0, 80);
  Pacman pacmanStart = new Pacman(width/2, height/2-80, 200, 0);
  Cherry cherryStart = new Cherry(width/2+100, height/2-80, 50);
  cherryStart.display();
  pacmanStart.display();

  noFill();
  stroke(200);
  strokeWeight(3);
  rect(width/2-420/2, height/2-420/2, 420, 420);

  textSize(32);
  textAlign(CENTER);
  text(cherryCount, width-30, height-10);
  textSize(18);
  text("Eat 10 cherries in the end of the time to WIN !!", width-300, height-10);
  textSize(52);
  text("Pac,PacMan !!", width/2, height-180);

  startButton();
}

public void keyReleased() {
  pacman.keyReleased();
}

public void restartButton() {
  float w = 300;
  float h = 60;
  float x = width/2-w/2;
  float y = height/2+h;

  restart = new Button("Restart", x, y, w, h);
  restart.run();
  if (restart.status) {
    gameMode = 1;
    cherryCount = 0;
    bgSong = minim.loadFile("bg.wav", 2048);
    bgSong.play();
  }
}

public void startButton() {
  float w = 300;
  float h = 60;
  float x = width/2-w/2;
  float y = height/2+120;

  restart = new Button("Start", x, y, w, h);
  restart.run();
  if (restart.status) {
    gameMode = 1;
    cherryCount = 0;
    saveTime = millis();
  }
}
class Cherry {
  float x, y, cSize;
  boolean status = true;
  PImage cherry = loadImage("cherry.png");
  Cherry(float cx, float cy, float cherrySize) {
    x = cx;
    y = cy;
    cSize = cherrySize;
  }

  public void run() {
    check();
    display();
  }

  public void display() {
    //if (status == true) {
    //  image(cherry, x, y, cSize, cSize);
    //}
    imageMode(CENTER);
    if (status) image(cherry, x, y, cSize, cSize);
  }
  public void check() {
    float dist = dist(x, y, pacman.x, pacman.y);
    if (dist < pacman.pacSize) status = false;
  }
}
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

  public void display() {
    float angle = abs(sin(frameCount/8))*PI/6;
    fill(255, 255, 0);
    noStroke();
    arc(x, y, pacSize, pacSize, direction*PI/2 +angle, direction*PI/2 +2*PI-angle);
    //filter(POSTERIZE, 4);
  }
  public void run() {
    directCheck();
    speedUp();
    display();
    move();
  }

  public void move() {
    x += xPlus;
    y += yPlus;
  }

  public void directCheck() {
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

  public void speedUp() {
    if (keyPressed) {
      if (keyCode == SHIFT) {
        speed *= 1.05f;
        xPlus *= 1.05f;
        yPlus *= 1.05f;
      }
    }
  }

  public void keyReleased() {
    xPlus = 0;
    yPlus = 0;
    speed = initSpd;
  }
}
class Button {
  boolean status, mouseHover;
  float bx, by, bh, bw;
  int bcolor;
  String str;
  Button(String string, float x, float y, float w, float h) {
    str = string;
    bx = x;
    by = y;
    bw = w;
    bh = h;
  }
  public void run() {
    check();
    display();
  }
  public void check() {
    if (mouseX <bx+bw && mouseX > bx && mouseY < by+bh && mouseY > by ) {
      //mouse hover
      bcolor = 0xff333333;
      mouseHover = true;
    } else {
      bcolor = 0xff999999;
      mouseHover = false;
    }
    if (mouseHover && mousePressed) {
      status = true;
      bcolor = 0xff222222;
    } else status = false;
    println("buttonStatus" + status + "hover" + mouseHover);
  }
  public void display() {
    fill(bcolor);
    noStroke();
    //rectMode(CENTER);
    rect(bx, by, bw, bh);
    fill(255);
    //textMode(SHAPE);
    textAlign(LEFT, TOP);
    textSize(0.8f*bh);
    text(str, bx+bw/4, by);
  }
}
  public void settings() {  size(512, 512); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "pacman_class_keyStone" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
