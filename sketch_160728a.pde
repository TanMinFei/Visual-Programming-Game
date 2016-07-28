int dragX, dragY,moveX,moveY;
float x;
float y;
float easing = 0.15;
float sizeX = 66;
float sizeY = 66;
float place = 400;
boolean restart = false;

void middle1(){   
  rectMode(CENTER);                                     //using center to determine the x and y                  
  rect(place, place, sizeX, sizeY);                     //middle shape
}
void changeColor(){
    if (mouseButton == LEFT && (mouseX>place - sizeX && mouseX< place + sizeX && mouseY> place - sizeY && mouseY< place + sizeY)) {             //changing the color
    fill(0); // Black
    cursor(HAND);
  } else if (mouseButton == RIGHT) {
    fill(255);
    cursor(ARROW);
  } else { 
    fill(255); // Gray
  }
}
void changeSize() {
  if (keyPressed == true ){                //adding the size
    if ((key == 's') || (key == 'S')) {
    sizeX = sizeX - 10;
    sizeY = sizeY - 10;
  }
   else if (sizeX < 900 && sizeY < 900){
    sizeX = sizeX+10;
    sizeY = sizeY+10;
  }
    else{
      sizeX = 55;
      sizeY = 55;    
  } 
} 
}

void changePlace(){
  if (key == CODED) { 
    if (keyCode == UP) {
      place = place + 20;
      sizeX = 66;
      sizeY = 66;
    } else if (keyCode == DOWN) {
      place = place - 20;
      sizeX = 66;
      sizeY = 66;
    }
  } else {
    place = 400;
    place = 400;
  }

}
void setup() {
  size(800, 800); 
  noStroke();  
}

void draw() { 
  background(51);
  
  float targetX = mouseX;
  float dx = targetX - x;
  x += dx * easing;
  
  float targetY = mouseY;
  float dy = targetY - y;
  y += dy * easing;
  
  ellipse(x, y, 33, 33);                    //mousePointer
  
  middle1();                              //shape in the middle
  changeColor();
  changeSize();
  changePlace();
  
  if (restart){
   redraw();
  }
  
}