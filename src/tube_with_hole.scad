use <x-way.scad>;

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

/* [Tubes] */
$tube_hole_dimensions = 15;
$tube_hole_offset = 0;

// Parts
module tube_with_hole() {
    difference() {
        xWay(0);
        translate([0, 0, $tube_hole_offset])
            translate([$main_radius, 0, 0])
                translate([-$tube_hole_dimensions/2, -$tube_hole_dimensions/2, -$tube_hole_dimensions/2])
                    cube([$tube_hole_dimensions, $tube_hole_dimensions, $tube_hole_dimensions]);
    }
}
tube_with_hole();
