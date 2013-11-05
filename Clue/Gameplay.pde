class Gameplay{
PFont f;
Person user; 
Person[] opponents = new Person[5];
Weapon[] weaponsArray = new Weapon[6];
Location[] locations = new Location[9];
int[] cards = new int[21];
int weapon, room, killer;
Card wCard, rCard, kCard;
PImage[] cardImages = new PImage[21];
String[] characters = {"green","scarlett","mustard","white","plum", "peacock"};
String message = "";
int sc,sw,sl; 

int result;
Gameplay(Person p, PFont f){
  this.f=f;
  //choose random weapon
  this.weapon = (int)random(0,5);
  this.room = (int)random(5,14);
  this.killer = (int)random(15,20);
  wCard = new Card(weapon);
  rCard = new Card(room);
  kCard = new Card(killer);
  //System.out.println("THE WEAPON: " + wCard.getName());
  //System.out.println("THE ROOM: " + rCard.getName());
  //System.out.println("THE KILLER: " + kCard.getName());

  this.user = p;
  divideCards();
  for(int i=0;i<21;i++){
    cardImages[i]=loadImage(i+".png");
  }
  for(int i=0, x=325; i<weaponsArray.length;i++){
    weaponsArray[i] = new Weapon(x,300,i);
    x+=75;
  }
  for(int i=0, x=390; i<locations.length;i++){
    if(i == 3 || i==6) x=390;
    if(i<3) locations[i] = new Location(x,250,i+6);
    else if(i>=3 && i<6) locations[i] = new Location(x,350,i+6);
    else if(i>=6) locations[i] = new Location(x,450,i+6);
    x+=100;
  }
}

//THESE METHOD DIVIDES UP ALL THE CARDS AFTER TAKING OUT THE KILLER,WEAPON,AND ROOM. IT SHUFFLES AND SORTS THEM TO PLAYERS. 3 CARDS PER PLAYER
//NOTE: FOR EASY LEVEL, WE LET THE USER LOOK AT OPPONENT 1's CARDS
void divideCards(){
  for(int i=0, j=0;i<characters.length;i++){
    if(characters[i]==user.getPlayer()) continue;
    else{
      opponents[j]= new Person(0,0,characters[i]);
      j++;
    }
  }
  
  for (int i=0; i<cards.length; i++) {
      cards[i] = i;
  }

  for (int i=0; i<cards.length; i++) {
      int shuffle = (int)random(1,cards.length);
      int temp = cards[i];
      cards[i] = cards[shuffle];
      cards[shuffle] = temp;
  }

  for(int i=0,j=0;i<18 && j<cards.length;j++){
      if(cards[j]!= weapon && cards[j] != room && cards[j]!=killer){
        if(i<6){
          if(i==5){
            user.setc1(cards[j]);
          } else{
            opponents[i].setc1(cards[j]);
          }
        }else if(i>=6 && i<12){
          if(i==11){
              user.setc2(cards[j]);
          } else{
            opponents[i-6].setc2(cards[j]);
          }
        } else if(i>=12){
          if(i==17){
                user.setc3(cards[j]);
          } else{
            opponents[i-12].setc3(cards[j]);
          }
        }
        i++;
      } 
      else continue;
  }
  
  for(int i=0; i<opponents.length;i++){
    //System.out.println(opponents[i].getFormalName());
    //System.out.println("CARD1: " + opponents[i].getc1().name);
    //System.out.println("CARD2: "+ opponents[i].getc2().name);
    //System.out.println("CARD3: "+ opponents[i].getc3().name);
  }
  //System.out.println("USER CARD 1: "+user.getc1().name);
  //System.out.println("USER CARD 2: "+user.getc2().name);
  //System.out.println("USER CARD 3: "+user.getc3().name);

}

//THIS DISPLAYS YOUR CARDS
void display(){
  textAlign(CENTER);
  rectMode(CENTER);
  fill(0);
  rect(width-250,height/2,500,500);
  fill(255);
  textFont(f,32);
  text("YOUR CLUES:", width-250,100);
  textFont(f,12);
  text("(Mark down on clue sheet)", width-250,125);
  fill(200);
  rect(350,height/2, 110,160);
  rect(500,height/2, 110,160);
  rect(650,height/2, 110,160);
  imageMode(CENTER);
  image(cardImages[user.getc1().getCode()],350,height/2);
  image(cardImages[user.getc2().getCode()],500,height/2);
  image(cardImages[user.getc3().getCode()],650,height/2);
  fill(255);
  textFont(f,12);
  text(user.getc1().getName(), 350,height/2 + 95);
  text(user.getc2().getName(), 500,height/2 + 95);
  text(user.getc3().getName(), 650,height/2 + 95);
  
  textFont(f,24);
  if(mouseX>=386 && mouseX<=615 && mouseY>=380 && mouseY<=400) fill(255,0,0);
  else fill(255);
  text("BACK TO GAME >>", width-250,400);
  fill(255);
  textFont(f,12);
  text("PRESS 'A' TO MAKE AN ACCUSATION", width-250,450);
  text("PRESS 'S' TO MAKE A SUGGESTION", width-250,465);
}

//THIS METHOD PLACES A RANDOM CHARACTER IN THE ROOM, THE RANDOM CHARACTER HAS CARDS ASSOCIATED WITH IT
void randomCharacter(int n, int x, int y){
  image(opponents[n].icon,x,y);
  textFont(f,12);
  //text("Press 'S' to make a suggestion ",width-250,height-75);
  //text("Press 'A' to make an accusation ",width-250,height-50);
}

//DISPLAYS MESSAGE AFTER SUGGESTING
void displayMessage(){
  fill(225);
  rectMode(CENTER);
  rect(width-250,height-50,400,35);
  fill(0);
  text(message,width-250,height-50);
}
//DISPLAYS EXTRA CARDS FOR EASY LEVEL
void displayExtraClues(){
  textAlign(CENTER);
  rectMode(CENTER);
  fill(0);
  rect(width-250,height/2,500,500);
  fill(255);
  textFont(f,32);
  text("EXTRA CLUES:", width-250,100);
  textFont(f,12);
  text("(Mark down on clue sheet)", width-250,125);
  fill(200);
  rect(350,height/2, 110,160);
  rect(500,height/2, 110,160);
  rect(650,height/2, 110,160);
  imageMode(CENTER);
  image(cardImages[opponents[1].getc1().getCode()],350,height/2);
  image(cardImages[opponents[1].getc2().getCode()],500,height/2);
  image(cardImages[opponents[1].getc3().getCode()],650,height/2);
  fill(255);
  textFont(f,12);
  text(opponents[1].getc1().getName(), 350,height/2 + 95);
  text(opponents[1].getc2().getName(), 500,height/2 + 95);
  text(opponents[1].getc3().getName(), 650,height/2 + 95);
  
  textFont(f,24);
  if(mouseX>=386 && mouseX<=615 && mouseY>=380 && mouseY<=400) fill(255,0,0);
  else fill(255);
  text("BACK TO GAME >>", width-250,400);
  fill(255);
  textFont(f,12);
  text("PRESS 'A' TO MAKE AN ACCUSATION", width-250,450);
  text("PRESS 'S' TO MAKE A SUGGESTION", width-250,465);
}
//DISPLAY SCREENS TO GET SUGGESTION
//SET METHODS FOR SUGGESTIONS, SETS THE CARDS TO BE ASKED
void getSuggestionCharacter(){
  
  opponents[0].x = 325;
  opponents[0].y = 300;
  
  opponents[1].x = 400;
  opponents[1].y = 300;
  
  opponents[2].x = 475;
  opponents[2].y = 300;
  
  opponents[3].x = 550;
  opponents[3].y = 300;
  
  opponents[4].x = 625;
  opponents[4].y = 300;
  
  int tempX =user.x;
  int tempY =user.y;
  user.current = 0;
  user.x = 700;
  user.y = 300;
  
  background(0);
  fill(255);
  textAlign(CENTER);
  rectMode(CENTER);
  textFont(f,48);
  text("WHO DID IT?", width-250,100);
  if(mouseX>=300 && mouseX<=350 && mouseY>=265 && mouseY<=340){
    fill(200);
    rect(325,300,50,75);
    fill(255,0,0);
    textFont(f,36);
    text(opponents[0].getFormalName(),width-250,175);
  }
  if(mouseX>=375 && mouseX<=425 && mouseY>=265 && mouseY<=340){
    fill(200);
    rect(400,300,50,75);
    fill(255,0,0);
    textFont(f,36);
    text(opponents[1].getFormalName(),width-250,175);
  }
  if(mouseX>=450 && mouseX<=500 && mouseY>=265 && mouseY<=340){
    fill(200);
    rect(475,300,50,75);
    fill(255,0,0);
    textFont(f,36);
    text(opponents[2].getFormalName(),width-250,175);
  }
  if(mouseX>=525 && mouseX<=575 && mouseY>=265 && mouseY<=340){
    fill(200);
    rect(550,300,50,75);
    fill(255,0,0);
    textFont(f,36);
    text(opponents[3].getFormalName(),width-250,175);
  }
  if(mouseX>=600 && mouseX<=650 && mouseY>=265 && mouseY<=340){
    fill(200);
    rect(625,300,50,75);
    fill(255,0,0);
    textFont(f,36);
    text(opponents[4].getFormalName(),width-250,175);
  }
  if(mouseX>=675 && mouseX<=725 && mouseY>=265 && mouseY<=340){
    fill(200);
    rect(700,300,50,75);
    fill(255,0,0);
    textFont(f,36);
    text(user.getFormalName(),width-250,175);
  }
  opponents[0].display();
  opponents[1].display();
  opponents[2].display();
  opponents[3].display();
  opponents[4].display();
  user.display();
  user.x = tempX;
  user.y = tempY;
}

void setSuggestionCharacter(int n){
  this.sc = n;
}


void getSuggestionWeapon(){
  background(0);
  fill(255);
  textAlign(CENTER);
  rectMode(CENTER);
  textFont(f,48);
  text("WHAT WEAPON?", width-250,100);
  if(mouseX>=300 && mouseX<=350 && mouseY>=265 && mouseY<=340){
    fill(200);
    rect(325,300,75,100);
    fill(255,0,0);
    textFont(f,36);
    text(weaponsArray[0].getName(),width-250,175);
  }
  if(mouseX>=375 && mouseX<=425 && mouseY>=265 && mouseY<=340){
    fill(200);
    rect(400,300,75,100);
    fill(255,0,0);
    textFont(f,36);
    text(weaponsArray[1].getName(),width-250,175);
  }
  if(mouseX>=450 && mouseX<=500 && mouseY>=265 && mouseY<=340){
    fill(200);
    rect(475,300,75,100);
    fill(255,0,0);
    textFont(f,36);
    text(weaponsArray[2].getName(),width-250,175);
  }
  if(mouseX>=525 && mouseX<=575 && mouseY>=265 && mouseY<=340){
    fill(200);
    rect(550,300,75,100);
    fill(255,0,0);
    textFont(f,36);
    text(weaponsArray[3].getName(),width-250,175);
  }
  if(mouseX>=600 && mouseX<=650 && mouseY>=265 && mouseY<=340){
    fill(200);
    rect(625,300,75,100);
    fill(255,0,0);
    textFont(f,36);
    text(weaponsArray[4].getName(),width-250,175);
  }
  if(mouseX>=675 && mouseX<=725 && mouseY>=265 && mouseY<=340){
    fill(200);
    rect(700,300,75,100);
    fill(255,0,0);
    textFont(f,36);
    text(weaponsArray[5].getName(),width-250,175);
  }
  weaponsArray[0].display();
  weaponsArray[1].display();
  weaponsArray[2].display();
  weaponsArray[3].display();
  weaponsArray[4].display();
  weaponsArray[5].display();
}

void setSuggestionWeapon(int n){
  this.sw = n;
}

void getSuggestionLocation(){
  background(0);
  fill(255);
  textAlign(CENTER);
  rectMode(CENTER);
  textFont(f,48);
  text("WHERE?", width-250,100);
  
  if(mouseY>=215 && mouseY <=280){
    if(mouseX>=350 && mouseX <=425){
      fill(200);
      rect(390,250,100,100);
      fill(255,0,0);
      textFont(f,36);
      text(locations[0].getFormalName(),width-250,175);
    }
    if(mouseX>=450 && mouseX <=525){
      fill(200);
      rect(490,250,100,100);
      fill(255,0,0);
      textFont(f,36);
      text(locations[1].getFormalName(),width-250,175);
    }
    if(mouseX>=550 && mouseX <=625){
      fill(200);
      rect(590,250,100,100);
      fill(255,0,0);
      textFont(f,36);
      text(locations[2].getFormalName(),width-250,175);
    }
  }
  if(mouseY>=310 && mouseY <=375){
    if(mouseX>=350 && mouseX <=425){
      fill(200);
      rect(390,350,100,100);
      fill(255,0,0);
      textFont(f,36);
      text(locations[3].getFormalName(),width-250,175);
    }
    if(mouseX>=450 && mouseX <=525){
      fill(200);
      rect(490,350,100,100);
      fill(255,0,0);
      textFont(f,36);
      text(locations[4].getFormalName(),width-250,175);
    }
    if(mouseX>=550 && mouseX <=625){
      fill(200);
      rect(590,350,100,100);
      fill(255,0,0);
      textFont(f,36);
      text(locations[5].getFormalName(),width-250,175);
    }
  }
  if(mouseY>=410 && mouseY <=475){
    if(mouseX>=350 && mouseX <=425){
      fill(200);
      rect(390,450,100,100);
      fill(255,0,0);
      textFont(f,36);
      text(locations[6].getFormalName(),width-250,175);
    }
    if(mouseX>=450 && mouseX <=525){
      fill(200);
      rect(490,450,100,100);
      fill(255,0,0);
      textFont(f,36);
      text(locations[7].getFormalName(),width-250,175);
    }
    if(mouseX>=550 && mouseX <=625){
      fill(200);
      rect(590,450,100,100);
      fill(255,0,0);
      textFont(f,36);
      text(locations[8].getFormalName(),width-250,175);
    }
  }
 
  for(int i=0; i<locations.length;i++) locations[i].displayTiny();
}
void setSuggestionLocation(int n){
  this.sl = n;
}

//IN THIS METHOD, WE CHECK EACH CARD IN THE OPPONENTS HAND. AFTER THE FIRST MATCH, WE SET THAT AS THE "CURRENT CARD" AND THEN IN THE NEXT TIME YOU ASK, IT WILL GIVE YOU A DIFFERENT CARD. SO WE DONT REPEAT
void ask(int n){
  if(opponents[n].getCurrentCard() !=null){
    if((sc == opponents[n].getc1().code || sw == opponents[n].getc1().code || sl == opponents[n].getc1().code) && (opponents[n].getc1().code != opponents[n].getCurrentCard().code)){
      this.message = "I have a new clue for you: "+ opponents[n].getc1().name;
      opponents[n].setCurrentCard(opponents[n].getc1());
    }
    else if((sc == opponents[n].getc2().code || sw == opponents[n].getc2().code || sl == opponents[n].getc2().code) && (opponents[n].getc2().code != opponents[n].getCurrentCard().code)){
      this.message = "I have a new clue for you: "+ opponents[n].getc2().name;
      opponents[n].setCurrentCard(opponents[n].getc2());
    }
    else if((sc == opponents[n].getc3().code || sw == opponents[n].getc3().code || sl == opponents[n].getc3().code) && (opponents[n].getc3().code != opponents[n].getCurrentCard().code)){
      this.message = "I have a new clue for you: "+ opponents[n].getc3().name;
      opponents[n].setCurrentCard(opponents[n].getc3());
    }
    else this.message = "I don't have a new clue for you!";
  }else {
    if((sc == opponents[n].getc1().code || sw == opponents[n].getc1().code || sl == opponents[n].getc1().code)){
      this.message = "I have a new clue for you: "+ opponents[n].getc1().name;
      opponents[n].setCurrentCard(opponents[n].getc1());
    }
    else if((sc == opponents[n].getc2().code || sw == opponents[n].getc2().code || sl == opponents[n].getc2().code)){
      this.message = "I have a new clue for you: "+ opponents[n].getc2().name;
      opponents[n].setCurrentCard(opponents[n].getc2());
    }
    else if((sc == opponents[n].getc3().code || sw == opponents[n].getc3().code || sl == opponents[n].getc3().code)){
      this.message = "I have a new clue for you: "+ opponents[n].getc3().name;
      opponents[n].setCurrentCard(opponents[n].getc3());
    }
    else this.message = "I don't have a new clue for you!";
  
  }
}

//IN ACCUSE, EVERY CARD MUST MATCH THE ONES THAT ARE THE WEAPON KILLER AND ROOM
void accuse(){
  if(sc == killer && sw == weapon && sl == room){
    this.result = 0;
  }
  else this.result =1;
}

//DISPLAYS ACCUSATION RESULTS
void displayResults(){
  background(0);
  fill(255);
  textFont(f,16);
  text(kCard.getName() + " killed the victim in the " + rCard.getName() + " with the " + wCard.getName(), width/2, 35);
  textFont(f,75);
  textMode(CENTER);
  if(result ==0) text("YOU WIN!!", width/2, height/2);
  else{
    fill(255,0,0);
    text("YOU LOSE", width/2, height/2);
  }
  textFont(f,24);

  if(mouseY>=430 && mouseY <=454 && mouseX >=343 && mouseX<=405) fill(255,0,0);
  else fill(255);
  text("QUIT", width/2, height-50);
}



}
