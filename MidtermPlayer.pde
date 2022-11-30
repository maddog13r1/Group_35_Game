class Person {  
  PVector perPos, perVel;
  Person() {
    int vel = 7;
  
    perPos = new PVector(width/2, height/2);
    perVel = new PVector(vel, vel);
  }
  void perRun() {    //displays and allows movement
    perDisplay();
    perMove();
  }

  void perDisplay() {
    int personW = 50;
    int personH = 50; 
    perPos.x = constrain(perPos.x, 25, width-personW/2);
    perPos.y = constrain(perPos.y, 25, height-personH/2);
    pushMatrix();
    translate(perPos.x, perPos.y);
    rectMode(CENTER);
    rect(0, 0, personW, personH);
    popMatrix();
  }
  
  void perMove() {
    if (keys['a']){ //move left 
      perPos.x -= perVel.x;
    }
    if (keys['d']){ //move right
      perPos.x += perVel.x;
    }
    if (keys['w']){ //move up
      perPos.y -= perVel.y;
    }
    if (keys['s']){ //move down
      perPos.y += perVel.y;
    }
  }
}
