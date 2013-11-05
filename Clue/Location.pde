class Location{
  PImage img;
  PFont f; 
  int x, y;
  String name, formalName;
  int code;
  Location(int x, int y, PFont f,int code){
    this.x=x;
    this.y=y;
    this.f=f;
    this.code = code;
    setName(code);
    setFormalName(code);
    //IGNORE 10, BECAUSE OF HALL CLASS
    if(code !=10) this.img = loadImage(this.name+".png");
  }
  
  Location(int x, int y, int code){
    this.x=x;
    this.y=y;
    this.code = code;
    setName(code);
    setFormalName(code);
    this.img = loadImage(this.name+".png");
  }
  
  void display(){
    image(img,x,y);
  }
  
  //MAKES TINY DISPLAY
  void displayTiny(){
    image(img,x,y,75,75);
  }
  
  //GET-SET FUNCTIONS
  void setName(int n){
    if(n == 6)  this.name = "library";
    if(n == 7)  this.name = "kitchen";
    if(n == 8)  this.name = "conservatory";
    if(n == 9)  this.name = "lounge";
    if(n == 10)  this.name = "hall";
    if(n == 11)  this.name = "study";
    if(n == 12)  this.name = "billards";
    if(n == 13)  this.name = "ballroom";
    if(n == 14)  this.name = "dining";
    if(n==15) this.name ="hallway";
    if(n==16) this.name ="upstairs";
  }
  
  void setFormalName(int n){
    if(n == 6)  this.formalName = "Library";
    if(n == 7)  this.formalName = "Kitchen";
    if(n == 8)  this.formalName = "Conservatory";
    if(n == 9)  this.formalName = "Lounge";
    if(n == 10)  this.formalName = "Hall";
    if(n == 11)  this.formalName = "Study";
    if(n == 12)  this.formalName = "Billards Room";
    if(n == 13)  this.formalName = "Ballroom";
    if(n == 14)  this.formalName = "Dining Room";
  }
  
  String getFormalName(){
    return this.formalName;
  }
  
  int getCode(){
    return this.code;
  }
}
