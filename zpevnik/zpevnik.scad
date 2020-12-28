$fn = 100;

pick_height=0.8;
logo_height=pick_height;
use_text = true;
hole_diameter = 4.0;


fudge = 0.1;
line_fn = 4;
min_line_width = 1.0;
function min_line_mm(w) = max(min_line_width, w) * 90/25.4;
s = 0.7;
caption = pick_height == 1 ? "1.0" : pick_height == 2 ? "2.0" : str(pick_height);


path12_0_center = [5.226885,-8.196161];

path12_0_points = [[4.160146,-4.213856],[1.882396,-4.310025],[-0.277709,-4.100636],[-2.275766,-3.585921],[-4.067372,-2.766106],[-5.608125,-1.641422],[-6.853620,-0.212097],[-7.759456,1.521641],[-8.281229,3.559561],[-8.315714,5.159441],[-7.985819,6.756574],[-7.322674,8.271311],[-6.357406,9.623999],[-5.121142,10.734988],[-3.645010,11.524629],[-1.960139,11.913269],[-0.097656,11.821259],[2.366327,11.072588],[4.346913,9.889501],[5.900864,8.350275],[7.084943,6.533186],[7.955912,4.516514],[8.570535,2.378534],[9.257789,-1.948237],[9.497351,-7.998942],[9.343238,-14.113733],[9.331946,-20.210214],[9.528174,-23.479859],[12.563444,-20.529733],[15.005455,-17.312273],[15.632055,-15.925443],[15.664022,-14.858360],[15.516280,-14.005434],[15.668600,-13.235135],[16.579547,-12.126434],[17.809097,-11.900299],[18.359671,-12.233207],[18.769483,-12.924772],[18.695288,-14.213144],[17.945206,-16.171223],[15.119590,-21.113227],[11.697053,-25.784236],[10.200818,-27.403571],[9.082008,-28.217701],[7.329083,-28.305592],[6.593611,-27.904592],[6.191390,-27.163016],[5.666489,-23.266847],[5.522447,-19.313915],[5.644517,-11.420869],[5.588365,-3.778313]];

module poly_path12(h, w, s, res=line_fn)
{
    sx = 25.4/90 * 1.05;
  scale([sx, -sx, 1]) union()
  {
    translate (path12_0_center) linear_extrude(height=h, convexity=10, scale=0.01*s)
      translate (-path12_0_center) polygon(path12_0_points);

  }
}

path34_0_center = [1.210934,3.149406];
path34_0_points = [[7.304669,3.149406],[6.824934,5.518785],[5.517564,7.456036],[3.580313,8.763405],[1.210934,9.243140],[-1.158444,8.763405],[-3.095695,7.456036],[-4.403065,5.518785],[-4.882800,3.149406],[-4.403065,0.780027],[-3.095695,-1.157224],[-1.158444,-2.464593],[1.210934,-2.944328],[3.580313,-2.464593],[5.517564,-1.157224],[6.824934,0.780027],[7.304669,3.149406],[7.304669,3.149406]];
module poly_path34(h, w, s, res=line_fn)
{
    sx1 = 25.4/90 * 1.1;
  scale([sx1, -sx1, 1]) union()
  {
    translate (path34_0_center) linear_extrude(height=h, convexity=10, scale=0.01*s)
      translate (-path34_0_center) polygon(path34_0_points);
  }
}

path18_0_center = [-0.000000,22.338810];
path18_0_points = [[1.152341,28.305592],[-48.007690,20.473580],[-48.781919,20.186411],[-49.367549,19.641063],[-49.707820,18.916272],[-49.745966,18.090774],[-49.450252,17.319597],[-48.903683,16.740680],[-48.177672,16.407124],[-47.343629,16.372028],[1.132810,24.692320],[47.343629,16.372028],[48.169432,16.395832],[48.896359,16.723590],[49.447505,17.300371],[49.745966,18.071243],[49.719111,18.896741],[49.384639,19.621532],[48.801145,20.166880],[48.027221,20.454049],[1.152341,28.305592],[1.152341,28.305592]];
module poly_path18(h, w, s, res=line_fn)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    translate (path18_0_center) linear_extrude(height=h, convexity=10, scale=0.01*s)
      translate (-path18_0_center) polygon(path18_0_points);
  }
}

