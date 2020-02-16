class Programmer {
  int xCoordinate;
  int yCoordinate;
  int imageWidth;
  int imageHeight;
  String file;
  int iconX;
  int iconY;
  
  PImage image;
  boolean collision;
  
  Programmer(int x, int y, int iWidth, int iHeight, String file, int iX, int iY) {
    this.xCoordinate = x;
    this.yCoordinate = y;
    this.imageWidth = iWidth;
    this.imageHeight = iHeight;
    this.file = file;
    this.iconX = iX;
    this.iconY = iY;
    
    this.image = loadImage(file);
    this.image.resize(45, 50);
    
    this.collision = false;
  }
  
  void checkAllCollisions(int busX, int busY, int busWidth, int busHeight) {
    boolean leftForwardCollision = this.checkCollision(busX + busHeight, busY);
    boolean leftBackwardCollision = this.checkCollision(busX, busY);  
    boolean leftUpwardCollision = this.checkCollision(busX, busY);
    boolean leftDownwardCollision = this.checkCollision(busX, busY + busHeight);
    boolean leftCollision = leftForwardCollision || leftBackwardCollision || leftUpwardCollision || leftDownwardCollision;
    
    boolean rightForwardCollision = this.checkCollision(busX + busHeight, busY + busWidth);
    boolean rightBackwardCollision = this.checkCollision(busX, busY + busWidth);  
    boolean rightUpwardCollision = this.checkCollision(busX + busWidth, busY);
    boolean rightDownwardCollision = this.checkCollision(busX + busWidth, busY + busHeight);
    boolean rightCollision = rightForwardCollision || rightBackwardCollision || rightUpwardCollision || rightDownwardCollision;
    
    this.collision = leftCollision || rightCollision;
  }
  
  boolean checkCollision(int busX, int busY) {
    boolean xCollision = busX >= xCoordinate && busX <= (xCoordinate + imageWidth);
    boolean yCollision = busY >= yCoordinate && busY <= (yCoordinate + imageHeight);
    
    if (xCollision && yCollision)  {
      return true;
    }
    return false;
  }
}
