int busFrame = 0;
int busX = -400;
boolean driveIn = true;
boolean driveAway = false;

void busReset(){
  busFrame = 0;
  busX = -400;
  driveIn = true;
  driveAway = false;
}

void busDriveOn(){
  busFrame++;
  if(driveIn){
    busX+=2;
    resetFade();
  }
  if(busX>width-300){
    driveIn = false;
  }
  
  if(cowX>busX && !driveIn){
   driveAway = true; 
  }
  
  if(driveAway){
   cowX = 2000;
   busX+=2;
  }
  if(busX>width+50){
    fade();
  }
  
  image(bus, busX, 470);
}
