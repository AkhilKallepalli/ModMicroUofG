//filter holder/'wheel' for excitation
module filter_holderem2(){
    translate([0,-20,-20])difference(){
        cube([120,35,5],center=true);
        cylinder(h=999,r=11,center=true);
        translate([-35,0,0])cylinder(h=999,r=11,center=true);
        translate([35,0,0])cylinder(h=999,r=11,center=true);
        translate([0,0,0])cube([27,27,3],center=true);
        translate([-35,0,0])cube([27,27,3],center=true);
        translate([35,0,0])cube([27,27,3],center=true);
    }
}    
translate([0,-50,0])difference(){
        filter_holderem2();
        translate([0,-20,-18])cube([119,34,4],center=true);
        translate([0,-20,-18.75])cube([119,34,2.5],center=true);
} 

module filter_holderLid(){
translate([0,-20,-18.75])difference(){
    cube([118.5,33.5,2.5],center=true);
    translate([0,0,0.5])cube([27,27,2.5],center=true);
    translate([35,0,0.5])cube([27,27,2.5],center=true);
    translate([-35,0,0.5])cube([27,27,2.5],center=true);
}
}


//filter_holderLid();  