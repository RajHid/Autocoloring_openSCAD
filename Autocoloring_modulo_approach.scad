// Parameters for the grid size and cube size
cube_size = 10;  // Side length of each cube
grid_size_X = 7;   // Grid dimensions (grid_size x grid_size)
grid_size_Y = 9;
module generate_grid() {
    // Generate grid of cubes with alternating colors
    for (x = [0 : (1/(grid_size_X-1)) : (grid_size_X-1)]) {
        for(y = [0 : 2 :grid_size_Y - 1]){
    //        color_ = get_color(1/(grid_size-1), 0, 0);
    //        echo(x);
    //        echo(color_);
            translate([x * cube_size, y * cube_size, 0 * cube_size]) {
                color(c = [ (1/(grid_size_X-1))*x,(1/(grid_size_Y-1))*y,], alpha = 0.5){
                    cube(cube_size);
                }
            }
        }
    }
}
//module colored_cube(x, y, z, color_) {
//    // Translate the cube to the correct position in the grid
//    r=x;
//    translate([x * cube_size, y * cube_size, z * cube_size]) {
//        color(c=[r,0,0], alpha = 0.5) {
//            cube(cube_size);
//        }
//    }
//}
//function get_color(x, y, z) =
//    let (
//        red_max = 1,
//        green_max = 1,
//        blue_max = 1,
//        step_size = 1/(grid_size-1),
//        r = (x + y + z) % (red_max + green_max + blue_max),
//        g = 0,//(y + (r > red_max ? step_size : 0)) % green_max,
//        b = 0//(x + z > (red_max + blue_max) ? step_size : 0)
//    )
//    [r, g, b];

generate_grid(); // Run the grid generation