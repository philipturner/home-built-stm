(Set the unit system, coordinate mode, and starting position.)
G21 G90;
G00 X0 Y0 Z10;

(Move to above where a hole will be drilled.)
(Set Y=-20 mm. Subsequent commands should use offsets relative to this.)
G00 X20 Y-20;

(Start the spindle.)
(Wait 2 seconds to ensure the operator can close the door.)
M3 S3000;
G04 X2.00;

(Drill 3 mm below the setpoint.)
(The setpoint is a little conservative, ~1 mm above the actual surface.)
(Descend from Z=10 mm to Z=-3 mm.)
G01 Z-3 F200;

(Retract to a safe Z position for scanning.)
G00 Z10;

(Stop the spindle.)
M5;
