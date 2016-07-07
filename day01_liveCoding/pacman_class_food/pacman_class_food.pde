/*Created by Aven on July 7th
 for Go Beyond Classics: Bring Video Game into Real World
 In class live coding
 */
int cherryCount = 0;
int saveTime;
int totalTime = 5000;
Pacman pacman;
Cherry cherry;
int gameMode;

void setup() {
  size(800, 800);
  pacman = new Pacman(random(200, 600), random(200, 600), 100, 8);
  cherry = new Cherry(random(20, width-20), random(20, height-20), 40);
  saveTime = millis();
  gameMode = 0;
}

void draw() { //gameMode;
  int passTime = millis()-saveTime;
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
  }
  if (passTime > totalTime) {
    //time is up
    if (gameMode ==1) {
      if (cherryCount < 5) {
        gameMode = 2;
        println("lose");
      } else {
        gameMode = 3;
        println("win");
      }
      cherryCount = 0;
    }
    saveTime = millis();//restart timer
  }
}