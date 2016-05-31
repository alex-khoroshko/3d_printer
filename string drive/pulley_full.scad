

module pulley () {
    include <gt2.scad>
}

$fn=100;

pulley ();

translate([0,0,11])
import("string_guide_render.stl");

module bearingShaft () {
    translate ([0,0,-7-2])
    linear_extrude(height=7)
    circle(r=4);

    translate ([0,0,-2])
    linear_extrude(height=2)
    circle(r=6);
}

bearingShaft ();

translate([0,0,62])
mirror([0,0,1])
bearingShaft ();