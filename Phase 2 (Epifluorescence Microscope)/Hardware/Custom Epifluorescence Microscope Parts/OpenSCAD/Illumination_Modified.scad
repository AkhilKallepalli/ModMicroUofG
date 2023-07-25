/******************************************************************
*                                                                 *
* OpenFlexure Microscope: Illumination                            *
*                                                                 *
* The illumination module includes the condenser lens mounts and  *
* the arm that holds them.                                        *
*                                                                 *
* (c) Richard Bowman, April 2018                                  *
* Released under the CERN Open Hardware License                   *
*                                                                 *
******************************************************************/

use <C:\Program Files\OpenSCAD\openflexure-microscope-master-openscad\openscad\libs/utilities.scad>;
include <C:\Program Files\OpenSCAD\openflexure-microscope-master-openscad\openscad\libs/microscope_parameters.scad>;
use <C:\Program Files\OpenSCAD\openflexure-microscope-master-openscad\openscad/illumination_dovetail.scad;
use <C:\Program Files\OpenSCAD\openflexure-microscope-master-openscad\openscad\libs/z_axis.scad>;
front_dovetail_y = 35; // position of the main dovetail
front_dovetail_w = 30; // width of the main dovetail


module each_illumination_arm_screw(middle=true){
    // A transform to repeat objects at each mounting point
    for(p=illumination_arm_screws) if(p[0]!=0 || middle) translate(p) children();
}
module right_illumination_arm_screw(){
    // A transform to position objects at the x>0 mounting point
    for(p=illumination_arm_screws) if(p[0]>0) translate(p) children();
}

module middle_illumination_arm_screw(){
    for(p=illumination_arm_screws) if(p[0]==0) translate(p) children();
}

module cyl_slot(r=1, h=1, dy=2, center=false){
    hull() repeat([0,dy,0],2,center=true) cylinder(r=r, h=h, center=center);
}

module illumination_arm(){
    // The arm on which we mount the illumination
    bottom_z = illumination_arm_screws[0][2]; // z position where we mount it
    h = 50;
    smooth_h = 15;
    dt_z = sample_z + 12; // z position and height of the dovetail
    dt_h = h + bottom_z - dt_z;
    
    translate([0,front_dovetail_y,dt_z]) mirror([0,1,0]) dovetail_m([front_dovetail_w, 10, h-smooth_h]);
    
    difference(){
        sequential_hull(){
            translate([-front_dovetail_w/2,front_dovetail_y-2,dt_z]) cube([front_dovetail_w, 15+2, 1]);
            hull(){
                each_illumination_arm_screw(middle=false) cyl_slot(r=4, h=3+d, dy=3);
                middle_illumination_arm_screw() scale([1,0.5,1]) cylinder(r=4, h=d);
            }
            //translate([0,0,dt_z-bottom_z-4]) hull(){
            //    each_illumination_arm_screw(middle=false) cyl_slot(r=4, h=d, dy=3);
            //    middle_illumination_arm_screw() scale([1,0.5,1]) cylinder(r=4, h=d);
            //}
            translate([-front_dovetail_w/2,front_dovetail_y+2,dt_z]) cube([front_dovetail_w, 10-2, dt_h]);
        }
        
        // slots for the mounting screws (to allow adjustment of position)
        each_illumination_arm_screw(middle=false) cyl_slot(r=3/2*1.33, h=999, dy=3, center=true);
        each_illumination_arm_screw(middle=false) translate([0,0,3]) cyl_slot(r=6, h=999, dy=3);
        
        // clearance for the motor
        translate([0,-2,0]) z_motor_clearance();
    }
}



//illumination_arm();



// parameters of the lens
pedestal_h = 5.5;
lens_r = 13/2; // for flanged plastic condenser
//lens_r = 16/2; // for 16mm plastic condenser
aperture_r = lens_r-1.1;
lens_t = 1;
base_r = lens_r+2;

lens_assembly_z = 30;
dt_clip = [front_dovetail_w, 16, lens_assembly_z]; //size of the dovetail clip
arm_end_y = front_dovetail_y-dt_clip[1]-4;

