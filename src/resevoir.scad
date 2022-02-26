/* [Render] */
$fa=1;
$fs=0.4;
$fn=10;

/* [General] */
$wall_thickness = 2.5;

/* [Main Body] */
$main_height = 100;
$main_radius = 35;
$joining_height = 10;
$joining_radius = $main_radius - $wall_thickness / 2;

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
