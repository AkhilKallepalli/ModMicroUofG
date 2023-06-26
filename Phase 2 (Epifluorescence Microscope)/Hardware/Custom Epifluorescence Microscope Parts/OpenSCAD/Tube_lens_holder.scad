module tubelensholder1(){
    difference(){
    cube([50,50,4],center=true);
    cylinder(r=11,h=11,center=true,$fn=100);
    //top magnet holders
    translate([20,20,-0.5])cylinder(h=3.7,r=3,center=true,$fn=50);
    translate([-20,-20,-0.5])cylinder(h=3.7,r=3,center=true,$fn=50);
    translate([-20,20,-0.5])cylinder(h=3.7,r=3,center=true,$fn=50);
    translate([20,-20,-0.5])cylinder(h=3.7,r=3,center=true,$fn=50);
}

translate([0,0,3.5])difference(){
    cylinder(h=4,r=13.5,center=true);
    cylinder(h=10,r=25.4/2 + 0.1,center=true,$fn=100);
}
}

tubelensholder1();