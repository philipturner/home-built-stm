(Set the unit system, coordinate mode, and starting position.)
G21 G90;
G00 X0 Y0 Z10;

(Move to above where a hole will be drilled.)
G00 X-10 Y-0.79;

(Start the spindle.)
(Wait 2 seconds to ensure the operator can close the door.)
M3 S3000;
G04 X2.00;

(Mill with a feedrate of 150 mm/min, 25% RDOC, and 50% ADOC.)
G01 Z-1.58 F150;
G01 X5 Y-0.79 F150;

(Retract to a safe Z position for scanning.)
G00 Z10;

(Stop the spindle.)
M5;
