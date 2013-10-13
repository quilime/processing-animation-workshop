PVector p, v;

void setup(){

  size(512,512);

  p = new PVector(width/2, height/2);
  v = new PVector();

}

void draw(){

  background(40);

  // drag
  v.mult( 0.84 );

  // add the veloctiy to the position
  p.add( v );

  if( mousePressed ) {

    // create new force vector from the mouse position minus the position of the object
    // the same as Mouse.sub(p)
    PVector force = new PVector( mouseX - p.x, mouseY - p.y );

    // reduce the force a bit
    force.mult(0.1);

    // add it to the velocity
    v.add(force);
  }

  fill( 255 );
  ellipse(p.x, p.y, 40, 40);
}
