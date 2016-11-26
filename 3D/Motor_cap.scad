
/* Configuration params */
// Motor Diameter
motorDiam = 7.5;
// Print tolerance
tol = 0.4;

/* [Hidden] */
$fn=50;


module motor_cap(){
    difference() {
        union(){
            translate([0, 0, -8.3]) cylinder(r2=10.8/2, r1=8/2, h=7.2);
            translate([0, 0, -8.28]) cylinder(h=8,r=8/2);
            translate([0, 0, -1.1]) cylinder(r=10.8/2, h=5);
        }
        translate([0, 0, -8.5]) cylinder(h=10,r=5.5/2);
        translate([0, 0, -1.1]) cylinder(r=(motorDiam+tol)/2, h=20);
        translate([0, 5, 1.4]) cube([1.5,10,5.1], center=true);
        translate([0, 3.5, -1]) rotate([40,0,0]) cube([1.5,4,1.7], center=true);
        translate([0, 3.5, -0.7]) rotate([0,0,0]) cube([1.5,4,1.7], center=true);
    }
}



motor_cap();