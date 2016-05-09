
module p2 () {
    include <htd5h.scad>
}


module p1 () {
include <gt2.scad>
}


module pulleys () {
    translate  ([0,0,7+7+1+2])
    union () {
        translate([0,0,-7])
        p1 ();
        p2 ();

        $fn = 100;

        translate ([0,0,-7-7-1-2])
        linear_extrude(height=7)
        circle(r=4);

        translate ([0,0,-7-1-2])
        linear_extrude(height=2)
        circle(r=6);

        translate ([0,0,-7-1])
        linear_extrude(height=1)
        circle(r=20);


        translate ([0,0,17])
        linear_extrude(height=2)
        circle(r=14);

        translate ([0,0,17+2])
        linear_extrude(height=2)
        circle(r=6);


        translate ([0,0,17+2+2])
        linear_extrude(height=7)
        circle(r=4);
    }
}

pulleys ();