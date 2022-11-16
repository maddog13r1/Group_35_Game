/************
 **  GROUP 35 GAME
 **  Mike, Jana, RJ, Josh, Stanley
 **  11/13/2022
 **  SP2 DEMO
 ************/
//global variables
PImage titlePic; //woah how cool
PImage Pic2;
PImage gym;
boolean isTitleScreen = true;
boolean isMainScreen = false;
boolean isHealthMinigame = false;
boolean isStudyMinigame = false;
boolean isMentalMinigame = false;
boolean isPhysicalMinigame = false;
boolean isSocialMinigame = false;
boolean isPhysicalWin = false;
boolean isPhysicalLose = false;
boolean isGuyWeight = true;
//stats
int financialStat;
int socialStat;
int gradeStat;
int healthStat;
//game variables
int liftRequired = 50; //how many times you need to press w
int inputW = 0;
PImage GuyWeight;
PImage GuyLift;
int physicalMinigameWin = 0;
//timers
float timerX = -640;
float speedX = 2; //sets the time to ~60 seconds
//time button and weeks
int week = 1;
//games played
int gamesPlayed = 0;
int counter = 0;
void setup() { //runs program once at program launch
  size(1280, 720, P2D); //720p resolution
  smooth(8); //anti-aliasing x8
  titlePic = loadImage("umbc_air.png"); //background of the starting page
  Pic2 = loadImage("mainScreen.png"); //background of week 1 screen
  //Images for gym minigame
  GuyWeight = loadImage("mang1.png");
  GuyLift = loadImage("mang2.png");
  gym = loadImage("UMBC_GYM.jpg");
  financialStat = int(random(25, 75));
  socialStat = int(random(25, 75));
  gradeStat = int(random(25, 75));
  healthStat = int(random(25, 75));
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
    workMinigame();
  }
  if ( isPhysicalWin == true ) {
    physicalWin();
  }
  if ( isPhysicalLose == true ) {
   physicalLose(); 
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
  rectMode(CENTER);
  fill(255, 255, 255, 150);
  rect(width/2, height/2, width, height);
  /* buttons */
  stroke(255);

  //study text highlight
  fill(288, 208, 10, 120);
  rect(width - 128, height - 64, 60, 40);
  //study button
  fill(0);
  textSize(20);
  text("Study", width - 128, height - 58);
  float studyButtonX = width-64; //678 in 1920
  float studyButtonY = height - 64; //776 in 1080
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

  //physical text highlight
  fill(220, 20, 60, 120);
  rect(width - 137, height - 128, 84, 40);
  //physical button
  fill(0);
  textSize(20);
  text("Workout", width - 136, height - 120);
  float physicalButtonX = width-64; //802 in 1920
  float physicalButtonY = height - 128; //776 in 1080;
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

  //work text highlight
  fill(124, 252, 0, 120);
  rect(width - 128, height - 194, 60, 40);
  //work button
  fill(0);
  textSize(20);
  text("Work", width - 128, height - 188);
  float workButtonX = width-64;
  float workButtonY = height - 192;
  int workButtonColor = 0;
  if ( mouseX >= workButtonX-27.5 && mouseY >= workButtonY-27.5 && mouseX <=  workButtonX+27.5 && mouseY <= workButtonY+27.5 ) {
    workButtonColor = workButtonColor + 255;
  }
  if (mousePressed && mouseX >=  workButtonX-27.5 && mouseY >= workButtonY-27.5 && mouseX <=  workButtonX+27.5 && mouseY <= workButtonY+27.5 ) {
    isMainScreen = false;
    isSocialMinigame = true;
    return;
  }
  fill(workButtonColor);
  ellipse(workButtonX, workButtonY, 55, 55);

  //time text highlight
  fill(255, 255, 255, 120);
  rect(width - 166, height - 256, 130, 40);
  //time button
  fill(0);
  textSize(20);
  text("Advance Week", width - 166, height - 248);
  float timeButtonX = width-64;
  float timeButtonY = height - 256;
  int timeButtonColor = 0;
  if ( mouseX >= timeButtonX-27.5 && mouseY >= timeButtonY-27.5 && mouseX <=  timeButtonX+27.5 && mouseY <= timeButtonY+27.5 ) {
    timeButtonColor = timeButtonColor + 255;
  }

  fill(timeButtonColor);
  ellipse(timeButtonX, timeButtonY, 55, 55);
  fill(0);
  textSize(26);
  text("Week "+ week, width/16, height/16);

  /* stat bar */
  //financial stat highlight
  fill(124, 252, 0, 120);
  rect(width/8, height -  70, 164, 50);
  //financial stat
  textSize(32);
  fill(0);
  text("Money: $" + int(financialStat), width/8, height - 60);

  //grade bar text
  fill(288, 208, 10, 120);
  rect(width/4, height -  112, 86, 42);
  fill(0);
  textSize(26);
  text("Grades", width/4, height-106);
  //grade bar
  rectMode(CORNER);
  rect(width/20, height - 128, 200, 26, 90);
  noStroke();
  fill(288, 208, 10);
  rect(width/20, height - 128, gradeStat * 2, 26, 90);
  textSize(16);
  fill(255);
  text(int(gradeStat) + "%", width/8 + 8, height - 110);

  //health bar text
  rectMode(CENTER);
  stroke(255);
  fill(220, 20, 60, 120);
  rect(width/4, height - 158, 86, 42);
  fill(0);
  textSize(26);
  text("Health", width/4, height-150);
  //health bar
  rectMode(CORNER);
  rect(width/20, height - 172, 200, 26, 90);
  noStroke();
  fill(220, 20, 60);
  rect(width/20, height - 172, healthStat * 2, 26, 90);
  textSize(16);
  fill(255);
  text(int(healthStat) + "%", width/8 + 8, height - 154);
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
  background(255);
  image(gym, 0, 0);
  if ( isGuyWeight == true ) {
    image(GuyWeight, 500, 200);
  }
  textSize(24);
  fill(0);
  text("Press W 50 times before the time runs out!", width/2, 75);
  if (liftRequired == 0) { //when the requirement goes all the way down to zero a win screen appears
    isPhysicalWin = true;
  }
  if ( isGuyWeight == false ) {
    image(GuyLift, 500, 200);
  }
  //timer
  if ( timerX != 640 ) {
    timerX = timerX + speedX;
  }
  fill(255, 0, 0);
  rect(timerX, 0, 1280, 64);
  if ( timerX == 640 ) {
    isPhysicalLose = true;
  }
  text("You have to press W " + liftRequired + " more times!", width/2, 95);
}

