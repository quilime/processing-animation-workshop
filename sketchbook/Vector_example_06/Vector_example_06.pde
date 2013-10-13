PVector p, v;

PVector[] trails;


void setup(){

  size(512,512);
  smooth();
  noStroke();

  p = new PVector(width/2, height/2);
  v = new PVector();

  // worm length
  trails = new PVector[100]; // set this to be any number
  
  for ( int i = trails.length-1 ; i >= 0; i--) {
    trails[i] = new PVector( random(width), random(height) );
  }

}

void draw(){

  background(40);


  // drag
  v.mult( 0.84 );


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


  if( mousePressed ) {

    // create new force vector from the mouse position minus the position of the object
    // the same as Mouse.sub(p), but this is a less verbose way to write it
    PVector force = new PVector( mouseX - p.x, mouseY - p.y );

    // reduce the force a bit so it's not extreme
    force.mult(0.1);

    // add it to the velocity
    v.add(force);
  }


  // draw trails
  fill( 255, 12, 12 );
  for ( int i = trails.length-1 ; i >= 0; i--) {
    float weight = (float) i / trails.length;
    float wave = sin(weight * PI);
    float size = (wave * 50); // scale of the trail snail pail whale
    ellipse(trails[i].x, trails[i].y, size, size);
  }


  // draw head
  //fill( 255 );
  //ellipse(p.x, p.y, 40, 40);



}
