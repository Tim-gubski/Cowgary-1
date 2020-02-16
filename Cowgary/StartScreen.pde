PImage startScreenBg;
PImage groundImg;
int xStart,yStart;
PFont font;

boolean started = false;

void startScreenSetup() {
  startScreenBg = loadImage("CalgaryBackdrop.png");
  groundImg = loadImage("Ground.png");
  font = createFont("munro.ttf", 40);
}

void startScreenDraw() {
  image(startScreenBg, 0,0);
  image(groundImg, 0, 570);
  image(groundImg, 400, 570);
  textFont(font, 40);
  fill(255,0,0);
  text("Cowgary", 390, 75);
  fill(255,255,255);
  text("Press  Enter  To  Start", 300, 125);
  if(started){
    fade();
  }
}
