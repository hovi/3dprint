winder_width=21;
winder_height=8;
winder_depth=15;
wall_width=3;

handle_height=60;
handle_moveable_height=10;
handle_radius = (winder_height + wall_width) / 2;
space = 0.45;
$fn = 100;
include<zpevnik_raw.scad>


module roundedcube(size = [1, 1, 1], center = false, radius = 0.5, apply_to = "all") {
    //cube(size=size, center=center);
    
	// If single value, convert to [x, y, z] vector
	size = (size[0] == undef) ? [size, size, size] : size;

	translate_min = radius;
	translate_xmax = size[0] - radius;
	translate_ymax = size[1] - radius;
	translate_zmax = size[2] - radius;

	diameter = radius * 2;

	module build_point(type = "sphere", rotate = [0, 0, 0]) {
		if (type == "sphere") {
			sphere(r = radius);
		} else if (type == "cylinder") {
			rotate(a = rotate)
			cylinder(h = diameter, r = radius, center = true);
		}
	}

	obj_translate = (center == false) ?
		[0, 0, 0] : [
			-(size[0] / 2),
			-(size[1] / 2),
			-(size[2] / 2)
		];

	translate(v = obj_translate) {
		hull() {
			for (translate_x = [translate_min, translate_xmax]) {
				x_at = (translate_x == translate_min) ? "min" : "max";
				for (translate_y = [translate_min, translate_ymax]) {
					y_at = (translate_y == translate_min) ? "min" : "max";
					for (translate_z = [translate_min, translate_zmax]) {
						z_at = (translate_z == translate_min) ? "min" : "max";

						translate(v = [translate_x, translate_y, translate_z])
						if (
							(apply_to == "all") ||
							(apply_to == "xmin" && x_at == "min") || (apply_to == "xmax" && x_at == "max") ||
							(apply_to == "ymin" && y_at == "min") || (apply_to == "ymax" && y_at == "max") ||
							(apply_to == "zmin" && z_at == "min") || (apply_to == "zmax" && z_at == "max")
						) {
							build_point("sphere");
						} else {
							rotate = 
								(apply_to == "xmin" || apply_to == "xmax" || apply_to == "x") ? [0, 90, 0] : (
								(apply_to == "ymin" || apply_to == "ymax" || apply_to == "y") ? [90, 90, 0] :
								[0, 0, 0]
							);
							build_point("cylinder", rotate);
						}
					}
				}
			}
		}
	}
}

module inside() {
            translate(v = [0, 0, 4])  {
                roundedcube(size = [winder_width - 1.5, winder_height, 
                    winder_depth], center=true, radius=2);
            }    
}

module top(turn_size=36, angle=60, offset_x=7, offset_y=0) {
    r = handle_radius;
    //18+10
    y = turn_size * sin(angle) - (winder_depth - wall_width) / 2 + offset_y;
    
    //winder_depth - 6 + 10
    x = turn_size * cos(angle) + offset_x;
    translate([y, 0, x])
    translate([0, 0, handle_height])
    union() {
        difference() {
            roundedcube(size = [winder_width + wall_width, winder_height + wall_width, 
                winder_depth + wall_width], center=true, radius=5, apply_to="zmin");
            inside();
        }
    }
    translate([0, 0, handle_height + r / 2])
    difference() {
        union() {
            sphere(r);
            rotate([angle, 0, 90])
            cylinder(r=r, h = turn_size);
        }
        translate([turn_size /2, 0, - r - 5])
        cube([turn_size * 2, r * 2, r * 2], center=true);
        translate([y, 0, x])
        translate([0, 0, - r / 2])
        inside();

    }
    s = 0.5;
    translate([y, 0, x + handle_height])
    translate([0, 0, - r / 2])
    rotate([90, 0, 0])
    translate([0, 5, winder_height / 2 + 1])
    scale([s, s, s])
    zpevnik(2);
    translate([y, 0, x + handle_height])
    translate([0, 0, - r / 2])
    rotate([90, 0, 180])
    translate([0, 5, winder_height / 2 + 1])
    scale([s, s, s])
    zpevnik(2);


}

module moveable(height, radius, inner_radius_bottom, inner_radius_top, space, center=false, outside=true, inside=true) {
    if (outside) {
        difference() {
            linear_extrude(height)
            circle(d=radius * 2);
            cylinder(r1=inner_radius_bottom, r2=inner_radius_top, h = height);
        }
    }
    if (inside) {
        cylinder(r1=inner_radius_bottom - space, r2=inner_radius_top - space, h = height);
    }
}

module handle() {
    r = handle_radius;
    r1 = r * 3 / 4;
    r2 = r * 2.5 / 4;

    moveable(
        height=handle_moveable_height, 
        radius=r,
        inner_radius_bottom = r1,
        inner_radius_top = r2,
        space = space,
        outside = true,
        inside = true
    );

    translate([0, 0, handle_height - handle_moveable_height])
    moveable(
        height=handle_moveable_height, 
        radius=r,
        inner_radius_bottom = r2,
        inner_radius_top = r + space,
        space = space,
        outside = true,
        inside = true
    );

    translate([0, 0, handle_moveable_height])
    cylinder(r=r2 - space, h = handle_height - handle_moveable_height * 2);

    translate([0, 0, handle_moveable_height])
    difference() {
        cylinder(r=r, h = handle_height - handle_moveable_height * 2);
        cylinder(r=r2, h = handle_height - handle_moveable_height * 2);
    }
    translate([0, 0, handle_height])
    cylinder(r=r, h = r / 2);

}

handle();
top();