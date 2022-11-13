/************
 **  GROUP 35 GAME
 **  Mike, Jana, RJ, Josh, Stanley
 **  11/13/2022
 ************/
//global variables


Boolean isTitleScreen = true;
boolean isNameScreen;

void setup() { //runs program once at program launch
  fullScreen(); //sets the game window size to the full screen of device
  smooth(8); //anti-aliasing x8
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
  mainScreen(); //calling void mainScreen()
  victoryScreen(); //calling void victoryScreen()
  lossScreen(); //calling void lossScreen()
}
//minigame call function
void minigames() {
  studyMinigame();
  healthMinigame();
}

/****** GAME SCREENS ******/

/*** GAME START SCREENS ***/

//titlescreen
void titleScreen() { //main title function
  /* background */
  background(0);
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
    nameScreen();
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


//Naming Screen
void nameScreen() { // main function calling all name screen functions
  /* background */
  int nameButtonX = width/2;
  int nameButtonY = height/2;
  background(0);
  fill(255);
  rect(nameButtonX, nameButtonY, 128, 128);
}


/*** END GAME SCREENS ***/

//victory scenario
void victoryScreen() {
}

//loss scenario
void lossScreen() {
}

//Main Screen
void mainScreen() {
  statBarMain();
}

void statBarMain() {
}
/****** MINIGAMES ******/
/*** study minigame ***/
void studyMinigame() { //function for entire study minigame
}
//background
/*** health minigame ***/
void healthMinigame() { //function for entire health minigame
}
//background
