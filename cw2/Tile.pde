class Tile{
    public Tile(int x, int y, boolean isGoal, boolean isWall){
        this.xPos = x;
        this.yPos = y;
        this.isGoal = isGoal;
        this.isWall = isWall;
    }
    public boolean getGoalStatus(){return this.isGoal;}
    public boolean getWallStatus(){return this.isWall;}
 
    private int xPos;
    private int yPos;
    private boolean isGoal;
    private boolean isWall;
}
