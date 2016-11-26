/* 
   Parametric Mini quadcopter Frame for SP Racing F3 Brushed (7 and 8mm motors)
   v1.0
*/

/*********************************************************************/
/*********************************************************************
Copyright (C) 2016  Alejandro Véliz Fernández

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*********************************************************************/
/********************************************************************/

/* Configuration params */
// Motor Diameter
motorDiam = 7.5;
// Motor mount extra size
extraSize = 1.2;
// Print tolerance
tolerance = 0.4;

/* [Hidden] */
$fn=60;

/*
  Frame with new 7mm holes
*/
module quad_frame() {
    difference(){
        // Frame with motor holes
        union() {
            // Import DC110 stl Repaired frame
            import("DC110_frame.stl", convexity=3);
            for(i=[0:90:270]){
                rotate([0,0,i]) translate([55,0,-2.74])
                    difference(){
                        cylinder(r=16/2, h=4);
                        #translate([0,0,-2]) 
                            cylinder(r=(motorDiam+tolerance)/2, h=7);
                    }
            }
        }
        // Add motor mount holes
        /*for(i=[0:180:180]){
            rotate([0,0,i]) translate([49.3,.2,-4]) 
                cylinder(r=(motorDiam+tolerance+extraSize)/2, h=10);
        }
        for(i=[90:180:270]){
            rotate([0,0,i]) translate([49.3,-.2,-4])
               cylinder(r=(motorDiam+tolerance+extraSize)/2, h=10);
        }*/
    }
}


// Show Frame
difference(){
    quad_frame();
    //translate([-80,-40,-5]) cube([150,120,20]);
}
