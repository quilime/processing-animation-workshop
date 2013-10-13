void setup() {
  size(512, 512);
  stroke(255);
  strokeWeight(20);
}
void draw() {
  //background(0);
  translate(width/2, height/2);
   
  float r = sin( frameCount * 0.0824 );
  r = map(r, -1, 1, 0, 1);
  
  float c = map(r, 0, 1, 0, 255);
  
  float x = sin( frameCount * 0.1 );
  x = mapper(x) * r;
  
  float y = cos( frameCount * 0.1 );
  y = mapper(y) * r;  
  
  stroke( c );
  strokeWeight(20);
  point(x, y);
  strokeWeight(1);
  line(0, 0, x, y);
 
  if ( frameCount < 50 ) { 
    saveFrame("out-###.gif");
  }
}

float mapper( float v ) {
  return map(v, -1, 1, -width/2, height/2);
}







