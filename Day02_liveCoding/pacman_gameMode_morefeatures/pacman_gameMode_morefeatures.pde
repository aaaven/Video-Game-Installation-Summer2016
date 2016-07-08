/*Created by Aven on July 7th
 for Go Beyond Classics: Bring Video Game into Real World
 In class live coding
 */
int cherryCount = 0;
int saveTime;
int totalTime = 10000;
Pacman pacman;
Cherry cherry;
int gameMode;

void setup() {
  size(800, 600);
  //fullScreen(1);
  //fullScreen(SPAN);
  pacman = new Pacman(random(200, 600), random(200, 600), 50, 8);
  cherry = new Cherry(random(20, width-20), random(20, height-20), 40);
  gameMode = 0;
  saveTime = millis();
  println(width,height);
}

void draw() { //gameMode;
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
  }
}