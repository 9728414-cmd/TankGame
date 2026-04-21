class Obstcale {
  int x, y, w, h, speed, health;
  //PImage obst1;
  char idir;

  // Constructor
  Obstcale(int x, int y) {
    this.x = x;
    this.y = y;
    x = 100;
    y = 100;
    w = 100;
    h = 100;
    speed = 4;
    health = 100;
  }

  void display() {
    rectMode(CENTER);
    fill(127);
    rect(x, y, w, h);
  }


  void move() {
    x = x + speed;
  }
}
