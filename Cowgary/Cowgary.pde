import processing.sound.*; 
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
      textMessages();
      break;
    case "pipeline":
      pipeScreenDraw();
      break;
    case "messages3":
      textMessages();
      break;
    case "tower":
      ctScreenDraw();
      break;
    case "messages4":
      textMessages();
      break;
    case "talking":
      convinceJezosScreenDraw();
      break;
    case "final":
      drawFinalWalk();
      break;
    case "credits":
      endingScreenDraw();
      break;
  }
}
