// Parameters for the grid size and cube size
cube_size = 10;  // Side length of each cube
grid_size_X = 5;   // Grid dimensions (grid_size x grid_size)
grid_size_Y = 5;
Count = 10;


module generate_grid() {
    // Generate grid of cubes with alternating colors
    for (y = [0 : 1  : grid_size_Y-1 ]) {
        for(x = [ 0 : (-1^y)*-1: ((grid_size_X-1)*-1^y)*-1 ]){
    //        color_ = get_color(1/(grid_size-1), 0, 0);
    //        echo(x);
    //        echo(color_);
            echo("y",y);
            echo("x",x);
            echo("hello", (-1)^y);
            echo("Color_y",(1/(grid_size_Y-1))*y);
            echo("Color_x",(1/(grid_size_X-1))*x*(-1^y));
            translate([x * cube_size, y * cube_size, 0 * cube_size]) {
                color(c = [ ((1/(grid_size_X-1))*x*(-1^y))*-1,(1/(grid_size_Y-1))*y,0], alpha = 0.5){
                    cube(cube_size);
                }
            }
        }
    }
}
generate_grid(); // Run the grid generation