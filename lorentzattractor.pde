import peasy.*;
PeasyCam cam;

float x = 0.01;
float y = 0.01;
float z = 0;

//test
float a = 10;
float b = 28;
float c = 8.0/3.0;

ArrayList<PVector> points = new ArrayList<PVector>(); 

void setup(){
  size(800,600,P3D);
  colorMode(HSB);
  cam = new PeasyCam(this,500);
}

void draw(){
  background(0);
  float dt =0.01;
  float dx = a*(y - x)*dt;
  float dy = (x*(b - z)-y)*dt;
  float dz =(x*y-c*z)*dt;
  x = x+dx;
  y = y+dy;
  z = z+dz;
  points.add(new PVector(x,y,z));

   // set up auto-rotation
  float autoRotateSpeed = 0.01;
  rotateY(frameCount * autoRotateSpeed);
  translate(0,0,-300);
  scale(5);
  stroke(255);
  noFill();
  
  float hu = 0;
  beginShape();
  for (PVector v: points){
    stroke(hu % 255, 255, 255);
    vertex(v.x,v.y,v.z);
    hu++;
  }
  endShape();
};
