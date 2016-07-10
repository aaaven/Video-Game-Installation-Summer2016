/*
Created by Richard in class"go beyond classics: bring video game into real world"
*/

import ddf.minim.*;
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

void setup () {
  size(512, 512);
  pacman = new Pacman(random(50, 200), random(50, 200), 50, 10);
  cherry = new Cherry(random(cherrySize/2, width-cherrySize/2), random(cherrySize/2, height-cherrySize/2), 40);
  minim = new Minim(this);
  bgSong = minim.loadFile("bg.wav", 2048);
  bgSong.play();
  gameMode = 0;
  saveTime = millis();
}

void draw() {
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

void gameMode1() {
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

void loseGame() {
  background(200, 0, 0);
  textSize(52);
  textAlign(CENTER);
  text("~YOU LOSE~", width/2, height/2);
  restartButton();
}

void winGame() {
  background(0, 200, 0);
  textSize(52);
  textAlign(CENTER);
  text("YOU WIN !!", width/2, height/2);
  restartButton();
}

void startGame() {
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

void keyReleased() {
  pacman.keyReleased();
}

void restartButton() {
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

void startButton() {
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