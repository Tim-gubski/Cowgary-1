PImage topDownCity;
boolean entry = true;
int driveY = -70;
int driveX = 75;
String herdingBtnState;
boolean vertical;
color border;


void herdingScreenSetup() {
  //startScreenBg = loadImage("CalgaryBackdrop.png");
  //groundImg = loadImage("Ground.png");
  topDownCity = loadImage("topDownCity.png");
  topDownCity.resize(900, 700);
  btnPressed = false;
  vertical = true;
  border = color(232, 216, 168);
}

void herdingScreenDraw() {
  fade();
  image(topDownCity, 0,0);
  
  if (entry) {
      driveY++;    
      if (driveY == 20) {
          entry = false;
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
      print(get(driveX, driveY) == border);
    } else {
      // do stuff
    }
  }
  if (vertical) {
     rect(driveX, driveY, 30, 60);
  } else {
     rect(driveX, driveY, 60, 30);
  }

  
  

  //image(groundImg, 0, 570);
  //image(groundImg, 400, 570);
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
