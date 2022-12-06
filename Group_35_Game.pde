/************************************
 **  GROUP 35 GAME                 **
 **  Mike, Jana, RJ, Josh, Stanley **
 **  11/13/2022                    **
 **  SP2 DEMO                      **
 ************************************/
//global variables
PImage titlePic; //woah how cool
PImage Pic2;
PImage gym;
PImage uniCenter;
boolean isTitleScreen = true;
boolean isMainScreen = false;
boolean isHealthMinigame = false;
boolean isStudyMinigame = false;
boolean isMentalMinigame = false;
boolean isPhysicalMinigame = false;
boolean isWorkMinigame = false;
boolean isMidtermMinigame = false;
boolean isFinalMinigame = false;
boolean isPhysicalWin = false;
boolean isPhysicalLose = false;
boolean isGuyWeight = true;
boolean screen1;
boolean screen2;
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
//midterm
float JetPlayerX = 576/2 - 32; //player's starting x position
float JetPlayerY = 704; //player's starting y position
float xDeltaJETPLAYER = 5; //player's x speed
float yDeltaJETPLAYER = xDeltaJETPLAYER; //player's y speed
float xDeltaWRONGS = 5;//Wrongs x speed
float xDeltaRIGHTS = 5; //Rights x speed
float yDeltaWRONGS = xDeltaWRONGS; //Wrongs y speed
final int NUM_RIGHTS = 3; //number of rights in game
final int NUM_WRONGS = 3; //number of wrongs in game
final int NUM_STARS = 10; //number of stars in background
int RIGHTS_REMAINING = NUM_RIGHTS; //counts number of rights on screen
float RightsX = 800; //declares RightsX array
float RightsY = 800; //declares RightsY array
float[] WrongsX = new float [NUM_WRONGS]; //declares RightX array
float[] WrongsY = new float [NUM_WRONGS]; //declares WrongX array
float[] StarsX = new float [NUM_STARS]; //declares StarsX array
float[] StarsY = new float [NUM_STARS]; //declares StarsY array
PImage Jetpack; //player character
PImage JetHit;//player getting hit
PImage Midterm; //Midterm image
PImage Midterm2; //Midterm second idle animation
//work
PImage starbucks; //work background
PImage workPlayer; // player for work
int midtermDelta = 2; //midterm speed
float MidtermX = 600; //midterm's x location
float MidtermY = 10; //midterm's y location
boolean isMidLeft = false;
boolean isMidRight = false;
int MaxWidth = 500; //empty health bar
int rectWidth = 500; //health
int MaxWidthMT = 500; //midterm health bar
int rectWidthMT = 500; //midterm health
int rectDelta = 1; //amount of pixels the players health goes down when touching wrongs
int rectDeltaMT = 25; //amount of pixels the midterms health goes down when player touches rights
boolean isJetHit = false; //declares the player getting hit animation is currently false
boolean isJetSafe = true; //declares the player's idle animation is currently true

boolean [] keys = new boolean[128];


public int backburner(int c, int r, int g, int b, int s, int f) {    /***********************************************/
  switch(c) {                                                        /** this variable is made to condense and     **/
  case 1:                                                            /** improve performance of the program        **/

    background(r, g, b);                                             /** boilerplate drawing code used on          **/
    textSize(s);                                                     /** game screens. The following is            **/
    fill(f);                                                         /** complete documentation on how to          **/
    break;                                                           /** use the function:                         **/
  case 2:                                                            /**                                           **/
    textSize(s);                                                     /** the function requires 6 int inputs to     **/
    fill(f);                                                         /** work, the first is the case defined as    **/
    break;                                                           /** int c, it has the following cases         **/
  case 3:                                                            /** 1 == background, textSize, & fill         **/
    fill(f);                                                         /** 2 == textSize, & fill                     **/
    break;                                                           /** 3 == fill                                 **/
  }                                                                  /**                                           **/
  return 0;                                                          /** the next 3 ints are for the background    **/
}                                                                    /** they are labeled r g b in order for the   **/
/** RGB colors.                               **/
/** the next two are for textSize and fill in **/
/** that order.                               **/
/**                                           **/
/** if you are using cases 2 or 3 please      **/
/** leave all unused variables as 0           **/
/** Ex backburner(3, 0, 0, 0, 0, 125);        **/
/***********************************************/

