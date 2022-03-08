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
