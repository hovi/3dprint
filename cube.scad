sizex = 9.32;
sizey = 10;
sizez = 10;
wall = 1;
small_sizex = sizex - wall;
small_sizey = sizey - wall;
small_sizez = sizez - wall;

difference() {
    translate([0,  - 4.7, 0])
    rotate([90, 0, 0])
    scale([0.1 , 0.1, 0.33])
    import("lucie.stl");
    cube([small_sizex, small_sizey, small_sizez], center=true);
}
//cube([93.2, 100, 3], center=true);
difference() {
    cube([sizex, sizey, sizez], center=true);
    //translate([0, 0, wall * 2])
    cube([small_sizex, small_sizey, small_sizez], center=true);
}