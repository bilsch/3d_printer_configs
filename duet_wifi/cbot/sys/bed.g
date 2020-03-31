; bed.g
; called to perform automatic bed compensation via G32
;

G28 ; Home
G30 P0 X0 Y0 Z-99999 ; Probe near Front Right leadscrew
G30 P1 X0 Y310 Z-99999 ; PROBE POINT 2 Rear Left
G30 P2 X130 Y310 Z-99999 ; Probe near Rear Middle leadscrew
G30 P3 X290 Y310 Z-99999 ; PROBE POINT 4 Rear Right
G30 P4 X130 Y165 Z-99999 ; PROBE POINT 5 Center
G30 P5 X130 Y0 Z-99999 ; PROBE POINT 6 Front Middle
G30 P6 X290 Y0 Z-99999 S3 ; Probe near a leadscrew and calibrate the 3 motors to achieve self leveling
G28 ; Home