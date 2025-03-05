color selectedColor;
color grey = #DDDDDD;
color yellow = #F5DE0F;
color red = #B74004;
color selectedStroke;
color blue = #3293E0;
color selectedBackground; 
color lightyellow = #FFF1A2;
color pink = #FFBCEC;
color lightblue = #BCF9FF;

void setup() {
  size(500,500);
  selectedColor = yellow;
  selectedBackground = lightyellow;
}

void draw() {
  background(selectedBackground);
  fill(selectedColor);
  noStroke();
  ellipse(250,150,200,200);
  
  strokeWeight(3);
  tactile(50);
  fill(yellow);
  rect(50,350,100,100);
  
  tactile(350);
  fill(red);
  rect(350,350,100,100);
  
  tactile(200);
  fill(blue);
  rect(200,350,100,100);
}

void tactile(float x) {
  if (mouseX < x+100 && mouseX > x && mouseY < 450 && mouseY > 350) {
    stroke(255);
  } else {
    stroke(0);
  }
}

void mouseReleased() {
  if (mouseX < 150 && mouseX > 50 && mouseY < 450 && mouseY > 350) {
    selectedColor = yellow;
    selectedBackground = lightyellow;
  }
  
  if (mouseX < 450 && mouseX > 350 && mouseY < 450 && mouseY > 350) {
    selectedColor = red;
    selectedBackground = pink;
  }

  if (mouseX < 300 && mouseX > 200 && mouseY < 450 && mouseY > 350) {
    selectedColor = blue;
    selectedBackground = lightblue;
  }

}
