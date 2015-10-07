
float tile_size = 2;
Tile[][] m = new Tile[floor(200/tile_size)][floor(200/tile_size)];
Environment e;

void setup(){
    size(200,200);

    for(int i=0;i<m.length;i++){
        for(int j=0;j<m[i].length;j++){
            boolean x = j%2==0;
            m[i][j] = new Tile(i,j,x,false);
        }
    }
    e = new Environment(m,tile_size);
}

void draw(){

}
