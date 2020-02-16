PImage jezos;
PImage dialogBox;
String selectState;

int selection = 0;
int jezosStateCounter;

int text1Colour = 0;
int text2Colour = 255;
int text3Colour = 255;

boolean questInfoDismissed_bezos;

void convinceJezosScreenSetup() {
  sittingCow = loadImage("Cow_SitAtDesk.png");
  jezos = loadImage("BezosPixelated.png");
  dialogBox = loadImage("dialog_box.png");
  font = createFont("munro.ttf", 40);
  stopSounds();
  bezos.loop();
  selectState = "idle";
  selection=0;
  jezosStateCounter = 0;
  questInfoDismissed_bezos = false;
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
  
  switch(jezosStateCounter) {
    case 0: 
        dialogText(true,"Hey Gary. Nice place you got here.", "Very... quaint.");
        break;
    case 1:
       dialogText(false, "I take the bus to work. What were you","expecting");
       break;
    case 2:
       dialogText(true, "Okay okay. So...", "Tell me why Amazoon should come to Cowgary.");
       break;
    case 3:
      dialogText(true, "Okay okay. So...", "Tell me why Amazoon should come to Cowgary.");
      if (!questInfoDismissed_bezos) {
          if (!btnPressed) {
            image(questDialogueBox, 75, 200);
            textFont(font, 40);
            fill(255, 255, 255);
            text("FINAL QUEST: Convince Beff!", 120, 275);
            text("Press any key to begin", 120, 325);
      
          }
        } else {
            questInfoDismissed_bezos = true;
        }
        break;
    case 4:
      challengeText("> Cowgary has 5 developers", "> Cowgary has 4 billion developers", "> I am a developer");
      break;
    case 5:
      challengeText("> Our winters aren’t that bad", "> The mountains are close", "> Deerfoot is the best road in the world.");
      break;
    case 6:
      challengeText("> At least we aren’t Deadmonton.", "> We have the Stampede.", "> Flames will win the Stanley Cup this year.");
      break;
    default:
      fade();
      break;  
  }
  //dialogText(true, "Not impressive, Gary.  But at least", "you’re honest! :)");
  //dialogText(true, "That doesn’t sound right >:(", "");
  //dialogText(true, "Let’s not kid ourselves here :(", "");
  
}

void redrawBg() {
  image(office,0,0);
  image(sittingCow, 85, -90);
  image(jezos, 50,120);
  jezos.resize(350,450);
  image(dialogBox,20,500);
  dialogBox.resize(860, dialogBox.height);
}

void dialogText(boolean isBezos, String firstSentence, String secondSentence) {
  redrawBg();
  int textShift = 0;
  textFont(font, 40);
  fill(255,255,0);
  if (isBezos) {
    text("Beff Jezos: ", 50, 560);
    textShift = 230;
  } else {
    text("Gary: ", 50, 560);
    textShift = 140;
  }
  fill(255,255,255);
  text(firstSentence, textShift, 560);
  text(secondSentence, 50, 600);
}

void challengeText(String first, String second, String third) {
  redrawBg();
  textFont(font, 40);
  switch (selection%3){
    case 0:
      text1Colour = 0;
      text2Colour = 255;
      text3Colour = 255;
      break;
    case 1:
      text1Colour = 255;
      text2Colour = 0;
      text3Colour = 255;
      break;
    case 2:
      text1Colour = 255;
      text2Colour = 255;
      text3Colour = 0;
      break;
  }
  fill(255,255,text1Colour);
  text(first, 70, 560);
  fill(255,255,text2Colour);
  text(second, 70, 600);
  fill(255,255,text3Colour);
  text(third, 70, 640);
}
