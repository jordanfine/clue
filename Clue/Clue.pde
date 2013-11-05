/*JORDAN FINE
  CAP3032 - INTERACTIVE MODELING AND ANIMATION SPRING 2013
  FINAL PROJECT
  CLUE: THE CLASSIC MYSTERY GAME
*/

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

PFont font;
Menu main ;
Person p;
Location[] locations = new Location[11];
PImage envelope;
Hall intro;
Gameplay gameplay;
ClueSheet sheet;

//ALL THE SWITCHES FOR ROOMS AND EVENTS
boolean menu =true, difficulty, introb,chooseCharacter, downstairs, upstairs,lounge, ballroom, billards, library, study, kitchen, conservatory, diningRoom, cluesheet, clues, xclues;
boolean suggestion, suggestionC, suggestionW, suggestionL, accusation , result; 
boolean easy;

//SONG
AudioPlayer menuSong;
AudioPlayer scream;
Minim minim;
int randomCharacter;

void setup(){
  envelope  = loadImage("envelope.png");
  font = loadFont("Minecraft-100.vlw");
  size(750,500);
  minim = new Minim(this);
  menuSong = minim.loadFile("01 Toccata and Fugue in D Minor.mp3");
  scream = minim.loadFile("scream.mp3");
  menuSong.play();
  menuSong.loop();

  p = new Person(300,300);
  for(int i=0; i<locations.length;i++){
    locations[i]=new Location(width-250,height/2,font,i+6);
  }
  main = new Menu(width/2,height/2, font);
  intro = new Hall(width-250,height/2, scream,font);
  sheet = new ClueSheet(font);
}

void stop(){
   scream.close();
   menuSong.close();
   minim.stop();
   super.stop();
}

void draw(){
  //THESE ARE THE SWITCHES BETWEEN EACH FRAME - WHETHER IT BE A MENU OR A ROOM
  if(menu){
    main.display();
  }
  if(difficulty) main.difficulty();
  if(!menu){
    if(chooseCharacter){
      main.chooseCharacter();
    }
    if(introb){
      intro.display();
      if(intro.items || intro.hall){
        gameplay.randomCharacter(randomCharacter,490, 294);
        p.display();
      }
    }
    if(downstairs){
       locations[9].display();
       p.display();
    }
    if(upstairs){
       locations[10].display();
       p.display();
    }
    if(ballroom){
      locations[7].display();
      gameplay.randomCharacter(randomCharacter,540, 275);
      p.display();
    }
    if(kitchen){
       locations[1].display();
       gameplay.randomCharacter(randomCharacter,540, 260);
       p.display();
    }
    if(conservatory){
      locations[2].display();
      gameplay.randomCharacter(randomCharacter,540, 320);
       p.display();
    }
    if(diningRoom){
      locations[8].display();
      gameplay.randomCharacter(randomCharacter,540, 265);
       p.display();
    }
    if(billards){
       locations[6].display();
       gameplay.randomCharacter(randomCharacter,540, 266);
       p.display();
    }
    if(library){
       locations[0].display();
       gameplay.randomCharacter(randomCharacter,540, 300);
       p.display();
    }
    if(study){
       locations[5].display();
       gameplay.randomCharacter(randomCharacter,540, 290);
       p.display();
    }
    if(lounge){
       locations[3].display();
       gameplay.randomCharacter(randomCharacter,540, 280);
       p.display();
    }
    if(clues){
      suggestion = false;
      gameplay.display();
    }
    if(easy && xclues){
      suggestion = false;
      gameplay.displayExtraClues();
    }
    if(cluesheet){
      if(suggestionC){
        gameplay.getSuggestionCharacter();
      }
      if(suggestionW){
        gameplay.getSuggestionWeapon();
      }
      if(suggestionL){
        gameplay.getSuggestionLocation();
      }
      if(suggestion){
        gameplay.displayMessage();
      }
      sheet.display();
      if(!clues && !xclues && !intro.first && !intro.second && !intro.kill && !intro.items){
        textFont(font,12);
        if(mouseX>=650 && mouseY>=0 && mouseY<=20) fill(0,0,255);
        else fill(0);
        text("YOUR CLUES", 700,15);
        if(easy){
          if(mouseX>=650 && mouseY>=21 && mouseY<=40) fill(0,0,255);
          else fill(0);
          text("EXTRA CLUES", 700,30);
        }
      }
      if(result){
        scream.play();
        gameplay.displayResults();
      }
    }

    
  }
}

