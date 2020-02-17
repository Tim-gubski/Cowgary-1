PImage endScreenBg;
PImage aidanImage;
PImage alyssaImage;
PImage kimImage;
PImage naraImage;
PImage timImage;


void endingScreenSetup() 
{
    endScreenBg = loadImage("CalgaryBackdrop.png");
    groundImg = loadImage("Ground.png");
    aidanImage = loadImage("aidan.png");
    alyssaImage = loadImage("alyssa.png");
    kimImage = loadImage("kim.png");
    naraImage = loadImage("nara.png");
    timImage = loadImage ("tim.png");

  
}

void endingScreenDraw()
{
  image(endScreenBg, 0,0);
  image(groundImg, 0, 570);
  image(groundImg, 400, 570);
  textFont(font, 40);
  fill(255,255,255);
  text("Thanks for Playing!", 230, 100);
  text("Check the README for credits", 200, 150);
  
  image(aidanImage, 5, 400);
  image(alyssaImage, 170, 400);
  image(kimImage, 380, 400);
  image(naraImage, 540, 400);
  image(timImage, 720, 400);
}
