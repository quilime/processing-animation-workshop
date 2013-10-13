import processing.opengl.*;

Worm[] w;

void setup() {

  size(512,512, OPENGL);
  smooth();
  noStroke();
  colorMode(HSB, 360, 255, 255);

  w = new Worm[16];

  // float inc = 360/w.length;
  // for (int i =  w.length - 1; i >= 0; i--) {
  //     w[i] = new Worm( 15, 20 );
  //     w[i].p.x = width/2 + cos(i * inc);
  //     w[i].p.y = height/2 + sin(i * inc);
  // }


  /* The horizontal "radius" is one half the width;
     the vertical "radius" is one half the height */
  float wi = mouseX - width/2;
  float h = mouseY - height/2;
  int n = w.length;
  float angle = TWO_PI/ n;

  for (int i = 0; i < n; i++) {
    w[i] = new Worm( 105, 20 );
    w[i].p.x = wi * cos(angle * i);
    w[i].p.y = h * sin(angle * i);
  }


}

void draw() {
  background(40);

  if ( mousePressed) {
    // create new force vector from the mouse position minus the position of the object
    // the same as Mouse.sub(p), but this is a less verbose way to write it
    PVector force = new PVector( mouseX - w[0].p.x, mouseY - w[0].p.y );

    // reduce the force a bit so it's not extreme
    force.mult(0.1);

    // add it to the velocity
    w[0].v.add(force);
  }

  float wi = mouseX;
  float h = mouseY;
  int n = w.length;
  float angle = TWO_PI/ n;

  for (int i = 0; i < n; i++) {
    w[i].p.x = width/2 + wi * cos(angle * i);
    w[i].p.y = height/2 + h * sin(angle * i);
    w[i].draw();
  }
}




class Worm {

  PVector p, v;
  PVector[] trails;

  color c;
  float hueCycle = 0;

  float fatness = 20;

  Worm( int _length, float _fatness )
  {
    // position
    p = new PVector(width/2, height/2);

    // velocity
    v = new PVector();

    // fatness
    fatness = _fatness;

    // setup trails
    trails = new PVector[_length];
    for ( int i = trails.length-1 ; i >= 0; i--) {
      trails[i] = new PVector( random(width), random(height) );
    }
  }


  void draw()
  {
    // drag
    v.mult( 0.94 );

    // add the veloctiy to the position
    p.add( v );

    // update trails
    // set first trail to be the object we're tracing
    trails[0].x = p.x;
    trails[0].y = p.y;

    // loop through the trails array from LAST to FIRST
    // setting each vectors position to the previous one
    for ( int i = trails.length-1 ; i >= 1; i--) {
      trails[i].x = trails[i-1].x;
      trails[i].y = trails[i-1].y;
    }


    // cycle colors
    // draw trails
    hueCycle -= 5  ;
      while (hueCycle < 0 ) {
        hueCycle += 360;
      }
    for ( int i = trails.length-1 ; i >= 0; i--) {

      float curHue = hueCycle + i * 5f;
      while (curHue > 360 ) {
        curHue -= 360;
      }

      //c = color(hueCycle, 255, 255);

      float weight = (float) i / trails.length;
      float wave = sin(weight * PI);
      float ssize = (wave * fatness);
      fill( curHue, 255, 255 );
      ellipse(trails[i].x, trails[i].y, ssize, ssize);
    }
  }

}
