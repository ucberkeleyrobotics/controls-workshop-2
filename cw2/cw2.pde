int mapSize= 600;
Agent r;
PImage bg;

void setup(){
    size(600,600);

    bg = loadImage("baseline.png");
    background(bg);

    r = new Agent(300, 300, 6);
    r.rotate(radians(45));
    r.setThrottle(1);
}

void draw(){
    r.drive();
}
