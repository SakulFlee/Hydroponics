include<_variables.scad> 
use<demo_assembled.scad>

$sidecut_x = 150;
$sidecut_y = 300;
$sidecut_z = 1000;

$t = 0.65; // Comment out for animation to work!

difference()
{
	demo_assembled();
	translate([ $t * -($sidecut_x / 2) + 50, -($sidecut_y / 2), -100 ])
	{
		cube([ $sidecut_x, $sidecut_y, $sidecut_z ]);
	}
}
