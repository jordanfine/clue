class Hall {
  PImage mimage = loadImage("hall.png");
  PImage dead = loadImage("dead.png");
  PImage envelope = loadImage("envelope.png");
  int x, y;
  AudioPlayer scream;
  PFont f; 
  Person s = new Person(400,400,"scarlett");
  Person g = new Person(300,250,"green");
  Person m = new Person(325,410,"mustard");
  Person w = new Person(500,400,"white");
  Person pl = new Person(475,300, "plum");
  Person c = new Person(600,300,"peacock");
  boolean kill=false, first =true, second =false,items=false, items2, hall=false;
  boolean easy;
  Hall(int x, int y, AudioPlayer s, PFont f){
    this.x=x;
    this.y=y;
    this.scream=s;
    this.f=f;
  }
  
  //DIFFERENT SWITCHES FOR DIFFERENT PARTS OF DIALOG IN THE BEGINNING
  void display(){
    background(0);
    imageMode(CENTER);
    if(first){
       image(mimage,x,y);
       s.display();
       g.display();
       m.display();
       w.display();
       pl.display();
       c.display();
       fill(69,43,205);
       textMode(CENTER);
       textFont(f,12);
       text("What a lovely night for a dinner party!\n(Press Enter to Continue)", width-250,height-50);
    }
    if(second){
       image(mimage,x,y);
       s.display();
       g.display();
       m.display();
       w.display();
       pl.display();
       c.display();
       fill(255,0,0);
       textMode(CENTER);
       textFont(f,12);
       text("This is a big house! It's giving me the creeps\n(Press Enter to Continue)", width-250,height-50);
    }
    if(kill){
       image(dead,x,y);
       s.display();
       g.display();
       m.display();
       w.display();
       pl.display();
       c.display();
       fill(0);
       textMode(CENTER);
       textFont(f,12);
       text("Oh my!\nWe must solve who did this!\n(Press Enter to Continue)", width-250,height-50);
       scream.play();
    }
    if(items){
       image(dead,x,y);
       image(envelope,438,365);
       fill(0);
       textMode(CENTER);
       textFont(f,12);
       text("Collect your clues!", width-250,height-50);
       scream.play();
    }
    if(hall){
       image(dead,x,y);
    }
  }

}