path26_0_center = [-0.010986,11.264620];
path26_0_points = [[1.152341,28.246998],[-39.609274,-3.237296],[-40.139057,-4.162587],[-39.863179,-5.190416],[-38.937889,-5.712876],[-37.910059,-5.444322],[1.093747,24.692320],[37.851466,-5.405260],[38.864647,-5.717759],[39.804586,-5.209948],[40.117085,-4.196767],[39.609274,-3.256828],[1.152341,28.246998],[1.152341,28.246998]];
module poly_path26(h, w, s, res=line_fn)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    translate (path26_0_center) linear_extrude(height=h, convexity=10, scale=0.01*s)
      translate (-path26_0_center) polygon(path26_0_points);
  }
}

path22_0_center = [0.019531,16.690631];
path22_0_points = [[1.152341,28.246998],[-45.019416,8.364236],[-45.944707,7.412090],[-45.917851,6.079086],[-44.958381,5.153795],[-43.632701,5.180651],[1.132810,24.692320],[43.632701,5.180651],[44.968147,5.134264],[45.937382,6.040024],[45.983769,7.358380],[45.078010,8.325174],[1.152341,28.246998],[1.152341,28.246998]];
module poly_path22(h, w, s, res=line_fn)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    translate (path22_0_center) linear_extrude(height=h, convexity=10, scale=0.01*s)
      translate (-path22_0_center) polygon(path22_0_points);
  }
}

module zpevnik(h)
{
  difference()
  {
    union()
    {
      translate ([0,0,0]) poly_path12(h, min_line_mm(1.0), 100.0);
      //translate ([0,0,0]) poly_path34(h, min_line_mm(1.0), 100.0);
      translate ([0,0,0]) poly_path18(h, min_line_mm(1.0), 100.0);
      translate ([0,0,0]) poly_path26(h, min_line_mm(1.0), 100.0);
      translate ([0,0,0]) poly_path22(h, min_line_mm(1.0), 100.0);
    }
  }
}


/*
pick shape based on:
https://www.thingiverse.com/thing:1672392
*/
module plek() {
	translate([0, 0, pick_height/2])
    difference() {
        union() {
            translate([0,13,0]) scale([2,1,1])cylinder(r=6, h=pick_height, center=true);
    //        color([1, 0, 0])
            translate([-5,2,0]) rotate([0,0,25])scale([1,2.8,1])cylinder(r=5, h=pick_height, center=true);
    //        color([1, 1, 0])
            translate([ 5,2,0]) rotate([0,0,-25])scale([1,2.8,1])cylinder(r=5, h=pick_height, center=true);
    //        color([1, 0, 1])
            translate([0, 4.6, 0])
            rotate([0,0,0]) scale([2.5,4.7,1]) cylinder(r=3, h=pick_height, center=true);
            
        }
        translate([-4, 15, -pick_height])
        linear_extrude(pick_height*4)
        circle(d=hole_diameter);
    }
}


translate([0, -8, 0]) plek();

if (use_text) {
    translate([0, -7, pick_height]) 
    linear_extrude(logo_height)
    text(size=5, valign="center", halign="center", caption);
    
    translate([0, 2.5, pick_height]) scale([s, s, 1]) translate([0, 0, 0.0])
    zpevnik(logo_height);

} else {
    s2 = 1.1;
    translate([0, 2.5, pick_height]) scale([s * s2, s * s2, 1])
    translate([0, -2, 0.0])
    zpevnik(logo_height);
}