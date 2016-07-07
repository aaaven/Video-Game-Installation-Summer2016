void startScreen() {//case 0
  background(150);
  Button startPlay = new Button("Start", width/4, 2*height/3, 20);
  startPlay.run();
  //click on startPlay to jump to gameMode1
  if (startPlay.status) {
    gameMode = 1;
    saveTime = millis();
  }
}
void gameMode1() { //case 1
  int passTime = millis()-saveTime;
  background(0);
  pacman.run();
  cherry.run();
  if (!cherry.status) {
    cherry = new Cherry(random(20, width-20), random(20, height-20), 40);
    cherryCount++;
    println("cherryCount    "+ cherryCount);
  }
  if (passTime > totalTime) {
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
  println(saveTime);
}
void loseGame() { //2
  background(200, 0, 0);
  text("U sucks!!!", width/2, height/2);
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
void winGame() {//3
  background(0, 200, 0);
  text("Yeah, u are fine", width/2, height/2);
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

void gameMode2() {
  background(0, 0, 255);
}