PImage fireball;
int draw;
float dimensions;

void setup() {
  draw = 1;
  size(800,800);
  background(255);
  fireball = loadImage("fireball.png");
}

void draw() {
  //toolbar
  fill(200);
  noStroke();
  rect(0,700,800,100);
  //stamp
  fill(255);
  tactile(50,725,50,50);
  rect(50,725,50,50);
  image(fireball, 50, 725, 50, 50);

}

void drawFireball() {
  if (mouseY < 700 && draw == 1) {
    image(fireball, mouseX-25, mouseY-25, 50, 50);
  }
}

void mouseDragged() {
  if (mouseY < 700 && draw == 2) {
    strokeWeight(5);
    stroke(0);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }

  drawFireball();
}

void mousePressed() {
  drawFireball();
}

void mouseReleased() {
//activates stamp
  if (mouseX > 50 && mouseX < 100 && mouseY > 725 && mouseY < 775) {
    draw = 1;
  }
}

void tactile(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    fill(255);
  } else {
    fill(200);
  }

}
