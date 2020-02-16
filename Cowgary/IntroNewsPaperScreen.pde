PImage officeBG;
int stateCounter = 0;
PImage sittingCow;
PImage newsPaper;

void introNewsPaperScreenSetup()
{
  sittingCow = loadImage("Cow_SitAtDesk.png");
  newsPaper = loadImage("NewsPaper_Amazoon.png");
  dialogBox = loadImage("dialog_box.png");
  frame = 0;
}

void introNewsPaperScreenDraw()
{
  switch(stateCounter)
  {
    case 0:
       image(office,0,0); 
       image(sittingCow, 85, -90);
       image(dialogBox,20, 500);
       dialogBox.resize(860, dialogBox.height);
       drawIntroDialogueText();
       break;
    case 1:
      drawNewspaper();
      break;
    default:
      drawNewspaper();
      fade();
      break;
   }
   frame++;

}

void drawNewspaper()
{
  image(newsPaper, 90, 0);
}

void drawIntroDialogueText()
{
  textFont(font, 40);
  fill(255,255,255);
  text("Another  beautiful  day  as  the  mayor ", 50, 560);
  text("of  Cowgary!", 50, 600);
}
