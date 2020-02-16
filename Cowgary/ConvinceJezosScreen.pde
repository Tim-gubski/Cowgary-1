PImage jezos;
PImage dialogBox;

void convinceJezosScreenSetup() {
  sittingCow = loadImage("Cow_SitAtDesk.png");
  jezos = loadImage("BezosPixelated.png");
  dialogBox = loadImage("dialog_box.png");
  font = createFont("munro.ttf", 40);
  
  questInfoDismissed = false;
  questDialogueBox = loadImage("dialog_box.png");
  questDialogueBox.resize(750, 250);
}

void convinceJezosScreenDraw() {
  image(office,0,0);
  image(sittingCow, 85, -90);
  image(jezos, 50,120);
  jezos.resize(350,450);
  image(dialogBox,20,500);
  dialogBox.resize(860, dialogBox.height);
  
  textFont(font, 40);
  fill(255,255,255);
  text("Hey Gary. Nice place you got here.", 50, 560);
  text("Very... quaint.", 50, 600);
  
  if (!questInfoDismissed) {
    if (!btnPressed) {
      image(questDialogueBox, 75, 200);
      textFont(font, 40);
      fill(255, 255, 255);
      text("FINAL QUEST: Convince Beff!", 120, 275);
      text("Press any key to begin", 120, 325);

    }
    else {
      questInfoDismissed = true;
    }
  }
  
}
