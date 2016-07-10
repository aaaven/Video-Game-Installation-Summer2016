/*Final project, Created by Yuhang on July 7th,
 for class "Go Beyond Classics: Bring Video Game into Real World"
 live coding
 */
int cherryCount = 0;
int saveTime;
int totalTime = 10000;
Pacman pacman;
Cherry cherry;
int gameMode;
PImage [] images;
PImage baigong;
String [] texts;
void setup() {
  size(800, 800);
  //fullScreen(1);
  //fullScreen(SPAN);


  pacman = new Pacman(random(200, 600), random(200, 600), 100, 8);
  cherry = new Cherry(random(20, width-20), random(20, height-20), 40);
  gameMode = 0;
  saveTime = millis();
  println(width, height);
  images = new PImage[4];  
  images[0]= loadImage("aa.png");
  images[1]= loadImage("aaa.png");
  images[2]= loadImage("aaaa.png");
  images[3]= loadImage("aaaaa.png");
  baigong= loadImage("baigong.png");
  texts = new String[4];
  texts[0] = "We are going to make America great again!";
  texts[1] = "We’re going to beat China, Japan. We’re going to beat Mexico with trade";
  texts[2] = "An ‘extremely credible source’ has called my office and told me that Barack Obama’s birth certificate is a fraud";
  texts[3] = "I will build a great, great wall on our southern border, and I will make Mexico pay for that wall. Mark my words.";
}

void draw() {
  //gameMode;
  textSize(12);
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
    //case 5:
    //  setupcolor();
    //  break;
  }
}