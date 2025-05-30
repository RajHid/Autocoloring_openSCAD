// Parameters for the grid size and cube size
cube_size = 10;  // Side length of each cube
grid_size_X = 5;   // Grid dimensions (grid_size x grid_size)
grid_size_Y = 5;
Count = 10;

//Generate_Grid_3();

//Generate_Grid_2(){
//    translate([0,-10,0]){
//        cylinder(h=15,d=3,$fn=12);
//    }
//    translate([0,-20,0]){
//        cylinder(h=15,d=3,$fn=12);
//    }
//    translate([0,-30,0]){
//        cylinder(h=15,d=3,$fn=12);
//    }
//    translate([0,-40,0]){
//        cylinder(h=15,d=3,$fn=12);
//    }
//    translate([0,-50,0]){
//        cylinder(h=15,d=3,$fn=12);
//    }
//    translate([0,-60,0]){
//        cylinder(h=15,d=3,$fn=12);
//    }
//}
module Generate_Grid() {
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
                    children();
                }
            }
        }
    }
}
module Generate_Grid_2(){
    // Generate grid of cubes with alternating colors
    for(i=[0:1:$children-1]){
        for (y = [0 : 1  : grid_size_Y-1 ]) {
            for(x = [ 0 : (-1^y)*-1: ((grid_size_X-1)*-1^y)*-1 ]){
        //        color_ = get_color(1/(grid_size-1), 0, 0);
        //        echo(x);
        //        echo(color_);
                echo("y",y);
                echo("x",x);
                echo("hello", (-1)^y);
                echo("Color_y",(1/(grid_size_Y-1))*y);
                echo("Color_x",((1/(grid_size_X-1))*x*(-1^y))*-1);
                echo("$children",$children);
                echo("((grid_size_Y-1)*(grid_size_X-1))/$children",((grid_size_Y-1)*(grid_size_X-1))/$children);
                color(c = [ ((1/(grid_size_X-1))*x*(-1^y))*-1,(1/(grid_size_Y-1))*y,0], alpha = 0.5){
                    //cube(cube_size);
                    translate([grid_size_X*x,0,0]){
                        children(((grid_size_Y-1)*(grid_size_X-1))/$children);
                    }
                }
            }
        }
    }
}
module Generate_Grid_3() {
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
            echo("Color_x",((1/(grid_size_X-1))*x*(-1^y))*-1);
            translate([x * cube_size, y * cube_size, 0 * cube_size]) {
                color(c = [ ((1/(grid_size_X-1))*x*(-1^y))*-1,(1/(grid_size_Y-1))*y,0], alpha = 0.5){
                    cube(cube_size);
                    children();
                }
            }
        }
    }
}
translate([0,-50,0]){
    meander();
}
module meander(){
END_x=3;
END_y=3;
    //for(i=[0:1:(END_x*END_y)-1]){
        for(x=[0:1:END_x-1]){
            for(y=[(END_y-1):1:0]){
                echo("x",x);
                echo("y",y);
                translate([x*11,y*11,0]){
                    cube(100);
                }
            } 
        }
    //}
}
//For_Downstepp();
module For_Downstepp(){
    for(j=[-5:1:0]){
        translate([-j*11,-75,20]){
            cube(10);
        }
    }
}

n = 5;
m = 3;
o = 5;
a = 0;
b = 1;
result_1 = [ [for (i=[0:m-1]) (i % 2 == 0) ? a : b ],[for (j=[0:m-1]) (j % 2 != 0) ? a : b] ];
result_2 = [ for(j=[0:1:n-1])[j], for(j=[0:1:n-1])[j] ];
result_3 = [for(i=[0:1:n*n])[   i,
                                (i % 2 != 0) ? i/2 : 9,
                                0]];
result_4 = [for(i=[1:1:(n*n)])[i,[red(i),green(i)]]];
echo("result_1",result_1); //ECHO: [0, 1, 0, 1, 0, 1, 0, 1, 0, 1]
echo("result_3",result_2);
echo("result_3",result_3);
echo("result_4",result_4);

function add_up_to(n, sum=0) =
    n==0 ?
        sum :
        add_up_to(n-1, sum+n);
 
echo(sum=add_up_to(3));
// ECHO: sum = 5.00005e+009

function red(RED) = ( (RED <= n) ? RED : RED - n); // for(i=[0:n-1]) (i % 2 == 0 ) ? 1:0  
function green(GREEN) = ((GREEN % 2 == 0) ? GREEN % 1: GREEN );
//function blue(BLUE) = (BLUE<=n*n)? 0:1;


echo("let",let(a = 135, s = sin(a), c = cos(a)) [ s, c ]); // ECHO: [0.707107, -0.707107]

//for (i = [10:50]) // creates a spiral of incrisingly sized spheres
//{
//    let (angle = i*360/20, r= i*2, distance = r*5)
//    {
//        rotate(angle, [1, 0, 0])
//        translate([0, distance, 0])
//        sphere(r = r);
//    }
//}

for(i=[0:1:17]){
    for(n=[1:-2:-1]){
        for(j_y=[0:1:8-1]){
            for(m=[-1:2:1]){
                for (j_x=[0:1*n:8-1]){
                    let(x_Step= j_x*6 , y_Step=i/2*6*n, z_Step=i/3*6){
                        translate([x_Step,y_Step,z_Step]){
//                            cube(5);
                        }
                    }
                }
            }
        }
    }
}

let_for_LOOP();

module let_for_LOOP(){
    for(n=[1:-2:-1]){
        for(m=[1:1:5]){
            let(x_Step= (n*6)*m,y_Step=6*n*-m,z_Step=1){
                translate([x_Step,y_Step,z_Step]){
                    cube(5);
                }
            }
        }
    }
}
////example 3 - iteration over a vector of vectors
//for(i = [ [[ 0,  0,  0], 20],
//          [[10, 12, 10], 50],
//          [[20, 24, 20], 70],
//          [[30, 36, 30], 10],
//          [[20, 48, 40], 30],
//          [[10, 60, 50], 40] ]){
//  translate([i[0][0], 2*i[0][1], 0])
//  cube([10, 15, i[1]]);
//}
//Generate_Grid(); // Run the grid generation