PImage calgaryTower;
PImage arrowL;
PImage arrowR;
PImage arrowRPressed;
PImage arrowLPressed;
PImage dottedLine;
PImage towerQuestDialogueBox;

PFont tower_font;

String btnState;
boolean btnPressed;
float pressCount;
int start;
int towerHeight;



boolean towerQuestInfoDismissed;

void ctScreenSetup() {
  startScreenBg = loadImage("ConstructionBackground.png");
  groundImg = loadImage("Ground.png");
  calgaryTower = loadImage("CalgaryTowerFullSprite.png");
  arrowL = loadImage("ArrowKeyLeft_Released.png");
  arrowR = loadImage("ArrowKeyRight_Released.png");
  arrowRPressed = loadImage("ArrowKeyRight_Pressed.png");
  arrowLPressed = loadImage("ArrowKeyLeft_Pressed.png");
  dottedLine = loadImage("DashedLine.png");
  towerQuestDialogueBox = loadImage("dialog_box.png");
  towerQuestDialogueBox.resize(750, 250);

  tower_font = createFont("munro.ttf", 40);
  btnPressed = false;
  pressCount = 0;
  start = 40;
  towerHeight = 280;
  cowX = 200;
  
  stopSounds();
  pipeBoi.loop();
  towerQuestInfoDismissed = false;
}

void ctScreenDraw() {
  buildTower(towerHeight);
  buttonStateAction();
  drawCow(true);
  
  if(!towerQuestInfoDismissed) {
    if (!btnPressed) {
      image(towerQuestDialogueBox, 75, 200);
      textFont(tower_font, 40);
      fill(255, 255, 255);
      text("Build the Cowgary Tower!", 120, 275);
      text("Use the right and left arrow keys.", 120, 325);
      text("Press an arrow key to begin.", 120, 375);
    }
    else {
      towerQuestInfoDismissed = true;
    }
  }
  
  if(pressCount > start && towerHeight != -120) {
    towerHeight -= start;
    buildTower(towerHeight);
    start += 40;
    print(towerHeight);
  }
  
  if (towerHeight == -120) {
    busDriveOn();
  }
  
}

void buttonStateAction() {
  if(btnPressed) {
    switch(btnState) {
      case "right":
        rightPressedOnly();
        pressCount+=.5;
        break;
      case "left":
        leftPressedOnly();
        pressCount+=.5;
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
  startScreenBg.resize(900,700);
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
  fill(255,255,255);
  textFont(tower_font, 40);
  text("CN  Tower", 50, 200);
  text("553 m", 90, 240);
}
