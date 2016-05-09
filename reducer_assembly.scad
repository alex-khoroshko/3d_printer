
module reducer () {
    include <gear_reducer.scad>
}

include <MCAD/stepper.scad>


/*
translate([0,0,-1])
motor(Nema23, size=NemaMedium, dualAxis=false);
*/

$fn=50;
axisDistance = 60;
translate([-axisDistance,0,-25])
reducer ();
/*
difference () {
    translate([0,0,-5])
    linear_extrude(height=5)
    intersection () {
        polygon (points=[[28,30],[-28,30],[-28,-28],[28,-28]]);
        union () {
            circle(r=38.5);
            polygon (points=[[28,0],[-28,0],[-28,30],[28,30]]);
        }
    }
    translate ([0,0,-50])
    linear_extrude(height=100)
    union () {
        translate ([47/2,47/2,0])
        circle (r=2.6);
        translate ([-47/2,47/2,0])
        circle (r=2.6);
        translate ([47/2,-47/2,0])
        circle (r=2.6);
        translate ([-47/2,-47/2,0])
        circle (r=2.6);
    }

    translate([0,0,-1.499])
    linear_extrude(height=1.5)
    circle (r=38.5/2);
    
    translate ([0,0,-10])
    linear_extrude(height=20)
    circle (r=8);
}

translate([0,30,-5])
linear_extrude (height=26)
polygon (points=[[28,0],[-28,0],[-28,5],[28,5]]);

difference () {
    translate([0,30+5,16.001])
    linear_extrude (height=5)
    polygon (points=[[28,0],[-28,0],[-28,50],[28,50]]);
    
    translate ([0,axisDistance,16])
    linear_extrude(height=7)
    circle (r=14);
}

translate([0,axisDistance,13])
bearing_holder ();    
    
    
module bearing_holder () {    
    linear_extrude(height=7)
    difference () {
        circle (r=15);
        circle (r=11.2);
    }
    
    translate ([0,0,7])
    linear_extrude(height=1)
    difference () {
        circle (r=15);
        circle (r=9);
    }
}
    
    translate([10,20,-15])
    linear_extrude(height=7)
    difference () {
        circle (r=11);
        circle (r=4);
    }
    */
module plate_wTriangles () {  
    difference () {
        plate ();

        
        translate ([0,0,-50])
        linear_extrude(height=100)
        union () {
            translate ([47/2,47/2,0])
            circle (r=2.6);
            translate ([-47/2,47/2,0])
            circle (r=2.6);
            translate ([47/2,-47/2,0])
            circle (r=2.6);
            translate ([-47/2,-47/2,0])
            circle (r=2.6);
        }

        translate([0,0,-1.499])
        linear_extrude(height=1.5)
        circle (r=38.5/2);
        
        translate ([0,0,-10])
        linear_extrude(height=20)
        circle (r=14);
     

    }
}


module triangle () {
    translate([-28,30,0])
    rotate([0,90,0])
    linear_extrude(height=28*2)
    polygon (points=[[0,0],[5,0],[2.5,3]]);
}


module plate () {
    intersection () {
        union () {
            translate([0,0,-5])
            linear_extrude(height=5)
            intersection () {
                polygon (points=[[28,30],[-28,30],[-28,-30],[28,-30]]);
                union () {
                    
                }
            }
            
            triangle ();
            
            mirror ([0,1,0])
            triangle ();
        }
        
        translate([0,0,-10])
        linear_extrude(height=20)   
        circle(r=40);
    }
}

module holder_guide () {
    translate([-28,30,2.5])
    rotate([0,90,0])
    linear_extrude (height=28*2+10)
    difference () {
        polygon (points=[[0,0],[20,0],[20,5],[0,5]]);
        translate ([2.5,0,0])
        polygon (points=[[0,0],[5,0],[2.5,3]]);
    }
}

holder_guide ();
mirror([0,1,0])
holder_guide ();

plate_wTriangles ();

translate([28,0,-(5)])
rotate([180,0,180])
difference () {
    intersection () {
        linear_extrude (height=12)
        union () {
            mirror([0,1,0])
            polygon (points=[[0,-10],[20,-15],[20,-13],[3,-8],[3,0],[0,0]]);
            polygon (points=[[0,-10],[20,-15],[20,-13],[3,-8],[3,0],[0,0]]);
        }

        translate([20,-30,0])
        rotate([90,0,180])
        linear_extrude(height=50)
        polygon (points=[[0,0],[20,0],[20,12],[0,3]]);
    }

    translate([-0.001,0,6])
    rotate([0,90,0])
    linear_extrude(height=10)
    circle(r=3.1);
}

difference () {
    translate([28+10,0,-15-2.5])
    linear_extrude(height=20)
    rotate([0,0,90])
    polygon (points=[[30+5,0],[-30-5,0],[-30-5,-5],[30+5,-5]]);

    translate([28+10-0.001,0,-5-6])
    rotate([0,90,0])
    linear_extrude(height=10)
    circle(r=3.1);
}



//переход со стенок 5мм на 3мм вертикальные
mirror([0,1,0])
translate([-28,30,-50])
linear_extrude(height=100)
polygon (points=[[-10,0],[0,0],[0,5],[-10,3]]);
translate([-28,30,-50])
linear_extrude(height=100)
polygon (points=[[-10,0],[0,0],[0,5],[-10,3]]);

translate ([0,0,-22])
linear_extrude(height=3)
polygon (points=[[28,30+5],[-28,30+5],[-28,-30-5],[28,-30-5]]);