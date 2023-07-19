use <C:\Program Files\OpenSCAD\openflexure-microscope-master-openscad\openscad\libs/utilities.scad>
use <C:\Program Files\OpenSCAD\openflexure-microscope-master-openscad\openscad\libs/libdict.scad>


module base_slab(){
translate([0,0,0])difference(){
    translate([0,20,0])cube([220,180,5],center=true);
    //optics cutout
    translate([0,-30,0])cube([70,170,20],center=true);
    translate([0,15,0])cube([90,80,20],center=true);
    translate([34,-25,0])rotate([0,0,45])cube([15,15,20],center=true);
    translate([-34,-25,0])rotate([0,0,45])cube([15,15,20],center=true);
    //screws for microscope base
    translate([-65,-10,55])rotate([0,0,30])translate([0,25,0])cylinder(d=5, h=999, center=true, $fn=30);
    translate([-65,-10,55])rotate([0,0,30])translate([0,-25,0])cylinder(d=5, h=999, center=true, $fn=30);
    translate([65,-10,55])rotate([0,0,-30])translate([0,25,0])cylinder(d=5, h=999, center=true, $fn=30);
    translate([65,-10,55])rotate([0,0,-30])translate([0,-25,0])cylinder(d=5, h=999, center=true, $fn=30);
    //screws for slab height
    translate([100,100,0])cylinder(d=6, h=999, center=true, $fn=20);
    translate([-100,100,0])cylinder(d=6, h=999, center=true, $fn=20);
    translate([100,-60,0])cylinder(d=6, h=999, center=true, $fn=20);
    translate([-100,-60,0])cylinder(d=6, h=999, center=true, $fn=20);
    translate([75,75,0])cylinder(d=6, h=999, center=true, $fn=20);
    translate([70,70,0])cylinder(d=6, h=999, center=true, $fn=20);
}
translate([0,140,0])cube([160,80,5],center=true);
}

projection(cut=true)base_slab();