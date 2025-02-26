color selectedColor;
color blue = #07C8ED;
color grey = #AAAAAA;
color lightBrown = #4B3608;
color black = #000000;
color orange = #ED9107;
color purple = #380E62;

void setup() {
  size(500,500);
  selectedColor = blue;
}

void draw() {
  background(grey);
  fill(selectedColor);
  strokeWeight(10);
  stroke(lightBrown);
  rect(100,100,300,200);
  line(250,100,250,300);
  line(100,200,400,200);
  
  stroke(black);
  
  tactile(100);
  fill(blue);
  circle(100, 400, 80);
  
  tactile(250);
  fill(orange);
  circle(250, 400, 80);
  
  tactile(400);
  fill(purple);
  circle(400, 400, 80);
}

void tactile(float x) {
  if (dist(x, 400, mouseX, mouseY) < 40) {
    strokeWeight(6);
  } else {
    strokeWeight(3);
  }
}
