import processing.opengl.*;

Worm[] w;

int num_worms = 5;
int worm_length = 120;

void setup() {

  size(512, 512, OPENGL);
  smooth();
  noStroke();

  // color mode as HSB so we can cycle through the color wheel
  colorMode(HSB, 360, 255, 255);

  reset();
}

void reset() {
  w = new Worm[num_worms];
  for (int i = num_worms-1; i >= 0; i--)
    w[i] = new Worm( worm_length, 20 );
}


void keyPressed()
{
  switch (keyCode) {

    case 38 : // up
      num_worms++;
        reset();
      break;

    case 40 : // down
      num_worms--;
      if (num_worms <= 0)
        num_worms = 1;
          reset();
      break;

    case 37 : // left
      worm_length--;
      if (worm_length <= 0)
        worm_length = 1;
          reset();
      break;

    case 39 : // right
      worm_length++;
  reset();      
      break;
  }

}


void draw() {

  background(40);

  // radius of structure
  float rad = dist(mouseX, mouseY, width/2, height/2);

  // angle between each worm
  float angle = TWO_PI / w.length;

  // get the mouse angle from center for rotation
  float mouse_angle = atan2(mouseY-height/2, mouseX-width/2);

  // loop through each worm and distribute them in a circle
  for (int i = 0; i < w.length; i++) {

    float dx =  width / 2 + rad * cos(angle * i + mouse_angle);
    float dy = height / 2 + rad * sin(angle * i + mouse_angle);

    // create new force from circle code
    PVector force = new PVector( dx - w[i].p.x , dy - w[i].p.y );

    // mult force so it's not so extreme. Try changing this value!
    force.mult( 0.2 );

    w[i].v.add(force);
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

    p = new PVector(width/2, height/2); // position
    v = new PVector(); // velocity

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
    // drag. Try changing this!
    v.mult( 0.85 );

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
    hueCycle -= 5  ; // cycle speed. Try changing this!
    while (hueCycle < 0 ) {
      hueCycle += 360;
    }

    for ( int i = trails.length-1 ; i >= 0; i--) {

      // loop through curHue
      float curHue = hueCycle + i * 5f;
      while (curHue > 360 ) {
        curHue -= 360;
      }

      // create new color from hue cycle
      c = color(hueCycle, 255, 255);
      float weight = (float) i / trails.length;
      float wave = sin(weight * PI);
      float ssize = (wave * fatness);
      fill( curHue, 255, 255 );
      ellipse(trails[i].x, trails[i].y, ssize, ssize);
    }
  }
}






/*


  if ( mousePressed ) {

    for (int i = 0; i < w.length; i++) {

      // create new force vector from the mouse position minus the position of the object
      // the same as Mouse.sub(p), but this is a less verbose way to write it
      PVector force = new PVector( mouseX - w[i].p.x, mouseY - w[i].p.y );

      // reduce the force a bit so it's not extreme
      force.mult(0.1);

      // add it to the velocity
      w[i].v.add(force);
    }

  }

*/
