void drawFinalWalk(){
  background(255);
  image(calgary, -x/2, 0);
  image(calgary, -x/2+1000, 0);
  for (int i = 0; i<=6; i++){
    image(ground, -2*x+400*i, 570);
  }
  image(HQ, -2*x+1200, 130);
  
  if(x>=0 && speed<0){
    x+=speed;
  }else if(x<1000 && speed>0){
    x+=speed;
  }
  drawCow(false);
  if(x>500){
   fade(); 
  }
}
