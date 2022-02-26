/* [Render] */
$fa=1;
$fs=0.4;
$fn=10;
$show_helpers = false;

/* [General] */
$wall_thickness = 2.5;

/* [Main Body] */
$main_radius = 35;
$joining_height = 10;
$joining_radius = $main_radius - $wall_thickness / 2;

/* [Cover] */
$hole_radius = $main_radius / 2.5;

// Parts
module cover() {
    difference() {
        cylinder(h = $joining_height, r = $joining_radius , center = true);
        cylinder(h = $joining_height + 2, r = $hole_radius , center = true);
    }
}
cover();
