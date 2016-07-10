void startScreen() {
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
void GameMode1() {
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
  

void keyReleased() {
  pac.keyReleased();
}

void winGame() {
  PImage WIN=loadImage("win.jpg");
  imageMode(CORNER);
  image(WIN,0,0,width,height);
  fill(0);
  textSize(30);
  text("Oh Yeah,kimoji b0SS!!!!!!", width/2, height/4*3);
  restartButton();
}

void loseGame() {
  PImage LOSE=loadImage("lose.jpg");
  imageMode(CORNER);
  image(LOSE,0,0,width,height);
  fill(0);
  textSize(30);
  text("U frickin lame!!!", width/2, height/4);
  restartButton();
}

void restartButton() {
  Button Restart = new Button("BACK", 100, height -50, 20);
  Restart.run();
  if (Restart.status) {
    gameMode = 0;
    fCount = 0;
  }
}