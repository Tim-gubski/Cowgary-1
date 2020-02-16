int[] platforms = new int[] {100,480};


void pipeScreenSetup() {
  startScreenBg = loadImage("CalgaryBackdrop.png");
  groundImg = loadImage("Ground.png");
}

void pipeScreenDraw() {
  image(startScreenBg, 0,0);
  image(groundImg, 0, 570);
  image(groundImg, 400, 570);
  for(int i = 0; i<platforms.length; i+=2){
    rect(platforms[i],platforms[i+1],200,20);
  }
  drawCow(true);
}
