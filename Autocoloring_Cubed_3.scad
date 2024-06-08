/*
- Autocoloring of Objects
- differentiation between different types of objects by funktion for the
    * The main objects aka that waht I want to print --> {blue, orange, yellow, green}
        * a possible Enviroment object where the object will be attached to/ or has to fit in {S/W/ Grey}
    * The Cutting objects that are used to shape the Main objects {Red}
    * The Adding Objects that are used to shape the Main objects {Magenta}
*/
DesignStatus="Color_Test_1";//["Color_Test_2","Color_Test_3"]

Number=5;
ColorDist=256/(Number-1);
CubeSize=5;
alpha=1;

module __Customizer_Limit__ () {}  // bevfore these the variables are usable in the cutomizer
shown_by_customizer = false;

//Test_Object();

function CUTTING_COLORS(I)=[0,(ColorDist/256)*I,1];

if(DesignStatus=="Color_Test_1"){
    see_me_in_colourful(){
        translate([CubeSize*Number,0,Number+Number*CubeSize]){
            cube(CubeSize*0.75);
            cube(CubeSize*0.75);
        }
        translate([CubeSize*0,0,0]){
            cylinder(h=10,d=CubeSize*0.5);
        }
        translate([CubeSize*1,0,0]){
            cylinder(h=10,d=CubeSize*0.5);
        }
        translate([CubeSize*2,0,0]){
            cylinder(h=10,d=CubeSize*0.5);
        }
        translate([CubeSize*3,0,0]){
            cylinder(h=10,d=CubeSize*0.5);
        }
        translate([CubeSize*4,0,0]){
            cylinder(h=10,d=CubeSize*0.5);
        }
        translate([CubeSize*5,0,0]){
            cylinder(h=10,d=CubeSize*0.5);
        }
    }
}
if(DesignStatus=="Color_Test_2"){
echo("Number from Color_Test_2",Number);
echo("ColorDist from Color_Test_2",ColorDist);
    for(i=[0:1:Number-1]){
        for(j=[0:1:Number-1]){
            for(k=[0:1:Number-1]){
                see_me_in_colourful(  ((1/256)*i*ColorDist),
                                      ((1/256)*j*ColorDist),
                                      ((1/256)*k*ColorDist),    
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

module see_me_in_colourful(R,G,B,ALPHA){ // iterates the given modules and colors them automaticly by setting values using trigonometric funktions
C_ColorDist=(255/$children-1)/1000;
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