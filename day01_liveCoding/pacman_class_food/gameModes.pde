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
  background(0);
  pacman.run();
  cherry.run();
  if (!cherry.status) {
    cherry = new Cherry(random(20, width-20), random(20, height-20), 40);
    cherryCount++;
    println("cherryCount    "+ cherryCount);
  }
}
void loseGame() {
  background(200, 0, 0);
  text("U sucks!!!", width/2, height/2);
}
void winGame() {
  background(0, 200, 0);
  text("Yeah, u are fine", width/2, height/2);
}