class Person{
//DIFFERENT ICONS FOR WALK CYCLE
PImage icon,iconu, iconl1,iconl2, iconr1,iconr2;
int x,y;
String name;
int current=0;
boolean feet=false;
int currentLoc = 0;
String fname;
Card c1,c2,c3;
int code;
Card currentCard;
Person(int x, int y, String s){
  this.x=x;
  this.y=y;
  this.name=s;
  setFormalName(s);
  setCode(s);
  icon = loadImage(name+"-down.png");
  iconu = loadImage(name+"-up.png");
  iconl1 = loadImage(name+"-left-1.png");
  iconl2 = loadImage(name+"-left-2.png");
  iconr1 = loadImage(name+"-right-1.png");
  iconr2 = loadImage(name+"-right-2.png");

}

Person(int x, int y){
  this.x=x;
  this.y=y;
}

//GET CURRENT CARD THAT THE OPPONENT SHOWED YOU
void setCurrentCard(Card c){
  this.currentCard = c;
}

Card getCurrentCard(){
  return this.currentCard;
}

void setPlayer(String s){
  this.name=s;
  setFormalName(s);
  setCode(s);
  icon = loadImage(name+"-down.png");
  iconu = loadImage(name+"-up.png");
  iconl1 = loadImage(name+"-left-1.png");
  iconl2 = loadImage(name+"-left-2.png");
  iconr1 = loadImage(name+"-right-1.png");
  iconr2 = loadImage(name+"-right-2.png");
}
String getPlayer(){
  return this.name;
}
Card getc1(){
  return this.c1;
}
void setc1(int w){
  this.c1= new Card(w);
}
Card getc2(){
  return this.c2;
}
void setc2(int r){
  this.c2 = new Card(r);
}
Card getc3(){
  return this.c3;
}
void setc3(int p){
  this.c3 = new Card(p);
}

String getFormalName(){
  return this.fname;
}

void setFormalName(String s){
  if(s =="green") this.fname = "Mr. Green";
  if(s =="white") this.fname = "Mrs. White";
  if(s =="scarlett") this.fname = "Miss Scarlett";
  if(s =="plum") this.fname = "Professor Plum";
  if(s =="mustard") this.fname = "Colonel Mustard";
  if(s =="peacock") this.fname = "Mrs. Peacock";
}

void setCode(String s){
  if(s =="green") this.code = 15;
  if(s =="white") this.code = 20;
  if(s =="scarlett") this.code = 19;
  if(s =="plum") this.code = 18;
  if(s =="mustard") this.code = 16;
  if(s =="peacock") this.code = 17;
}

int getCode(){
  return this.code;
}

void display()
{
    imageMode(CENTER);
    if(current==1) image(iconl1,x,y);
    if(current==2) image(iconl2,x,y);
    if(current==3) image(iconu,x,y);
    if(current==4) image(icon,x,y);
    if(current==5) image(iconr1,x,y);
    if(current==6) image(iconr2,x,y);
    if(current==0) image(icon,x,y);
}

void setName(String s){
  this.name = s;
  icon = loadImage(name+"-down.png");
  iconu = loadImage(name+"-up.png");
  iconl1 = loadImage(name+"-left-1.png");
  iconl2 = loadImage(name+"-left-2.png");
  iconr1 = loadImage(name+"-right-1.png");
  iconr2 = loadImage(name+"-right-2.png");
}

//CURRENT LOCATION
void setCurrentLoc(int c){
  this.currentLoc = c;
}

//direction:left or right| foot: left or right
void walk(int direction){
  if(currentLoc ==0){
  //1 : left
      //TRUE FOOT: 1 / FALSE FOOT: 2
      if(direction==1){
        if(feet){
          image(iconl1,x-=8,y);
          current=1;
          feet = !feet;
        }
        else{
          image(iconl2,x-=8,y);
          current=2;
          feet = !feet;
        }
      }
      //2 : Right
      if(direction==2){
        if(feet){
          image(iconr1,x+=8,y);
          current=5;
          feet = !feet;
        }
        else{
          image(iconr2,x+=8,y);
          current=6;
          feet= !feet;
        }
      }
      //3:up
      if(direction==3 ){
          image(iconu,x,y-=8);
          current=3;
      }
      //4:down
      if(direction==4 ){
          image(icon,x,y+=8);
          current=4;
      }
    }
  }

}
