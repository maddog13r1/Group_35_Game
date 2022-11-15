/************
 **  GROUP 35 GAME
 **  Mike, Jana, RJ, Josh, Stanley
 **  11/13/2022
 **  SP2 DEMO
 ************/
//global variables
PImage titlePic;
PImage Pic2;
boolean isTitleScreen = true;
boolean isMainScreen = false;
boolean isHealthMinigame = false;
boolean isStudyMinigame = false;
boolean isMentalMinigame = false;
boolean isPhysicalMinigame = false;
int financialStat;
int socialStat;
int gradeStat;
int healthStat;

void setup() { //runs program once at program launch
  fullScreen(); //sets the game window size to the full screen of device
  smooth(8); //anti-aliasing x8
  titlePic = loadImage("umbc_air.png");
  Pic2 = loadImage("2nd_page.jpg");
  financialStat = int(random(width/20.645, width/6.882));
  socialStat = int(random(width/20.645, width/6.882));
  gradeStat = int(random(width/20.645, width/6.882));
  healthStat = int(random(width/20.645, width/6.882));
}

void draw() { //runs programs at 60 fps at program launch
  noStroke(); //removes outline
  game(); //calls the game call function (this runs the entire game)
}

/****** CALL FUNCTIONS ******/
//(calls all functions into a single large function to reduce clutter)
void game() {
  screens(); //runs all screens
  minigames(); //runs all minigames
}

//screen call function
void screens() {
  if ( isTitleScreen == true ) {
    titleScreen(); //calling void titleScreen()
  }
  if ( isMainScreen == true) {
    mainScreen(); //calling void mainScreen()
  }
}
//minigame call function
void minigames() {
  if ( isHealthMinigame == true ) {
    healthMinigame();
  }
  if ( isStudyMinigame == true ) {
    studyMinigame();
  }
  if ( isMentalMinigame == true ) {
    mentalMinigame();
  }
  if ( isPhysicalMinigame == true ) {
    physicalMinigame();
  }
}


/****** GAME SCREENS ******/

/*** GAME START SCREENS ***/

//titlescreen
void titleScreen() { //main title function
  /* background */
  image(titlePic, 0, 0);
  //title box
  rectMode(CENTER);
  fill(255); //white
  rect(width/2-4, height/4-46, 560, 208); //places a box for the text
  //title text
  textAlign(CENTER); //aligns text to the center
  textSize(144); //font size
  fill(0); //black
  text("GRIT", width/2-140, height/4);
  fill(245, 245, 0); //yellow
  text("LIFE", width/2 +140, height/4);

  /* buttons */
  int playButtonX = width/2;
  int playButtonY = height/2-33;
  int playButtonColor = 0;
  //play button functionality
  if ( mouseX >= playButtonX-140 && mouseY >= playButtonY-52 && mouseX <= playButtonX+140 && mouseY <= playButtonY+52 ) {
    playButtonColor = playButtonColor + 150;
  }
  if (mousePressed && mouseX >= playButtonX-140 && mouseY >= playButtonY-52 && mouseX <= playButtonX+140 && mouseY <= playButtonY+52 ) {
    isTitleScreen = false;
    isMainScreen = true;
    return;
  }
  //play button
  stroke(255);
  fill(playButtonColor);
  rect(playButtonX, playButtonY, 280, 104);
  fill(255); //white
  textSize(72); //font size
  text("PLAY", width/2, height/2);
}


//mainScreen
void mainScreen() { // main function calling all main screen functions
  /* background */
  background(0);
  image(Pic2, width/6.4, 0);
  /* stat bar */
  //financial bar
  noStroke();
  rectMode(CORNER);
  fill(0);
  rect(width/3 + 155, height - 45, width/5.5 + 23, 26, 90);

  noStroke();
  fill(30, 144, 255);
  rect(width/3 + 155, height - 45, financialStat, 26, 90);
  textSize(16);
  fill(255);
  text(financialStat/3.72, width/2 + 5, height - 27);

  //social bar
  rectMode(CORNER);
  fill(0);
  rect(width/3 + 155, height - 84, width/5.5 + 23, 26, 90);

  noStroke();
  fill(30, 144, 255);
  rect(width/3 + 155, height - 84, socialStat, 26, 90);
  textSize(16);
  fill(255);
  text(socialStat/3.72, width/2 + 5, height - 66);

  //grade bar
  rectMode(CORNER);
  fill(0);
  rect(width/3 + 155, height - 128, width/5.5 + 23, 26, 90);

  noStroke();
  fill(30, 144, 255);
  rect(width/3 + 155, height - 128, gradeStat, 26, 90);
  textSize(16);
  fill(255);
  text(gradeStat/3.72, width/2 + 5, height - 110);

  //health bar
  rectMode(CORNER);
  fill(0);
  rect(width/3 + 155, height - 172, width/5.5 + 23, 26, 90);

  noStroke();
  fill(30, 144, 255);
  rect(width/3 + 155, height - 172, healthStat, 26, 90);
  textSize(16);
  fill(255);
  text(healthStat/3.72, width/2 + 5, height - 154);
}



/*** END GAME SCREENS ***/

//victory scenario
void victoryScreen() {
}

//loss scenario
void lossScreen() {
}


/****** MINIGAMES ******/

/*** study minigame ***/
void studyMinigame() { //function for entire study minigame
  //background
}
/*** health minigame ***/
void healthMinigame() { //function for entire health minigame
  //background
}
/*** mental minigame ***/
void mentalMinigame() {
  //background
}
/*** physical minigame ***/
void physicalMinigame() {
  //background
}
