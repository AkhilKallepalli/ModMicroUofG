use <C:\Program Files\OpenSCAD\openflexure-microscope-master-openscad\openscad\libs/utilities.scad>
use <C:\Program Files\OpenSCAD\openflexure-microscope-master-openscad\openscad\libs/libdict.scad>


//beamsplitter and emission filter
module beamsplitter_cube(){
    translate([0,50,-40])union(){
        difference(){
            cube([50,50,50],center=true);
            translate([0,-23,13])cube([30,70,55],center=true);
            translate([0,0,-20])cube([45,37,5.5],center=true);
            translate([0,0,-18.5])cube([65,37,6],center=true);
            translate([0,0,-15])cube([30,30,55],center=true);
            translate([0,0,10])rotate([45,0,0])cube([45,65,5],center=   true);
            #rotate([45,0,0])translate([0,3,7])cube([65,42,3.5],center=   true);
            //bottom magnet holders
            translate([20,20,-23.5])cylinder(h=3.7,r=3,center=true,$fn=50);
            translate([-20,-20,-23.5])cylinder(h=3.7,r=3,center=true,$fn=50);
            translate([-20,20,-23.5])cylinder(h=3.7,r=3,center=true,$fn=50);
            translate([20,-20,-23.5])cylinder(h=3.7,r=3,center=true,$fn=50);
            //top magnet holders
            translate([20,20,23.5])cylinder(h=3.7,r=3,center=true,$fn=50);
            translate([-20,-20,23.5])cylinder(h=3.7,r=3,center=true,$fn=50);
            translate([-20,20,23.5])cylinder(h=3.7,r=3,center=true,$fn=50);
            translate([20,-20,23.5])cylinder(h=3.7,r=3,center=true,$fn=50);
            //screwhole back
            translate([0,0,-10])rotate([90,0,0])trylinder_selftap(2.5, h=999, center=true);
        }
        difference(){
            translate([0,0,10])rotate([45,0,0])cube([45,65,5],center=true);
            rotate([45,0,0])translate([0,3,7])cube([65,42,4],center=true);
            translate([0,-3,0])cube([20,30,100],center=true);
            translate([0,0,32.5])cube([70,70,15],center=true);   
        }
    }
}
beamsplitter_cube();
