

// Calibration Coefficients
// Ultimaker 2
A=1.001;
B=0.272;



module Light_Mixer_Base(){
difference(){
union(){
// Mounting tabs    
hull(){
translate([50-12.5,25,-16])cylinder(d=16,h=8,$fn=80,center=true);
translate([-25-12.5,25,-16])cylinder(d=16,h=8,$fn=80,center=true);
}
hull(){
translate([50-12.5,-25,-16])cylinder(d=16,h=8,$fn=80,center=true);
translate([-25-12.5,-25,-16])cylinder(d=16,h=8,$fn=80,center=true);
}
// Overall enclosure
minkowski(){        
translate([0,0,-3])cube([61,61,34],center=true);
cylinder(d=5,h=0.01,$fn=80,center=true);    
}
}
// Cutouts for LED assemblies
translate([0,28,2.5])LED_Assembly_Cutout();
translate([0,-28,2.5])rotate([0,0,180])LED_Assembly_Cutout();
translate([28,0,2.5])rotate([0,0,-90])LED_Assembly_Cutout();

// Cutout for Fibre assembly
translate([-28,0,2.5])rotate([0,0,90])Fibre_Assembly_Cutout();

// Central recesses
translate([0,0,6])cube([45,46,35],center=true);
translate([0,0,13.5])cube([48,48,2],center=true);

// Locating magnets for lid
translate([29,29,13])cylinder(d=2.97*A+B,h=2.2,$fn=80,center=true);
translate([29,-29,13])cylinder(d=2.97*A+B,h=2.2,$fn=80,center=true);
translate([-29,29,13])cylinder(d=2.97*A+B,h=2.2,$fn=80,center=true);
translate([-29,-29,13])cylinder(d=2.97*A+B,h=2.2,$fn=80,center=true);

// Mounting tab holes and screw recesses
translate([50-12.5,25,-15])cylinder(d=6.3,h=11,$fn=80,center=true);
translate([-25-12.5,25,-15])cylinder(d=6.3,h=11,$fn=80,center=true);
translate([50-12.5,-25,-15])cylinder(d=6.3,h=11,$fn=80,center=true);
translate([-25-12.5,-25,-15])cylinder(d=6.3,h=11,$fn=80,center=true);
translate([50-12.5,25,0])cylinder(d1=11,d2=7.6,h=33,$fn=80,center=true);
translate([-25-12.5,25,0])cylinder(d1=11,d2=7.6,h=33,$fn=80,center=true);
translate([50-12.5,-25,0])cylinder(d1=11,d2=7.6,h=33,$fn=80,center=true);
translate([-25-12.5,-25,0])cylinder(d1=11,d2=7.6,h=33,$fn=80,center=true);

// Recess for X-Cube
translate([0,0,-1])cube([24.9,24.9,24.8],center=true);
}
}



module X_Prism(){
// X-Cube
color([0.7,1,1,0.4])translate([0,0,-1])cube([24.8,24.8,24.8],center=true);
color("blue")rotate([0,0,-45])cube([35,0.3,23],center=true);
color("red")rotate([0,0,45])cube([35,0.3,23],center=true);     
}



module Light_Mixer_Lid(){
difference(){    

// Overall Lid Envelope
union(){    
minkowski(){        
translate([0,0,-5])cube([61,61,6],center=true);
cylinder(d=5,h=0.01,$fn=80,center=true);    
}
translate([0,0,-8])cube([47.2,47.2,2],center=true);
}

// Recess
translate([0,0,-7.5])cube([45,45,4],center=true);

// Magnets for lid
translate([29,29,-7])cylinder(d=2.97*A+B,h=2.2,$fn=80,center=true);
translate([29,-29,-7])cylinder(d=2.97*A+B,h=2.2,$fn=80,center=true);
translate([-29,29,-7])cylinder(d=2.97*A+B,h=2.2,$fn=80,center=true);
translate([-29,-29,-7])cylinder(d=2.97*A+B,h=2.2,$fn=80,center=true);

// Cutouts for LED assemblies
translate([0,28,-26+1.6])rotate([0,0,90])cube([5.7,30.7,36],center=true);
translate([0,-28,-26+1.6])rotate([0,0,90])cube([5.7,30.7,36],center=true);
translate([28,0,-26+1.6])cube([5.7,30.7,36],center=true);
translate([0,24,-10.6])rotate([0,0,90])cube([5.7,29.2,5],center=true);
translate([0,-24,-10.6])rotate([0,0,90])cube([5.7,29.2,5],center=true);
translate([23,0,-10.6])rotate([0,0,0])cube([5.7,29.2,5],center=true);

// Cutout for Fibre assembly
translate([-28,0,-26+1.6])cube([5.7,30.7,36],center=true);
translate([-23,0,-10.6])rotate([0,0,0])cube([5.7,29.2,5],center=true);
}
}



