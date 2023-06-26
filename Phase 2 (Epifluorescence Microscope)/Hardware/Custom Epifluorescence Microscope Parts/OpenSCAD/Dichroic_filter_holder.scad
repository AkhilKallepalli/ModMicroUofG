//filter holder/'wheel' for excitation
module filter_holderdi2(){
    translate([0,50,-21])difference(){
        cube([120,41,3],center=true);
        cylinder(h=999,r=11,center=true);
        translate([-35,0,0])cylinder(h=999,r=11,center=true);
        translate([35,0,0])cylinder(h=999,r=11,center=true);
        translate([0,0,0])cube([27,38,1.5],center=true);
        translate([-35,0,0])cube([27,38,1.5],center=true);
        translate([35,0,0])cube([27,38,1.5],center=true);
    }
}    


translate([0,-50,0])difference(){
        filter_holderdi2();
        translate([0,50,-18.5])cube([119,39,4],center=true);
}