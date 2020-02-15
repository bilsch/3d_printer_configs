; endstop based z home
G91               ; relative positioning
G1 Z5 F6000 S2    ; lift Z relative to current position
G1 S1 Z-305 F1800 ; move quickly to X axis endstop and stop there (first pass)
G1 Z5 F6000       ; go back a few mm
G1 S1 Z-305 F360  ; move slowly to X axis endstop once more (second pass)
G90               ; absolute positioning

; probe based z home
;G90               ; absolute positioning
;G1 Z5 F6000 S2    ; lift Z relative to current position
;G1 X40 Y0 F6000   ; go to first probe point
;G30               ; home Z by probing the bed

; Uncomment the following lines to lift Z after probing
;G91              ; relative positioning
;G1 Z5 F100 S2    ; lift Z relative to current position
;G90              ; absolute positioning