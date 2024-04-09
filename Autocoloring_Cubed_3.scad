/*
- Autocoloring of Objects
- differentiation between different types of objects by funktion for the
    * The main objects aka taht waht I want to print --> {blue, orange, yellow, green}
        * a possible Enviroment object where the object will be attached to/ or has to fit in {S/W/ Grey}
    * The Cutting objects that are used to shape the Main objects {Red}
    * The Adding Objects that are used to shape the Main objects {Magenta}
*/
DesignStatus="Color_Test_1";//["Color_Test_2","Color_Test_3"]

Number=7;
ColorDist=255/Number;
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
//module Test_Object(){
//    for (i=[0:1:Number-1]){
//        translate([CubeSize*(i),0,Number+Number*CubeSize]){
//            see_me_in_colourful(    (ColorDist/256)*i,
//                                    0,
//                                    1,
//                                    0.5) {sphere(r=CubeSize/2);}
//        }
//        translate([CubeSize*(i),Number+Number*CubeSize,Number+Number*CubeSize]){
//            see_me_in_colourful() {cube(CubeSize*0.75);}
//        }
//    }
//}

//ColorCubeDELTA_Start
//ColorCubeDELTA_End

//for(j=[0:1:Number-1]){
//    for(i=[0:1:Number-1]){
//        for(k=[0:1:Number-1]){
//            see_me_in_colourful(  ((ColorDist/256)*i),
//                                  ((ColorDist/256)*j),
//                                  ((ColorDist/256)*k),    
//                                  alpha){
//                translate([CubeSize*i,CubeSize*j,CubeSize*k]){
//                    cube(CubeSize-CubeSize/5);
//                    //echo("i",(Number*i/256));
//                }
//            }
//        }
//    }
//}


//CUBE_CUT();
module CUBE_CUT(){
    difference(){
        cube([CubeSize*2,CubeSize*2,CubeSize*2],center=true);
        cube([CubeSize,CubeSize,CubeSize*2],center=true);
    }
}
module see_me_in_colourful(){ // iterates the given modules and colors them automaticly by setting values using trigonometric funktions
C_ColorDist=(255/$children-1)/100;
echo("$children",$children);
echo("C_ColorDist",C_ColorDist);
for(i=[0:1:$children-1]){
    //for(red=[0+i*C_ColorDist:1:$children-1]){
        //for(green=[0+i*C_ColorDist:1:$children-1]){
            //for(blue=[0+i*C_ColorDist:1:$children-1]){
                //    echo("Red-Value",R);
                //    echo("Yellow-Value",Y);
                //    echo("Blue-Value",R);
                    translate([15/2,0,0]){
                        //for(i=[0:$children-1]){
                        a=255;
                        b=50;       // cuts away the dark colors to prevent bad visual contrast to backgound
                        //k_farbabstand=((a-b)/J);
                        //Farbe=((k_farbabstand*J)/255);
                        // SINUS_Foo=0.5+(sin(((360/(a-b))*k_farbabstand)*(J+1)))/2;
                        // COSIN_Foo=0.5+(cos(((360/(a-b))*k_farbabstand)*(J+1)))/2;
                        color (c = [    (i+C_ColorDist/256)*i,
                                        (C_ColorDist/256)*0,
                                        (C_ColorDist/256)*0],
                                        alpha = 0.5){
                            //echo("red",red);
                            //echo("C_ColorDist/256)*red",C_ColorDist/256*red);    
                            render(convexity=10){children(i);} //renders the modules, effect is that inner caveties become visible
                            children();
                            translate([70/2,0,0]){
                                //cube([80,90,150],center=true);
                            }
                        }
                    }
        //        }
      //      }
    //    }
    }
}