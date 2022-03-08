include<_variables.scad>;

// Parts
module cover() {
    difference() {
        cylinder(h = $joining_height, r = $joining_radius , center = true);
        cylinder(h = $joining_height + 2, r = $hole_radius , center = true);
    }
}
cover();