module Heatsink_Drill_Guide(){    
    difference(){
    cube([27,27,5],center=true);
    translate([0,0,2])cube([23.2,23.2,3],center=true);    
    translate([18/2,0,0])cylinder(d=2,h=7,$fn=30,center=true);
    translate([-18/2,0,0])cylinder(d=2,h=7,$fn=30,center=true);
    translate([18/2,18/2,0])cylinder(d=2,h=7,$fn=30,center=true);
    translate([-18/2,-18/2,0])cylinder(d=2,h=7,$fn=30,center=true);    
    }  
}



module Heatsink_Mount_C(){    
    difference(){
    cube([30,5,30],center=true);
    translate([0,1.8,0])cube([23.2,5,23.2],center=true);    
    translate([0,0,0])rotate([90,0,0])cylinder(d=21,h=7,$fn=100,center=true);
    translate([18/2,0,0])rotate([90,0,0])cylinder(d=3.5,h=7,$fn=30,center=true);
    translate([-18/2,0,0])rotate([90,0,0])cylinder(d=3.5,h=7,$fn=30,center=true);
    translate([18/2,0,-18/2])rotate([90,0,0])cylinder(d=2.5,h=7,$fn=30,center=true);
    translate([-18/2,0,18/2])rotate([90,0,0])cylinder(d=2.5,h=7,$fn=30,center=true);     
    }  
}



module Heatsink_Mount_R(){    
    difference(){
    cube([30,5,30],center=true);
    translate([0,1.8,0])cube([23.2,5,23.2],center=true);   
    translate([0,0,0])cube([23.2,7,14],center=true);
    translate([18/2,0,0])rotate([90,0,0])cylinder(d=3.5,h=7,$fn=30,center=true);
    translate([-18/2,0,0])rotate([90,0,0])cylinder(d=3.5,h=7,$fn=30,center=true);
    translate([18/2,0,-18/2])rotate([90,0,0])cylinder(d=2.5,h=7,$fn=30,center=true);
    translate([-18/2,0,18/2])rotate([90,0,0])cylinder(d=2.5,h=7,$fn=30,center=true);     
    }  
}



module LED_Spacer(){    
    difference(){
    cube([25,25,5],center=true);
    translate([0,0,3])cylinder(d=20,h=7,$fn=100,center=true);   
    translate([0,0,0])cylinder(d=13.2,h=7,$fn=100,center=true); 
    translate([18/2,0,0])cylinder(d=3.5,h=7,$fn=30,center=true);
    translate([-18/2,0,0])cylinder(d=3.5,h=7,$fn=30,center=true);    
    }  
}



module PMMA_Mount(){    
    difference(){
    translate([0,-1.5,0])cube([26.2,8,26.2],center=true);
    translate([0,-1.3,0])rotate([90,0,0])cylinder(d1=13*A+B+0.15,d2=13*A+B-0.15,h=7,$fn=200,center=true);     
    rotate([90,0,0])cylinder(d=12.2,h=12,$fn=100,center=true);
    translate([0,3,0])rotate([90,0,0])cylinder(d=18,h=5,$fn=100,center=true);    
    translate([18/2,3.5,0])rotate([90,0,0])cylinder(d=6,h=7,$fn=50,center=true);
    translate([-18/2,3.5,0])rotate([90,0,0])cylinder(d=6,h=7,$fn=50,center=true);    
    translate([-18/2,0,18/2])rotate([90,0,0])cylinder(d=3,h=12,$fn=30,center=true);
    translate([18/2,0,-18/2])rotate([90,0,0])cylinder(d=3,h=12,$fn=30,center=true);
    translate([5.5,2.5,10])cylinder(d=3,h=20,$fn=30,center=true);
    translate([-5.5,2.5,10])cylinder(d=3,h=20,$fn=30,center=true);
    translate([0,-4.3,0])rotate([90,0,0])cylinder(d=13*A+B,h=1,$fn=200,center=true);    
    }  
}



module Fibre_Mount(){    
    difference(){
    cube([30,5,30],center=true);
            
    translate([0,1.5,0])rotate([90,0,0])cylinder(d1=13.3,d2=13.05,h=7,$fn=200,center=true);     
    
    rotate([90,0,0])cylinder(d=12.2,h=12,$fn=100,center=true); 
    
    translate([0,-1.5,0])rotate([90,0,0])cylinder(d=13.15,h=1,$fn=200,center=true); 
        
    translate([19/2,0,19/2])rotate([90,0,0])cylinder(d=2,h=7,$fn=30,center=true);
    translate([-19/2,0,-19/2])rotate([90,0,0])cylinder(d=2,h=7,$fn=30,center=true);
    translate([-19/2,0,19/2])rotate([90,0,0])cylinder(d=2,h=12,$fn=30,center=true);
    translate([19/2,0,-19/2])rotate([90,0,0])cylinder(d=2,h=12,$fn=30,center=true);    
    }  
}



