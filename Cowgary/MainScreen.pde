PImage calgary;
PImage ground;
int x,y;

int speed = 0;

void loadImages() {
  calgary = loadImage("CalgaryBackdrop.png");
  ground = loadImage("Ground.png");
}

void setBackground() {
  background(255);
  image(calgary, -x/2, 0);
  image(calgary, -x/2+1000, 0);
  for (int i = 0; i<=6; i++){
    image(ground, -2*x+400*i, 570);
  }
  x+=speed;
}

void keyPressed() {
  if (key == CODED) {
      if (keyCode == RIGHT) {
        speed = 1;
      } else if (keyCode == LEFT) {
        speed = -1;
      }else{
        speed=0;
    }
  }
}


//void keyReleased() {
//  speed = 0;
//}
