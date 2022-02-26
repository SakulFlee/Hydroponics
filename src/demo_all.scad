use <demo_xways.scad>
use <cover.scad>
use <resevoir.scad>
use <tube_with_hole.scad>
use <demo_planter.scad>
use <demo_tray.scad>
use <demo_assembled.scad>

// --- Line 1 ---
translate([0, 0, 0]) rotate([0, 0, 0])
    demo_xways();

// --- Line 2 ---
translate([0, 150, 0]) rotate([0, 0, 0])
    cover();

// --- Line 3 ---
translate([0, 300, 0]) rotate([0, 0, 0])
    resevoir();

// --- Line 4 ---
translate([0, 450, 0]) rotate([0, 0, 0])
    tube_with_hole();

// --- Line 4 ---
translate([0, 600, 0]) rotate([0, 0, 0])
    demo_planter();

// --- Line 5 ---
translate([0, 750, 0]) rotate([0, 0, 0])
    demo_tray();

// --- Line 6 ---
translate([0, 900, 0]) rotate([0, 0, 0])
    demo_assembled();
