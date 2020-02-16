PImage calgary;
PImage office;
PImage ground;
PImage platformGround;
PImage HQ;
PImage cityHall;
PImage pipe;
PImage smallPipe;
PImage emptyPipe;
PImage bus;

SoundFile calm;
SoundFile bezos;
SoundFile zen;
SoundFile pipeBoi;

int x = 0;
float cowX = 400;
float cowY = 400;
Animation cowRight, cowLeft, cowIdleLeft,cowIdleRight;

String cowState = "idleRight";
int speed = 0;
int jumpSpeed = 0;

void loadImages() {
  calgary = loadImage("CalgaryBackdrop.png");
  office = loadImage("OfficeMap.png");
  office.resize(900,700);
  ground = loadImage("Ground.png");
  platformGround = loadImage("Ground.png");
  platformGround.resize(20,20);
  HQ = loadImage("AmazonHQ.png");
  cityHall = loadImage("cityHall.png");
  cityHall.resize(500,450);
  bus = loadImage("CalgaryTransitBus.png");
  bus.resize(400,100);
  pipe = loadImage("Pipe.png");
  pipe.resize(120,90);
  smallPipe = loadImage("Pipe.png");
  smallPipe.resize(60,40);
  emptyPipe = loadImage("PipeEmpty.png");
  emptyPipe.resize(60,40);
  cowRight = new Animation("right_", 10);
  cowLeft = new Animation("left_", 10);
  cowIdleRight = new Animation("idle_",5);
  cowIdleLeft = new Animation("leftIdle_",5);
  
  calm = new SoundFile(this, "Retroland_Recital.wav"); 
  bezos = new SoundFile(this, "Conferring_with_an_Old_Master.wav"); 
  zen = new SoundFile(this, "Digital_Zen.wav"); 
  pipeBoi = new SoundFile(this, "All_Time_High_Jump.wav"); 

  calm.loop();
}

void stopSounds(){
  calm.stop();
  bezos.stop();
  zen.stop();
  pipeBoi.stop();
}

void setBackground() {
  background(255);
  image(calgary, -x/2, 0);
  image(calgary, -x/2+1000, 0);
  for (int i = 0; i<=6; i++){
    image(ground, -2*x+400*i, 570);
  }
  image(cityHall, -2*x+1200, 130);
  
  if(x>=0 && speed<0){
    x+=speed;
  }else if(x<1000 && speed>0){
    x+=speed;
  }
  drawCow(false);
  if(x>500){
   fade(); 
  }
  
  //if(x>600){
  // busDriveOn(); 
  // drawCow(true);
  //}else{
  //drawCow(false);
  //}
}

boolean onPlatform(){
  boolean onPlatform = false;
    for(int i = 0; i<platforms.length; i+=2){
      if(cowX>platforms[i]-100 && cowX<platforms[i]+170 && cowY < platforms[i+1]-90 && cowY > platforms[i+1]-110 && currentScreen == "pipeline"){
      onPlatform = true;
      pickedUpPipes[i/2] = true;
      }
    }
    if(cowY>470){
      onPlatform = true;
    }
  return onPlatform;
}

void drawCow(boolean moves){
  if(moves){
    if((cowX>0 && speed<0) || (cowX<width-110 && speed>0)){
      cowX+=speed*2;
    }
    cowY-=jumpSpeed;
    
    if(!onPlatform()){
      jumpSpeed-=1;
    }else{
      jumpSpeed = 0; 
    }
  
  }else{
   cowX = 400;
   cowY = 470;
  }
  
  switch(cowState) {
    case "right":
      cowRight.display(cowX, cowY, 0.3);
      break;
    case "left":
      cowLeft.display(cowX, cowY, 0.3);
      break;
    case "idleLeft":
      cowIdleLeft.display(cowX, cowY, 0.15);
      break;
    case "idleRight":
      cowIdleRight.display(cowX, cowY, 0.15);
      break;
    default:

  }
}

void resetCow(){
  cowX = 400;
}

void keyPressed() {
  stateCounter++;
  btnPressed = true;
  if(currentScreen == "startScreen" && keyCode == ENTER){
    started = true;
  }
  switch(keyCode) {    case RIGHT:
      speed = 1;
      btnState = "right";
      cowState = "right";
      herdingBtnState = "right";
      break;
    case LEFT:
      speed = -1;
      btnState = "left";
      cowState="left";
      herdingBtnState = "left";
      break;
    case UP:
      herdingBtnState = "up";
      selectState = "up";
      selection-=1;
      if(onPlatform()){
        jumpSpeed=15;
      }
      break;
    case DOWN:
      selection+=1;
      herdingBtnState = "down";
      selectState = "down";
      break;
    case ENTER:
      jezosStateCounter+=1;
  }
}


void keyReleased() {
  btnPressed = false;
  if(keyCode!=38){
    speed=0;
    if(cowState=="right"){
          cowState="idleRight";
    }else if(cowState=="left"){
          cowState="idleLeft";
    }
  }
}
