/************
**  GROUP 35 GAME
**  Mike, Jana, RJ, Josh
*/
//global variables

void setup(){ //runs program once at program launch
  fullScreen(); //sets the game window size to the full screen of device
}

void draw(){ //runs programs at 60 fps at program launch
  noStroke(); //removes outline
  smooth(8); //anti-aliaslising x8
  startScreen(); //calls start screen function
 
}
void startScreen(){ // beginning screen of the game - input your name or character's
  background(255); //white background
}
