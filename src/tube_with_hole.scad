include<_variables.scad>;
use <x-way.scad>;

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
