PImage calgaryTower;
PImage arrowL;
PImage arrowR;
PImage arrowRPressed;
PImage arrowLPressed;
PImage dottedLine;
String btnState;
boolean btnPressed;
int pressCount;
int start;
int towerHeight;

void ctScreenSetup() {
  startScreenBg = loadImage("CalgaryBackdrop.png");
  groundImg = loadImage("Ground.png");
  calgaryTower = loadImage("CalgaryTowerFullSprite.png");
  arrowL = loadImage("ArrowKeyLeft_Released.png");
  arrowR = loadImage("ArrowKeyRight_Released.png");
  arrowRPressed = loadImage("ArrowKeyRight_Pressed.png");
  arrowLPressed = loadImage("ArrowKeyLeft_Pressed.png");
  dottedLine = loadImage("DashedLine.png");
  font = createFont("ARCADECLASSIC.TTF", 40);
  btnPressed = false;
  pressCount = 0;
  start = 40;
  towerHeight = 280;
}

void ctScreenDraw() {
  buildTower(towerHeight);
  buttonStateAction();
  
  
  if(pressCount > start && towerHeight != -120) {
    towerHeight -= start;
    buildTower(towerHeight);
    start += 40;
    print(towerHeight);
  }
  
  if (towerHeight == -120) {
    textFont(font, 40);
    fill(255,255,255);
    text("YAY!", 600, 280);
  }
}

void buttonStateAction() {
  if(btnPressed) {
    switch(btnState) {
      case "right":
        rightPressedOnly();
        pressCount++;
        break;
      case "left":
        leftPressedOnly();
        pressCount++;
        break;
    }
  } else {
    btnState = "idle";
    neutralButtons();
  }
}

void rightPressedOnly() {
  image(arrowL, 650, 375);
  image(arrowRPressed, 650, 375);
}

void leftPressedOnly() {
  image(arrowLPressed, 650, 375);
  image(arrowR, 650, 375);
}

void neutralButtons() {
  image(arrowL, 650, 375);
  image(arrowR, 650, 375);
}

void buildTower(int y) {
  image(startScreenBg, 0,0);
  image(groundImg, 0, 570);
  image(groundImg, 400, 570);
  buttonStateAction();
  
  image(calgaryTower, 100, y);
  image(groundImg, 0, 570);
  drawDottedLine();
}

void drawDottedLine() {
  image(dottedLine, 265,100);
  dottedLine.resize(250, dottedLine.height);
  
  textFont(font, 40);
  fill(0,0,0);
  text("CN  Tower", 50, 200);
  text("553 m", 90, 240);
}
