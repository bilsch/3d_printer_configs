; ***********************************************************
; Euclid Probe Independant Screw Leveling Macro
; RRF3.X Firmware Example
; saveas system/bed4point.g 
; could save it as conventional bed.g but for illustration purposes 
; the name is purposefully altered
; comments and echo statements throughout are provided for convenience
; ***********************************************************
; probe is -16.4 in X -29.4 in Y bed is 290 in X 325 in Y
; locations of probe points are at 
; (18, 285)     (270,285)
;
; (18,65)       (270,65)
;
; adjust coords so that probe hits symmetric points on the bed and avoids dock
;
echo "Running bed4point.g"
M558 F60 A3                              ; fix probe speed to 1mm/s
G90
G4 P250

while true
  if iterations = 2
    break
  else
    G30 K0 P0 X30 Y30 Z-99999 ; probe near front left belt
    G30 K0 P1 X30 Y225 Z-99999 ; probe near back left belt
    G30 K0 P2 X265 Y225 Z-99999 ; probe near back right belt 
    G30 K0 P3 X265 Y30 Z-99999 S4 ; probe near front right belt 

echo "bed4point.g complete" 
