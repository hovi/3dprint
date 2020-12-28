pick_height=60;

/*
pick shape based on:
https://www.thingiverse.com/thing:1672392
*/
module plek(height) {
	$fn=50;
	translate([0, 0, height/2])union() {
		translate([0,13,0]) scale([2,1,1])cylinder(r=6, h=height, center=true);
		translate([-5,2,0]) rotate([0,0,25])scale([1,2.8,1])cylinder(r=5, h=height, center=true);
		translate([ 5,2,0]) rotate([0,0,-25])scale([1,2.8,1])cylinder(r=5, h=height, center=true);
		rotate([0,0,0]) scale([1,3,1]) cylinder(r=3, h=height, center=true);
        
	}
}

module box() {
    s1 = 1.25;
    difference() {
        scale([s1, s1, s1], center=true) translate([0, 0, 0]) plek(60);

        s2 = 1.1;
        color([1, 0, 0])
        translate([0, 0.5, 0.6])
        scale([s2, s2, s2*3], center=true)  plek(60);
    }
}


module lid() {
    s3 = 1.40;
    difference() {
        scale([s3, s3, s3], center=true) translate([0, 0, 0]) plek(10);

        s4 = 1.26;
        color([1, 0, 0])
        translate([0, 0.5, 0.6])
        scale([s4, s4, s4*3], center=true)  plek(10);
    }
}

lid();