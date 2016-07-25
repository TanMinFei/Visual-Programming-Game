import ddf.minim.*;
Minim minim;
AudioPlayer song;
PFont Font;
float x=400;                                                 //6 changed the position of the picture1
float y=400;
float w=100;
float h=100;
boolean menu = true;
int s=0;
int m=0;
int score;
int displayScore;
 
void setup() {
  size(800,800);
  background(50,70,60);
  minim = new Minim(this);
  Font = createFont("LithosPro-Black",40);
  textFont(Font);
  
}
void draw() {
    
if(menu == true){                                                             //1 added menu before game start
  
      
    
      PImage img;                                                             // added menu image
      img = loadImage("bloodywall.jpg"); 
      smooth();
      background(img);                                                       //2 image is the background     
      
      song = minim.loadFile("Menu game soundtrack.mp3");                                                            
      song.play();
      
      fill(0);                                                                //creating three menu selection
      strokeWeight(2);                                                         
      stroke(255,0,0);                          
      rect(225,180,350,100);                                                 
      rect(225,300,350,100);                                                  
      rect(225,420,350,100);
      
      
      textAlign(CENTER);                                                    //3 menu text
      textSize(40);                                                           
      fill(0,102,153);                                                      //blue color text
      text("START GAME",400,250);
      text("INSTRUCTIONS",400,365);
      text("EXIT",400,490);   
      
      stroke(255,0,0);                                                      //menu mouse
      fill(255,0,0);                                                        
      rect(mouseX,mouseY+20,2,10); 
      rect(mouseX,mouseY-25,2,10);
      rect(mouseX-25,mouseY,10,2);
      rect(mouseX+20,mouseY,10,2);
      
      
      
    if(mousePressed  && (mouseButton == LEFT) && (mouseX>255 && mouseX<575 && mouseY>180 && mouseY<280)){                  //proceeding to game
       menu = false;
       m = 0;
       score = 0;
       displayScore = 0;
      
      
    }
    else if(mousePressed  && (mouseButton == LEFT) && (mouseX>255 && mouseX<575 && mouseY>300 && mouseY<400)){
      
          background(0);                                               //Instruction menu
          fill(255,0,0);         
          textSize(80);
          text("HOLD TO READ",400,200);          
          textSize(30);
          text("EACH CLICK ON THE TARGET = 1 POINT",400,300);
          
    }
    else if(mousePressed  && (mouseButton == LEFT) && (mouseX>255 && mouseX<575 && mouseY>420 && mouseY<520)){
      exit();
      
    }
    }
  
   if(menu == false){  
     
     String time = m+":"+s;                                              //7 timer
  
     PImage img;                                                         //IN-game background (after clicking)
     img = loadImage("bloodybg.jpg"); 
     smooth();
     background(img); 
     
     textAlign(CENTER);                                                 //setting of timer
     textSize(70);
     if(s<=59){
       text(time,700,60);
       s=s+5;
     }
     else{
       m = m +1;
       s = 0;
       text(time,700,60);
     }
       if(m == 10){
       text(time,700,60);
       m = 10;
       s = 0;
     }
       
 
 if(m != 10){
   if (mousePressed && (mouseButton == LEFT) && (mouseX >300 && mouseX <450 && mouseY >350 && mouseY <450)){      //4 changed the position of mouseclicking 
  
       score = score + 1;                                                                     //8 added score (each click +0.6)      
       displayScore = score ;
       text(displayScore,40,60);
         
       song = minim.loadFile("AWP Shoot Sound Effect CS-GO.mp3");                             //sound after clicking                                                        
       song.play(2);
 
      
       noStroke();                                                                            //the "face" object (AFTER clicking)
       fill(255,0,0);
       ellipse(400,400,100,100);                                                             //5 changed the position of the picture2 
   
       fill(255,0,0);
       ellipse(434,372,30,30);   
       ellipse(460,400,13,14);
       
       fill(0);
       stroke(0);
       strokeWeight(5);
       line(370,375,390,400);                                             //left "\"
       line(390,375,370,400);                                             //left "/"
       line(410,375,430,400);                                             //right "\"
       line(430,375,410,400);                                             //right "/"
 
       stroke(255,0,0);                                                  //IN-game mouse 
       fill(255,0,0);
       rect(mouseX-25,mouseY,10,2);
       rect(mouseX+20,mouseY,10,2);
       rect(mouseX,mouseY-25,2,10);
       rect(mouseX,mouseY+20,2,10);
   } 
   else {
    
    background(255);                                                     //In-game background
    textAlign(CENTER);                                                   //setting of timer
    textSize(70);
    text(displayScore,40,60);  
     if(s<=59){
       text(time,700,60);
       s=s+5;
     }
     else{
       m = m+1;
       s = 0;
       text(time,700,60);
     }
       if(m == 10){
       text(time,700,60);
       m = 10;
       s = 0;
     } 
 
     
    noStroke();                                                    //the "face" object (BEFORE)
    fill(0,200,150);
    ellipse(x,y,w,h);
    
    fill(0);                                                       //the eye of the object
    ellipse(380,385,10,10);                                        //left eye
    ellipse(420,385,10,10);                                        //right eye                                            
    
    stroke(255,0,0);                                               //IN-game mouse (after clicking)
    fill(255,0,0);
    rect(mouseX-20,mouseY,10,2);
    rect(mouseX+15,mouseY,10,2);
    rect(mouseX,mouseY-20,2,10);
    rect(mouseX,mouseY+15,2,10);
  }
   }
 
 else if(m == 10){
          textSize(150);                                                        //9 FINAL SCORE
          text(displayScore,400,400);
          textSize(70);
          text("YOUR SCORE :",400,150);
          
          textSize(55);                                                         //10 re-enter the game
          text("AGAIN", 400,500);
          text("Main Menu",400,600);                                            //11 back to main menu 
          
     stroke(255,0,0);                                                          //end page mouse
     fill(255,0,0);
     rect(mouseX-25,mouseY,10,2);
     rect(mouseX+20,mouseY,10,2);
     rect(mouseX,mouseY-25,2,10);
     rect(mouseX,mouseY+20,2,10);
     
    
    
    if(mouseX >300 && mouseX < 480 && mouseY > 450 && mouseY < 500){                            //end page
        
         fill(#335EB9);                                    //blue color (AGAIN)        
        
        if(mousePressed && (mouseButton == LEFT) && (mouseX>300 && mouseX<480 && mouseY>450 && mouseY<500)){
          m = 0 ;
          score = 0;
          displayScore = 0;
        }
    }
    else if(mouseX>250 && mouseX<690 && mouseY>570 && mouseY<600){
         fill(#FBFF1A);                                   //yellow (MAIN MENU)
      
        if(mousePressed && (mouseButton == LEFT) && (mouseX>250 && mouseX<690 && mouseY>570 && mouseY<600)){
          menu = true;
        }
       
    }
    
          
 }  
   }
    
   }