module Fibre_Holder(){    
    difference(){
    union(){    
    minkowski(){    
    cube([21.5,5,21.5],center=true);
    rotate([90,0,0])cylinder(d=5,h=0.01,$fn=50,center=true);        
    }
    translate([0,5,0])rotate([90,0,0])cylinder(d2=10,d1=8,h=14,$fn=100,center=true); 
} 
    translate([0,6,0])rotate([90,0,0])cylinder(d=3.32*A+B,h=14,$fn=80,center=true);

    translate([0,-2.5,0])rotate([90,0,0])cylinder(d1=2.5,d2=8,h=3,$fn=80,center=true);

    rotate([90,0,0])cylinder(d=2.5,h=10,$fn=80,center=true);     
        
    translate([19/2,0,19/2])rotate([90,0,0])cylinder(d=3.5,h=7,$fn=50,center=true);
    translate([-19/2,0,-19/2])rotate([90,0,0])cylinder(d=3.5,h=7,$fn=50,center=true);
    translate([-19/2,0,19/2])rotate([90,0,0])cylinder(d=3.5,h=12,$fn=50,center=true);
    translate([19/2,0,-19/2])rotate([90,0,0])cylinder(d=3.5,h=12,$fn=50,center=true);    
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



module Heatsink(){
color("gray")difference(){    
cube([26,8,26],center=true);
translate([0,3,0])cube([30,6,3],center=true);
translate([0,3,5])cube([30,6,3],center=true);
translate([0,3,10])cube([30,6,3],center=true);
translate([0,3,-5])cube([30,6,3],center=true);
translate([0,3,-10])cube([30,6,3],center=true);
translate([0,3,0])cube([3,6,30],center=true);
translate([5,3,0])cube([3,6,30],center=true);
translate([10,3,0])cube([3,6,30],center=true);
translate([-5,3,0])cube([3,6,30],center=true);
translate([-10,3,0])cube([3,6,30],center=true);
translate([18/2,-2,-18/2])rotate([90,0,0])cylinder(d=2.5,h=7,$fn=30,center=true);
translate([-18/2,-2,18/2])rotate([90,0,0])cylinder(d=2.5,h=7,$fn=30,center=true);     
translate([18/2,-2,0])rotate([90,0,0])cylinder(d=2.5,h=7,$fn=30,center=true);
translate([-18/2,-2,0])rotate([90,0,0])cylinder(d=2.5,h=7,$fn=30,center=true);   
}
}



module LED_Assembly_Cutout(){
translate([0,0,3-2.5])rotate([0,0,90])cube([5.2,30.2,36],center=true);
translate([0,-2.1,0])rotate([0,0,90])cube([1,31,36],center=true);
translate([0,1.3,-14.5])rotate([0,0,90])cube([13,15,10],center=true);
translate([0,0,1.5])rotate([0,0,90])cube([24,28,35],center=true);    
}



module Fibre_Assembly_Cutout(){
translate([0,0,3-2.5])rotate([0,0,90])cube([5.2,30.2,36],center=true);
translate([0,-2.1,0])rotate([0,0,90])cube([1,31,36],center=true);
translate([0,0,1.5])rotate([0,0,90])cube([20,28,35],center=true);   
}



module Fibre_Assembly(){
rotate([0,0,180])Fibre_Holder();    
translate([0,5,0])rotate([0,0,180])Fibre_Mount();
translate([0,6.5,0])rotate([0,0,180])Lens();    
}



module LED(){
difference(){    
color("YellowGreen")rotate([90,0,0])cylinder(d=19.5,h=1.6,$fn=200,center=true);
translate([18/2,-2,0])rotate([90,0,0])cylinder(d=2.5,h=7,$fn=30,center=true);
translate([-18/2,-2,0])rotate([90,0,0])cylinder(d=2.5,h=7,$fn=30,center=true);    
}
color("white")translate([0,-1.3,0])cube([5,1,5],center=true);
color("red")translate([0,-1.7,0])sphere(d=3,$fn=50);    
}



module Lens(){
difference(){
color("cyan")sphere(d=12,$fn=100);
translate([0,5,0])cube([20,10,20],center=true);    
}
color("cyan")rotate([90,0,0])cylinder(d=13,h=1,$fn=100,center=true);
}



module LED_Assembly(){
translate([0,3,0])Heatsink();
Heatsink_Mount_C();
translate([0,-5,0])rotate([0,180,0])PMMA_Mount();
translate([0,-1.7,0])LED();
translate([0,-8.5,0])Lens();    
}



module LED_Assembly_Exp(){
translate([0,40,0])Heatsink();
Heatsink_Mount_C();
translate([0,-40,0])rotate([0,180,0])PMMA_Mount();
translate([0,20,0])LED();
translate([0,-20,0])Lens();    
}



module Light_Mixer_Assembly(){
Light_Mixer_Base();
translate([0,28,0])LED_Assembly();
translate([0,-28,0])rotate([0,0,180])LED_Assembly();
translate([28,0,0])rotate([0,0,-90])LED_Assembly();
translate([-33,0,0])rotate([0,0,-90])Fibre_Assembly();
X_Prism();    
}



Light_Mixer_Base();
//Light_Mixer_Lid();
//Heatsink_Drill_Guide();
//Heatsink_Mount_C();
//Heatsink_Mount_R();
//LED_Spacer();
//PMMA_Mount();
//Fibre_Mount();
//Fibre_Holder();
//Fibre_Collimator();
//LED_Assembly();
//Light_Mixer_Assembly();
//LED_Assembly_Exp();




