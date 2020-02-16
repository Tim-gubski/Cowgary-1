void herdingScreenSetup() {
  startScreenBg = loadImage("CalgaryBackdrop.png");
  groundImg = loadImage("Ground.png");
}

void herdingScreenDraw() {
  image(startScreenBg, 0,0);
  image(groundImg, 0, 570);
  image(groundImg, 400, 570);
}
