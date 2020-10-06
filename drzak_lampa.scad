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
fix = 0.01;

$fn = 100;


module main() {
    linear_extrude((black_height + white_small_height + extra_height))
    circle(d=circle_diameter);
}



difference() {
    main();
    distance = 18;
    height = white_small_height + black_height + extra_height + 0.01;
    hole(distance, height);
    hole(-distance, height);
    translate([0, 0, 13 + extra_height])
    outsideRim(4, 4, 4);
    
    translate([0, 0, -fix])
    linear_extrude(extra_height + 7)
    circle(r=circle_diameter /2 - 4);
}





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
        linear_extrude(full_h * 1 - fix)
        circle(r=circle_diameter / 2 + fix, center=true);        
        
        
        
        //color([1, 0, 0])
        translate([0, 0, h / 2 + mid / 2])
        cylinder(h=h, r2=circle_diameter / 2 + fix, r1 = circle_diameter / 2 - d + fix, center=true);
        //color([0, 1, 0])
        translate([0, 0, - h / 2 - mid / 2])
        cylinder(h=h, r1=circle_diameter / 2 + fix, r2 = circle_diameter / 2 - d + fix, center=true);
    translate([0, 0, - mid / 2])
    linear_extrude(mid - fix)
    circle(r=circle_diameter / 2 - d + fix, center=true);
        
    }

}


//outsideRim(2);