PImage calgaryTower;

void ctScreenSetup() {
  startScreenBg = loadImage("CalgaryBackdrop.png");
  groundImg = loadImage("Ground.png");
  calgaryTower = loadImage("CalgaryTowerFullSprite.png");
}

void ctScreenDraw() {
  image(startScreenBg, 0,0);
  image(groundImg, 0, 570);
  image(groundImg, 400, 570);
  image(calgaryTower, 100,-100);
  image(groundImg, 0, 570);
}
