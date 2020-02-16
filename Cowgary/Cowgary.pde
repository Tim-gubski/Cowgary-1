void setup() {
  size(900, 700);
  loadImages();
  startScreenSetup();
}

void draw() {
  switch(currentScreen) {
    case "startScreen":
      startScreenDraw();
      break;
    case "walkToOffice":
      setBackground();
      break;
    case "NewsPaper":
      introNewsPaperScreenDraw();
      break;
    case "messages1":
      textMessages();
      break;
    case "herding":
      herdingScreenDraw();
      break;
    case "messages2":
      changeScreens();
      break;
    case "pipeline":
      pipeScreenDraw();
      break;
    case "messages3":
      changeScreens();
      break;
    case "tower":
      ctScreenDraw();
      break;
    case "talking":
      changeScreens();
      break;
    case "final":
      drawFinalWalk();
      break;
  }
}
