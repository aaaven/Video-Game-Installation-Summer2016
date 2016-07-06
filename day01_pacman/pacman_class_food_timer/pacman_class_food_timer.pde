/* Created by Aven on July 5th
for Go beyond classics: Bring video game into real world class
More game structure add in
*/
Pacman pac;
Food foo;
int fCount = 0;
int saveTime;
int totalTime = 10000;
int fCnt = 3;

int gameMode = 1;
void setup() {
  //size(800, 100);
  size(800, 600);
  saveTime = millis();
  pac = new Pacman(width/2, height/2, 4, 30);
  foo = new Food(random(100, 500), random(100, 500), 10);
}

void draw() {
  int passTime = millis()-saveTime;
  switch (gameMode) {
  case 0:
    //start screen
    break;
  case 1:
    gameMode();
    break;
  case 2:
    loseGame();
    break;
  case 3:
    winGame();
    break;
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
void gameMode() {
  background(0);  
  pac.run();
  foo.run();
  if (!foo.fStatue) {
    foo = new Food(random(100, 500), random(100, 500), 10);
    fCount ++;
    //println(fCount);
  }
}

void keyReleased() {
  pac.keyReleased();
}

void winGame() {
  background(255, 0, 0);
  //fill(0);
  text("Yeah, u win!!!!!!", width/2, height/2);
  restartButton();
}

void loseGame() {
  background(0);
  fill(255);
  text("u SUCK!!!!!", width/2, height/2);
  restartButton();
}

void restartButton() {
  Button Restart = new Button("Restart", 100, height -50, 60, 20);
  Restart.run();
  if (Restart.status) {
    gameMode = 1;
    fCount = 0;
  }
}