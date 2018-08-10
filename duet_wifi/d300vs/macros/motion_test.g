; UltiBots D300VS initial commisioning test
;
G21 			; mm
G90 			; absolute positioning
M83 			; extruder relative

; slowly bring up the LEDs
M106 P2 S50 		; LEDS on
G4 P750 		; 3/4 sec
M106 P2 S100 		; LEDS on
G4 P750 		; 3/4 sec
M106 P2 S150 		; LEDS on
G4 P750 		; 3/4 sec
M106 P2 S200 		; LEDS on
G4 P750 		; 3/4 sec
M106 P2 S255 		; LEDS on

G28 			; home
; move around a little
G0 Z100			
G0 Z200
G0 X100
G0 Y100
G0 X-100
G0 Y-100
G0 X0 Y0
G0 Z100
G0 Z200
G28			; home

; slowly turn off the LEDs
M106 P2 S200 		; LEDS on
G4 P750 		; 3/4 sec
M106 P2 S150 		; LEDS on
G4 P750 		; 3/4 sec
M106 P2 S100 		; LEDS on
G4 P750 		; 3/4 sec
M106 P2 S50 		; LEDS on
G4 P750 		; 3/4 sec
M106 P2 S0 		; LEDS on
M84			; motors off
