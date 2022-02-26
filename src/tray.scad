/* [Render] */
$fa=1;
$fs=0.4;
$fn=10;

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
    angle_per_rotation = 360 / $tray_rotations;

    difference() {
        cylinder(h = $tray_thickness, r = $tray_radius, center = true);
        for(i = [1:$tray_holes_per_rotation]) {
            for (r = [1:$tray_rotations]) {
                rotate([0, 0, r * angle_per_rotation]) {
                    cylinder(h = $tray_thickness * 2, r = $tray_hole_radius, center = true);
                    translate([i * distance, 0, 0])
                        cylinder(h = $tray_thickness * 2, r = $tray_hole_radius, center = true);
                    translate([i * -distance, 0, 0])
                        cylinder(h = $tray_thickness * 2, r = $tray_hole_radius, center = true);
                }
            }
        }
    }
}
tray();
