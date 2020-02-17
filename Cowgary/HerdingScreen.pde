PImage topDownCity;
Programmer aidan;
Programmer alyssa;
Programmer kim;
Programmer nara;
Programmer tim;

boolean entry = true;
int driveY = -70;
int driveX = 75;
int busWidth = 20;
int busHeight = 40;
String herdingBtnState;
boolean vertical;
color border;


PImage questDialogueBox;
PImage topBusRight;
PImage topBusLeft;
PImage topBusUp;
PImage topBusDown; 

boolean questInfoDismissed;
int collectionCounter;
PFont font_herding;

void herdingScreenSetup() {
  font_herding = createFont("munro.ttf", 40);

  topDownCity = loadImage("topDownCity.png");
  topDownCity.resize(900, 700);
  
  questDialogueBox = loadImage("dialog_box.png");
  questDialogueBox.resize(750, 250);
  
  topBusRight = loadImage("PixelBusTopDown_RightFacing.png");
  topBusRight.resize(busHeight, busWidth);
  
  topBusLeft = loadImage("PixelBusTopDown_LeftFacing.png");
  topBusLeft.resize(busHeight, busWidth);
  
  topBusUp = loadImage("PixelBusTopDown_UpFacing.png");
  topBusUp.resize(busWidth, busHeight);
  
  topBusDown = loadImage("PixelBusTopDown_DownFacing.png");
  topBusDown.resize(busWidth, busHeight);
  
  aidan = new Programmer(700, 600, 45, 50, "aidan.png", 475, 10);
  alyssa = new Programmer(10, 250, 45, 50, "alyssa.png", 525, 10);
  kim = new Programmer(210, 80, 45, 50, "kim.png", 575, 10);
  nara = new Programmer(430, 400, 45, 50, "nara.png", 625, 10);
  tim = new Programmer(600, 230, 45, 50, "tim.png", 675, 10);

  
  btnPressed = false;
  vertical = true;
  border = color(0, 0, 255);
  
  questInfoDismissed = false;
  
  collectionCounter = 0;
  
  stopSounds();
  pipeBoi.loop();
}

void herdingScreenDraw() {
  image(topDownCity, 0,0);
  fill(221, 210, 250);
  rect(460, 5, 265, 60, 7);
  drawSprite(aidan);
  drawSprite(alyssa);
  drawSprite(kim);
  drawSprite(nara);
  drawSprite(tim);
 
  if (entry) {
      driveY += 3;    
      if (driveY == 20) {
          entry = false;
      }
      drawBus("down");
  }
  else if (!questInfoDismissed) {
    if (!btnPressed) {
      image(questDialogueBox, 75, 200);
      textFont(font_herding, 40);
      fill(255, 255, 255);
      text("Collect 5 developers!", 120, 275);
      text("Use the arrow keys to drive.", 120, 325);
      text("Press an arrow key to begin.", 120, 375);
    }
    else {
      questInfoDismissed = true;
    }
  }
  else {
    if(btnPressed) {
      switch(herdingBtnState) {
        case "right":
          driveRight();
          vertical = false;
          break;
        case "left":
          driveLeft();
          vertical = false;
          break;
        case "up":
          vertical = true;
          driveUp();
          break;
        case "down":
          vertical = true;
          driveDown();
          break;
      }   
    }
    drawBus(herdingBtnState);    
  }
  
  if (aidan.collision && alyssa.collision && kim.collision && nara.collision && tim.collision) {
    fade();
  }
}

void drawBus(String direction) {  
  switch(direction) {
    case "right":
      image(topBusRight, driveX, driveY);
      break;
    case "left":
      image(topBusLeft, driveX, driveY);
      break;
    case "up":
      image(topBusUp, driveX, driveY);
      break;
    case "down":
      image(topBusDown, driveX, driveY);
      break;
  }   
}

void driveRight() {
  driveX += 3;
}

void driveLeft() {
  driveX -= 3;
}


void driveUp() {
 driveY -= 3; 
}

void driveDown() {
  driveY += 3;
}

void drawSprite(Programmer programmer) {
  boolean collision = programmer.collision;
  if (!collision) {
    programmer.checkAllCollisions(driveX, driveY, busWidth, busHeight);
    image(programmer.image, programmer.xCoordinate, programmer.yCoordinate);
  }
  else {
      image(programmer.image, programmer.iconX, programmer.iconY);
  }
}
