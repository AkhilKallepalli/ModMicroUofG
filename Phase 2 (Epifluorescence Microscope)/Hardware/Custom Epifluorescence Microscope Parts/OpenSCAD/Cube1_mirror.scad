use <C:\Program Files\OpenSCAD\openflexure-microscope-master-openscad\openscad\libs/utilities.scad>
use <C:\Program Files\OpenSCAD\openflexure-microscope-master-openscad\openscad\libs/libdict.scad>



//mirror and confocal pinhole before detector
module detector_cube(){
    translate([0,50,0])rotate([0,180,0])union(){
        difference(){
            cube([50,50,50],center=true);
            translate([0,-19,13])cube([45,70,55],center=true);
            translate([0,-14,-20])cube([27,70,3.5],center=true);
            translate([0,0,-15])cube([20,20,55],center=true);
            translate([0,0,10])rotate([-45,0,0])cube([45,65,5],center=true);
            //top magnet holders
            translate([20,20,-23.5])cylinder(h=3.7,r=3,center=true,$fn=50);
            translate([-20,-20,-23.5])cylinder(h=3.7,r=3,center=true,$fn=50);
            translate([-20,20,-23.5])cylinder(h=3.7,r=3,center=true,$fn=50);
            translate([20,-20,-23.5])cylinder(h=3.7,r=3,center=true,$fn=50);
            //bottom magnet holders
            translate([20,20,23.5])cylinder(h=3.7,r=3,center=true,$fn=50);
            translate([-20,-15,23.5])cylinder(h=3.7,r=3,center=true,$fn=50);
            translate([-20,20,23.5])cylinder(h=3.7,r=3,center=true,$fn=50);
            translate([20,-15,23.5])cylinder(h=3.7,r=3,center=true,$fn=50);
            //screwhole back
            translate([0,0,10])rotate([90,0,0])trylinder_selftap(2.5, h=999, center=true);
            //screwhole picam
            translate([20,-22,-20])rotate([90,0,0])trylinder_selftap(2.5, h=9, center=true);
            translate([-20,-22,-20])rotate([90,0,0])trylinder_selftap(2.5, h=9, center=true);
        }
        difference(){
            translate([0,0,10])rotate([-45,0,0])cube([45,65,9],center=true);
            translate([0,0,10])rotate([-45,0,0])translate([0,4,0])cube([27,70,5],center=true);
            cube([20,25,100],center=true);
            translate([0,0,32.5])cube([70,70,15],center=true);  
            translate([0,30,0])cube([70,10,70],center=true);
            translate([20,-15,23.5])cylinder(h=3.7,r=3,center=true,$fn=50); 
            translate([-20,-15,23.5])cylinder(h=3.7,r=3,center=true,$fn=50);
        }
    }
}
detector_cube();
