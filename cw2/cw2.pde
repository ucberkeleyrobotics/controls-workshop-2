int mapSize= 600;
Environment e;
Agent r;

void setup(){
    size(600,600);
    noStroke();

    e = new Environment(m,tile_size);
    e.fillEnv();
    e.drawEnv();
    r = new Agent(e, 300, 300, 1);
    r.rotate(radians(0));
    // TODO: initialize timer
}

void draw(){
    fill(#0000FF);
    stroke(420);
    // triangle(r.posX,r.posY,r.posX + 200, r.posY - 200, r.posX - 200, r.posY - 200);
    // stroke(0);
    // triangle(r.posX,r.posY,r.posX + 200, r.posY - 200, r.posX - 200, r.posY - 200);
    r.setThrottle(1);
    r.drive();
    println(r.posX,r.posY);
}
