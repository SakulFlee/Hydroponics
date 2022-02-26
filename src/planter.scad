/* [Render] */
$fa=1;
$fs=0.4;
$fn=10;

/* [General] */
$wall_thickness = 2.5;

/* [Main Body] */
$main_height = 100;
$main_radius = 35;

/* [Tubes] */
$tube_height = $main_height / 2;
$tube_radius = $main_radius - 15;

/* [Planter] */
$stripes_count = 8;
$stripe_width = 5.0;
$planter_hole_radius = 2.5;

// Parts
module planter_frame(r, th) {
    a = r - $wall_thickness - 2; // 2 -> spacing
    translate([0, 0, a / 2 - a / 4]) 
        cylinder(h = th, r = a, center=false);
    translate([0, 0, a / 2 - a / 4])
        sphere(r = a);
}

module planter_ring(r, th) {
    a = r - $wall_thickness - 2; // 2 -> spacing
    translate([0, 0, th]) 
        difference() {
            cylinder(h = $wall_thickness, r = r, center = false);
            translate([0, 0, -1])
                cylinder(h = $wall_thickness + 2, r = a, center = false);
        }
}

module planter_hole() {
    height = 10;
    translate([0, 0, -(height + height / 2)])
        cylinder(h = height, r = $planter_hole_radius, center = false);
}

module planter_stripes(r, th) {
    angle_per = 360 / $stripes_count;

    for (i = [0:$stripes_count]) {
        a = r - $wall_thickness - 2; // 2 -> spacing
        current_angle = angle_per * i;
        
        rotate([0, 0, current_angle])
            translate([-$stripe_width / 2, -$stripe_width / 2, -(a / 2)])
                cube([25, $stripe_width, th + a / 2]);
    }
}

module planter(r, th) {
    difference() {
        planter_frame(r, th);
        planter_frame(r - 1, th + 1);
        planter_stripes(r, th);
        planter_hole();
    }
    planter_ring(r, th);
}
planter($tube_radius, $tube_height);
