use <C:\Program Files\OpenSCAD\openflexure-microscope-master-openscad\openscad\libs/utilities.scad>
use <C:\Program Files\OpenSCAD\openflexure-microscope-master-openscad\openscad\libs/libdict.scad>

include <C:\Program Files\OpenSCAD\openflexure-microscope-master-openscad\openscad\libs\cameras/picamera_2.scad>


module picam1(){
//picamera mount
translate([-5,0,0])rotate([0,180,45])picamera_2_camera_mount(screwhole=true, counterbore=false);

translate([0,0,-1])difference(){
    cube([50,50,3],center=true);
    translate([-5,0,0])cylinder(h=999,r=4.4,center=true,$fn=50);
    translate([5.5,0,0])rotate([0,0,55])trylinder_selftap(1.5, h=999, center=true);
    translate([-15.5,0,0])rotate([0,0,55])trylinder_selftap(1.5, h=999, center=true);
    //screwhole picam
    translate([20,-20,0])trylinder_selftap(2.5, h=999, center=true);
    translate([20,20,0])trylinder_selftap(2.5, h=999, center=true);
}
//breadboard attachment
translate([-21,0,2.5])cube([8,50,4],center=true);
difference(){
    translate([-23.5,0,23])cube([3,50,45],center=true);
    rotate([0,90,0])translate([-32.5,12.5,0])trylinder_selftap(6, h=999, center=true);
    rotate([0,90,0])translate([-32.5,-12.5,0])trylinder_selftap(6, h=999, center=true);
}
}
picam1();