//public void buttonBackburner( int buttonX, int buttonY, int buttonColor, boolean screen1, boolean screen2, int tSize, String buttonText, int x, int y ) {
//    if ( mouseX >= buttonX-27.5 && mouseY >= buttonY-27.5 && mouseX <=  buttonX+27.5 && mouseY <= buttonY+27.5 ) {
//        buttonColor = buttonColor + 255;
//    }
//    if (mousePressed && mouseX >=  buttonX-27.5 && mouseY >= buttonY-27.5 && mouseX <=  buttonX+27.5 && mouseY <= buttonY+27.5) {
//        screen1 = true;
//        screen2 = false;
//        return;
//    }
//    textSize(tSize);
//    text("" + buttonText, x, y);

//    fill(buttonColor);
//    ellipse(buttonX, buttonY, 55, 55);
//}

void setup() { //runs program once at program launch
  size(1280, 720); //720p resolution
  smooth(8); //anti-aliasing x8
  titlePic = loadImage("umbc_air.png"); //background of the starting page
  Pic2 = loadImage("mainScreen.png"); //background of week 1 screen
  //Images for gym minigame
  GuyWeight = loadImage("player_weight.png");
  GuyLift = loadImage("player_lift.png");
  gym = loadImage("UMBC_GYM.jpg");
  financialStat = int(random(25, 75));
  socialStat = int(random(25, 75));
  gradeStat = int(random(25, 75));
  healthStat = int(random(25, 75));
  //midterm character setup
  size(1280, 720);
  background(0, 255, 0);
  Jetpack = loadImage("player_jetpack.png"); //loads player image
  JetHit = loadImage("player_jetpack_hit.png"); //loads player hit image
  Midterm = loadImage("midterm.png"); //loads midterm image
  Midterm2 = loadImage("midterm2.png"); //loads second midterm image
  uniCenter = loadImage("uniCenter.png"); //loads uniCenter image
  //work
  starbucks = loadImage("UMBC_STARBUCKS.jpg"); //loads starbucks
  workPlayer = loadImage("GritLife_Player_Work.png"); //loads player
  //places Right answer block on the screen
  placeRights();

  //places Wrong answer blocks on the screen
  placeWrongs();

  //places star blocks in the background
  placeStars();
  /***myPerson = new Person();***/
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
  if ( isWorkMinigame == true ) {
    workMinigame();
  }
  if ( isMidtermMinigame == true ) {
    midtermMinigame();
  }
  if ( isPhysicalWin == true ) {
    physicalWin();
  }
  if ( isPhysicalLose == true ) {
    physicalLose();
  }
  if ( isFinalMinigame == true ) {
    midtermMinigame();
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
  backburner(2, 0, 0, 0, 144, 0); //textsize 144 and black text
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
  String Play = "Play";
  stroke(255);
  fill(playButtonColor);
  rect(playButtonX, playButtonY, 280, 104);
  backburner(2, 0, 0, 0, 72, 255); //text size 72 and white text
  text("" + Play, width/2, height/2);
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
  backburner(2, 0, 0, 0, 20, 0);//text size 20 and black text
  text("Study", width - 128, height - 58);
  float studyButtonX = width - 64; //678 in 1920
  float studyButtonY = height - 64; //776 in 1080
  int studyButtonColor = 0;
  if ( mouseX >= studyButtonX-27.5 && mouseY >= studyButtonY-27.5 && mouseX <= studyButtonX+27.5 && mouseY <= studyButtonY+27.5 ) {
    studyButtonColor = studyButtonColor + 255;
  }
  if (mousePressed && mouseX >= studyButtonX-27.5 && mouseY >= studyButtonY-27.5 && mouseX <= studyButtonX+27.5 && mouseY <= studyButtonY+27.5 ) {
    isMainScreen = false;
    isStudyMinigame = true;
  }
  float midtermButtonX = width/2 - 200;
  float midtermButtonY = height/2;
  int midtermButtonColor = 0;
  if (week == 7 || week == 14) {
  if (mouseX >= midtermButtonX && mouseY >= midtermButtonY && mouseX <=  midtermButtonX + 400 && mouseY <= midtermButtonY + 100 ) {
    midtermButtonColor = midtermButtonColor + 255;
  }
  if (mousePressed && mouseX >= midtermButtonX && mouseY >= midtermButtonY && mouseX <=  midtermButtonX + 400 && mouseY <= midtermButtonY + 100 ) {
    midtermMinigame();
    return;
  }
  }
  backburner(2, 0, 0, 0, 20, 0);//text size 20 and black text
  rectMode(CENTER);
  fill(studyButtonColor);
  ellipse(studyButtonX, studyButtonY, 55, 55);

  //physical text highlight
  fill(220, 20, 60, 120);
  rect(width - 137, height - 128, 84, 40);
  //physical button
  fill(0);
  text("Workout", width - 136, height - 120);
  float physicalButtonX = width - 64; //802 in 1920
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
  text("Work", width - 128, height - 188);
  float workButtonX = width-64;
  float workButtonY = height - 192;
  int workButtonColor = 0;
  if ( mouseX >= workButtonX-27.5 && mouseY >= workButtonY-27.5 && mouseX <=  workButtonX+27.5 && mouseY <= workButtonY+27.5 ) {
    workButtonColor = workButtonColor + 255;
  }
  if (mousePressed && mouseX >=  workButtonX-27.5 && mouseY >= workButtonY-27.5 && mouseX <=  workButtonX+27.5 && mouseY <= workButtonY+27.5 ) {
    isMainScreen = false;
    isWorkMinigame = true;
    return;
  }
  fill(workButtonColor);
  ellipse(workButtonX, workButtonY, 55, 55);

  //time text highlight
  fill(255, 255, 255, 120);
  rect(width - 166, height - 256, 130, 40);
  //time button
  fill(0);
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
  
  if (week == 7 || week == 14) {
  rectMode(CORNER);
  fill(midtermButtonColor);
  rect(midtermButtonX, midtermButtonY, 400, 100);
  fill(255);
  textSize(50);
  text("Midterm", width/2, height/2 + 60);
  }
  
  /* stat bar */
  //financial stat highlight
  rectMode(CENTER);
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

void midtermMinigame() {
  isMainScreen = false;
  isStudyMinigame = false;
  isMidtermMinigame = true;

  background(0, 0, 50); //blue background

  //create stars in background
  drawStars();

  //moves stars to go across the background
  moveStars();

  //creates midterm boss on the right
  drawMidterm();

  //creates player character
  drawJetPlayer();

  //creates positive items (Correct answer C)
  drawRights();

  //creates negative items (Wrong answer A, B, D)
  drawWrongs();

  //move player up, down, left, right
  movePlayer();

  //check bounds and keep player from going too far off screen or too close to boss
  restrictPlayer();

  //has wrong answers move left spawn back from the midterm one they go pass screen
  moveWrongs();

  //has right answer move left and spawn back from midterm once off screen or collected
  moveRights();

  //creates the player's health bar
  drawPlayerHealth();

  //creates the midterm's health bar
  drawMidtermHealth();

  //controlls midterm direction to left
  ChangeMidtermDir();

  //controls midterm direction to right
  ChangeMidtermDir2();

  //endscreens for midterm
  midtermEnd();
}
//draws player at the given playerX, playerY
void drawJetPlayer() {
  if (isJetSafe == true) {
    image(Jetpack, JetPlayerX, JetPlayerY, 64, 128);
  } else {
    isJetSafe = false;
    image(JetHit, JetPlayerX, JetPlayerY, 64, 128);
  }
}

//draws number of rights required by the for loop
void drawRights() {
  for (int i = 0; i < NUM_RIGHTS; i++) {
    fill(0, 255, 0); //white
    rect(RightsX, RightsY, 64, 64); //block

    //when player touches right answer, it disappears and decreases midterm health
    if ((JetPlayerX >= RightsX && JetPlayerX <= RightsX + 64) &&
      (JetPlayerY >= RightsY && JetPlayerY <= RightsY + 64)) {

      rectWidthMT -= rectDeltaMT;
      RightsX = -500;
      RightsY = -500;
    }
    if ((JetPlayerX + 64>= RightsX && JetPlayerX + 64<= RightsX + 64) &&
      (JetPlayerY + 128 >= RightsY && JetPlayerY + 64 <= RightsY + 64)) {
      rectWidthMT -= rectDeltaMT;
      RightsX = -500;
      RightsY = -500;
    }
    if ((JetPlayerX + 64>= RightsX && JetPlayerX + 64<= RightsX + 64) &&
      (JetPlayerY >= RightsY && JetPlayerY <= RightsY + 64)) {

      rectWidthMT -= rectDeltaMT;
      RightsX = -500;
      RightsY = -500;
    }
    if ((JetPlayerX >= RightsX && JetPlayerX <= RightsX + 64) &&
      (JetPlayerY + 128 >= RightsY && JetPlayerY + 64 <= RightsY + 64)) {

      rectWidthMT -= rectDeltaMT;
      RightsX = -500;
      RightsY = -500;
    }
  }
}

//draws number of wrong answers required by the for loop
void drawWrongs() {
  for (int i = 0; i < NUM_WRONGS; i++) {
    fill(255); //white
    rect(WrongsX[i], WrongsY[i], 64, 64); //block
    //when player touches wrong answer, their health decreases
    if ((JetPlayerX >= WrongsX[i] && JetPlayerX <= WrongsX[i] + 64) &&
      (JetPlayerY >= WrongsY[i] && JetPlayerY <= WrongsY[i] + 64)) {

      rectWidth -= rectDelta;
      isJetSafe = false;
      isJetHit = true;
      if (isJetHit == true) {
        image(JetHit, JetPlayerX, JetPlayerY, 64, 128);
      }
    }

    if ((JetPlayerX + 64>= WrongsX[i] && JetPlayerX + 64<= WrongsX[i] + 64) &&
      (JetPlayerY + 128 >= WrongsY[i] && JetPlayerY + 64 <= WrongsY[i] + 64)) {

      rectWidth -= rectDelta;
      isJetSafe = false;
      isJetHit = true;
      if (isJetHit == true) {
        image(JetHit, JetPlayerX, JetPlayerY, 64, 128);
      }
    }
    if ((JetPlayerX + 64>= WrongsX[i] && JetPlayerX + 64<= WrongsX[i] + 64) &&
      (JetPlayerY >= WrongsY[i] && JetPlayerY <= WrongsY[i] + 64)) {

      rectWidth -= rectDelta;
      isJetSafe = false;
      isJetHit = true;
      if (isJetHit == true) {
        image(JetHit, JetPlayerX, JetPlayerY, 64, 128);
      }
    }
    if ((JetPlayerX >= WrongsX[i] && JetPlayerX <= WrongsX[i] + 64) &&
      (JetPlayerY + 128 >= WrongsY[i] && JetPlayerY + 64 <= WrongsY[i] + 64)) {

      rectWidth -= rectDelta;
      isJetSafe = false;
      isJetHit = true;
      if (isJetHit == true) {
        image(JetHit, JetPlayerX, JetPlayerY, 64, 128);
      }
    }
  }
}

//draws Midterm enemy
void drawMidterm() {
  MidtermX -= midtermDelta;
  if (isMidLeft == true) {
    image( Midterm, MidtermX, MidtermY, 1080, 720);
  }
  if (isMidRight == true) {
    image( Midterm2, MidtermX, MidtermY, 1080, 720);
  }
}

void ChangeMidtermDir() {
  if (MidtermX == 550) {
    midtermDelta *= -1;
    isMidLeft = true;
  }
}

void ChangeMidtermDir2() {
  if (MidtermX == 750) {
    midtermDelta *= -1;
    image( Midterm2, MidtermX, MidtermY, 1080, 720);
    isMidRight = true;
  }
}

//draws Stars in background
void drawStars() {
  for (int i = 0; i < NUM_STARS; i++) {
    noStroke();
    fill(255);
    rect(StarsX[i], StarsY[i], 5, 5);
  }
}

//draws the Player's health bar and health
void drawPlayerHealth() {
  fill(200); //empty health bar
  rect(0, 0, MaxWidth, 64);

  fill(0, 0, 255); //health
  rect(0, 0, rectWidth, 64);
}

//draws the Midterm's health bar and health
void drawMidtermHealth() {
  rectMode(CORNER);
  fill(200); //empty midterm health bar
  rect(780, 0, MaxWidthMT, 64);

  fill(255, 0, 0); //midterm health
  rect(780, 0, rectWidthMT, 64);
}

//moves player up, down, left, right
void movePlayer() {
  if (keyPressed) { //moves player right
    if (keys['d']) {
      JetPlayerX += xDeltaJETPLAYER;
    }
  }

  if (keyPressed) { //moves player down
    if (keys['s']) {
      JetPlayerY += yDeltaJETPLAYER;
    }
  }

  if (keyPressed) { //moves player left
    if (keys['a']) {
      JetPlayerX -= xDeltaJETPLAYER;
    }
  }

  if (keyPressed) { //moves player up
    if (keys['w']) {
      JetPlayerY -= yDeltaJETPLAYER;
    }
  }
}

//player does not advance when hitting the health bar or too far down screen
void restrictPlayer() {
  if (JetPlayerY > 656) { //stops player from going too far bottom
    JetPlayerY = 656;
  }
  if (JetPlayerY < 64) { //stops player from going past health bar
    JetPlayerY = 64;
  }
  if (JetPlayerX > 700) { //stops player from getting too close to midterm
    JetPlayerX = 700;
  }
  if (JetPlayerX < 0 ) { //stops player from going left pass the screen
    JetPlayerX = 0;
  }
}

void placeRights() { //places right answer coming from midterm in a random y postion
  RightsX = 1400;
  RightsY = random(128, 720 - 128);
}

void placeWrongs() { //places each of the wrong answers in a random location between the set bounds
  for (int i = 0; i < NUM_WRONGS; i++) {
    WrongsX[0] = 1000;
    WrongsX[1] = 1200;
    WrongsX[2] = 800;
    WrongsY[i] = random(128, 720 - 128);
  }
}

void moveWrongs() { //Wrongs move left off the screen and starts from the right
  for (int i = 0; i < NUM_WRONGS; i++) {
    WrongsX[i] -= xDeltaWRONGS;
    if (WrongsX[i] < -64) {
      WrongsX[i] = 1200;
      WrongsY[i] = random(64, 720 - 128);
    }
  }
}

void moveRights() { //wrong answers move left off the screen and starts from the midterm on the right
  RightsX -= xDeltaRIGHTS;
  if (RightsX < -64) {
    RightsX = 1200;
    RightsY = random(128, 720 - 128);
  }
}

void placeStars() { //places each of the Stars in a random location between the set bounds
  for (int i = 0; i < NUM_STARS; i++) {
    StarsX[0] = 1280;
    StarsX[1] = 1100;
    StarsX[2] = 1000;
    StarsX[3] = 900;
    StarsX[4] = 800;
    StarsX[5] = 700;
    StarsX[6] = 600;
    StarsX[7] = 500;
    StarsX[8] = 400;
    StarsX[9] = 300;
    StarsY[i] = random(128, 720);
  }
}

void moveStars() { // moves stars left off the screen and starts from the right
  for (int i = 0; i < NUM_STARS; i++) {
    StarsX[i] -= xDeltaWRONGS;
    if (StarsX[i] < -64) {
      StarsX[i] = 1200;
      StarsY[i] = random(64, 720);
    }
  }
}

void midtermEnd() {
  if (rectWidthMT <= 0) {
    isMidtermMinigame = false;
    isMainScreen = true;
  }
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
  image(uniCenter, -700, -100);
  rectMode(CENTER);
  fill(255, 255, 255, 150);
  rect(width/2, height/2, width, height);
  //University Center text highlight
  fill(288, 208, 10, 120);
  rect(width-500, height-360, 200, 40);
  //University Center button
  backburner(2, 0, 0, 0, 20, 0);//text size 20 and black text
  text("University Center", width - 500, height - 350);
  //The RAC text highlight
  fill(288, 208, 10, 120);
  rect(width-780, height-360, 200, 40);
  //The RAC button
  backburner(2, 0, 0, 0, 20, 0);//text size 20 and black text
  text("The RAC", width - 780, height - 350);
  //The Commons text highlight
  fill(288, 208, 10, 120);
  rect(width-640, height-260, 200, 40);
  //The Commons button
  backburner(2, 0, 0, 0, 20, 0);//text size 20 and black text
  text("The Commons", width - 640, height - 255);
  float studyButtonX = width-500;
  float studyButtonY = height - 360;
  int studyButtonColor = 255;
  if ( mouseX >= studyButtonX-27.5 && mouseY >= studyButtonY-27.5 && mouseX <= studyButtonX+27.5 && mouseY <= studyButtonY+27.5 ) {
    studyButtonColor = studyButtonColor + 255;
  }
  if (mousePressed && mouseX >= studyButtonX-27.5 && mouseY >= studyButtonY-27.5 && mouseX <= studyButtonX+27.5 && mouseY <= studyButtonY+27.5 ) {
    isMainScreen = false;
    isStudyMinigame = true;
    return;
  }
  fill(studyButtonColor);
  rect(studyButtonX, studyButtonY, 200, 40);

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
    image(GuyWeight, 500, 50);
  }
  textSize(24);
  fill(0);
  text("Press W 50 times before the time runs out!", width/2, 75);
  if (liftRequired == 0) { //when the requirement goes all the way down to zero a win screen appears
    isPhysicalWin = true;
  }
  if ( isGuyWeight == false ) {
    image(GuyLift, 500, 50);
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

void finalMinigame() {
}
//result screens
void physicalWin() {
  isPhysicalMinigame = false;
  switch(counter) {
  case 0:
    healthStat = healthStat + 10;
    counter ++;
    break;
  case 1:
    if (liftRequired == 0 && counter == 1) {
      backburner(1, 200, 100, 0, 100, 255);
      text("Wowza! Great Job!", width/2, height/2-80);
      text("Your health stat is now " + healthStat + "!", width/2, height/2+64);
    } else {
      counter --;
    }
  }
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
  //buttonBackburner( width/2, height-200, 0, isMainScreen, isPhysicalWin, 24, "Return to Main Menu" ,width/2, height-120 );
  fill(0);
  textSize(24);
  text("Week "+ week, width/2, height/16);
}
void physicalLose() { //if you lose the physical minigame
  isPhysicalMinigame = false;
  switch(counter) {
  case 0:
    healthStat = healthStat - 10;
    counter ++;
    break;
  case 1:
    if ( timerX == 640 && counter == 1) {
      backburner(1, 200, 0, 0, 100, 255);
      text("You lose!", width/2, height/2-80);
      text("Your health stat is now" + healthStat + "!", width/2, height/2+64);
    } else {
      counter --;
    }
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
  //midterm
  keys[key] = true;
}

//key released commands for minigames
void keyReleased() {
  //physical minigame
  if (key == 'w' && liftRequired > 0 && isPhysicalMinigame == true) {
    liftRequired = liftRequired - 1; //pressing w drops the amount needed
    isGuyWeight = true;
  }
  //midterm
  keys[key] = false;
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
    counter = 0;
  }
}

void workMinigame() {
  //background
  background(0);
  image(starbucks, 0, 0);
  image(workPlayer, width/2-170, 160);
  fill(0);
  rect(640, 56, 1280, 72);
  textSize(72);
  fill(245, 245, 0); //yellow
  text("You pulled a shift at the UMBC Starbucks", width/2, 75);
  switch(counter) {
  case 0:
    financialStat = financialStat + 10;
    counter ++;
    break;
  case 1:
    if (  counter == 1 ) {
      fill(0);
      rect(width/2+350, height/2-226, 546, 72);
      fill(0, 255, 0);
      text("You now have $" + financialStat, width/2+350, height/2-200);
    } else {
      counter --;
    }
  }
  //button

  float timeButtonX = width/2+310;
  float timeButtonY = height-400;
  int timeButtonColor = 0;
  if ( mouseX >= timeButtonX-27.5 && mouseY >= timeButtonY-27.5 && mouseX <=  timeButtonX+27.5 && mouseY <= timeButtonY+27.5 ) {
    timeButtonColor = timeButtonColor + 255;
  }
  if (mousePressed && mouseX >=  timeButtonX-27.5 && mouseY >= timeButtonY-27.5 && mouseX <=  timeButtonX+27.5 && mouseY <= timeButtonY+27.5) {
    isMainScreen = true;
    isWorkMinigame = false;
    return;
  }
  fill(245, 245, 0); //yellow
  ellipse(timeButtonX, timeButtonY, 110, 110);
  fill(timeButtonColor);
  ellipse(timeButtonX, timeButtonY, 55, 55);
  fill(225);
  textSize(24);
  text("Return to Main Menu", width/2+310, height-320);
}
