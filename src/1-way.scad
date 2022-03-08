include<_variables.scad>;
use <x-way.scad>;

/*  Check settings ("customizer variables") in x-way.scad.
    The current config is pre-defined for a 150x150x150mm printing area.
    To tweak use one of the following:
    1. via OpenSCAD's Command-Line
        Use the `--D` flag to change variables.
        E.g. `--D $fn=100` to make the circles smooth.
    2. via OpenSCAD GUI
        Open this file and check the Customizer panel.
        In case the variables don't show up, proceed to the 3rd option.
    3. via an Editor (or OpenSCAD GUI)
        Open the file from above (`use <THIS FILE.scad>`) in either 
        an Editor or OpenSCAD GUI and change the variables in code
        or inside the Customizer. 
        Afterwards (re-)open this file in OpenSCAD and see the changes.

        Note: Editing the variables inside the code will affect ALL models
        depending on it. This can have advantages, but also disadvantages.
*/

// --- 

xWay(1);
