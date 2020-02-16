PImage calgary;
PImage ground;
PImage HQ;

int x = 0;
Animation cowRight, cowLeft, cowIdleLeft,cowIdleRight;

String cowState = "idleRight";
int speed = 0;

void loadImages() {
  calgary = loadImage("CalgaryBackdrop.png");
  ground = loadImage("Ground.png");
  HQ = loadImage("AmazonHQ.png");
  cowRight = new Animation("right_", 10);
  cowLeft = new Animation("left_", 10);
  cowIdleRight = new Animation("idle_",5);
  cowIdleLeft = new Animation("leftIdle_",5);
}

void setBackground() {
  background(255);
  image(calgary, -x/2, 0);
  image(calgary, -x/2+1000, 0);
  for (int i = 0; i<=6; i++){
    image(ground, -2*x+400*i, 570);
  }
  image(HQ, -2*x+1200, 130);
  switch(cowState) {
    case "right":
      cowRight.display(400, 470, 0.3);
      break;
    case "left":
      cowLeft.display(400, 470, 0.3);
      break;
    case "idleLeft":
      cowIdleLeft.display(400, 470, 0.15);
      break;
    case "idleRight":
      cowIdleRight.display(400, 470, 0.15);
      break;
    default:

  }
  x+=speed;
}

void keyPressed() {
  switch(keyCode) {
    case RIGHT:
      speed = 1;
      cowState = "right";
      break;
    case LEFT:
      speed = -1;
      cowState="left";
      break;
    default:
      speed=0;
      if(cowState=="right"){
        cowState="idleRight";
      }else if(cowState=="left"){
        cowState="idleLeft";
      }
  }
}


void keyReleased() {
  speed=0;
  if(cowState=="right"){
        cowState="idleRight";
  }else if(cowState=="left"){
        cowState="idleLeft";
  }
}
