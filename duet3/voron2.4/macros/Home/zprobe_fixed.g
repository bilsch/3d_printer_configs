G90	          ; absolute positioning
M564 S0       ; allow beyond limit axis to print area
G1 X200 Y294  ; Location of microswitch - try for center ;)
G30 K1 Z-99999 S-3    ; Note K1 is probe 1, probe 0 is euclid
M564 S1       ; restrict printing area again