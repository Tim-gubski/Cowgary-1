PImage startScreenBg;
PImage groundImg;
int xStart,yStart;
PFont font;

void startScreenSetup() {
  startScreenBg = loadImage("CalgaryBackdrop.png");
  groundImg = loadImage("Ground.png");
  font = createFont("ARCADECLASSIC.TTF", 40);
}

void startScreenDraw() {
  image(startScreenBg, 0,0);
  image(groundImg, 0, 570);
  image(groundImg, 400, 570);
  textFont(font, 40);
  fill(255,169,40);
  text("Cowgary", 420, 280);
  
  text("Press  Enter  To  Start", 300, 380);
}
