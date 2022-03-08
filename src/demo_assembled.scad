include<x_way.scad>

    use<resevoir.scad> use<tube_with_hole.scad> use<planter.scad> use<cover.scad>

        // use <tray.scad>

        module demo_assembled()
{
	// Resevoir
	translate([ 0, 0, 0 ])
	resevoir();
	// Tube with holes
	translate([ 0, 0, 100 - $joining_height / 2 ])
	tube_with_hole();
	// Tube (0-Way)
	translate([ 0, 0, 200 - $joining_height ])
	xWay(0);
	// 1-Way
	translate([ 0, 0, 300 - $joining_height - $joining_height / 2 ])
	xWay(1);
	//      Planter
	translate([ 0, -25, 300 - $joining_height - 15 ])
	rotate([ 45, 0, 0 ])
	planter($tube_radius, $tube_height);
	// 2-Way
	translate([ 0, 0, 400 - $joining_height - $joining_height ])
	xWay(2);
	//      Planter
	translate([ 0, -15, 400 - $joining_height - 30 ])
	rotate([ 45, 0, 0 ])
	planter($tube_radius, $tube_height);
	// 3-Way
	translate([ 0, 0, 500 - $joining_height - $joining_height - $joining_height / 2 ])
	xWay(3);
	// 4-Way
	translate([ 0, 0, 600 - $joining_height - $joining_height - $joining_height ])
	xWay(4);
	// 5-Way
	translate([ 0, 0, 650 - $joining_height - $joining_height - $joining_height - $joining_height / 2 ])
	cover();
}
demo_assembled();