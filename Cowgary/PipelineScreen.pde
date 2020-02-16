int[] platforms = new int[] {100,480,300,380,100,280,500,280};
float pipeBob = 0;
float pipeBobChange = 0.3;
boolean[] pickedUpPipes = new boolean[platforms.length/2];

void pipeScreenSetup() {
  startScreenBg = loadImage("CalgaryBackdrop.png");
  groundImg = loadImage("Ground.png");
}

void pipeScreenDraw() {
  image(startScreenBg, 0,0);
  image(groundImg, 0, 570);
  image(groundImg, 400, 570);  
  pipeBob += pipeBobChange;
  if(abs(pipeBob)>4){
    pipeBobChange*=-1;
  }
  for(int i = 0; i<platforms.length; i+=2){
    rect(platforms[i],platforms[i+1],200,20);
    
    //Icon Pipes
    if(pickedUpPipes[i/2] == true){
      image(smallPipe, width-60-i*30, 20);
    }else{
      image(emptyPipe, width-60-i*30, 20);
    }
    
    if(pickedUpPipes[i/2] != true){
      image(pipe, platforms[i]+40, platforms[i+1]-80+pipeBob);
    }
  }
  
  
  drawCow(true);
}
