(Set the unit system and coordinate mode.)
(Ensure we're starting at a safe Z position.)
G21 G90;
G00 Z10;

(Move to the approach position.)
(25% RDOC = 0.79 mm)
G00 X-10 Y-0.79;

(Start the spindle.)
(Wait 10 seconds to ensure the camera has started filming.)
(Wait 2 seconds to ensure the operator can close the door.)
G04 X10.00;
M3 S6000;
G04 X2.00;



(Start the first Z plane.)
(50% ADOC = 1.58 mm)
G01 Z-1.58 F300;

(First line in the Y-direction.)
G01 Y-0.79 F300;
G01 X5 F300;

(Second line in the Y direction.)
G01 Y0.00 F300;
G01 X-3 F300;

(Third line in the Y direction.)
G01 Y0.79 F300;
G01 X5 F300;

(Fourth line in the Y direction.)
G01 Y1.58 F300;
G01 X-3 F300;



(Start the second Z plane.)
(50% ADOC = 1.58 mm)
G01 Z-3.16 F300;

(First line in the Y-direction.)
G01 Y-0.79 F300;
G01 X5 F300;

(Second line in the Y direction.)
G01 Y0.00 F300;
G01 X-3 F300;

(Third line in the Y direction.)
G01 Y0.79 F300;
G01 X5 F300;

(Fourth line in the Y direction.)
G01 Y1.58 F300;
G01 X-3 F300;



(Retract to a safe Z position for scanning.)
G01 Z5 F300;
G00 Z10;

(Stop the spindle.)
M5;
