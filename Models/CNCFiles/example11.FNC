(Set the unit system and coordinate mode.)
(Ensure we're starting at a safe Z position.)
G21 G90;
G00 Z10;

(Move to the approach position.)
(25% RDOC = 0.79 mm)
G00 X-10 Y-0.79;

(Start the spindle.)
(Wait 2 seconds to ensure the operator can close the door.)
M3 S6000;
G04 X2.00;

(Mill with a feedrate of 300 mm/min.)
(50% ADOC = 1.58 mm)
G01 Z-1.58 F300;
G01 X5 F300;
G01 X-5 F300;

(Move to a new line in the Y direction.)
G01 Y0.00 F300;
G01 X5 F300;
G01 X-5 F300;

(Retract to a safe Z position for scanning.)
G01 Z5 F300;
G00 Z10;

(Stop the spindle.)
M5;
