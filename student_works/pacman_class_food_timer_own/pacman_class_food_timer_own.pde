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
void setup() {
  //size(800, 100);
  size(768, 540);
  saveTime = millis();
  pac = new Pacman(width/2, height/2, 4, 50);
  cherry = new Cherry(random(100, 500), random(100, 500), 40);
  gameMode = 0;
  saveTime = millis();
  println(width,height);
  //import controlP5.*;
  
}

void draw() {
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