
class Agent {
  int chill = 0;

  Environment env;

  /* Direction the agent is facing, in radians; 0 radians faces down visually. */
  float heading;

  /* How many units the agent moves per tick at max power. */
  float power;

  /* Fraction of agent's max power currently being used, between -1 and 1, inclusive. */
  float throttle;

  /* Position of the centroid of the agent. */
  float posX;
  float posY;

  Agent(Environment e, float lzX, float lzY, float pow) {
    this.env = e;
    this.posX = lzX;
    this.posY = lzY;
    this.heading = 0;
    this.power = pow;
    this.throttle = 0;
  }

  Agent(Environment e) {
    this.env = e;
    this.posX = 0;
    this.posY = 0;
    this.heading = 0;
    this.power = 1;
    this.throttle = 0;
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
    // redraw
  }

  /* Change the agent's position based on power, throttle, and heading.
   * The agent should drive on every tick. */
  void drive() {
    this.posX += this.power * this.throttle * sin(this.heading);
    this.posY += this.power * this.throttle * cos(this.heading);
    // redraw
  }

  /* Return the sensor reading for the agent's rotation. */
  float senseGyro() {
    return this.heading;
  }

  /* TODO: implement distance sensor */
}
