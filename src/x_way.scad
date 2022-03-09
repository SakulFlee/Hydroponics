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
include<tray.scad>;

// Parts
module main_body()
{
	difference()
	{
		// Cylinder
		main_body_outer();
		main_body_inner();

		// Top joining
		translate([ 0, 0, $main_height / 2 ])
		cylinder(h = $joining_height, r = $joining_radius, center = true);

		// Bottom joining
		translate([ 0, 0, -$main_height / 2 ])
		difference()
		{
			cylinder(h = $joining_height, r = $main_radius + 1, center = true);
			cylinder(h = $joining_height, r = $joining_radius, center = true);
		}
	}
}

module main_body_outer()
{
	cylinder(h = $main_height, r = $main_radius, center = true);
}

module main_body_inner()
{
	cylinder(h = $main_height + 1, r = $main_radius - $wall_thickness, center = true);
}

module tube_body(r, t)
{
	difference()
	{
		difference()
		{
			tube_body_outer(r, t);
			tube_body_inner(r, t);
		}
		main_body_outer();
	}
}

module tube_body_outer(r, t)
{
	translate(t)
	{
		rotate(r)
		{
			cylinder(h = $tube_height, r = $tube_radius, center = true);
		}
	}
}

module tube_body_inner(r, t)
{
	translate(t)
	{
		rotate(r)
		{
			cylinder(h = $tube_height + 1, r = $tube_radius - $wall_thickness, center = true);
		}
	}
}

module water_column()
{
	translate([ 0, 0, 0 ])
	{
		difference()
		{
			cylinder(h = $main_height, r = $water_colon_radius, center = true);
			cylinder(h = $main_height + 1, r = $water_colon_radius - $wall_thickness, center = true);

			// Bottom joining
			translate([ 0, 0, -($main_height / 2 - $joining_height / 4) ])
			{
				cylinder(h = $joining_height / 2 + 1, r = $water_colon_radius - $wall_thickness + 1, center = true);
			}
		}
	}

	// Upper joining
	translate([ 0, 0, $main_height / 2 - $joining_height / 4 + $joining_height / 2 ])
	{
		difference()
		{
			cylinder(h = $joining_height / 2, r = $water_colon_radius - $wall_thickness + 1, center = true);
			cylinder(h = $joining_height / 2 + 1, r = $water_colon_radius - $wall_thickness, center = true);
		}
	}
}

// Assembled modules

module xWay(count, include_water_collon = true, include_tray = true)
{
	$per_item = 180 / count;

	if (count > 0)
	{
		for (i = [0:count - 1])
		{
			rotate([ 0, 0, i * $per_item * 2 ])
			tube_body([ 45, 0, 0 ], [ 0, -$main_radius, 0 ]);
		}
	}

	difference()
	{
		main_body();
		if (count > 0)
		{
			for (i = [0:count - 1])
			{
				rotate([ 0, 0, i * $per_item * 2 ])
				tube_body_inner([ 45, 0, 0 ], [ 0, -$main_radius, 0 ]);
			}
		}
	}

	if (include_tray)
	{
		translate([ 0, 0, -($main_height / 2) + $tray_thickness / 2 ])
		tray();
	}

	if (include_water_collon)
	{
		water_column();
	}
}
