
class Agent {
  int chill = 0;

  /* Direction the agent is facing, in radians; 0 radians faces down visually. */
  float heading;

  /* How many units the agent moves per tick at max power. */
  float power;

  /* Fraction of agent's max power currently being used, between -1 and 1, inclusive. */
  float throttle;

  /* Position of the centroid of the agent. */
  float posX;
  float posY;

  Agent(float lzX, float lzY, float pow) {
    this.posX = lzX;
    this.posY = lzY;
    this.heading = 0;
    this.power = pow;
    this.throttle = 0;
  }

  Agent(Environment e) {
    this.posX = 0;
    this.posY = 0;
    this.heading = 0;
    this.power = 1;
    this.throttle = 0;
  }

  void drawAgent() {
    float h = this.heading;
    float s = 10;
    float x = posX;
    float y = posY;


    background(bg);
    stroke(69);
    fill(69, 69, 69);
    int theTip = get((int)(x + (2.17 * s) * sin(h)), (int)(y + (2.17 * s) * cos(h)));
    if (theTip == -16777216) {
      println("You crashed!");
      delay(2000);
      exit();
    } else if (theTip == -16711936) {
      println("You made it!");
      delay(2000);
      exit();
    }
    triangle(
      x + (2 * s) * sin(h), y + (2 * s) * cos(h),
      x + s * sin(h + (TWO_PI / 3)), y + s * cos(h + (TWO_PI / 3)),
      x + s * sin(h - (TWO_PI / 3)), y + s * cos(h - (TWO_PI / 3))
    );
  }

  /* Change the throttle of the agent to throttle, a float between -1 and 1 inclusive */
  void setThrottle(float throttle) {
    if (throttle > 1) {
      this.throttle = 1;
    } else if (throttle < -1) {
      this.throttle = -1;
    } else {
      this.throttle = throttle;
    }
  }

  /* Change the direction the agent is facing by radTurn radians */
  void rotate(float radTurn) {
    this.heading = (this.heading + radTurn) % TWO_PI;
    this.drawAgent();
  }

  /* Change the agent's position based on power, throttle, and heading.
   * The agent should drive on every tick. */
  void drive() {
    this.posX += this.power * this.throttle * sin(this.heading);
    this.posY += this.power * this.throttle * cos(this.heading);
    this.drawAgent();
  }

  /* Return the sensor reading for the agent's rotation. */
  float senseGyro() {
    return this.heading;
  }

  float senseDistance() {
    float x = this.posX + (2.2 * 10) * sin(this.heading);
    float y = this.posY + (2.2 * 10) * cos(this.heading);
    float dist = 0;

    float resolution = 0.01;
    float xDiff = sin(this.heading) * resolution;
    float yDiff = cos(this.heading) * resolution;
    float distDiff = sqrt(sq(xDiff) + sq(yDiff));

    while (get((int)x, (int)y) != -16777216) {
      dist += distDiff;
      x += xDiff;
      y += yDiff;
    }
    return dist;
  }
}
