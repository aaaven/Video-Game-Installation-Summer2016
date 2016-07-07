/*Created by Aven on July 7th
 for Go Beyond Classics: Bring Video Game into Real World
 In class live coding
 */
 
Pacman pacman;
void setup() {
  size(800, 800);
  pacman = new Pacman(random(200, 600), random(200, 600), 100, 8);
}
void draw() {
  background(0);
  pacman.run();
}
void keyReleased(){
 pacman.keyReleased(); 
}