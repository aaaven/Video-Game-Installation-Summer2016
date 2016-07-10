class Button {
  boolean status, mouseHover;
  float bx, by, bh, bw;
  color bcolor;
  String str;
  Button(String string, float x, float y, float w, float h) {
    str = string;
    bx = x;
    by = y;
    bw = w;
    bh = h;
  }
  void run() {
    check();
    display();
  }
  void check() {
    if (mouseX <bx+bw && mouseX > bx && mouseY < by+bh && mouseY > by ) {
      //mouse hover
      bcolor = #333333;
      mouseHover = true;
    } else {
      bcolor = #999999;
      mouseHover = false;
    }
    if (mouseHover && mousePressed) {
      status = true;
      bcolor = #222222;
    } else status = false;
    println("buttonStatus" + status + "hover" + mouseHover);
  }
  void display() {
    fill(bcolor);
    noStroke();
    //rectMode(CENTER);
    rect(bx, by, bw, bh);
    fill(255);
    //textMode(SHAPE);
    textAlign(LEFT, TOP);
    textSize(0.8*bh);
    text(str, bx+bw/4, by);
  }
}