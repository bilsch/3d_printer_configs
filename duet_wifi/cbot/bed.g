; bed.g
; called to perform automatic bed compensation via G32
;
; generated by RepRapFirmware Configuration Tool on Wed Mar 28 2018 11:00:13 GMT-0400 (Eastern Daylight Time)
M561                ; clear any bed transform
M98 Pdeployprobe.g  ; deploy mechanical Z probe
; Probe the bed at 4 points
G30 P0 X15 Y15 H0 Z-99999
G30 P1 X15 Y270 H0 Z-99999
G30 P2 X270 Y270 H0 Z-99999
G30 P3 X270 Y15 H0 Z-99999 S
M98 Pretractprobe.g ; retract mechanical Z probe
