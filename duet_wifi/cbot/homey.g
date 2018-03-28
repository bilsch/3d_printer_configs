; homey.g
; called to home the Y axis
;
; generated by RepRapFirmware Configuration Tool on Wed Mar 28 2018 11:00:13 GMT-0400 (Eastern Daylight Time)
G91              ; relative positioning
G1 Z5 F6000 S2   ; lift Z relative to current position
G1 S1 Y305 F1800 ; move quickly to Y axis endstop and stop there (first pass)
G1 Y-5 F6000     ; go back a few mm
G1 S1 Y305 F360  ; move slowly to Y axis endstop once more (second pass)
G1 Z-5 F6000 S2  ; lower Z again
G90              ; absolute positioning
