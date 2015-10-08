int mapSize= 600;
Agent r;
PImage bg;

void setup(){
    size(600,600);

    bg = loadImage("baseline.png");
    background(bg);
    r = new Agent(300, 300, 1);
    r.rotate(radians(0));
    // TODO: initialize timer
}

void draw(){
    fill(#0000FF);
    stroke(420);
    r.setThrottle(1);
    r.drive();
    println(r.posX,r.posY);
}
