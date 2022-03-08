include<_variables.scad>;

// Parts
module main_body() {
    difference() {
        // Cylinder
        main_body_outer();
        main_body_inner();

        // Top joining
        translate([0, 0, $main_height/2]) cylinder(h = $joining_height, r = $joining_radius, center = true);

        // Bottom joining
        translate([0, 0, -$main_height/2])
        difference() {
            cylinder(h = $joining_height, r = $main_radius + 1, center = true);
            cylinder(h = $joining_height, r = $joining_radius, center = true);
        }
    }
}

module main_body_outer() {
    cylinder(h = $main_height, r = $main_radius, center = true);
}

module main_body_inner() {
    cylinder(h = $main_height + 1, r = $main_radius - $wall_thickness, center = true);
}

module tube_body(r, t) {
    difference() {
        difference() {
            tube_body_outer(r, t);
            tube_body_inner(r, t);
        }
        main_body_outer();
    }
}

module tube_body_outer(r, t) {
    translate(t) {
        rotate(r) {
            cylinder(h = $tube_height, r = $tube_radius, center = true);
        }
    }
}

module tube_body_inner(r, t) {
    translate(t) {
        rotate(r) {
            cylinder(h = $tube_height + 1, r = $tube_radius - $wall_thickness, center = true);
        }
    }
}

// Assembled modules

module xWay(count) {
    $max_angle = 180;
    $per_item = $max_angle / count;
    
    if(count > 0) {
        for (i = [0 : count - 1]) {
            rotate([0, 0, i * $per_item * 2]) tube_body([45, 0, 0], [0, -$main_radius, 0]);
        }
    }

    difference() {
        main_body();
        if(count > 0) {
            for (i = [0 : count - 1]) {
                rotate([0, 0, i * $per_item * 2]) tube_body_inner([45, 0, 0], [0, -$main_radius, 0]);
            }
        }
    }
}
