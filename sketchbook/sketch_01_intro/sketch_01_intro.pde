void setup() {
  size(512, 512);
  frameRate( 60 );
}
 
void draw() {
  background( 150 );  
  strokeWeight( mouseX * 0.025 );
    
  stroke(255);
  line( width / 2, height / 2, mouseX, mouseY );
   
  stroke(20);
  point( 234, 120 );
  
  translate(width / 2, height / 2);
  //triangle(30, 75, 58, 20, 86, 75);  
  
  noFill();
  beginShape();
  vertex(30, 75);
  vertex(58, 20);
  vertex(86, 75);
  endShape(CLOSE);
  
}


/*

//  stroke(100);
//  rect( 10, 20, mouseX, mouseY );




*/
 


