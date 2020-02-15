PImage calgary;
PImage ground;
int x,y;

void setup() {
  size(900, 900);
  calgary = loadImage("Calgary_Pixelated.png");
  ground = loadImage("Ground.png");
}

void draw() {
  background(255);
  x = constrain(x, 0, calgary.width - width);
  y = constrain(y, 0, calgary.height - height);
  image(calgary, -x, 0);
  for (int i = 0; i<=6; i++){
    image(ground, -2*x+400*i, 750);
  }
  x = frameCount;
}
