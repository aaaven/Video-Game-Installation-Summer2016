//recreate by Aven from Learning processing by Daniel shiffman
//for Go beyond classics: Bring video game into real world 
//demo on time count in game design
int saveTime;
int totalTime = 10000;
void setup() {
  size(800, 600); 
  saveTime = millis();
}

void draw() {
  int passTime = millis()-saveTime;
  if (passTime > totalTime) {
    //reset the timer
    saveTime = millis();
  }
  println(passTime);
}