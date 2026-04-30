// Almas Alzahrani || Apr 14 2026 || Tank Game
PImage bg;
Tank tank1;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
int score;
Timer obsTimer, puTimer;

void setup() {
  size(750, 750);
  bg = loadImage("bg1.png");
  tank1 = new Tank();
  //obstacles.add(new Obstacle(250, 250));
  // obstacles.add(new Obstacle(25, 400));
  //obstacles.add(new Obstacle(150, 200));
  score = 0;
  obsTimer = new Timer(1000);
  obsTimer.start();
  puTimer = new Timer(5000);
  puTimer.start();
}

void draw () {
  background(127);
  imageMode(CORNER);
  image(bg, 0, 0);
  // add timer to distrbuite obstacles
  if (obsTimer.isFinished()) {
    obsTimer.start();
    obstacles.add(new Obstacle(50, 50));
  }
  if (puTimer.isFinished()) {
    puTimer.start();
    powerups.add(new PowerUp());
    puTimer.start();
  }
  tank1.display();

  // diplaying obstacles
  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle obs = obstacles.get(i);
    obs.display();
    obs.move();

    if (obs.reachedSide()) {
      obstacles.remove(i);
    }
  }
  //displaying progectiles
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);
    p.display();
    p.move();
    if (p.reachedSide()) {
      projectiles.remove(i);
    }
  }

  //display & remove powerups
  for (int i = 0; i < powerups.size(); i++) {
    PowerUp pu = powerups.get(i);
    pu.display();
    pu.move();
    if (pu.reachedSide()) {
      powerups.remove(pu);
    }
    if (pu.intersect(tank1)) {
      if (pu.type == 'h') {
        tank1.health = tank1.health + 100;
        powerups.remove(pu);
      } else if (pu.type == 'a') {
        tank1.laserCount = tank1.laserCount + 50;
        powerups.remove(pu);
      } else if (pu.type == 't') {
        tank1.turretCount = tank1.turretCount + 100;
        powerups.remove(pu);
      }
    }
  }
}
void scorePanel() {
  fill(127, 127);
  rectMode(CENTER);
  rect(width/2, 30, width/2, 60);
  fill(255);
  textSize(30);
  text("Score:" + score, width/2, 50);
  text("Health:" + tank1.health, width/2, -150);
  text("Ammo:" + tank1.laserCount, width/2+150, 25);
}

void keyPressed() {
  if (key == 'w') {
    tank1.move('w');
  } else if (key == 's') {
    tank1.move('s');
  } else if (key == 'd') {
    tank1.move('d');
  } else if (key == 'a') {
    tank1.move('a') ;
  }
}

void mousePressed() {
  if (tank1.turretCount == 1) {
    projectiles.add(new Projectile(tank1.x, tank1.y));
  } else if (tank1.turretCount == 2) {
    projectiles.add(new Projectile(tank1.x, tank1.y));
    projectiles.add(new Projectile(tank1.x, tank1.y));
  }
}
