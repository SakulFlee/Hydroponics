/* [Render] */
$fa=1;
$fs=0.4;
$fn=25;

/* [General] */
$wall_thickness = 2.5;

/* [Main Body] */
$main_radius = 35;

/* [Tray] */
$tray_thickness = 2.5;
$tray_hole_radius = 1;
$tray_radius = $main_radius - $wall_thickness;
$tray_holes_per_rotation = 4;
$tray_rotations = 16;

// Parts
module tray() {
    distance = ($tray_radius - 5) / $tray_holes_per_rotation;

    difference() {
        cylinder(h = $tray_thickness, r = $tray_radius, center = true);
        
        for (x = [-$tray_radius:5:$tray_radius]) {
            for (y = [-$tray_radius:5:$tray_radius]) {
                if (abs(x) + abs(y) <= $tray_radius) {
                    translate([x, y, 0])
                        cylinder(h = $tray_thickness * 2, r = $tray_hole_radius, center = true);
                }
            }
        }
    }
}

tray();
