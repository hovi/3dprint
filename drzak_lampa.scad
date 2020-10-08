outer_black_biggest = 8.5;
black_height = 15.5;
white_small_height = 9.7;
white_bigger = 10;
white_smaller = 8;
white_top_bigger = 11.6;
white_top_smaller = 9.8;

extra_space = 0.4;
extra_height = 0;
circle_diameter = 40;

main_height = white_small_height + black_height + extra_height;
fix = 0.01;

$fn = 100;


module main() {
    linear_extrude((black_height + white_small_height + extra_height))
    circle(d=circle_diameter);
}



module top() {
    translate([0, 0, main_height])
    difference() {
        main();
        distance = 18;
        height = main_height + 0.01;
        hole(distance, height);
        hole(-distance, height);
        translate([0, 0, 13 + extra_height])
        outsideRim(4, 4, 4);
        
        translate([0, 0, -fix])
        linear_extrude(extra_height + 7)
        circle(r=circle_diameter /2 - 4);
    }
}



module bottom() {
    overlap = 5;
    outer_r = 35;
    outer_smaller_r = circle_diameter / 2 + 3;
    cylinder_h = main_height - 11;
    difference() {
        union() {
            h = main_height + overlap;
            translate([0, 0, cylinder_h / 2])
            cylinder(h=cylinder_h, r1=outer_r + fix, r2=outer_smaller_r + fix, center=true);
            linear_extrude(h)
            circle(r=outer_smaller_r);
        }
        translate([0, 0, main_height])
        linear_extrude(overlap + fix)
        circle(r=circle_diameter / 2 + 0.25);
        
        linear_extrude(main_height + fix)
        circle(r=circle_diameter / 2 - 3);
        
        x = 4;
        translate([0, 0, cylinder_h / 2 - fix])
        cylinder(h=cylinder_h, r1=outer_r + fix - x, r2=outer_smaller_r - 10 + fix - x, center=true);
        
        translate([0, 0, 3])
        rotate([90, 0, 0])
        linear_extrude(outer_r)
        circle(r=2);
        
        translate([0, - outer_r, 0])
        cube([1.4, outer_r, 3], center=true);

    }
}


bottom();
//top();


module hole(distance, height) {
    t=1;
    w=distance * 3;
    translate([0, distance / 2, height / 2])
    cube([white_bigger + extra_space, white_smaller + extra_space, height], center=true);
    translate([0, distance / 2 + w/2, height / 2])
    cube([t, abs(w), height], center=true);
}




module outsideRim(h=2, d=2,mid=1) {
    //cube([d, d, h * 1.5], center=true);
    full_h  = h * 2 + mid;
    difference() {
        
        translate([0, 0, - full_h / 2])
        linear_extrude(full_h * 1 - fix, center=false)
        circle(r=circle_diameter / 2 + fix, center=true);        
        
        
        
        //color([1, 0, 0])
        translate([0, 0, h / 2 + mid / 2])
        cylinder(h=h, r2=circle_diameter / 2 + fix, r1 = circle_diameter / 2 - d + fix, center=true);
        //color([0, 1, 0])
        translate([0, 0, - h / 2 - mid / 2])
        cylinder(h=h, r1=circle_diameter / 2 + fix, r2 = circle_diameter / 2 - d + fix, center=true);
    translate([0, 0, - mid / 2])
    linear_extrude(mid - fix, center=false)
    circle(r=circle_diameter / 2 - d + fix, center=true);
        
    }

}


//outsideRim(2);