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
    //meander();
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
//echo("result_1",result_1); //ECHO: [0, 1, 0, 1, 0, 1, 0, 1, 0, 1]
//echo("result_3",result_2);
//echo("result_3",result_3);
//echo("result_4",result_4);

function add_up_to(n, sum=0) =
    n==0 ?
        sum :
        add_up_to(n-1, sum+n);
 
//echo(sum=add_up_to(3));
// ECHO: sum = 5.00005e+009

function red(RED) = ( (RED <= n) ? RED : RED - n); // for(i=[0:n-1]) (i % 2 == 0 ) ? 1:0  
function green(GREEN) = ((GREEN % 2 == 0) ? GREEN % 1: GREEN );
//function blue(BLUE) = (BLUE<=n*n)? 0:1;


//echo("let",let(a = 135, s = sin(a), c = cos(a)) [ s, c ]); // ECHO: [0.707107, -0.707107]

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

//let_for_LOOP();

module let_for_LOOP(){
    for(n=[-1:2:1]){
        for(m=[0:1:5]){
            let(x_Step=6*m*n,y_Step=6*n,z_Step=0){
                translate([x_Step,y_Step,z_Step]){
                    //cube(5);
                    echo("m",m);
                    echo("n",n);
                    text(str(m), font = "Liberation Sans");
                }
            }
        }
    }
}
//SINE_Foo();
module SINE_Foo(){
    CubeCount=7;
    CubeCount_SINE=360/CubeCount;
    for(m=[0:30:360]){
        for(n=[0:30:360]){
            echo("m",m);
            echo("n",n);
            let(x_Step=sin(m)*10){
                translate([(m*5)/30,0,x_Step]){
                    cube(5);
                }
            }
        }
    }
}
//anzColor=4;
1_r=1;
//Recursive_Color_Cube();
module Recursive_Color_Cube(r=1,anzColor=3){
    echo("anzColor^3",anzColor*anzColor*anzColor);
    echo("anzColor",anzColor);
    if(anzColor*anzColor>=0){
        for(n=[0*1_r:1:2]){
            for(m=[0:1:anzColor]){
                translate([n*7,m*7,0]){
                    color(c=[1/(n+1),1/(m+1),0.5],alpha = 0.5){
                        cube(5);
                    }
                    Recursive_Color_Cube(-1,anzColor-1);
                }
            }
        }
    }
}
anzColor_x=5;
anzColor_y=1;
r=1;
CubeCount=1;        //WAS: anzColor_x^2
//2_Recursive_Color_Cube();
module 2_Recursive_Color_Cube(r=1,y_Val=0){
    //echo("anzColor",anzColor);
    //if(anzColor*anzColor>=0){
    for(CubeCount=[0:1:0]){
        //for(y_Val=[0:1:anzColor_y-1]){
            //echo("anzColor_y",anzColor_y);
            for(x_Val=[(anzColor_x-1)*r:-(1*r):0]){  // ? can a for-Loop start on the outskirts and cont inward? from 4 to 0 and -4 to 0?
                //echo("anzColor_x",anzColor_x);
                translate([x_Val*7*r,y_Val*7,CubeCount]){
                    color(c=[0,1/abs(x_Val),0.5],alpha = 0.5){
                        //echo("1/abs(n)",1/abs(x_Val));
                        //echo("floor 0",floor(0));
                        //echo("Sign",sign(-5.0));            //!!! Signum Function ==> gives back 1, 0 or -1 in case a val;ue is above, zero or under -1,
                        //cube(5);
                        text(str(x_Val), font = "Liberation Sans", size=4);
                    }
                }
                echo("x_Val",x_Val);
                if(x_Val*r==(anzColor_x-1)*r){
                    echo("x_Val==anzColor_x-1 is TRUE");
                    echo("r*-1 FROM IF",r*-1);
                    echo("y_Val+abs(r) FROM IF",y_Val+abs(r));
                    2_Recursive_Color_Cube(r*-1,y_Val+abs(r));
                }
            }
            //2_Recursive_Color_Cube(-1,n-1,anzColor_y);
            echo("y_Val",y_Val);
        //}
    }
    //}
    //2_Recursive_Color_Cube(-1,anzColor_x,anzColor_y-1);
}
For_Loop_Experiments(0,1,5,0,19);
module For_Loop_Experiments(Start=7,Step=7,End=7,Exit=7,Foo=1){
    y=0;
    z=0;
    ENDE=5;
    echo("Start",Start);
    echo("Step",Step);
    echo("End",End);
    echo("Exit",Exit);
    if(Exit<ENDE){
        for(m=[1:1:1]){
            for(n=[Start:Step:End]){
                translate([abs((n)*7),Exit*7,z*7]){
                    echo("n_",n+Exit);
                    echo("Start_",Start);
                    echo("End_",End);
                    safe_n = (n == 0) ? 0 : 1/n; // to avoid division by ZERO (I Asked Chat GPT for that in 2026-06-23)
                    safe_exit = (Exit == 0) ? 0 : 1/Exit;
                    color(c=[safe_n, safe_exit, 0], alpha=0.5){
//                    color(c=[1/n,1/Exit,0],alpha=0.5){
                        text(str(n), font = "Liberation Sans", size=4);
                        cube(5);
                    }
                    echo("CUT================");
                }
                if(n==End){
                    echo("n==End",n);
                    Help=End;
                    End=Start;
                    Start=Help;
                    Step=Step*-1;
                    Exit=Exit+1;
                    echo("GoTo-------------");
                    For_Loop_Experiments(Start,Step,End,Exit,1);
                }
                else if(Foo==9){
                        echo("1==1");
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