module tall_condenser(){
    difference(){
        union(){

            
            // add a bottom
            hull() reflect([1,0,0]){
                translate([0,0,-10]) cylinder(r=base_r, h=lens_assembly_z+d+10);
                translate([-dt_clip[0]/2, arm_end_y,0]) cube([dt_clip[0], 2, lens_assembly_z]);
            }
            
            // mount for the dovetail clip
            translate([-dt_clip[0]/2,arm_end_y,0]) cube([dt_clip[0], 4, dt_clip[2]]);
            
            // the dovetail clip
            translate([0,front_dovetail_y, 0]) mirror([0,1,0]) dovetail_clip(dt_clip, slope_front=2, solid_bottom=0.2);
    translate([0,24.24,0.84])cube([27,18,1.2],center=true);        
            
//            translate([0,0,lens_assembly_z]){
//                // the lens holder
//                trylinder_gripper(inner_r=lens_r, grip_h=pedestal_h + lens_t/3,h=pedestal_h+lens_t+1.5, base_r=base_r, flare=0.5);
//                // pedestal to raise the lens up within the gripper
//                cylinder(r=aperture_r+0.8,h=pedestal_h);
//            }
            
            translate([0,0,33])cylinder(d=14.9,h=10,$fn=100,center=true);
             translate([0,0,30.5])cylinder(d=17,h=3,$fn=32,center=true);
        }
        
        // hole for the beam passing through the lens
        translate([0,0,9]) lighttrap_cylinder(r1=5.6, r2=6,h=lens_assembly_z-9+d);
        //#translate([0,0,lens_assembly_z]) cylinder(r=aperture_r,h=999);
        
        // hole for the LED
        //LED
        //#deformable_hole_trylinder(led_r,led_r+0.7,h=20, center=true);
        translate([0,0,15])cylinder(d=11.5,h=60,center=true);
        //#translate([0,0,0.6])cylinder(d=13.5,h=1.2,$fn=100,center=true);
        //#translate([0,0,1.7])cylinder(d1=13.5,d2=11.3,h=1.2,$fn=100,center=true);
        
        translate([0,0,39])cylinder(d=13.3,h=5,$fn=100,center=true);
        translate([0,0,37.05])cylinder(d=13.5,h=1.1,$fn=100,center=true);
        translate([0,12,-5.4])cube([35,45,11],center=true);
        translate([0,0,37.5])cube([20,1,2],center=true);
        translate([0,0,37.5])cube([1,20,2],center=true);
        cylinder(r=led_r+1.0,h=2,center=true);
        translate([0,0,2-d]) cylinder(r1=led_r+1.0, r2=led_r,h=2,center=true);
        
    translate([7.2,6.2,3])cylinder(d=2.7,h=10,$fn=50,center=true);
    translate([-7.2,6.2,3])cylinder(d=2.7,h=10,$fn=50,center=true);
    }
}



module Fibre_Collimator(){
  difference(){
 
union(){
    translate([0,-3,0])rotate([90,0,0])cylinder(d=17,h=8,$fn=170,center=true);
    translate([0,5,0])rotate([90,0,0])cylinder(d2=14,d1=8,h=14,$fn=120,center=true); 
    
}  
    translate([0,7.6,0])rotate([90,0,0])cylinder(d=3.1*A+B,h=14,$fn=80,center=true);
    translate([0,-2.5,0])rotate([90,0,0])cylinder(d1=2.4,d2=13.4,h=6.5,$fn=120,center=true);
    rotate([90,0,0])cylinder(d=2.5,h=10,$fn=80,center=true);        
translate([0,-6.7,0])rotate([90,0,0])cylinder(d=13.22,h=2,$fn=200,center=true);
translate([0,-7.25,0])rotate([90,0,0])cylinder(d1=12.2,d2=16,h=2,$fn=200,center=true);
    }     
}



