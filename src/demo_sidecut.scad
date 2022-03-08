include<_variables.scad> use<demo_assembled.scad>

    $sidecut_dim = 150;
$sidecut_height = 750;

$t = 0.65; // Comment out for animation to work!

difference()
{
	demo_assembled();
	translate([ $t * -($sidecut_dim / 2) + 50, -($sidecut_dim / 2), 0 ])
	{
		cube([ $sidecut_dim, $sidecut_dim, $sidecut_height ]);
	}
}
