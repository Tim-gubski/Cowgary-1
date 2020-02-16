PImage jezos;
PImage dialogBox;

void convinceJezosScreenSetup() {
  jezos = loadImage("BezosPixelated.png");
  dialogBox = loadImage("dialog_box.png");
  font = createFont("ARCADECLASSIC", 40);
}

void convinceJezosScreenDraw() {
  image(office,0,0);
  image(jezos, 50,120);
  jezos.resize(350,450);
  image(dialogBox,20,500);
  dialogBox.resize(860, dialogBox.height);
  
  textFont(font, 40);
  fill(255,255,255);
  text("So.. What's up, G? What information  have", 50, 560);
  text("you got for me?", 50, 600);
}
