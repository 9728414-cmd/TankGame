// Almas Alzahrani || Apr 14 2026 || Tank Game
PImage bg;
Tank tank1; //declaring tank's name
ArrayList<Obstcale> obstcales = new ArrayList<Obstcale>();

void setup() {
  size(750, 750);
  bg = loadImage("bg1.png");
  tank1 = new Tank();
  obstcales.add(new Obstcale(100, 100));
}

void draw () {
  background(127);
  imageMode(CORNER);
  image(bg, 0, 0);

  for (int i = 0; i < obstcales.size(); i++) {
    Obstcale obs = obstcales.get(i);
    obs.display();
    obs.move();
  }

  tank1.display();
}

void keyPressed() {
  if (key == 'w') {
    tank1.move('w');
  } else if (key == 's') {
    tank1.move('s');
  } else if (key == 'd') {
    tank1.move('d');
  } else if (key == 'a') {
    tank1.move('s') ;
  }
}
