int[] platforms = new int[] {100,480,300,380,100,280,500,280};
float pipeBob = 0;
float pipeBobChange = 0.3;
boolean[] pickedUpPipes = new boolean[platforms.length/2];


void pipeScreenSetup() {
  startScreenBg = loadImage("PipelineBackground1.png");
  groundImg = loadImage("Ground.png");
  resetFade();
  stopSounds();
  pipeBoi.loop();
  
  questDialogueBox = loadImage("dialog_box.png");
  questDialogueBox.resize(750, 250);
  questInfoDismissed = false;
  btnPressed = false;
  font = createFont("munro.ttf", 40);
}

void pipeScreenDraw() {
  boolean allPicked = true;
  image(startScreenBg, 0,0);
  startScreenBg.resize(900, 700);
  image(groundImg, 0, 570);
  image(groundImg, 400, 570);  
  pipeBob += pipeBobChange;
if(abs(pipeBob)>4){
    pipeBobChange*=-1;
  }
  for(int i = 0; i<platforms.length; i+=2){
    //rect(platforms[i],platforms[i+1],200,20);
    for(int v = 0; v<10;v++){
      image(platformGround, platforms[i]+v*20,platforms[i+1]);
      noFill();
      stroke(0);
      rect(platforms[i]+v*20, platforms[i+1], 20, 20);
    }
    
    //Icon Pipes
    if(pickedUpPipes[i/2] == true){
      image(smallPipe, width-60-i*30, 20);
    }else{
      image(emptyPipe, width-60-i*30, 20);
      allPicked = false;
    }
    
    if(pickedUpPipes[i/2] != true){
      image(pipe, platforms[i]+40, platforms[i+1]-80+pipeBob);
    }
  }
  drawCow(true);
  
  if(allPicked){
   busDriveOn();
  }
  
   if (!questInfoDismissed) {
    if (!btnPressed) {
      image(questDialogueBox, 75, 200);
      textFont(font, 40);
      fill(255, 255, 255);
    text("Build pipeline (0/4 pipes collected)", 120, 275);
      text("Use the arrow keys to drive.", 120, 325);
      text("Press any key to begin.", 120, 375);
    }
    else {
      questInfoDismissed = true;
    }
  }
  
}
