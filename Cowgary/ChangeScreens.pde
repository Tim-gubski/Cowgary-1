String currentScreen = "startScreen";


void changeScreens(){
  resetFade();
  busReset();
  resetCow();
  x=0;
  stateCounter=0;
  currentText = 0;
  switch(currentScreen) {
    case "startScreen":
      currentScreen = "walkToOffice";
      break;
    case "walkToOffice":
      introNewsPaperScreenSetup();
      currentScreen = "NewsPaper";
      break;
    case "NewsPaper":
      setupTextMessages("PhoneTexts_Frame",9);
      currentScreen = "messages1";
      break;
    case "messages1":
      herdingScreenSetup();
      currentScreen = "herding";
      break;
    case "herding":
      setupTextMessages("AfterHerdingTexts_Frame",6);
      currentScreen = "messages2";
      break;
    case "messages2":
      pipeScreenSetup();
      currentScreen = "pipeline";
      break;
    case "pipeline":
      setupTextMessages("AfterPipelineTexts_Frame",12);
      currentScreen = "messages3";
      break;
    case "messages3":
      ctScreenSetup();
      currentScreen = "tower";
      break;
    case "tower":
      setupTextMessages("AfterTowerTexts_Frame",5);
      currentScreen = "messages4";
      break;
    case "messages4":
      convinceJezosScreenSetup();
      currentScreen = "talking";
      break;
    case "talking":
      stopSounds();
      zen.loop();
      currentScreen = "final";
      break;
    case "final":
      endingScreenSetup();
      currentScreen = "credits";
      break;
  }

}
