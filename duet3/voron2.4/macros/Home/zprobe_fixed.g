G90	          ; absolute positioning
M564 S0       ; allow beyond limit axis to print area
G1 X202 Y297  ; Location of microswitch - try for center ;)
while true
  if iterations = 3
    break
  G30 K1 Z-99999 S-3    ; Note K1 is probe 1, probe 0 is euclid
  G91
  G1 Z5
  G90

M564 S1       ; restrict printing area again