
void startScreen() {//case 0
  imageMode(CENTER);
  PImage background = loadImage("background.jpg");
  image(background, width/2, height/2, width, height);
  Button startPlay =new Button("Start", width/4, 2*height/3, 20);

  startPlay.run();
  //click on startPlay to jump to gameMode1

  if (startPlay.status) {
    gameMode = 1;
    saveTime = millis();
  }
  Button exit = new Button("Exit", 3*width/4, 2*height/3, 20);
  exit.run();
  if (exit.status) exit();


  /*Button setupcolor= new Button("Color", 2*width/4, 2*height/3, 20);
  setupcolor.run();
  if (setupcolor.status) {
    gameMode =5;
  }*/
}


void gameMode1() { //case 1


  image(baigong, width/2, height/2, 2*width, height);
  //cp5.hide();    
  int passTime = millis()-saveTime;
  
  pacman.run();
  cherry.run();
  if (!cherry.status) {
    cherry = new Cherry(random(20, width-20), random(20, height-20), random(30,60));
    cherryCount++;
    pacman.pacSize+=10;
    pacman.textKey = int(random(0,4));
    //println("cherryCount    "+ cherryCount);
  }
  if (passTime > totalTime) {
    pacman.pacSize=pacman.initSize;

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
  //println(saveTime);
}

void loseGame() { //2
  imageMode(CENTER);
  PImage fired = loadImage("fired.png");
  image(fired, width/2, height/2, width, height);

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
  imageMode(CENTER);
  PImage good = loadImage("good.jpg");
  image(good, width/2, height/2, width, height);
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

/*void setupcolor() { //5
  background(0);
  Button play = new Button("play", 3*width/4, 2*height/3, 20);
  play.run();
  //cp5 = new ControlP5( this );
  //cp5.addColorWheel("c", 250, 10, 200 ).setRGB(color(128, 0, 255));
  noStroke();
  int c = color(100);
  if (play.status) {
    gameMode=1;
    //int c =100;
    fill( c );
    saveTime = millis();
   // cp5.hide();
  }
}*/





void gameMode2() {
  int passTime = millis()-saveTime;
  background(79, 192, 196);
  pacman.run();
  cherry.secondrun();
  if (!cherry.status) {
    cherry = new Cherry(random(20, width-20), random(20, height-20), 40);
    cherryCount++;
    pacman.pacSize+=10;
    //println("cherryCount    "+ cherryCount);
  }
  if (passTime > totalTime) {
    pacman.pacSize=pacman.initSize;

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
  //println(saveTime);
}