void physicalWin() {
  isPhysicalMinigame = false;
  if (liftRequired == 0  && counter == 0) { //when the requirement goes all the way down to zero a win screen appears
    healthStat = healthStat + 10;
    counter = 1;
  } else if (liftRequired == 0 && counter == 1) {
    background(200, 100, 0);
    textSize(100);
    fill(255);
    text("Wowza! Great Job!", width/2, height/2-80);
    text("Your health stat is now " + healthStat + "!", width/2, height/2+64);
  } else if (liftRequired != 0 && counter == 1) {
    counter = 0;
  }
  //button
  float timeButtonX = width/2;
  float timeButtonY = height-200;
  int timeButtonColor = 0;
  if ( mouseX >= timeButtonX-27.5 && mouseY >= timeButtonY-27.5 && mouseX <=  timeButtonX+27.5 && mouseY <= timeButtonY+27.5 ) {
    timeButtonColor = timeButtonColor + 255;
  }
  if (mousePressed && mouseX >=  timeButtonX-27.5 && mouseY >= timeButtonY-27.5 && mouseX <=  timeButtonX+27.5 && mouseY <= timeButtonY+27.5) {
    isMainScreen = true;
    isPhysicalWin = false;
    return;
  }
  textSize(24);
  text("Return to Main Menu", width/2, height-120);

  fill(timeButtonColor);
  ellipse(timeButtonX, timeButtonY, 55, 55);
  fill(0);
  textSize(24);
  text("Week "+ week, width/2, height/16);
}
void physicalLose() { //if you lose the physical minigame
  isPhysicalMinigame = false;
  if ( timerX == 640 && counter == 0 ) {
    healthStat = healthStat - 10;
    counter = 1;
  } else if ( timerX == 640 && counter == 1 ) {
    background(255, 0, 0);
    textSize(100);
    fill(255);
    text("You lose!", width/2, height/2-80);
    text("Your health stat is now" + healthStat + "!", width/2, height/2+64);
  } else if (timerX != 640 && counter == 1) {
    counter = 0;
  }
  float timeButtonX = width/2;
  float timeButtonY = height-200;
  int timeButtonColor = 0;
  if ( mouseX >= timeButtonX-27.5 && mouseY >= timeButtonY-27.5 && mouseX <=  timeButtonX+27.5 && mouseY <= timeButtonY+27.5 ) {
    timeButtonColor = timeButtonColor + 255;
  }
  if (mousePressed && mouseX >=  timeButtonX-27.5 && mouseY >= timeButtonY-27.5 && mouseX <=  timeButtonX+27.5 && mouseY <= timeButtonY+27.5) {
    isMainScreen = true;
    isPhysicalLose = false;
    return;
  }
  textSize(24);
  text("Return to Main Menu", width/2, height-120);

  fill(timeButtonColor);
  ellipse(timeButtonX, timeButtonY, 55, 55);
  fill(0);
  textSize(24);
  text("Week "+ week, width/2, height/16);
}









//key pressed commands for minigames
void keyPressed() {
  //physical minigame
  if (key == 'w' && isPhysicalMinigame == true) {
    isGuyWeight = false;
  }
}
//key released commands for minigames
void keyReleased() {
  //physical minigame
  if (key == 'w' && liftRequired > 0 && isPhysicalMinigame == true) {
    liftRequired = liftRequired - 1; //pressing w drops the amount needed
    isGuyWeight = true;
  }
}

//this progresses time only if you have played a minigame
void mouseReleased() {
  float timeButtonX = width-64;
  float timeButtonY = height - 256;
  if (mouseX >=  timeButtonX-27.5 && mouseY >= timeButtonY-27.5 && mouseX <=  timeButtonX+27.5 && mouseY <= timeButtonY+27.5 ) {
    week = week + 1;
    liftRequired = 50;
    financialStat = financialStat - 10;
    timerX = -640;
  }
}

void workMinigame() {
  //background
}
