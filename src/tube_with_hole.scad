/*
 * All variables are stored inside `_variables.scad`.
 * Please examine this file and change to your needs.
 * OpenSCAD will recognize these changes automatically
 * & reload after editing.
 *
 * Why is this done?
 * Pretty much all files in this repository depend on each other.
 * For example:
 *  `[[0,1,2,3,4,5]-way, tube_with_hole, resvoir].scad` depend on `x_way.scad`.
 *  `x_way.scad` makes use of `tray.scad`.
 * Even seemingly unconnected files like `planter.scad` or `cover.scad`
 * are using variables that are defined in other files.
 * Yes, we could (like before) split all the variables out in their own files,
 * but a single change in one file requires you to also change it in
 * all other files for them to fit together.
 * Unfortunately, this breaks OpenSCAD's customizer.
 */
include<_variables.scad>;
use<x_way.scad>;

// Parts
module tube_with_hole()
{
	difference()
	{
		xWay(0);
		translate([ 0, 0, $tube_hole_offset ])
		translate([ $main_radius, 0, 0 ])
		translate([ -$tube_hole_dimensions / 2, -$tube_hole_dimensions / 2, -$tube_hole_dimensions / 2 ])
		cube([ $tube_hole_dimensions, $tube_hole_dimensions, $tube_hole_dimensions ]);
	}
}
tube_with_hole();
