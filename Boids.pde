class Boids {
  float x, y;
  int num;
  PVector vec = new PVector();

  Boids(int num_) {
    x = random(width);
    y = random(height);
    num = num_;
    //vec.set(0, -1);
    vec.set(x-random(width), y - random(height));
  }
  void distance() {
    float dx, dy, dst, n, mx, my, kx, ky;
    dst = 0;

    PVector angl = new PVector();
    for (int i = 0; i<boidnum; i++) {
      dx = boid[i].x;
      dy = boid[i].y;
      n = 0;
      mx = 0;
      my = 0;
      for (int j = 0; j<boidnum; j++) {
        kx = boid[j].x;
        ky = boid[j].y;
        if ((abs(x-kx)+abs(y-ky) < centerdist)) {
        //  if(abs(vec.heading()-PVector.angleBetween(vec,boid[j].vec))>3*PI/4);
          n++;
          mx+=kx;
          my+=ky;
        }
      }
      mx /= n;
      my /= n;
      if ((i != num)&(abs(x-dx)+abs(y-dy) < mindist)) {
        dst = map(abs(x-dx)+abs(y-dy), 0, mindist, 0, 1);
        vec.lerp(boid[i].vec, sameAngleLerp*(1-dst)).normalize();
        vec.lerp(PVector.fromAngle(angl.set(x-mx, y-my).heading()).div(7), dst*centreLerp).normalize();
        vec.lerp(PVector.fromAngle(angl.set(x-dx, y-dy).heading()+PI).div(10*distanceLerp), distanceLerp*(1-dst));
      }
    }
  }

  void show() {
    //  vec.set(x-random(width), y - random(height));
    x -= speed* cos(vec.heading());
    y -= speed* sin(vec.heading());
    distance();
    //vec.set(vec.x+random(-0.1,0.1),vec.y+random(-0.1,0.1));
    if (x >= width) {
      x -= width;
    }
    if (x <= 0) {
      x += width;
    }
    if (y >= height) {
      y -= height;
    }
    if (y <= 0) {
      y += height;
    }
    boid[1].x = mouseX;
    boid[1].y = mouseY; 
    triangle(x-+siz*cos(vec.heading()), y- siz/2*sin(vec.heading()), x+siz/2*cos(vec.heading()-PI/3), y+ siz/2*sin(vec.heading()-PI/3), x+siz/2*cos(vec.heading()+PI/3), y+siz/2*sin(vec.heading()+PI/3));
  }
}
