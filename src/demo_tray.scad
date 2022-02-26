use <demo_xways.scad>
use <tray.scad>

// TODO: Variants not working. Use module variables :)


module demo_tray() {
    translate([0, 0, 0]) tray();
    translate([150, 0, -45]) tray();
    translate([300, 0, -45]) tray();
    translate([450, 0, -45]) tray();
    translate([600, 0, -45]) tray();
    translate([750, 0, -45]) tray();
    translate([900, 0, -45]) tray();
    
    translate([150, 0, 0]) demo_xways();

    // // $tray_holes_per_rotation = 2;
    // // $tray_rotations = 16;
    // translate([150, 0, 0]) tray();

    // // $tray_holes_per_rotation = 8;
    // // $tray_rotations = 8;
    // translate([300, 0, 0])tray();

    // // $tray_holes_per_rotation = 2;
    // // $tray_rotations = 32;
    // translate([450, 0, 0]) tray();

    // // $tray_holes_per_rotation = 12;
    // // $tray_rotations = 4;
    // translate([600, 0, 0])tray();

    // // $tray_holes_per_rotation = 12;
    // // $tray_rotations = 6;
    // translate([750, 0, 0])tray();
}
demo_tray();