void mousePressed(){
  //THESE ARE THE MOUSE PRESSES THAT SIGNAL CERTAIN EVENTS TO HAPPEN
  if(menu && mouseX>=286 && mouseX<=459 && mouseY>=310 && mouseY <=353 ){
        menu = false;
        difficulty= true;
  }
  else if(menu && mouseX>=286 && mouseX<=459 && mouseY>=409 && mouseY <=451)
  {
    menuSong.close();  
    exit();
  }
  else if(difficulty && mouseX>=286 && mouseX<=459 && mouseY>=310 && mouseY <=353 ){
        //EASY
        difficulty= false;
        easy = true;
        chooseCharacter = true;
  }
  else if(difficulty && mouseX>=286 && mouseX<=459 && mouseY>=409 && mouseY <=451)
  {
        difficulty= false;
        easy = false;
        chooseCharacter = true;
  }
  
  else if(chooseCharacter){
      //Scarlett
      if(mouseX>=150 && mouseX<=200 && mouseY>=265 && mouseY<=340){
        chooseCharacter=false;
        p.setPlayer("scarlett");
        introb=true;
        gameplay = new Gameplay(p,font);
        cluesheet = true;
      }
      //Green
      if(mouseX>=225 && mouseX<=275 && mouseY>=265 && mouseY<=340){
        chooseCharacter=false;
        p.setPlayer("green");
        introb=true;
        gameplay = new Gameplay(p,font);
        cluesheet = true;
      }
      //Mustard
      if(mouseX>=300 && mouseX<=350 && mouseY>=265 && mouseY<=340 ){
        chooseCharacter=false;
        p.setPlayer("mustard");
        introb=true;
        gameplay = new Gameplay(p,font);
        cluesheet = true;
      }
      //White
      if(mouseX>=375 && mouseX<=425 && mouseY>=265 && mouseY<=340){
        chooseCharacter=false;
        p.setPlayer("white");
        introb=true;
        gameplay = new Gameplay(p,font);
        cluesheet = true;
      }
      //Plum
      if(mouseX>=450 && mouseX<=500 && mouseY>=265 && mouseY<=340){
        chooseCharacter=false;
        p.setPlayer("plum");
        introb=true;
        gameplay = new Gameplay(p,font);
        cluesheet = true;
      }
      //Peacock
      if(mouseX>=525 && mouseX<=575 && mouseY>=265 && mouseY<=340){
        chooseCharacter=false;
        p.setPlayer("peacock");
        introb=true;
        gameplay = new Gameplay(p,font);
        cluesheet = true;
      }
      
    }
   else if(!clues && mouseX>=650 && mouseY>=0 && mouseY<=20) clues = true;
   else if(easy && !xclues && mouseX>=650 && mouseY>=21 && mouseY<=40) xclues = true;
   else if(suggestionC || suggestionW){
      if(mouseX>=300 && mouseX<=350 && mouseY>=265 && mouseY<=340){
        if(suggestionC) {
          gameplay.setSuggestionCharacter(gameplay.opponents[0].getCode());
          suggestionC=false;
          suggestionW=true;
        }
        else if(suggestionW) {
          gameplay.setSuggestionWeapon(gameplay.weaponsArray[0].getCode());
          suggestionW=false;
          suggestionL=true;
        }
      }
      if(mouseX>=375 && mouseX<=425 && mouseY>=265 && mouseY<=340){
        if(suggestionC) {
          gameplay.setSuggestionCharacter(gameplay.opponents[1].getCode());
          suggestionC=false;
          suggestionW=true;
        }
        else if(suggestionW) {
          gameplay.setSuggestionWeapon(gameplay.weaponsArray[1].getCode());
          suggestionW=false;
          suggestionL=true;
        }
      }
      if(mouseX>=450 && mouseX<=500 && mouseY>=265 && mouseY<=340){
        if(suggestionC) {
          gameplay.setSuggestionCharacter(gameplay.opponents[2].getCode());
          suggestionC=false;
          suggestionW=true;
        }
        else if(suggestionW) {
          gameplay.setSuggestionWeapon(gameplay.weaponsArray[2].getCode());
          suggestionW=false;
          suggestionL=true;
        }
      }
      if(mouseX>=525 && mouseX<=575 && mouseY>=265 && mouseY<=340){
       if(suggestionC) {
          gameplay.setSuggestionCharacter(gameplay.opponents[3].getCode());
         suggestionC=false;
          suggestionW=true;
       }
        else if(suggestionW) {
          gameplay.setSuggestionWeapon(gameplay.weaponsArray[3].getCode());
          suggestionW=false;
          suggestionL=true;
        }
      }
      if(mouseX>=600 && mouseX<=650 && mouseY>=265 && mouseY<=340){
        if(suggestionC) {
        gameplay.setSuggestionCharacter(gameplay.opponents[4].getCode());
        suggestionC=false;
        suggestionW=true;
        }
        else if(suggestionW) {
          gameplay.setSuggestionWeapon(gameplay.weaponsArray[4].getCode());
          suggestionW=false;
          suggestionL=true;
        }
      }
      if(mouseX>=675 && mouseX<=725 && mouseY>=265 && mouseY<=340){
        if(suggestionC) {
        gameplay.setSuggestionCharacter(gameplay.user.getCode());
        suggestionC=false;
        suggestionW=true;
        }
        else if(suggestionW) {
          gameplay.setSuggestionWeapon(gameplay.weaponsArray[5].getCode());
          suggestionW=false;
          suggestionL=true;
        }
      }
    }
    else if(suggestionL){
      if(mouseY>=215 && mouseY <=280){
        if(mouseX>=350 && mouseX <=425){
          gameplay.setSuggestionLocation(gameplay.locations[0].getCode());
          suggestionL=false;
          gameplay.ask(randomCharacter);
          if(accusation){
            gameplay.accuse();
            result = true;
          }else suggestion =true;
        }
        if(mouseX>=450 && mouseX <=525){
          gameplay.setSuggestionLocation(gameplay.locations[1].getCode());
          suggestionL=false;
          gameplay.ask(randomCharacter);
          if(accusation){
            gameplay.accuse();
            result = true;
          }else suggestion =true;
        }
        if(mouseX>=550 && mouseX <=625){
          gameplay.setSuggestionLocation(gameplay.locations[2].getCode());
          suggestionL=false;
          gameplay.ask(randomCharacter);
          if(accusation){
            gameplay.accuse();
            result = true;
          }else suggestion =true;
        }
      }
      if(mouseY>=310 && mouseY <=375){
        if(mouseX>=350 && mouseX <=425){
          gameplay.setSuggestionLocation(gameplay.locations[3].getCode());
          suggestionL=false;
          gameplay.ask(randomCharacter);
          if(accusation){
            gameplay.accuse();
            result = true;
          }else suggestion =true;
        }
        if(mouseX>=450 && mouseX <=525){
          gameplay.setSuggestionLocation(gameplay.locations[4].getCode());
          suggestionL=false;
          gameplay.ask(randomCharacter);
          if(accusation){
            gameplay.accuse();
            result = true;
          }else suggestion =true;
        }
        if(mouseX>=550 && mouseX <=625){
          gameplay.setSuggestionLocation(gameplay.locations[5].getCode());
          suggestionL=false;
          gameplay.ask(randomCharacter);
          if(accusation){
            gameplay.accuse();
            result = true;
          }else suggestion =true;  
        }
      }
      if(mouseY>=410 && mouseY <=475){
        if(mouseX>=350 && mouseX <=425){
          gameplay.setSuggestionLocation(gameplay.locations[6].getCode());
          suggestionL=false;
          gameplay.ask(randomCharacter);
          if(accusation){
            gameplay.accuse();
            result = true;
          }else suggestion =true;
        }
        if(mouseX>=450 && mouseX <=525){
          gameplay.setSuggestionLocation(gameplay.locations[7].getCode());
          suggestionL=false;
          gameplay.ask(randomCharacter);
          if(accusation){
            gameplay.accuse();
            result = true;
          }else suggestion =true;
        }
        if(mouseX>=550 && mouseX <=625){
          gameplay.setSuggestionLocation(gameplay.locations[8].getCode());
          suggestionL=false;
          gameplay.ask(randomCharacter);
          if(accusation){
            gameplay.accuse();
            result = true;
          }else suggestion =true;
        }
      }
    }
    
    //TOGGLE COLORS ON CLUE SHEET- LEFT CLICK FOR RED
    if(cluesheet && mouseX >=15 && mouseX<=30 && mouseButton ==LEFT){
     //suspects
     if(mouseY>=40 && mouseY<55) sheet.scarlett = !sheet.scarlett;
     if(mouseY>=55 && mouseY<70) sheet.mustard = !sheet.mustard;
     if(mouseY>=70 && mouseY<85) sheet.plum = !sheet.plum;
     if(mouseY>=85 && mouseY<100) sheet.white = !sheet.white;
     if(mouseY>=100 && mouseY<115) sheet.peacock = !sheet.peacock;
     if(mouseY>=115 && mouseY<130) sheet.green = !sheet.green;
     //weapons
     if(mouseY>=185 && mouseY<200) sheet.candlestick = !sheet.candlestick;
     if(mouseY>=200 && mouseY<215) sheet.revolver = !sheet.revolver;
     if(mouseY>=215 && mouseY<230) sheet.wrench = !sheet.wrench;
     if(mouseY>=230 && mouseY<245) sheet.rope = !sheet.rope;
     if(mouseY>=245 && mouseY<260) sheet.leadpipe = !sheet.leadpipe;
     if(mouseY>=260 && mouseY<275) sheet.knife = !sheet.knife;
     //locations
     if(mouseY>=330 && mouseY<345) sheet.study = !sheet.study;
     if(mouseY>=345 && mouseY<360) sheet.dining = !sheet.dining;
     if(mouseY>=360 && mouseY<375) sheet.ballroom = !sheet.ballroom;
     if(mouseY>=375 && mouseY<390) sheet.hall = !sheet.hall;
     if(mouseY>=390 && mouseY<405) sheet.library = !sheet.library;
     if(mouseY>=405 && mouseY<420) sheet.kitchen = !sheet.kitchen;
     if(mouseY>=420 && mouseY<435) sheet.billards = !sheet.billards;
     if(mouseY>=435 && mouseY<450) sheet.conservatory = !sheet.conservatory;
     if(mouseY>=450 && mouseY<465) sheet.lounge = !sheet.lounge;
    }
    //RIGHT CLICK FOR BLUE
    if(cluesheet && mouseX >=15 && mouseX<=30 && mouseButton ==RIGHT){
     //suspects
     if(mouseY>=40 && mouseY<55) sheet.scarlett2 = !sheet.scarlett2;
     if(mouseY>=55 && mouseY<70) sheet.mustard2 = !sheet.mustard2;
     if(mouseY>=70 && mouseY<85) sheet.plum2 = !sheet.plum2;
     if(mouseY>=85 && mouseY<100) sheet.white2 = !sheet.white2;
     if(mouseY>=100 && mouseY<115) sheet.peacock2 = !sheet.peacock2;
     if(mouseY>=115 && mouseY<130) sheet.green2 = !sheet.green2;
     //weapons
     if(mouseY>=185 && mouseY<200) sheet.candlestick2 = !sheet.candlestick2;
     if(mouseY>=200 && mouseY<215) sheet.revolver2 = !sheet.revolver2;
     if(mouseY>=215 && mouseY<230) sheet.wrench2 = !sheet.wrench2;
     if(mouseY>=230 && mouseY<245) sheet.rope2 = !sheet.rope2;
     if(mouseY>=245 && mouseY<260) sheet.leadpipe2 = !sheet.leadpipe2;
     if(mouseY>=260 && mouseY<275) sheet.knife2 = !sheet.knife2;
     //locations
     if(mouseY>=330 && mouseY<345) sheet.study2 = !sheet.study2;
     if(mouseY>=345 && mouseY<360) sheet.dining2 = !sheet.dining2;
     if(mouseY>=360 && mouseY<375) sheet.ballroom2 = !sheet.ballroom2;
     if(mouseY>=375 && mouseY<390) sheet.hall2 = !sheet.hall2;
     if(mouseY>=390 && mouseY<405) sheet.library2 = !sheet.library2;
     if(mouseY>=405 && mouseY<420) sheet.kitchen2 = !sheet.kitchen2;
     if(mouseY>=420 && mouseY<435) sheet.billards2 = !sheet.billards2;
     if(mouseY>=435 && mouseY<450) sheet.conservatory2 = !sheet.conservatory2;
     if(mouseY>=450 && mouseY<465) sheet.lounge2 = !sheet.lounge2;
    }
    if((clues || xclues) && mouseX>=386 && mouseX<=615 && mouseY>=380 && mouseY<=400){
      clues=false; 
      xclues=false;
      intro.items = false;
      intro.hall=true;  
    }
    if(result && mouseY>=430 && mouseY <=454 && mouseX >=343 && mouseX<=405) {
      menuSong.close();  
      exit();
    }
}

