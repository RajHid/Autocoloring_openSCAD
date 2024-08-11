/*
- Autocoloring of Objects
- differentiation between different types of objects by funktion for the
    * The main objects aka that waht I want to print --> {blue, orange, yellow, green}
        * a possible Enviroment object where the object will be attached to/ or has to fit in {S/W/ Grey}
    * The Cutting objects that are used to shape the Main objects {Red}
    * The Adding Objects that are used to shape the Main objects {Magenta}
*/
DesignStatus="Color_Test_1";//["Color_Test_1","Color_Test_2","Color_Test_3"]

Number=5;
ColorDist=256/(Number-1);
CubeSize=5;
alpha=1;

module __Customizer_Limit__ () {}  // bevfore these the variables are usable in the cutomizer
shown_by_customizer = false;

//Test_Object();

function CUTTING_COLORS(I)=[0,(ColorDist/256)*I,1];

if(DesignStatus=="Color_Test_1"){
Quadr_1=1; // Color Cube Quadrant
Quadr_2=2; // Color Cube Quadrant
Quadr_3=3; // Color Cube Quadrant
Quadr_4=4; // Color Cube Quadrant
Quadr_5=5; // Color Cube Quadrant
Quadr_6=6; // Color Cube Quadrant
Quadr_7=7; // Color Cube Quadrant
Quadr_8=8; // Color Cube Quadrant
    see_me_in_colourful_AUTO_3(0.0,0.0,0.5,1.0,0.0,0.5,0.5){
        translate([CubeSize*0,CubeSize*-1,0]){
            cylinder(h=10,d=CubeSize*0.5);
        }
        translate([CubeSize*1,CubeSize*-1,0]){
            cylinder(h=10,d=CubeSize*0.5);
        }
        translate([CubeSize*2,CubeSize*-1,0]){
            cylinder(h=10,d=CubeSize*0.5);
        }
    }
    see_me_in_colourful_AUTO_3(0.5,1.0,0.5,1.0,0.0,0.0,0.9){
        translate([CubeSize*0,CubeSize*0,0]){
            cylinder(h=10,d=CubeSize*0.5);
        }
        translate([CubeSize*1,CubeSize*0,0]){
            cylinder(h=10,d=CubeSize*0.5);
        }
        translate([CubeSize*2,CubeSize*0,0]){
            cylinder(h=10,d=CubeSize*0.5);
        }
        translate([CubeSize*3,CubeSize*0,0]){
            cylinder(h=10,d=CubeSize*0.5);
        }
    }
        see_me_in_colourful_AUTO_3(0.0,1.0,0.0,0.0,0.0,0.0,0.9){
        translate([CubeSize*0,CubeSize*-2,0]){
            cylinder(h=10,d=CubeSize*0.5);
        }
        translate([CubeSize*1,CubeSize*-2,0]){
            cylinder(h=10,d=CubeSize*0.5);
        }
        translate([CubeSize*2,CubeSize*-2,0]){
            cylinder(h=10,d=CubeSize*0.5);
        }
        translate([CubeSize*3,CubeSize*-2,0]){
            cylinder(h=10,d=CubeSize*0.5);
        }
        translate([CubeSize*4,CubeSize*-2,0]){
            cylinder(h=10,d=CubeSize*0.5);
        }
    }
    see_me_in_colourful_AUTO_3(0.0,0.0,0.0,0.5,0.0,0.5,0.9){                          // Cutting modules
        translate([CubeSize*0,CubeSize*1,0]){
            cylinder(h=15,d=CubeSize*0.5);
        }
        translate([CubeSize*1,CubeSize*1,0]){
            cylinder(h=15,d=CubeSize*0.5);
        }
        translate([CubeSize*2,CubeSize*1,0]){
            cylinder(h=15,d=CubeSize*0.5);
        }
        translate([CubeSize*3,CubeSize*1,0]){
            cylinder(h=15,d=CubeSize*0.5);
        }
        translate([CubeSize*4,CubeSize*1,0]){
            cylinder(h=15,d=CubeSize*0.5);
        }
        translate([CubeSize*5,CubeSize*1,0]){
            cylinder(h=15,d=CubeSize*0.5);
        }
        translate([CubeSize*6,CubeSize*1,0]){
            cylinder(h=15,d=CubeSize*0.5);
        }
        translate([CubeSize*7,CubeSize*1,0]){
            cylinder(h=15,d=CubeSize*0.5);
        }
        translate([CubeSize*8,CubeSize*1,0]){
            cylinder(h=15,d=CubeSize*0.5);
        }
        translate([CubeSize*9,CubeSize*1,0]){
            cylinder(h=15,d=CubeSize*0.5);
        }
    }
}
if(DesignStatus=="Color_Test_2"){
echo("Number from Color_Test_2",Number);
echo("ColorDist from Color_Test_2",ColorDist);
    for(i=[0:1:Number-1]){
        for(j=[0:1:Number-1]){
            for(k=[0:1:Number-1]){
                see_me_in_colourful(    ((1/256)*i*ColorDist),
                                        ((1/256)*k*ColorDist),
                                        ((1/256)*j*ColorDist),    
                                        alpha){
                    translate([CubeSize*i,CubeSize*j,CubeSize*k]){
                        cube((CubeSize-CubeSize/5));
                        //echo("i",(Number*i/256));
                    }
                }
            }
        }
    }
}
//CUBE_CUT();
module CUBE_CUT(){
    difference(){
        cube([CubeSize*2,CubeSize*2,CubeSize*2],center=true);
        cube([CubeSize,CubeSize,CubeSize*2],center=true);
    }
}
module see_me_in_colourful(R,G,B,ALPHA){ //
    C_ColorDist=(256/$children-1)/100;
    echo("$children",$children);
    echo("C_ColorDist",C_ColorDist);
    echo("Red-Value",R);
    echo("Green-Value",G);
    echo("Blue-Value",B);
    for(i=[0:1:$children-1]){
        a=255;
        b=50;       // cuts away the dark colors to prevent bad visual contrast to backgound
        color (c = [    R,G,B],
                        alpha = 0.9){
            render(convexity=10){children(i);} //renders the modules, effect is that inner caveties become visible
            //children();
            }            
    }
}
module see_me_in_colourful_AUTO_3(R_s,R_e,G_s,G_e,B_s,B_e,ALPHA){ //
// Cutt_OFF: Upper value of Color Space, 0 -> 255 mapped on 0 -> 1
// *_s: Start value of Color space. 0 -> 255 mapped on 0 -> 1
// C_ColorDist_AUTO_R: distance between colors dependant of number of objects
C_ColorDist_AUTO_R=((1-R_s)/($children-1));
C_ColorDist_AUTO_G=((1-G_s)/($children-1));
C_ColorDist_AUTO_B=((1-B_s)/($children-1));
ColorStepp=$children^3/($children-1);
echo("R_s",R_s);
echo("R_e",R_e);
echo("G_s",G_s);
echo("B_s",B_s);
echo("ALPHA",ALPHA);

echo("$children_AUTO_2",$children);
echo("C_ColorDist_AUTO_R",C_ColorDist_AUTO_R);
echo("Red-Value_AUTO",R_s);
echo("Green-Value_AUTO",G_s);
echo("Blue-Value_AUTO",B_s);
echo("R_e-R_s",R_e-R_s);
echo("(R_e-R_s)/$children",(R_e-R_s)/$children);
    for(i=[0:1:$children-1]){
//        for(j=[0:1:$children-1]){
//            for(k=[0:1:$children-1]){
        echo("iii-R_s",((i-R_s)/((R_e-R_s)/($children)))-1);
        echo("(R_e-R_s)/$children",(R_e-R_s)/$children);
        echo("(i*1)/((R_e-R_s)*$children)",(i*1)/((R_e-R_s)*$children));
        echo("((R_e-R_s)*($children-1))/$children",((R_e-R_s)*($children-1))/$children);
        color (c = [    R_s+((R_e-R_s)/$children)*i,
                        G_s+((G_e-G_s)/$children)*i,
                        B_s+((B_e-B_s)/$children)*i],
                        alpha = ALPHA){
            render(convexity=10){children(i);} //renders the modules, effect is that inner caveties become visible
            //children();
            }
            echo("R_for", R_s+((R_e-R_s)/($children-1))*i);
            echo("G_for", G_s+((G_e-G_s)/($children-1))*i);
            echo("B_for", B_s+((B_e-B_s)/($children-1))*i);
            }
//        }
//    }
}
module see_me_in_colourful_AUTO_2(R_s,R_e,G_s,G_e,B_s,B_e,ALPHA){ //
// Cutt_OFF: Upper value of Color Space, 0 -> 255 mapped on 0 -> 1
// *_s: Start value of Color space. 0 -> 255 mapped on 0 -> 1
// C_ColorDist_AUTO_R: distance between colors dependant of number of objects
C_ColorDist_AUTO_R=((1-R_s)/($children-1));
C_ColorDist_AUTO_G=((1-G_s)/($children-1));
C_ColorDist_AUTO_B=((1-B_s)/($children-1));
ColorStepp=$children^3/($children-1);
echo("R_s",R_s);
echo("R_e",R_e);
echo("G_s",G_s);
echo("B_s",B_s);
echo("ALPHA",ALPHA);

echo("$children_AUTO_2",$children);
echo("C_ColorDist_AUTO_R",C_ColorDist_AUTO_R);
echo("Red-Value_AUTO",R_s);
echo("Green-Value_AUTO",G_s);
echo("Blue-Value_AUTO",B_s);
echo("R_e-R_s",R_e-R_s);
echo("(R_e-R_s)/$children",(R_e-R_s)/$children);
    for(i=[R_s:(R_e-R_s)/$children:R_e]){
//        for(j=[0:1:$children-1]){
//            for(k=[0:1:$children-1]){
        echo("iii-R_s",((i-R_s)/((R_e-R_s)/($children)))-1);
        echo("(R_e-R_s)/$children",(R_e-R_s)/$children);
        echo("(i*1)/((R_e-R_s)*$children)",(i*1)/((R_e-R_s)*$children));
        echo("((R_e-R_s)*($children-1))/$children",((R_e-R_s)*($children-1))/$children);
        color (c = [    i,
                        i*G_s,
                        i*B_s],
                        alpha = ALPHA){
            render(convexity=10){children(((i-R_s)/((R_e-R_s)/($children-1))));} //renders the modules, effect is that inner caveties become visible
            //children();
            }
            echo("R_for", i);
            echo("G_for", i*G_s);
            echo("B_for", i*B_s);
            }
//        }
//    }
}
module see_me_in_colourful_AUTO(R_s,G_s,B_s,ALPHA){ //
// Cutt_OFF: Upper value of Color Space, 0 -> 255 mapped on 0 -> 1
// *_s: Start value of Color space. 0 -> 255 mapped on 0 -> 1
// C_ColorDist_AUTO_R: distance between colors dependant of number of objects
C_ColorDist_AUTO_R=((1-R_s)/($children-1));
C_ColorDist_AUTO_G=((1-G_s)/($children-1));
C_ColorDist_AUTO_B=((1-B_s)/($children-1));
ColorStepp=$children^3/($children-1);
echo("children",$children);
echo("$children_AUTO",$children);
echo("C_ColorDist_AUTO",C_ColorDist_AUTO_R);
echo("Red-Value_AUTO",R_s);
echo("Green-Value_AUTO",G_s);
echo("Blue-Value_AUTO",B_s);
    for(i=[0:1:$children-1]){
//        for(j=[0:1:$children-1]){
//            for(k=[0:1:$children-1]){
        echo("iii",i);
        color (c = [    i*C_ColorDist_AUTO_R+R_s,
                        i*C_ColorDist_AUTO_G+G_s,
                        i*C_ColorDist_AUTO_B+B_s],
                        alpha = ALPHA){
            render(convexity=10){children(i);} //renders the modules, effect is that inner caveties become visible
            //children();
            }
            echo("R_for", i*C_ColorDist_AUTO_R+R_s);
            echo("G_for", i*C_ColorDist_AUTO_G+G_s);
            echo("B_for", i*C_ColorDist_AUTO_B+B_s);
            }
//        }
//    }
}