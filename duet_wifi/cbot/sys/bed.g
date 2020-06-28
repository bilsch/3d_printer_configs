; bed.g
; called to perform automatic bed compensation via G32
;

M561 ; clear any bed transform
G28 ; Home
G30 P0 X0 Y0 Z-99999 ; probe near a leadscrew
G30 P1 X0 Y260 Z-99999 ; probe near a leadscrew
G30 P2 X260 Y145 Z-99999 S3 ; probe near a leadscrew and calibrate 3 motor
G29 ; probe the bed and enable compensation
G28 ; Home