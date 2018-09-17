$fn = 100;
width = 67;
height = 128;
bottom_width = 83;
diff_dole = (bottom_width-width)/2;
vzdalenost_vlevo = 3;
posun = -1; //posun 4 der na ram uprostred
mid_hole = 35.5; //vzdalenost dvou blizsich sroubu u rumby

// 0 = holes in way power cords are bottom left
// 1 = holes in way power cords are top right
holes = 0;

module m3nuthole() {
    translate([0,0,1.49]) cube([3.4,5.8,3.01],true);
    translate([0,0,1.49]) rotate([0,0,60]) cube([3.4,5.8,3.01],true);
    translate([0,0,1.49]) rotate([0,0,-60]) cube([3.4,5.8,3.01],true);
    
    
}
module podlozka(vyska,prumerdiry,prumer) {
    union() {
        cylinder(vyska,prumer/2,prumer/2,false);
        cylinder(3,prumer-2,prumer-2,false);
        
    }          
    
}
module m3dira(vyska) {
    cylinder(vyska,1.7,1.7,false);
}
difference() {
    
    union() {    
    translate ([0, width, 0]) podlozka(9,3.4,8);
    translate ([height,0,0]) podlozka(9,3.4,8);

    if (holes == 0) {
        translate ([0,width-mid_hole,0]) podlozka(9,3.4,8);
        translate ([height,width,0]) podlozka(9,3.4,8);
    } else {
        translate ([height,mid_hole,0]) podlozka(9,3.4,8);
        translate ([0, 0, 0]) podlozka(9,3.4,8);
    }
    


    //spodni 2
    translate([0,-diff_dole,0]) cylinder(3,5,5,false);    
    translate([0,width + diff_dole,0]) cylinder(3,5,5,false);   
        
    //3 vlevo, 1 vpravo
    translate([48.5,width + diff_dole - vzdalenost_vlevo - posun,0]) cylinder(3,5,5,false);    
    translate([48.5 + 13.5,width + diff_dole - vzdalenost_vlevo - posun,0]) cylinder(3,5,5,false);    
    translate([48.5 + 13.5 * 2,width + diff_dole - vzdalenost_vlevo - posun,0]) cylinder(3,5,5,false);    
        
    translate([48.5,- vzdalenost_vlevo - posun,0]) cylinder(3,5,5,false);    

    translate([0, -1, 0]) cube([height,4.3,3]);
    translate([-1, - diff_dole, 0]) cube([4.3,bottom_width,3]);
    translate([0,width-3.3,0]) cube([height,4.3,3]);
    translate([height-3.3,0,0])cube([4.3,width,3]);
        
    translate([48.5 - 2.5,width - vzdalenost_vlevo + 2 - posun,0]) cube([13.5*2 + 5,3.3 + 6,3]);
        
    }
    translate ([48.5,width + diff_dole - vzdalenost_vlevo - posun,0]) m3dira(9);
    translate ([48.5, - vzdalenost_vlevo - posun,0]) m3dira(9);
    translate ([48.5 + 13.5,width + diff_dole - vzdalenost_vlevo - posun,0]) m3dira(9);
    translate ([48.5 + 13.5 * 2,width + diff_dole - vzdalenost_vlevo - posun,0]) m3dira(9);
    

    translate([0,-diff_dole,0]) m3dira(4);
    translate([0,width+diff_dole,0]) m3dira(4);
    
    m3vyska = 3.2;
    translate ([0, width, 0]) m3nuthole();
    translate ([0, width,m3vyska]) m3dira(9);
    
    translate ([height,0,0]) m3nuthole();
    translate ([height,0,m3vyska]) m3dira(9);
    if (holes == 0) {
        translate ([height,width,0]) m3nuthole();
        translate ([height,width,m3vyska]) m3dira(9);
        
        translate ([0,width-mid_hole,0]) m3nuthole();
        translate ([0,width-mid_hole,m3vyska]) m3dira(9);
    } else {
        translate ([height,mid_hole,0]) m3nuthole();
        translate ([height,mid_hole,m3vyska]) m3dira(9);
        
        translate ([0, 0, 0]) m3nuthole();
translate ([0, 0,m3vyska]) m3dira(9);
    }

    
    //translate([-20, -20, 0.8]) cube([200, 100, 10]);

}