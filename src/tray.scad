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

// Parts
module tray()
{
	distance = ($tray_radius - 5) / $tray_holes_per_rotation;

	difference()
	{
		cylinder(h = $tray_thickness, r = $tray_radius, center = true);
		cylinder(h = $tray_thickness + 1, r = $water_column_radius, center = true);

		for (x = [-$tray_radius:5:$tray_radius])
		{
			for (y = [-$tray_radius:5:$tray_radius])
			{
				vec_dist = sqrt(x ^ 2 + y ^ 2);
				if (vec_dist <= $tray_radius - $tray_hole_radius && vec_dist >= $water_column_radius)
				{
					translate([ x, y, 0 ])
					cylinder(h = $tray_thickness + 1, r = $tray_hole_radius, center = true);
				}
			}
		}
	}
}

tray();
