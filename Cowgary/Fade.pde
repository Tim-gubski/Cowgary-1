int fadeWidth = 0;
int fadeSpeed = 10;
boolean fade(){
  fill(0);
  rect(0,0,fadeWidth,height);
  if(fadeWidth<width){
    fadeWidth+=fadeSpeed;
    fadeSpeed+=2;
    fill(255);
    return false;
  }else{
   return true; 
  }

}

void resetFade(){
  int fadeWidth = 0;
  int fadeSpeed = 10;
}


boolean unFade(){
  fill(0);
  rect(0,0,width-fadeWidth,height);
  if(fadeWidth<width){
    fadeWidth+=fadeSpeed;
    fadeSpeed+=2;
    return false;
  }else{
   return true;
  }
}