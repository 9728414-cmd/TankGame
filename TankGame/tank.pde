class Tank {
  int x, y, w, h, speed, health;
  PImage ItankW, iTankA, iTankS, iTankD;
  char idir;

  // Constructor
  Tank() {
    x = 100;
    y = 100;
    w = 100;
    h = 100;
    speed = 4;
    health = 100;
    iTankW = loadImage("Tank.png");
    iTankA = loadImage("Tank.png");
    iTankS = loadImage("Tank.png");
    iTankD = loadImage("Tank.png");
    idir = 'w';
  }

  void display() {
    rectMode(CENTER);
    fill(127);
    rect(x, y, w, h);
  }


  void move() {
    tank1.move();
    x = x + speed;
  }
}
