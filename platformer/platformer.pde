Player tim;
Obstacle wall;
boolean gameOver=false;
void setup() {
  size(400, 200);
  tim=new Player();
  wall=new Obstacle();
}

void draw() {
  background(255);
  if (gameOver) {
    fill(0);
    text("Game Over", width/2, height/2);
    return;
  }
  tim.y=mouseY;
  tim.draw();
  wall.draw();
}

class Player {
  int x, y, s=10;
  Player() {
    x=width/2;
    y=height/2;
  }

  void draw() {
    rectMode(CENTER);
    rect(x, y, s, s);
  }
}

class Obstacle {
  int x, y, w, h;
  Obstacle() {
    x=width;
    y=height/4;
    w=width/10;
    h=height/2;
  }

  void draw() {
    rectMode(CENTER);
    rect(x, y, w, h);
    x=x-5;
    if (tim.x+tim.s/2<x-w/2)return;
    if (tim.x-tim.s/2>x+w/2)return;
    if (tim.y+tim.s/2<y-h/2)return;
    if (tim.y-tim.s/2>y+h/2)return;
    gameOver=true;
  }
}

