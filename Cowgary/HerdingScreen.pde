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
PImage topBus;

boolean questInfoDismissed;
int collectionCounter;


void herdingScreenSetup() {
  font = createFont("ARCADECLASSIC.TTF", 40);

  //startScreenBg = loadImage("CalgaryBackdrop.png");
  //groundImg = loadImage("Ground.png");
  topDownCity = loadImage("topDownCity.png");
  topDownCity.resize(900, 700);
  
  questDialogueBox = loadImage("dialog_box.png");
  questDialogueBox.resize(750, 250);
  
  //topBus.resize(busHeight, busWidth);
  
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
}

void herdingScreenDraw() {
  fade();
  image(topDownCity, 0,0);
  fill(221, 210, 250);
  rect(460, 5, 265, 60, 7);
  drawSprite(aidan);
  drawSprite(alyssa);
  drawSprite(kim);
  drawSprite(nara);
  drawSprite(tim);
  
  if (entry) {
      driveY++;    
      if (driveY == 20) {
          entry = false;
      }
      drawBus();
  }
  else if (!questInfoDismissed) {
    if (!btnPressed) {
      //fill(211, 138, 59);
      //rect(200, 200, 500, 300);
      image(questDialogueBox, 75, 200);
      textFont(font, 40);
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
    drawBus();    
  }
  
  if (aidan.collision && alyssa.collision && kim.collision && nara.collision && tim.collision) {
    print("all done");
  }
}

void drawBus() {
  if (vertical) {
     rect(driveX, driveY, busWidth, busHeight);
  } else {
     rect(driveX, driveY, busHeight, busWidth);
  }
}

void driveRight() {
  driveX++;
}

void driveLeft() {
  driveX--;
}


void driveUp() {
 driveY--; 
}

void driveDown() {
  driveY++;
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
