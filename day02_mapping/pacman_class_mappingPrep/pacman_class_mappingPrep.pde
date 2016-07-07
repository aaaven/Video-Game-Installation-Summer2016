/*Created by Aven on July 7th
 for Go Beyond Classics: Bring Video Game into Real World
 In class live coding
 */
int cherryCount = 0;
int saveTime;
int totalTime = 30000;
Pacman pacman;
Cherry cherry;
int gameMode;
int Width = 1280;
int Height = 800;
int mainWidth = 2560;
int mainHeight = 1080;
void setup() {
  //size(800, 800);
  //fullScreen(1);
  fullScreen(SPAN);
  pacman = new Pacman(random(200, 600), random(200, 600), 100, 8);
  cherry = new Cherry(random(20, Width-20), random(20, Height-20), 40);
  gameMode = 0;
  saveTime = millis();
  println(Width,Height);
}

void draw() { //gameMode;
pushMatrix();
translate(2560,0);
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
  popMatrix();
}