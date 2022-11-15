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
boolean isSocialMinigame = false;
int financialStat;
int socialStat;
int gradeStat;
int healthStat;

//timers
float timerX = -1280;
float speedX = 0.5; //sets the time to ~60 seconds


void setup() { //runs program once at program launch
  size(1280,720); //720p resolution
  smooth(8); //anti-aliasing x8
  titlePic = loadImage("umbc_air.png");
  Pic2 = loadImage("2ndpage.jpg");
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
  if ( isSocialMinigame == true ) {
    socialMinigame();
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
  image(Pic2, 0, 0);
  /* buttons */
  stroke(255);
  
  //study button
  float studyButtonX = 500; //678 in 1920
  float studyButtonY = 470; //776 in 1080
  int studyButtonColor = 0;
  if ( mouseX >= studyButtonX-27.5 && mouseY >= studyButtonY-27.5 && mouseX <= studyButtonX+27.5 && mouseY <= studyButtonY+27.5 ) {
    studyButtonColor = studyButtonColor + 255;
  }
  if (mousePressed && mouseX >= studyButtonX-27.5 && mouseY >= studyButtonY-27.5 && mouseX <= studyButtonX+27.5 && mouseY <= studyButtonY+27.5 ) {
    isMainScreen = false;
    isStudyMinigame = true;
    return;
  }
  fill(studyButtonColor);
  ellipse(studyButtonX, studyButtonY, 55, 55);
  
  //physical button
  float physicalButtonX = 378; //802 in 1920
  float physicalButtonY = 470; //776 in 1080;
  int physicalButtonColor = 0;
  if ( mouseX >= physicalButtonX-27.5 && mouseY >= physicalButtonY-27.5 && mouseX <=  physicalButtonX+27.5 && mouseY <= physicalButtonY+27.5 ) {
    physicalButtonColor = physicalButtonColor + 255;
  }
  if (mousePressed && mouseX >=  physicalButtonX-27.5 && mouseY >= physicalButtonY-27.5 && mouseX <=  physicalButtonX+27.5 && mouseY <= physicalButtonY+27.5 ) {
    isMainScreen = false;
    isPhysicalMinigame = true;
    return;
  }
  fill(physicalButtonColor);
  ellipse(physicalButtonX, physicalButtonY, 55, 55);
  
  //social button
    float socialButtonX = 816;
    float socialButtonY = 470;
    int socialButtonColor = 0;
    if ( mouseX >= socialButtonX-27.5 && mouseY >= socialButtonY-27.5 && mouseX <=  socialButtonX+27.5 && mouseY <= socialButtonY+27.5 ) {
    physicalButtonColor = physicalButtonColor + 255;
  }
  if (mousePressed && mouseX >=  socialButtonX-27.5 && mouseY >= socialButtonY-27.5 && mouseX <=  socialButtonX+27.5 && mouseY <= socialButtonY+27.5 ) {
    isMainScreen = false;
    isSocialMinigame = true;
    return;
  }
  fill(socialButtonColor);
  ellipse(socialButtonX, physicalButtonY, 55, 55);
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
  text(int(financialStat/3.72) + "%", width/2 + 5, height - 27);

  //social bar
  rectMode(CORNER);
  fill(0);
  rect(width/3 + 155, height - 84, width/5.5 + 23, 26, 90);

  noStroke();
  fill(30, 144, 255);
  rect(width/3 + 155, height - 84, socialStat, 26, 90);
  textSize(16);
  fill(255);
  text(int(socialStat/3.72) + "%", width/2 + 5, height - 66);

  //grade bar
  rectMode(CORNER);
  fill(0);
  rect(width/3 + 155, height - 128, width/5.5 + 23, 26, 90);

  noStroke();
  fill(30, 144, 255);
  rect(width/3 + 155, height - 128, gradeStat, 26, 90);
  textSize(16);
  fill(255);
  text(int(gradeStat/3.72) + "%", width/2 + 5, height - 110);

  //health bar
  rectMode(CORNER);
  fill(0);
  rect(width/3 + 155, height - 172, width/5.5 + 23, 26, 90);

  noStroke();
  fill(30, 144, 255);
  rect(width/3 + 155, height - 172, healthStat, 26, 90);
  textSize(16);
  fill(255);
  text(int(healthStat/3.72) + "%", width/2 + 5, height - 154);
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
  background(0);
  fill(255);
  text("study minigame", width/2, height/2);
  //timer
  if ( timerX != 0 ) {
    timerX = timerX + speedX;
  }
  fill(255, 0, 0);
  rect(timerX, 0, 1280, 64);
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
  background(0);
  fill(255, 0, 0);
  text("physical minigame", width/2, height/2);
    //timer

  if ( timerX != 0 ) {
    timerX = timerX + speedX;
  }
  fill(255, 0, 0);
  rect(timerX, 0, 1280, 64);
}
/*** social minigame ***/
void socialMinigame(){
  //background
  background(0);
  text("social minigame", width/2, height/2);
}
