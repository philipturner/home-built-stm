(Set the unit system, coordinate mode, and starting position.)
G21 G90;
G00 X0 Y0 Z10;

(Move to above where a hole will be drilled.)
(Set Y=-36 mm. Subsequent commands should use offsets relative to this.)
G00 X20 Y-36;

(Start the spindle.)
(Wait 2 seconds to ensure the operator can close the door.)
M3 S6000;
G04 X2.00;

(Drill 7 mm below the setpoint.)
(The setpoint is a little conservative, ~1 mm above the actual surface.)
(Descend from Z=10 mm to Z=-7 mm.)
G01 Z-7 F300;

(Drill a counterclockwise semicircle with a radius of 12 mm.)
G03 X44 Y-36 I12 J0 F300;

(Retract to a safe Z position for scanning.)
G00 Z10;

(Stop the spindle.)
M5;
