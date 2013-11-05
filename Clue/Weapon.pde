class Weapon{
  PImage icon;
  int x,y;
  int code;
  String name;
  Weapon(int x, int y, int code){
    this.x=x;
    this.y=y;
    this.code = code;
    setName(code);
    icon = loadImage(code+".png");
  }
  
  Weapon(int x, int y){
    this.x=x;
    this.y=y;
  }
  //GET-SET FUNCTIONS
  void setName(int n){
    if(n==0) this.name = "Leadpipe";
    if(n==1) this.name = "Rope";
    if(n==2) this.name = "Revolver";
    if(n==3) this.name = "Knife";
    if(n==4) this.name = "Wrench";
    if(n==5) this.name = "Candlestick";
  }
  String getName(){
    return this.name;
  }
  
  int getCode(){
    return this.code;
  }
  void display(){
    image(icon,x,y);
  }
}
