use <C:\Program Files\OpenSCAD\openflexure-microscope-master-openscad\openscad\libs/utilities.scad>;
include <C:\Program Files\OpenSCAD\openflexure-microscope-master-openscad\openscad\libs/microscope_parameters.scad>;
use <C:\Program Files\OpenSCAD\openflexure-microscope-master-openscad\openscad/illumination_dovetail.scad;
use <C:\Program Files\OpenSCAD\openflexure-microscope-master-openscad\openscad\libs/z_axis.scad>;
use <C:\Program Files\OpenSCAD\openflexure-microscope-master-openscad\openscad\libs/libdict.scad>

use <C:\Users\rober\OneDrive\Desktop\ModMicro\modmicroopenscad\V2 SIMCONFOCAL/illumination_Modified.scad>;


module main_tube(){
translate([0,0,-11])difference(){
    cylinder(h=30,r=13.5,center=true);
    cylinder(h=90,r=11.5,center=true);
}

translate([0,0,-5.5])difference(){
    cylinder(h=41,r=14.9,center=true);
    cylinder(h=999,r=25.4/2 + 0.1,center=true,$fn=100);
}
}
main_tube();
translate([0,0,-24])difference(){
    cylinder(h=4,r=14.9,center=true);
    cylinder(h=99,d=12.4,center=true);
    //screwholes
    translate([7.2,6.2,0])trylinder_selftap(2.5, h=999, center=true);
    translate([-7.2,6.2,0])trylinder_selftap(2.5, h=999, center=true);

}
//translate([0,0,-44])rotate([-90,0,0])Fibre_Retainer();