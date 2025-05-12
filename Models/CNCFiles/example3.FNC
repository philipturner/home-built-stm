(Set the unit system, coordinate mode, and starting position.)
G21 G90;
G00 X0 Y0 Z10;

(Move to above where a hole will be drilled.)
(The Z position is already at 10 mm.)
G00 X20 Y00;

(Start the spindle.)
(Wait 2 seconds to ensure the operator can close the door.)
M3 S6000;
G04 X2.00;

(Drill 7 mm below the setpoint.)
(The setpoint is a little conservative, ~1 mm above the actual surface.)
(Descend from Z=10 mm to Z=-7 mm.)
G01 Z-7 F300;

(Retract to a safe Z position for scanning.)
G00 Z10;

(Stop the spindle.)
M5;