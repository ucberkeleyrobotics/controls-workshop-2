class Environment{
    public Environment(Tile[][] map,float tile_size){
        this.map = map;
        this.tile_size = tile_size;
        for(int i=0; i<map.length; i++){
            for(int j=0; j<map[i].length; j++){
                if(map[i][j].getWallStatus()){     fill(000000);}
                else if(map[i][j].getGoalStatus()){fill(#00FF00);}
                rect(j*tile_size, i*tile_size, tile_size, tile_size);
            }
        }
    }

    float tile_size;
    int agents;
    Tile[][] map;
}
