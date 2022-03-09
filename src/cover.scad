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
use<tray.scad>;

// Parts

module cover()
{
	difference()
	{
		cylinder(h = $joining_height, r1 = $tray_radius, r2 = $water_colon_radius / 2, center = true);
		translate([ 0, 0, -$wall_thickness / 2 ])
		cylinder(h = $joining_height, r1 = $tray_radius, r2 = $water_colon_radius / 2, center = true);

		// water column
		cylinder(h = $joining_height + 1, r = $water_colon_radius - $wall_thickness + 1, center = true);

		make_holes_round(total_radius = $tray_radius - 2, depth_steps = 5, angle_steps = 15,
		                 thickness = $joining_height + 2, radius = 0.5, center_offset = $water_colon_radius);
	}
	difference()
	{
		cylinder(h = $joining_height, r = $joining_radius, center = true);
		cylinder(h = $joining_height + 1, r = $joining_radius - $wall_thickness, center = true);
	}
}

cover();
