PImage[] texts = new PImage[9];
int currentText = 0;
int frame;

void setupTextMessages(){
  resetFade();
  frame = 0;
  for(int i = 1; i<=9; i++){
    String fileName = "PhoneTexts_Frame" + str(i) + ".png";
    texts[i-1] = loadImage(fileName);
    texts[i-1].resize(600,600);
  }
}

void textMessages(){
  frame++;
  image(office,0,0);
    if(frame>200){
    if(frame % 120 == 0 && currentText<texts.length-1){
     currentText++; 
    }
    image(texts[currentText],160,50); 
    if(frame>1300){
      fade();
    }
  }

}
