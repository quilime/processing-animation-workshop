
float x,y;

float vx,vy;

void setup() {

    size(500,500);
    x = width/2;
    y = height/2;

}

void draw() {

    background(40);

    //  adding two vectors
    x += vx;
    y += vy;

    vx *= 0.9;
    vy *= 0.9;

    fill(255);
    ellipse(x, y, 40, 40);

}

void mouseDragged() {
    vx = (mouseX-x) * 0.1;
    vy = (mouseY-y) * 0.1;
}
