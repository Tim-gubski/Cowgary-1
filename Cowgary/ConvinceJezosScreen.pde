PImage jezos;
PImage dialogBox;

void convinceJezosScreenSetup() {
  jezos = loadImage("BezosPixelated.png");
  dialogBox = loadImage("dialog_box.png");
}

void convinceJezosScreenDraw() {
  image(office,0,0);
  image(jezos, 50,120);
  jezos.resize(350,450);
  image(dialogBox,20,500);
  dialogBox.resize(860, dialogBox.height);
}
