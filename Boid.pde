int boidnum = 100;
Boids[] boid = new Boids[boidnum];
float siz = 10;
float speed = 5;
float mindist = 100;
float centerdist = 300;
float sameAngleLerp = 0.1; //0 for old 1 for new
float distanceLerp = 0.1;
float centreLerp = 0.2;

void setup() {
  size(1280, 720);
  for (int i = 0; i<boidnum; i++) {
    boid[i] = new Boids(i);
  }
  
}


void draw() {
  background(255);
  for(int i = 0;i<boidnum;i++){
  boid[i].show();
  } 
} 
