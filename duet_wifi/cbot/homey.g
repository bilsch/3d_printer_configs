; homey.g
; called to home the Y axis
;
; generated by RepRapFirmware Configuration Tool on Sat Jan 07 2017 20:25:17 GMT-0500 (EST)

; Lift Z relative to current position
G91
G1 Z5 F5000 S2
G90

; Move quickly to Y axis endstop and stop there (first pass)
G1 Y-290 F5000 S1

; Go back a few mm
; G91
; G1 Y5 F5000
; G90

; Move slowly to X axis endstop once more (second pass)
G1 Y-290 F360 S1

; Lower Z again
G91
G1 Z-5 F5000 S2
G90