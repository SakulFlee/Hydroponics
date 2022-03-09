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

module make_holes_squared(total_radius, steps, thickness, radius, center_offset)
{
	for (x = [-total_radius:steps:total_radius])
	{
		for (y = [-total_radius:steps:total_radius])
		{
			x = x + steps / 8; // No idea why it's offset ... Using 1/8th of steps seems to work.
			y = y + steps / 8; // No idea why it's offset ... Using 1/8th of steps seems to work.
			vec_dist = sqrt(x ^ 2 + y ^ 2);
			if (vec_dist < total_radius - radius * 2 && vec_dist > center_offset)
			{
				translate([ x, y, 0 ])
				{
					cylinder(h = thickness + 1, r = radius, center = true);
				}
			}
		}
	}
}

module make_holes_round(total_radius, depth_steps, angle_steps, thickness, radius, center_offset)
{
	for (depth = [0:depth_steps:total_radius])
	{
		for (angle = [0:angle_steps:360])
		{
			if (abs(depth) - radius > center_offset)
			{
				rotate([ 0, 0, angle ])
				{
					translate([ depth, 0, 0 ])
					{
						cylinder(h = thickness + 1, r = radius, center = true);
					}
				}
			}
		}
	}
}

// Parts
module tray()
{
	difference()
	{
		cylinder(h = $tray_thickness, r = $tray_radius, center = true);
		cylinder(h = $tray_thickness + 1, r = $water_colon_radius, center = true);

		make_holes_squared($tray_radius, 5, $tray_thickness, $tray_hole_radius, $water_colon_radius);
	}
}

tray();
