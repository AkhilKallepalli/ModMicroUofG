
module RGB_Base(){
difference(){
    union(){
minkowski(){
cube([95-5,62-5,10],center=true);
cylinder(d=5,h=0.01,$fn=80);    
}
hull(){
translate([41.5,35,-2.5])cylinder(d=12,h=5,$fn=80,center=true);
translate([41.5,-35,-2.5])cylinder(d=12,h=5,$fn=80,center=true);
}
hull(){
translate([-41.5,35,-2.5])cylinder(d=12,h=5,$fn=80,center=true);
translate([-41.5,-35,-2.5])cylinder(d=12,h=5,$fn=80,center=true);
}
}

translate([0,0,2])cube([89,56,10],center=true);
translate([0,25,8])cube([73,15,9],center=true);

translate([41.5,-35,-3])cylinder(d=4.4,h=7,$fn=80,center=true);
translate([-41.5,-35,-3])cylinder(d=4.4,h=7,$fn=80,center=true);
translate([41.5,35,-3])cylinder(d=4.4,h=7,$fn=80,center=true);
translate([-41.5,35,-3])cylinder(d=4.4,h=7,$fn=80,center=true);
}

difference(){
union(){
translate([75.241/2+1.5,45/2+0.2,-1])cylinder(d=7,h=6,$fn=80,center=true);
translate([-75.241/2+1.1,45/2-(30.449/2),-1])cylinder(d=7,h=6,$fn=80,center=true);
translate([-75.241/2+1.1,-45/2,-1])cylinder(d=7,h=6,$fn=80,center=true);
translate([75.241/2+1.5,-45/2,-1])cylinder(d=7,h=6,$fn=80,center=true);}

translate([75.241/2+1.5,45/2+0.2,-1])cylinder(d=2.8,h=7,$fn=80,center=true);
translate([-75.241/2+1.1,45/2-(30.449/2),-1])cylinder(d=2.8,h=7,$fn=80,center=true);
translate([-75.241/2+1.1,-45/2,-1])cylinder(d=2.8,h=7,$fn=80,center=true);
translate([75.241/2+1.5,-45/2,-1])cylinder(d=2.8,h=7,$fn=80,center=true);
}
}



module RGB_Thin_Dial(){
    difference(){
  cylinder(d1=14,d2=12,h=15,$fn=12);
  intersection(){
    translate([0,0,-2])cylinder(d=6.35,h=14,$fn=80);
    translate([0,0.75,5])cube([8,4.85,11],center=true);  
  }
    rotate([0,0,-90])translate([0,5,15])cube([1,10,2],center=true);      
    }
}



module Scale(){
rotate([0,0,45])translate([7.6,0,1.4])cube([6,1.1,2],center=true);
rotate([0,0,-45])translate([7.6,0,1.4])cube([6,1.1,2],center=true);
rotate([0,0,90+45])translate([7.6,0,1.4])cube([6,1.1,2],center=true);
rotate([0,0,-90-45])translate([7.6,0,1.4])cube([6,1.1,2],center=true);

rotate([0,0,45+90/3])translate([7.1,0,1.4])cube([5,0.8,2],center=true);
rotate([0,0,45+(90/3)*2])translate([7.1,0,1.4])cube([5,0.8,2],center=true);
rotate([0,0,(45+90/3)+90])translate([7.1,0,1.4])cube([5,0.8,2],center=true);
rotate([0,0,(45+(90/3)*2)+90])translate([7.1,0,1.4])cube([5,0.8,2],center=true);
rotate([0,0,-45-(90/3)*2])translate([7.1,0,1.4])cube([5,0.8,2],center=true);
rotate([0,0,-45-90/3])translate([7.1,0,1.4])cube([5,0.8,2],center=true);

}



module Dial_Plate(){
difference(){
union(){    
translate([0,0,-2.2])cube([11,11,3],center=true);
cylinder(d=23,h=2,$fn=100,center=true);
}
cylinder(d=7.3,h=10,$fn=100,center=true);

translate([6.5/2,-8.8/2,-3.5])cylinder(d=2,h=4,$fn=30,center=true);
translate([-6.5/2,8.8/2,-3.5])cylinder(d=2,h=4,$fn=30,center=true);
}
}



module Scale_Plate(){
    difference(){
union(){    
translate([0,0,-3])Dial_Plate();
translate([48.7/3,0,-3])Dial_Plate();
translate([(48.7/3)*2,0,-3])Dial_Plate();
translate([48.7,0,-3])Dial_Plate();
}
translate([0,0,-3])Scale();
translate([48.7/3,0,-3])Scale();
translate([(48.7/3)*2,0,-3])Scale();
translate([48.7,0,-3])Scale();
}
}



//RGB_Base();
//RGB_Thin_Dial();
translate([0,0,0])Scale_Plate();

