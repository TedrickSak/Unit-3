float sliderY;
float diameter;

void setup() {
  size(500,500);
  strokeWeight(5);
  sliderY = 250;

}

void draw() {
  background(255);
  line(100,50,100,450);
  fill(255);
  circle(100,sliderY,30);
  fill(10,100,10);
  diameter = map(sliderY,50,450,100,200);
  circle(300,250,diameter);
}

void slide() {
  if (mouseX < 115 && mouseX > 85 && mouseY > 50 && mouseY < 450) {
    sliderY = mouseY;
  }
}

void mouseDragged() {
  slide();
}

void mouseReleased() {
  slide();
}
