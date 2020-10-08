PGraphics cubeA;
PGraphics cubeB;

void setup() {
  size(500,500, P3D);
  cubeA = createGraphics(width, height, P3D);
  cubeB = createGraphics(width, height, P3D);
  background(0);
}

void draw () {
  //background(0);
  pushMatrix();
  translate(width*0.5, height*0.5);
  rotate(frameCount / 200.0);
  fill(random(255), random(255), random(255));
  star(100,20,5,20,6);
  star(-100,30,5,20,6);
  popMatrix();
  
  drawCubeA();
  drawCubeB();
  float alphaA = map(mouseX, 0, width, 0, 255);
  float alphaB = map(mouseY, 0, height, 0, 255);
  tint(250,5,10, alphaA);
  image(cubeA, 0, 0);
  tint(120,15,245, alphaB);
  image(cubeB, 0, 0);
  
 
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}


void drawCubeA() {
  cubeA.beginDraw();
  cubeA.lights();
  cubeA.clear();
  cubeA.stroke(2);
  cubeA.translate(width/2, height/2);
  cubeA.rotateX(frameCount/100.0);
  cubeA.rotateY(frameCount/200.0);
  cubeA.box(80);
  cubeA.endDraw();
}

void drawCubeB() {
  cubeB.beginDraw();
  cubeB.lights();
  cubeB.clear();
  cubeB.stroke(2);
  cubeB.translate(width/2, height/2);
  cubeB.rotateX(frameCount/150.0);
  cubeB.rotateY(frameCount/250.0);
  cubeB.box(80);
  cubeB.endDraw();
}

void mouseClicked (){
  fill (random(255), random(255), random(255));
  star(mouseX,mouseY,5,20,6);
}
