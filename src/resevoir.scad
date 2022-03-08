include<_variables.scad>;

// Parts
module main_body_outer() {
    cylinder(h = $main_height, r = $main_radius, center = true);
}

module resevoir() {
    difference() {
        // Cylinder
        main_body_outer();
        cylinder(h = $main_height - $joining_height + 1, r = $main_radius - $wall_thickness, center = true);

        // Top joining
        translate([0, 0, $main_height/2]) cylinder(h = $joining_height, r = $joining_radius, center = true);
    }
}
resevoir();
