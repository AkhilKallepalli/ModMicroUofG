use <C:\Program Files\OpenSCAD\openflexure-microscope-master-openscad\openscad\libs/utilities.scad>
use <C:\Program Files\OpenSCAD\openflexure-microscope-master-openscad\openscad\libs/libdict.scad>

include <C:\Program Files\OpenSCAD\openflexure-microscope-master-openscad\openscad\libs\cameras/picamera_2.scad>

difference(){
    cylinder(h=125,r=25.4/2, $fn=100, center=true);
    trylinder_selftap(6, h=999, center=true);
}