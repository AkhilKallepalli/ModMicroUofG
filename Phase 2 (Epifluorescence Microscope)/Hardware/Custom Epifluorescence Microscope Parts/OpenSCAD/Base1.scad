//base to combine with acrylic

use <C:\Program Files\OpenSCAD\openflexure-microscope-master-openscad\openscad\libs/microscope_parameters.scad>
use <C:\Program Files\OpenSCAD\openflexure-microscope-master-openscad\openscad\libs/lib_microscope_stand.scad>
use <C:\Program Files\OpenSCAD\openflexure-microscope-master-openscad\openscad\libs/utilities.scad>
use <C:\Program Files\OpenSCAD\openflexure-microscope-master-openscad\openscad\libs/libdict.scad>


TALL_BUCKET_BASE = false;
module microscope_stand_stl(tall_bucket_base){
    params = default_params();
    stand_params = default_stand_params(tall=tall_bucket_base);
    microscope_stand(params, stand_params);
}


difference(){
    microscope_stand_stl(TALL_BUCKET_BASE);
    cube([200,200,105],center=true);
    translate([0,-40,60])cube([60,50,50],center=true);
}
translate([-65,-10,55])rotate([0,0,30])difference(){
    cube([20,80,5],center=true);
    translate([0,25,0])trylinder_selftap(6, h=999, center=true);
    translate([0,-25,0])trylinder_selftap(6, h=999, center=true);
}
translate([65,-10,55])rotate([0,0,-30])difference(){
    cube([20,80,5],center=true);
    translate([0,25,0])trylinder_selftap(6, h=999, center=true);
    translate([0,-25,0])trylinder_selftap(6, h=999, center=true);
}












