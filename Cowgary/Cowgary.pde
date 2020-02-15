PImage calgary;
int x,y;

void setup() {
  size(900, 900);
  calgary = loadImage("Calgary_Pixelated.png");
}

void draw() {
  background(255);
  x = constrain(x, 0, calgary.width - width);
  y = constrain(y, 0, calgary.height - height);
  image(calgary, -x, 0);
  x = frameCount;
}
