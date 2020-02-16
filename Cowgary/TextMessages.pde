PImage[] texts;
int currentText = 0;
int frame;

void setupTextMessages(String preFix,int num){
  texts = new PImage[num];
  resetFade();
  frame = 0;
  for(int i = 1; i<=num; i++){
    String fileName = preFix + str(i) + ".png";
    texts[i-1] = loadImage(fileName);
    texts[i-1].resize(600,600);
  }
  stopSounds();
  bezos.loop();
  stateCounter = 0;
}

void textMessages(){
  frame++;
  image(office,0,0);
    if(currentText<texts.length-1){
     currentText=stateCounter; 
    }
    image(texts[currentText],160,50); 
    if(stateCounter>currentText){
      fade();
    }

}
