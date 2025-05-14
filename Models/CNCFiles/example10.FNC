(Set the unit system, coordinate mode, and starting position.)
G21 G90;
G00 Z10;

(Move to above where a hole will be drilled.)
G00 X80 Y-32;

(Start the spindle.)
(Wait 5 seconds to ensure the operator can close the door.)
M3 S8000;
G04 X5.00;

(Drill below the upper surface of the billet.)
(Make sure to recalibrate the Z datum point before each test.)
G01 Z-3 F400;

(Retract to a safe Z position for scanning.)
G00 Z10;

(Stop the spindle.)
M5;
