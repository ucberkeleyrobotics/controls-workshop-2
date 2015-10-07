
float tile_size = 2;
Tile[][] m = new Tile[floor(200/tile_size)][floor(200/tile_size)];
Environment e;

void setup(){
    size(200,200);
    noStroke();
    for(int i=0;i<m.length;i++){
        for(int j=0;j<m[i].length;j++){
            boolean x = j%2==0;
            if(i==0 || i==m.length-1 || j==0 || j==m.length-1){
                m[i][j] = new Tile(i,j,false,true);
            }
            else{
                m[i][j] = new Tile(i,j,false,false);
            }
        }
    }
    e = new Environment(m,tile_size);
}

void draw(){

}
