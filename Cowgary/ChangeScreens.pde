String currentScreen = "startScreen";


void changeScreens(){
  resetFade();
  busReset();
  resetCow();
  x=0;
  switch(currentScreen) {
    case "startScreen":
      currentScreen = "walkToOffice";
      break;
    case "walkToOffice":
      introNewsPaperScreenSetup();
      currentScreen = "NewsPaper";
      break;
    case "NewsPaper":
      setupTextMessages();
      currentScreen = "messages1";
      break;
    case "messages1":
      herdingScreenSetup();
      currentScreen = "herding";
      break;
    case "herding":
      currentScreen = "messages2";
      break;
    case "messages2":
      pipeScreenSetup();
      currentScreen = "pipeline";
      break;
    case "pipeline":
      currentScreen = "messages3";
      break;
    case "messages3":
      ctScreenSetup();
      currentScreen = "tower";
      break;
    case "tower":
      currentScreen = "talking";
      break;
    case "talking":
      currentScreen = "final";
      break;
    case "final":
      currentScreen = "credits";
      break;
  }

}
