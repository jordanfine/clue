class Menu{
  PImage mimage = loadImage("menu.png");
  Person s = new Person(175,300,"scarlett");
  Person g = new Person(250,300,"green");
  Person m = new Person(325,300,"mustard");
  Person w = new Person(400,300,"white");
  Person p = new Person(475,300, "plum");
  Person c = new Person(550,300,"peacock");
  int x, y;
  PFont f;
  
  Menu(int x, int y, PFont f){
    this.x=x;
    this.y=y;
    this.f=f;
  }
  
  void startGame(){
  
  }
  //START SCREEN
  void display(){
    background(0);
    imageMode(CENTER);
    image(mimage,x,y);
    fill(0);
    textAlign(CENTER);
    textFont(f,48);
    if(mouseX>=286 && mouseX<=459 && mouseY>=310 && mouseY <=353 ){
      fill(255,0,0);
      text("START", width/2,height/2+100);
    } else {
      fill(0);
      text("START", width/2,height/2+100);
    }
    if(mouseX>=310 && mouseX<=435 && mouseY>=409 && mouseY <=451 ){
      fill(255,0,0);
      text("QUIT", width/2,height/2+200);
    } else {
      fill(0);
      text("QUIT", width/2,height/2+200);
    }
    
  }
  //CHOOSE A CHARACTER SCREEN
  void chooseCharacter(){
    background(0);
    fill(255);
    textAlign(CENTER);
    rectMode(CENTER);
    textFont(f,48);
    text("CHOOSE A CHARACTER", width/2,100);
    if(mouseX>=150 && mouseX<=200 && mouseY>=265 && mouseY<=340){
      fill(200);
      rect(175,300,50,75);
      fill(255,0,0);
      textFont(f,36);
      text("MISS SCARLETT",width/2,175);
    }
    if(mouseX>=225 && mouseX<=275 && mouseY>=265 && mouseY<=340){
      fill(200);
      rect(250,300,50,75);
      fill(0,255,0);
      textFont(f,36);
      text("MR.GREEN",width/2,175);
    }
    if(mouseX>=300 && mouseX<=350 && mouseY>=265 && mouseY<=340){
      fill(200);
      rect(325,300,50,75);
      fill(243,207,8);
      textFont(f,36);
      text("COLONEL MUSTARD",width/2,175);
    }
    if(mouseX>=375 && mouseX<=425 && mouseY>=265 && mouseY<=340){
      fill(200);
      rect(400,300,50,75);
      fill(220);
      textFont(f,36);
      text("MRS.WHITE",width/2,175);
    }
    if(mouseX>=450 && mouseX<=500 && mouseY>=265 && mouseY<=340){
      fill(200);
      rect(475,300,50,75);
      fill(131,23,193);
      textFont(f,36);
      text("PROFESSOR PLUM",width/2,175);
    }
    if(mouseX>=525 && mouseX<=575 && mouseY>=265 && mouseY<=340){
      fill(200);
      rect(550,300,50,75);
      fill(69,43,205);
      textFont(f,36);
      text("MRS.PEACOCK",width/2,175);
    }
    s.display();
    g.display();
    m.display();
    w.display();
    p.display();
    c.display();
  }
  //CHOOSE A DIFFICULY SCREEN
  void difficulty(){
   background(0);
    imageMode(CENTER);
    image(mimage,x,y);
    fill(0);
    textAlign(CENTER);
    textFont(f,48);
    if(mouseX>=286 && mouseX<=459 && mouseY>=310 && mouseY <=353 ){
      fill(255,0,0);
      text("EASY", width/2,height/2+100);
    } else {
      fill(0);
      text("EASY", width/2,height/2+100);
    }
    if(mouseX>=310 && mouseX<=435 && mouseY>=409 && mouseY <=451 ){
      fill(255,0,0);
      text("HARD", width/2,height/2+200);
    } else {
      fill(0);
      text("HARD", width/2,height/2+200);
    }
  
  }

}
