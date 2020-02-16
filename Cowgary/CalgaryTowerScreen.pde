PImage calgaryTower;
PImage arrowL;
PImage arrowR;
PImage arrowRPressed;
PImage arrowLPressed;
String btnState;
boolean btnPressed;

void ctScreenSetup() {
  startScreenBg = loadImage("CalgaryBackdrop.png");
  groundImg = loadImage("Ground.png");
  calgaryTower = loadImage("CalgaryTowerFullSprite.png");
  arrowL = loadImage("ArrowKeyLeft_Released.png");
  arrowR = loadImage("ArrowKeyRight_Released.png");
  arrowRPressed = loadImage("ArrowKeyRight_Pressed.png");
  arrowLPressed = loadImage("ArrowKeyLeft_Pressed.png");
  btnPressed = false;
}

void ctScreenDraw() {
  image(startScreenBg, 0,0);
  image(groundImg, 0, 570);
  image(groundImg, 400, 570);
  image(calgaryTower, 100,-100);
  image(groundImg, 0, 570);
  
  if(btnPressed) {
    switch(btnState) {
      case "right":
        rightPressedOnly();
        break;
      case "left":
        leftPressedOnly();
        break;
    }
  } else {
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
