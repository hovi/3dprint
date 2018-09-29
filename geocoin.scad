 vyska = 5;
polomerdira = 4.25;
pocet_sten = 12;
polomer=20;
velikost_pisma_nahore=8;
velikost_pisma_dole=8;
hloubka_pisma=1;
 
scale = 0.5;
font_scale = 20/35;
 
 
 difference() {
     cylinder(vyska,polomer,polomer,$fn=pocet_sten);
     translate([0,0,vyska * -0.5]) cylinder(h=vyska * 2, r=polomerdira);
     translate([0,0,vyska - hloubka_pisma]) linear_extrude(height = vyska * 2) {
       translate([0, 9, 0]) text(text = "GEOCOIN", size = velikost_pisma_nahore* font_scale, halign="center", valign="center");
     }
     translate([0,0,vyska - hloubka_pisma]) linear_extrude(height = vyska * 2) {
       translate([0, -9, 0]) text(text = "TÝM HOVI", size = velikost_pisma_dole* font_scale, halign="center", valign="center");
         

     }
    translate([0,-7,-1]) linear_extrude(height = hloubka_pisma + 1) {
        rotate([180,0, 180]) text(text = "KASÁRNA", size = 5.5 * font_scale, halign="center", valign="center");
    }
    translate([0,-12,-1]) linear_extrude(height = hloubka_pisma + 1) {
        rotate([180,0, 180]) text(text = "HAMRNÍKY", size = 6.2* font_scale, halign="center", valign="center");
    }
    translate([0,8,-1]) linear_extrude(height = hloubka_pisma + 1) {
        rotate([180,0, 180]) text(text = "ZÓNA KLIDU", size = 7 * font_scale, halign="center", valign="center");
    }
 }
 

 

    

 


