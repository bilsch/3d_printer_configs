; Configuration file for UltiBots D300VS Delta 3D Printer
; version 1.0 for RepRapFirmware version 1.19.2

; Communication and general
M111 S0                             	; Debug off
M550 PD300VS				; Machine name and Netbios name (can be anything you like)

; Wifi Networking
M552 S1					; Enable Wifi by default

M555 P2                           	; Set output to look like Marlin
G21                                 	; Work in millimeters
G90                                	; Send absolute positional coordinates...
M83                                 	; ...but relative extruder moves

; Axis and motor configuration
M569 P0 S1				; Drive 0 goes backwards (X tower)
M569 P1 S1				; Drive 1 goes backwards (Y tower)
M569 P2 S1				; Drive 2 goes backwards (Z tower)
M569 P3 S1				; Drive 3 goes backwards (extruder 1)

M574 X2 Y2 Z2 S1			; Set endstop configuration (all endstops at high end, active high)

; *** The homed height is deliberately set too high in the following - these will be adjusted with delta auto-calibration
M665 R205.963 L375.00 B149 H440.236 X0.172 Y-0.266 Z0.0	; Set delta radius, diagonal rod length, printable radius and homed height changed B from 140 -> 145 4/3 for max printable area
M666 X0.70 Y-1.61 Z0.91			; Endstop offset adjustments, these will be adjusted with delta auto-calibration

M350 X16 Y16 Z16 E16 I1			; Set microstepping  X, Y and Z and extruder stepper with interpolation
M92 X200 Y200 Z200 E837			; Set axis steps/mm - e steps are based on .9 stepper with e3d default for now
M906 X1000 Y1000 Z1000 E1000		; Set motor currents (mA)
M201 X1000 Y1000 Z1000 E1000		; Accelerations (mm/s^2)
M203 X20000 Y20000 Z20000 E8000	        ; Maximum speeds (mm/min)
M566 X1200 Y1200 Z1200 E1200		; Maximum instant speed changes mm/minute

; Fans
M106 P1 T50 S255 H1			; Set hotend heatsink FAN1 thermostatic control at 50°C

; Thermistors
M305 P0 T100000 B4138	                ; keenovo silicon ac heater
; M305 P1 R4700 T100000 B4725 C7.06e-8	; E3D V6 Semitec GT-104 thermistor cartridge

; PT100 sensors
M305 P1 X201                            ; e3d hotend has a pt100 on rtd2 board 1
M143 H1 S480                            ; Set temperature limit for heater 1 to 480C

; Heater configuration
; M307 H0 B1				; Heater 0 (bed) use bang-bang control
M307 H1 B0                              ; Heater 0 (bed) use PID
M307 H1 A512.9 C267.0 D9.0 B0		; Heater 1 (hot end) use PID

; Tool definitions
M563 P0 D0 H1                       	; Define tool 0, the extruder - fried the normal heater 1 so switched to heater 3
G10 P0 S0 R0                        	; Set tool 0 operating and standby temperatures
M92 E837	                       	; Set extruder steps per mm

; Z probe and compensation definition
; Change "H25" to "H3" AFTER commissioning your printer
M558 P4 X0 Y0 Z0 H3 I1 		; FSRs with JohnSL board Z probe behaves as a switch and is not used for homing any axes
G31 X0 Y0 Z-.461 P500		; post pc print, was off by .1 on z.
; G31 X0 Y0 Z-.261 P500		; MUST READ: http://www.sublimelayers.com/2017/05/fdffsd.html
M557 R130 S20                   ; probe within a radius of 130mm from the centre with a mesh spacing of 20mm

T0					; Select tool 0, the hot end
M501					; Load config-override.g
