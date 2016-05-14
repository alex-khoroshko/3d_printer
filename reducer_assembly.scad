
module reducer () {
    include <gear_reducer.scad>
}

include <MCAD/stepper.scad>
include <Libs.scad>

boltDist = 47/2;
boltDia = 4;
washerDia = 9;
tuneTrackLength = 10;

translate([0,0,-1])
motor(Nema23, size=NemaMedium, dualAxis=false);


$fn=50;

axisDistance = 60;
translate([-axisDistance,0,-29])
reducer ();


    
tensionerWidth = 14;
tensionerHeight = 8;
tensionerVdepth=3;
tensionerBolt=3.2;

module v_shape () {
    translate([-(tensionerWidth/2+0.001),tensionerWidth/2,-tensionerHeight/2-0.001])
    rotate([90,0,0])
    linear_extrude(height=tensionerWidth+0.002)
    polygon(points=[[0,-tensionerVdepth],[0,tensionerVdepth],[tensionerVdepth,0]]);
}


translate([-axisDistance+30,10,-19])
difference () {
    //отрисовка штыря держателя подшипника и куба над ним
    //
    translate([0,0,1])
    union () {
        linear_extrude(height=7)
        circle  (r=4);
        translate([0,0,-1])
        linear_extrude(height=1)
        circle  (r=4+2);
        translate([-tensionerWidth/2,-tensionerWidth/2,-(tensionerHeight+1)])
        linear_extrude(height=tensionerHeight)
        polygon(points=[[0,tensionerWidth],[tensionerWidth,tensionerWidth],[tensionerWidth,0],[0,0]]);
    }
    //v-канал
    v_shape ();
    mirror([1,0,0])
    v_shape ();
    
    translate([0,0.001+tensionerWidth/2,-tensionerHeight/2])
    rotate([90,0,0])
    linear_extrude(height=tensionerWidth+0.002)
    circle (r=tensionerBolt/2);
}



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
module plate_wHoles () {  
    difference () {
        plate ();
        centerHole ();
        boltHole ();
        mirror ([0,1,0])
        boltHole ();
        translate ([-boltDist*2,0,0])
        boltHole ();
        mirror ([0,1,0])
        translate ([-boltDist*2,0,0])
        boltHole ();
    }
}

module centerHole () {
    smallRad=14;
    bigRad=38.5/2;
    
    translate([0,0,-1.499])
    linear_extrude(height=1.5)
    union () {
        circle (r=38.5/2);
        translate([tuneTrackLength,0,0])
        circle (r=bigRad);
        polygon(points=[[0,bigRad],[tuneTrackLength,bigRad],[tuneTrackLength,-bigRad],[0,-bigRad]]);
    }
           
    translate ([0,0,-10])
    linear_extrude(height=20)
    union () {
        circle (r=smallRad);
        translate ([tuneTrackLength,0,0])
        circle (r=smallRad);
        polygon(points=[[0,smallRad],[tuneTrackLength,smallRad],[tuneTrackLength,-smallRad],[0,-smallRad]]);
    }
}

module triangle () {
    translate([-28,30,0])
    rotate([0,90,0])
    linear_extrude(height=28*2)
    polygon (points=[[0,0],[5,0],[2.5,3]]);
}


module plate () {
    translate([0,0,-5])
    linear_extrude(height=5)
    polygon (points=[[tuneTrackLength+28,30],[-28,30],[-28,-30],[tuneTrackLength+28,-30]]);
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
/*
holder_guide ();
mirror([0,1,0])
holder_guide ();
*/

//plate_wTriangles ();

/*

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
*/
/*

//переход со стенок 5мм на 3мм вертикальные
mirror([0,1,0])
translate([-28,30,-50])
linear_extrude(height=100)
polygon (points=[[-10,0],[0,0],[0,5],[-10,3]]);
translate([-28,30,-50])
linear_extrude(height=100)
polygon (points=[[-10,0],[0,0],[0,5],[-10,3]]);
*/
/*
translate ([0,0,-22])
linear_extrude(height=3)
polygon (points=[[28,30+5],[-28,30+5],[-28,-30-5],[28,-30-5]]);
*/

//boltHole ();

module boltHole () {
    boltHoleRad=0.6+boltDia/2;
    washerRad = washerDia/2;
    washerSpace = washerRad+1;
    translate ([boltDist,boltDist,-(3+5)])
    linear_extrude (height=5)
    union () {
        circle (r=washerSpace);
        translate ([tuneTrackLength,0,0])
        circle (r=washerSpace);
        polygon(points=[[0,washerSpace],[tuneTrackLength,washerSpace],[tuneTrackLength,-washerSpace],[0,-washerSpace]]);
    }
    translate ([boltDist,boltDist,-5])
    linear_extrude(height=10)
    union () {
        circle (r=boltHoleRad);
        translate ([tuneTrackLength,0,0])
        circle (r=boltHoleRad);
        polygon(points=[[0,boltHoleRad],[tuneTrackLength,boltHoleRad],[tuneTrackLength,-boltHoleRad],[0,-boltHoleRad]]);
    }
} 

plate_wHoles ();

module bolt_wWasher () {
    translate ([boltDist,boltDist,-4])
    color([1,1,1])
    union () {
        capBolt("M4",12);
        washer(size="M4");
    }
}

bolt_wWasher ();
mirror ([1,1,0])
bolt_wWasher ();
mirror ([0,1,0])
bolt_wWasher ();
mirror ([1,0,0])
bolt_wWasher ();

