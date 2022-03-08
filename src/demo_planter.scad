use<x_way.scad> use<planter.scad>

    // Parts
    module planter_helper_frame(r, t)
{
	difference()
	{
		tube_body_outer(r, t);
		tube_body_inner(r, t);
	}
}

module demo_planter()
{
	planter($tube_radius, $tube_height);

	translate([ 150, 0, 0 ])
	planter_helper_frame([ 0, 0, 0 ], [ 0, 0, 0 ]);
	translate([ 150, 0, 45 ])
	planter($tube_radius, $tube_height);

	translate([ 300, 0, 0 ])
	planter_helper_frame([ 0, 0, 0 ], [ 0, 0, 0 ]);
	translate([ 300, 0, 0 ])
	planter($tube_radius, $tube_height);

	translate([ 450, 0, 0 ])
	planter_helper_frame([ 0, 0, 0 ], [ 0, 0, 0 ]);
	translate([ 450, 0, -25 ])
	planter($tube_radius, $tube_height);
}
demo_planter();
