Tile[][] m = new Tile[5][5];
Environment e;
void setup(){
    size(200,200);

    for(int i=0;i<5;i++){
        for(int j=0;j<5;j++){
            m[i][j] = new Tile(i,j,false,true);
        }
    }
    e = new Environment(m);
}

void draw(){

}