void keyPressed(){ 
  //THESE ARE THE CODES FOR WALKING AROUND. EACH ROOM HAS DIFFERENT BOUNDARIES
  //UP: 2
  //DOWN: 4
  //LEFT: 1
  //RIGHT: 2
  if(key == CODED){
    if (keyCode == UP) { // action
        if(introb && (intro.items || intro.hall)){
          if(p.y<=296 && p.x>=250 && p.x <=442){
            suggestion=false;
            introb =false;
            upstairs = true;
            p.y=height-10;
            p.x=500;
          }
          if(p.y<=296 && p.x>=550 && p.x <=606){
            suggestion=false;
            introb =false;
            ballroom = true;
            randomCharacter = (int)random(0,5);
            p.y=275;
            p.x=260;
            p.walk(2);
          }
          if(p.x>442 && p.y<=296);
          else if(p.y>296) p.walk(3);   
        }
        if(downstairs){
          if(p.y<=300 && p.x>=595 && p.x<=643){
            suggestion=false;
            downstairs =false;
            kitchen = true;
            randomCharacter = (int)random(0,5);
            p.y=260;
            p.x=260;
            p.walk(2);
          }
          if(p.y<=300 && p.x>=395 && p.x<=451){
            suggestion=false;
            downstairs =false;
            conservatory = true;
            randomCharacter = (int)random(0,5);
            p.y=320;
            p.x=260;
            p.walk(2);
          }
          else if(p.y>300) p.walk(3);
        }
        if(upstairs){
          if(p.y>130) p.walk(3);
          if(p.y<=130 && p.x>=480 && p.x<=520){
            suggestion=false;
            upstairs = false;
            lounge = true;
            randomCharacter = (int)random(0,5);
            p.x = 266;
            p.y = 280;
            p.walk(2);
          }
        }

    }
    else if (keyCode == DOWN) {
          if(introb && (intro.items || intro.hall)){
            if(p.y<height-10) p.walk(4); 
          } 
          if(downstairs){
            if(p.y<height-10) p.walk(4);
          }
          if(upstairs){
            if(p.y>=height-10){
              suggestion=false;
              upstairs= false;
              introb= true;
              randomCharacter = (int)random(0,5);
              p.x = 350;
              p.y = 302;
            }
            p.walk(4);
          }
    }
    else if (keyCode == RIGHT) { // action
         if(introb && (intro.items || intro.hall)){
           if(p.x<696) p.walk(2);
         } 
         if(downstairs){
          if(p.x>=width-14){
            suggestion=false;
            downstairs = false;
            introb= true;
            randomCharacter = (int)random(0,5);
            p.x = 266;
          }
          p.walk(2);
        }
        if(upstairs){
          if(p.x<572) p.walk(2);
          if(p.x>=572 && p.y>=350 && p.y<=394){
            suggestion=false;
            upstairs=false;
            diningRoom=true;
            randomCharacter = (int)random(0,5);
            p.x = 266;
            p.y = 265;
          }
          if(p.x>=572 && p.y>=170 && p.y<=226){
            suggestion=false;
            upstairs=false;
            study=true;
            randomCharacter = (int)random(0,5);
            p.x = 266;
            p.y = 290;
          }
        }
        if(ballroom){
          if(p.x< 515) p.walk(2);
        }
        if(kitchen){
          //load secret path
          p.walk(2);
        }
        if(kitchen && p.x>=696){
          //load secret path
          suggestion=false;
          kitchen = false;
          study = true;
          randomCharacter = (int)random(0,5);
          p.y=290;
          p.x=690;
          p.walk(1);
        }
        if(conservatory){
          //load secret path
          p.walk(2);
        }
        if(conservatory && p.x>=696){
          //load secret path
          suggestion=false;
          conservatory = false;
          lounge = true;
          randomCharacter = (int)random(0,5);
          p.x = 690;
          p.y =280;
          p.walk(1);
          p.walk(1);
        }
        if(diningRoom && p.x<696){
          //load secret path
          p.walk(2);
        }
        if(study && p.x<696){
          //load secret path
          p.walk(2);
        }
        if(study && p.x>=696){
          //load secret path
          suggestion=false;
          study = false;
          kitchen = true;
          randomCharacter = (int)random(0,5);
          p.y=260;
          p.x=690;
          p.walk(1);
        }
        if(lounge && p.x<696){
          //load secret path
          
          p.walk(2);
        }
        if(lounge && p.x>=696){
          //load secret path
          suggestion=false;
          lounge = false;
          conservatory = true;
          randomCharacter = (int)random(0,5);
          p.y=320;
          p.x=690;
          p.walk(2);
        }
        if(billards){
          if(p.x<696) p.walk(2);
          else{
            suggestion=false;
            upstairs =true;
            billards = false;
            randomCharacter = (int)random(0,5);
            p.y=373;
            p.x=432;
            p.walk(4);
          }
        }
        if(library){
          if(p.x<696) p.walk(2);
          else{
            suggestion=false;
            upstairs =true;
            library = false;
            randomCharacter = (int)random(0,5);
            p.y=217;
            p.x=432;
            p.walk(4);
          }
        }
    }
    else if (keyCode == LEFT){
         if(introb && (intro.items || intro.hall)){
           if(p.x <=265){
            suggestion=false;
            introb =false;
            downstairs = true;
            randomCharacter = (int)random(0,5);
            p.x=width-15;
          }
          else  p.walk(1);   
         } 
         if(downstairs){
          if(p.x>=303) p.walk(1);
        }
        if(upstairs){
          if(p.x>431) p.walk(1);
          if(p.x<=431 && p.y>=350 && p.y<=394){
            suggestion=false;
            upstairs=false;
            billards=true;
            randomCharacter = (int)random(0,5);
            p.x = 694;
            p.y = 266;
          }
          if(p.x<=431 && p.y>=181 && p.y<=233){
            suggestion=false;
            upstairs=false;
            library=true;
            randomCharacter = (int)random(0,5);
            p.x = 694;
            p.y = 300;
          }
        }
         if(ballroom){
          if(p.x>280) p.walk(1);
          else{
            suggestion=false;
            introb =true;
            ballroom = false;
            randomCharacter = (int)random(0,5);
            p.y=300;
            p.x=580;
            p.walk(4);
          }
        }
        if(kitchen){
          if(p.x>280) p.walk(1);
          else{
            suggestion=false;
            downstairs =true;
            kitchen = false;
            randomCharacter = (int)random(0,5);
            p.y=300;
            p.x=620;
            p.walk(4);
          }
        }
        if(conservatory){
          if(p.x>280) p.walk(1);
          else{
            suggestion=false;
            downstairs =true;
            conservatory = false;
            randomCharacter = (int)random(0,5);
            p.y=300;
            p.x=420;
            p.walk(4);
          }
        }
        if(diningRoom){
          if(p.x>280) p.walk(1);
          else{
            suggestion=false;
            upstairs =true;
            diningRoom = false;
            randomCharacter = (int)random(0,5);
            p.y=373;
            p.x=560;
            p.walk(4);
          }
        }
        if(study){
          if(p.x>280) p.walk(1);
          else{
            suggestion=false;
            upstairs =true;
            study = false;
            randomCharacter = (int)random(0,5);
            p.y=200;
            p.x=560;
            p.walk(4);
          }
        }
        if(lounge){
          if(p.x>280) p.walk(1);
          else{
            suggestion=false;
            upstairs =true;
            lounge = false;
            randomCharacter = (int)random(0,5);
            p.y=135;
            p.x=500;
            p.walk(4);
          }
        }
        if(billards){
          if(p.x>266) p.walk(1);
        }
        if(library){
          if(p.x>266) p.walk(1);
        }
    }
    
    //ENVELOPE FOR CLUES
    if(intro.items){
      if(p.x>=432 && p.x<=445 && p.y>=360 && p.y<=370){
        clues = true;
        intro.items = false;
        intro.items2 = true;
      }
    }

  }
  
  
  //THESE ARE USED TO CONTINUE THROUGH DIALOGS IN THE BEGINNING
  if(key == ENTER || key == RETURN){
      if(introb){
        if(intro.first){
          intro.first= !intro.first;
          intro.second = !intro.second;
        }
        else if(intro.second){
          intro.second = !intro.second;
          intro.kill = !intro.kill;
        }
        else if(intro.kill){
          intro.kill = !intro.kill;
          intro.items = !intro.items;
        }
      }
  }
  
  
  
  //WHEN IN A ROOM THAT ISNT DOWNSTAIRS HALLWAY AND UPSTAIRS HALLWAY AND NOT DURING THE DIALOG SCREENS, ALLOW USERS TO SUGGEST AND ACCUSE
  if(key == 's' && !downstairs && !upstairs && !intro.first && !intro.second && !intro.kill && !intro.items){
    suggestion = false;
    suggestionC = true;
  }
  if(key == 'a'  && !downstairs && !upstairs && !intro.first && !intro.second && !intro.kill && !intro.items){
    suggestion = false;
    result = false;
    accusation = true;
    suggestionC=true;
  }
}


 
 

