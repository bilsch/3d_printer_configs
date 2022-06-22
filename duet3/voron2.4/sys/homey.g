; homex.g
; called to home the X axis
;
; M98 P"0:/sys/homexy.g"                         ; home x y
; ***********************************************************
; homexy.g
; ***********************************************************
; 
M564 S0 H0              ; allow movement outside limits
			; Home X and Y at the high end of the axis
G91                     ; relative positioning
G1 H2 Z10 F2000          ; lift Z relative to current position
G1 H1 Y500 F9000        ; move quickly to X and Y axis endstops and stop there (first pass)
G1 H2 X-5 Y-5 F900      ; go back a few mm
G1 H1 Y500 F360         ; move slowly to X and Y axis endstops once more (second pass)
G1 H2 Z-10 F2000         ; lift Z relative to current position
G90                     ; absolute positioning
M564 S1			; restrict movement outside limits again
