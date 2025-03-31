PImage fireball;
PImage pen;
PImage eraser;
PImage trash;
PImage curve;
PImage line;
int draw;
int straight;
float sliderX;
float diameter;
float radius;
color colour;
color black = #000000;
color blue = #1658F7;
float pointX;
float pointY;

void setup() {
  draw = 2;
  straight = 0;
  size(800,800);
  background(255);
  fireball = loadImage("fireball.png");
  pen = loadImage("pen.png");
  eraser = loadImage("eraser.png");
  trash = loadImage("trash.png");
  curve = loadImage("curve.png");
  line = loadImage("straight.png");
  sliderX = 100;
  colour = black;
}

void draw() {
  //toolbar
  fill(120);
  noStroke();
  rect(0,650,800,150);
  
  //fireball button
  fill(255);
  tactile(25,725,50,50);
  rect(25,725,50,50);
  image(fireball, 27, 727, 45, 45);
  
  //pen button
  tactile(100,725,50,50);
  rect(100,725,50,50);
  image(pen, 100, 720, 50, 55);
  
  //eraser button
  tactile(175,725,50,50);
  rect(175,725,50,50);
  image(eraser, 179, 730, 50, 50);
  
  //curve button
  if (mouseX > 648 && mouseX < 702 && mouseY > 733 && mouseY < 787) {
    fill(255);
  } else {
    if (straight == 0) {
      fill(0);
    } else {
      fill(200);
    }
  }
  rect(648,733,54,54);
  image(curve, 650, 735, 50, 50);

  //line button
  if (mouseX > 648 && mouseX < 702 && mouseY > 653 && mouseY < 717) {
    fill(255);
  } else {
    if (straight == 1) {
      strokeWeight(2);
      stroke(0);
    } else {
      fill(200);
    }
  }
  rect(648,663,54,54);
  image(line, 650, 665, 48, 48); 
  
  //slider
  if (mouseX < 225 && mouseX > 30 && mouseY > 660 && mouseY < 700) {
    stroke(255);
  } else {
    stroke(200);
  }
  strokeWeight(6);
  line(30,680,225,680);
  diameter = map(sliderX,30,225,3,50);
  radius = diameter / 2;
  noStroke();
  fill(colour);
  circle(sliderX,680,diameter);
  
  //trash can
  tactile(725,735,50,50);
  rect(725,735,50,50);
  image(trash, 702, 722, 100, 93);
  
  //indicator
  stroke(250);
  strokeWeight(1);
  fill(200,240,255);
  circle(-25 + 75 * draw, 780 , 10);
}

void slide() {
  if (mouseX < 225 && mouseX > 30 && mouseY > 660 && mouseY < 700) {
    sliderX = mouseX;
  }
}

void create() {
  if (mouseY < 650 && draw == 1) {
    image(fireball, mouseX-radius, mouseY-radius, diameter, diameter);
  }
  if (mouseY < 650 && draw == 2 && straight == 0) {
    strokeWeight(diameter);
    stroke(0);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  if (mouseY < 650 && draw == 3) {
    strokeWeight(diameter);
    stroke(255);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}

void mouseDragged() {
  create();
  slide();
}

void mousePressed() {
  create();
  slide();
  if (straight == 1 && draw == 2) {
    pointX = mouseX;
    pointY = mouseY;
  }
}

void mouseReleased() {
//activates stamp
  if (mouseX > 25 && mouseX < 75 && mouseY > 725 && mouseY < 775) {
    draw = 1;
  }
//activates pen
  if (mouseX > 100 && mouseX < 150 && mouseY > 725 && mouseY < 775) {
    draw = 2;
  }
//activates eraser
  if (mouseX > 175 && mouseX < 225 && mouseY > 725 && mouseY < 775) {
    draw = 3;
  }
//activates trash
  if (mouseX > 725 && mouseX < 775 && mouseY > 725 && mouseY < 775) {
    fill(255);
    noStroke();
    rect(0,0,800,650);
  }
//activates curve
  if (mouseX > 648 && mouseX < 702 && mouseY > 733 && mouseY < 787) {
    straight = 0;
  }
//activates line
  if (mouseX > 648 && mouseX < 702 && mouseY > 653 && mouseY < 717) {
    straight = 1;
  }

//draw line
  if (straight == 1 && mouseY < 650 && draw == 2) {
    strokeWeight(diameter);
    stroke(0);
    line(pointX, pointY, mouseX, mouseY);
  }
}

void tactile(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    fill(255);
  } else {
    fill(200);
  }

}
