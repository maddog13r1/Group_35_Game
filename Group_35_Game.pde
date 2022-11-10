/************
 **  GROUP 35 GAME
 **  Mike, Jana, RJ, Josh
 ************/
//global variables

int playButtonX = width/2;
int playButtonY = height/2-33;


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
  titleScreen(); //calling void titleScreen()
  nameScreen(); //calling void nameScreen()
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
  titleBackground(); //calling void titleBackground()
  titleButtons(); //calling void titleButtons()
}
void titleBackground() { //creates background aka all non-functional UI for title
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
}
void titleButtons() { //creates buttons for title
  //play button
  stroke(255);
  fill(0);
  rect(playButtonX, playButtonY, 280, 104);
  fill(255); //white
  textSize(72); //font size
  text("PLAY", width/2, height/2);
  //play button functionality
  if ( mouseX =< playButtonX && mouseY =< playButtonY ) {
    nameScreen();
  }
}
//Naming Screen
void nameScreen() { // main function calling all name screen functions
  nameBackground(); //calling void nameBackground()
  nameButtons(); //calling void nameButtons()
  nameInput(); //calling void nameInput()
}
void nameBackground() {
}
void nameButtons() {
}
void nameInput() {
}
/*** END GAME SCREENS ***/

//victory scenario
void victoryScreen() {
  victoryButtons();
  victoryBackground();
}
void victoryButtons() {
}
void victoryBackground() {
}
//loss scenario
void lossScreen() {
  lossButtons();
  lossBackground();
}
void lossButtons() {
}
void lossBackground() {
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
  studyMinigameBackground();
  studyMinigameButtons();
}
//background
void studyMinigameBackground() {
}
//buttons
void studyMinigameButtons() {
}
/*** health minigame ***/
void healthMinigame() { //function for entire health minigame
  healthMinigameBackground();
  healthMinigameButtons();
}
//background
void healthMinigameBackground() {
}
//buttons
void healthMinigameButtons() {
}
