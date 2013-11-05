class ClueSheet{
PFont font;
//RED SWITCH
boolean scarlett,mustard,plum,white,peacock,green,candlestick,revolver,wrench,rope,leadpipe,knife,study,dining,ballroom,hall,library,kitchen,billards,conservatory,lounge;
//BLUE SWITCH
boolean scarlett2,mustard2,plum2,white2,peacock2,green2,candlestick2,revolver2,wrench2,rope2,leadpipe2,knife2,study2,dining2,ballroom2,hall2,library2,kitchen2,billards2,conservatory2,lounge2;
ClueSheet(PFont f){
  this.font = f;
}

void display(){
      noStroke();
      fill(237,236,200);
      rectMode(CORNER);
      rect(0,0,250,500);
      fill(0);
      textMode(CENTER);
      textFont(font,24);
      text("SUSPECTS", 250/2,30);
      stroke(0);
      strokeWeight(3);
      if(scarlett) fill(255,0,0);
      else if(scarlett2) fill(0,0,255);
      else noFill();
      rect(15,40,15,15);
      if(mustard) fill(255,0,0);
      else if(mustard2) fill(0,0,255);
      else noFill();
      rect(15,55,15,15);
      if(plum) fill(255,0,0);
      else if(plum2) fill(0,0,255);
      else noFill();
      rect(15,70,15,15);
      if(white) fill(255,0,0);
      else if(white2) fill(0,0,255);
      else noFill();
      rect(15,85,15,15);
      if(peacock) fill(255,0,0);
      else if(peacock) fill(0,0,255);
      else noFill();
      rect(15,100,15,15);
      if(green) fill(255,0,0);
      else if(green2) fill(0,0,255);
      else noFill();
      rect(15,115,15,15);
      fill(0);
      text("WEAPONS", 250/2,165);
      stroke(0);
      strokeWeight(3);
      if(candlestick) fill(255,0,0);
      else if(candlestick2) fill(0,0,255);
      else noFill();
      rect(15,185,15,15);
      if(revolver) fill(255,0,0);
      else if(revolver2) fill(0,0,255);
      else noFill();
      rect(15,200,15,15);
      if(wrench) fill(255,0,0);
      else if(wrench2) fill(0,0,255);
      else noFill();
      rect(15,215,15,15);
      if(rope) fill(255,0,0);
      else if(rope2) fill(0,0,255);
      else noFill();
      rect(15,230,15,15);
      if(leadpipe) fill(255,0,0);
      else if(leadpipe2) fill(0,0,255);
      else noFill();
      rect(15,245,15,15);
      if(knife) fill(255,0,0);
      else if(knife2) fill(0,0,255);
      else noFill();
      rect(15,260,15,15);
      fill(0);
      text("LOCATIONS", 250/2,310);
      stroke(0);
      strokeWeight(3);
      if(study) fill(255,0,0);
      else if(study2) fill(0,0,255);
      else noFill();      
      rect(15,330,15,15);
      if(dining) fill(255,0,0);
      else if(dining2) fill(0,0,255);
      else noFill();
      rect(15,345,15,15);
      if(ballroom) fill(255,0,0);
      else if(ballroom2) fill(0,0,255);
      else noFill();
      rect(15,360,15,15);
      if(hall) fill(255,0,0);
      else if(hall2) fill(0,0,255);
      else noFill();
      rect(15,375,15,15);
      if(library) fill(255,0,0);
      else if(library2) fill(0,0,255);
      else noFill();
      rect(15,390,15,15);
      if(kitchen) fill(255,0,0);
      else if(kitchen2) fill(0,0,255);
      else noFill();
      rect(15,405,15,15);
      if(billards) fill(255,0,0);
      else if(billards2) fill(0,0,255);
      else noFill();
      rect(15,420,15,15);
      if(conservatory) fill(255,0,0);
      else if(conservatory2) fill(0,0,255);
      else noFill();
      rect(15,435,15,15);
      if(lounge) fill(255,0,0);
      else if(lounge2) fill(0,0,255);
      else noFill();
      rect(15,450,15,15);
      
      fill(0);
      textFont(font,11);
      text("MISS SCARLETT", 250/2, 52 );
      text("COLONEL MUSTARD", 250/2, 69 );
      text("PROFESSOR PLUM", 250/2, 86 );
      text("MRS.WHITE", 250/2, 101 );
      text("MRS.PEACOCK", 250/2, 116);
      text("MR.GREEN", 250/2, 131 );
      
      text("CANDLESTICK", 250/2, 196 );
      text("REVOLVER", 250/2, 212 );
      text("WRENCH", 250/2, 228);
      text("ROPE", 250/2, 244);
      text("LEADPIPE", 250/2, 260);
      text("KNIFE", 250/2, 276 );

      text("STUDY", 250/2, 340 );
      text("DINING ROOM", 250/2, 356 );
      text("BALLROOM", 250/2, 372);
      text("HALL", 250/2, 388);
      text("LIBRARY", 250/2, 404);
      text("KITCHEN", 250/2, 420 );
      text("BILLARDS ROOM", 250/2, 436 );
      text("CONSERVATORY", 250/2, 452 );
      text("LOUNGE", 250/2, 468 );
}



}