module Pol_Analyser(){
difference(){
   union(){ 
    cylinder(d=27,h=8,$fn=150,center=true);
    hull(){
     translate([0,-17,3])cylinder(d=6,h=2,$fn=50,center=true);
     translate([0,0,3])cylinder(d=6,h=2,$fn=50,center=true);
    }
   }
translate([0,0,-1.25])cylinder(d=24.1,h=6.3,$fn=150,center=true);
translate([0,0,-1])cylinder(d=24.3,h=5.8,$fn=150,center=true);    
cylinder(d=14,h=10,$fn=150,center=true);
translate([0,0,2.4])cube([17.4,17.4,2],center=true);
translate([0,0,-3.1])cube([30,1,2],center=true);
translate([0,0,-3.1])cube([1,30,2],center=true);    
}
}



module Fibre_Retainer(){
  difference(){
 
union(){
    hull(){
    translate([0,-4,0])rotate([90,0,0])cylinder(d=16.5,h=6,$fn=170,center=true);
    translate([8.8,-4,8])rotate([90,0,0])cylinder(d=6,h=6,$fn=50,center=true);
    translate([-8.8,-4,8])rotate([90,0,0])cylinder(d=6,h=6,$fn=50,center=true);
    }
    translate([0,5,0])rotate([90,0,0])cylinder(d2=14,d1=8,h=14,$fn=120,center=true); 
    
}  
    translate([0,7.6,0])rotate([90,0,0])cylinder(d=3.6,h=14,$fn=80,center=true);
    translate([0,-1.5,0])rotate([90,0,0])cylinder(d1=2.4,d2=12,h=4.5,$fn=120,center=true);

    translate([0,-4.78,0])rotate([90,0,0])cylinder(d=12,h=2.1,$fn=120,center=true);

    rotate([90,0,0])cylinder(d=2.5,h=10,$fn=80,center=true);        
translate([0,-6.7,0])rotate([90,0,0])cylinder(d=13.5,h=2,$fn=200,center=true);
translate([0,-6.25,0])rotate([90,0,0])cylinder(d=13.6,h=1.1,$fn=200,center=true);
translate([0,-7.15,0])rotate([90,0,0])cylinder(d1=12.2,d2=16,h=2,$fn=200,center=true);

translate([7.2,-4.7,6.2])rotate([90,0,0])cylinder(d=3.5,h=5,$fn=50,center=true);
translate([-7.2,-4.7,6.2])rotate([90,0,0])cylinder(d=3.5,h=5,$fn=50,center=true);

translate([7.2,0.5,6.2])rotate([90,0,0])cylinder(d=6.5,h=7,$fn=50,center=true);
translate([-7.2,0.5,6.2])rotate([90,0,0])cylinder(d=6.5,h=7,$fn=50,center=true);
    }     
}



module Fibre_Adapter(){
difference(){
union(){
cylinder(d=5.75,h=15,$fn=50,center=true);
translate([0,0,11])cylinder(d=7,h=8,$fn=50,center=true);
}
cylinder(d=3.25,h=32,$fn=50,center=true);
}
}



module ModLight_Condenser(){
difference(){
rotate([15,0,0])import("condenser.stl", convexity = 5);
translate([0,15,-0.9])cube([30,50,10],center=true);
translate([0,0,12.5])cylinder(d1=12.5,d2=11,h=20,$fn=80,center=true);
//#translate([0,36,20])cube([40,1,30],center=true);
translate([7.2,6.2,5])cylinder(d=2.6,h=10,$fn=50,center=true);
translate([-7.2,6.3,5])cylinder(d=2.6,h=10,$fn=50,center=true);
}
difference(){
translate([0,25,6.8])cube([30,20,5.4],center=true);
minkowski(){
translate([0,29,6.5])cube([23-4,20-4,8],center=true);
cylinder(d=4,h=0.01,$fn=20);
}
}
}




//translate([0,0,36])Pol_Analyser();
//translate([0,0,-10])rotate([-90,0,0])Fibre_Collimator();
translate([0,0,-5])rotate([-90,0,0])Fibre_Retainer();
//tall_condenser();
//ModLight_Condenser();
//Fibre_Adapter();





