
G91               ; relative positioning

; endstop based z home
G1 Z5 F6000     ; lift Z relative to current position
G1 H1 Z-305 F1800 ; move quickly to X axis endstop and stop there (first pass)
G1 Z5 F6000       ; go back a few mm
G1 H1 Z-305 F360  ; move slowly to X axis endstop once more (second pass)

; TODO: probe based

G90               ; absolute positioning