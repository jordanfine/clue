class Card{
//CODE AND NAME OF EACH CLUE CARD
String name;
int code;
Card(int x){
  this.code=x;
  if(x==0){
    this.name ="Leadpipe";
  }
  if(x==1){
    this.name ="Rope";
  }
  if(x==2){
    this.name ="Revolver";
  }
  if(x==3){
    this.name ="Knife";
  }
  if(x==4){
    this.name ="Wrench";
  }
  if(x==5){
    this.name ="Candlestick";
  }
  if(x==6){
    this.name ="Library";
  }
  if(x==7){
    this.name ="Kitchen";
  }
  if(x==8){
    this.name ="Conservatory";
  }
  if(x==9){
    this.name ="Lounge";
  }
  if(x==10){
    this.name ="Hall";
  }
  if(x==11){
    this.name ="Study";
  }
  if(x==12){
    this.name ="Billards Room";
  }
  if(x==13){
    this.name ="Ballroom";
  }
  if(x==14){
    this.name ="Dining Room";
  }
  if(x==15){
    this.name ="Mr. Green";
  }
  if(x==16){
    this.name ="Colonel Mustard";
  }
  if(x==17){
    this.name ="Mrs. Peacock";
  }
  if(x==18){
    this.name ="Professor Plum";
  }
  if(x==19){
    this.name ="Miss Scarlett";
  }
  if(x==20){
    this.name ="Mrs.White";
  }
}

String getName(){
  return this.name;
}

int getCode(){
  return this.code;
}




}
