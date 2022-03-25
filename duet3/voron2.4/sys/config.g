; Configuration file for Duet 3 (firmware version 3)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v3.1.3 on Sun Jul 12 2020 20:53:52 GMT+0200 (Central European Summer Time)

; General preferences
G90                                            	    ; send absolute coordinates...
M83                                                 ; ...but relative extruder moves
M550 P"Voron"                                   	; set printer name
M669 K1                                            	; select CoreXY mode

; Network - using pi
; M552 P0.0.0.0 S0                                   	; enable network and acquire dynamic address via DHCP
; M586 P0 S0                                          ; enable HTTP
; M586 P1 S0                                         	; disable FTP
; M586 P2 T1 S0                                      	; disable Telnet

; Wait a bit so boards can sync up
G4 S5

; Drives for XY
M569 P0.4 S1                                       	; A motor 
M569 P0.5 S0                                       	; B motor

; Drives for Z
M569 P0.2 S1                                       	; Front left 
M569 P0.1 S0                                       	; Back left
M569 P0.0 S1                                       	; Back right
M569 P0.3 S1                                       	; Front right

; Drive for extruder, 3hc
M569 P1.0 S1                                   ; physical drive 1.0 goes forwards

; Drive mappings 
M584 X0.4 Y0.5 Z0.0:0.1:0.2:0.3 E1.0               	; set drive mapping

; General drive config like speeds, accel, jerk, etc
M350 X16 Y16 Z16:16:16:16 E16 I1                   	; configure microstepping with interpolation
M92 X80.00 Y80.00 Z800.00 E410.00         			; set steps per mm
M566 X600.00 Y600.00 Z60.00 E8000.00       			; set maximum instantaneous speed changes (mm/min)
M203 X18000.00 Y18000.00 Z3000 E15000		       	; set maximum speeds (mm/min)
M201 X1500.00 Y1500.00 Z350.00 E1800.00    			; set accelerations (mm/s^2)
M204 P1500 T2000									; set printing acceleration and travel acceleration
M906 X2000 Y2000 Z2000 E1600 I60                	; set motor currents (mA) and motor idle factor in per cent
M84 S30  

; Axis Limits
M208 X0:305 Y0:305
M208 Z0:265

; Endstops
M574 X2 S1 P"io3.in"                               ; microswitch
M574 Y2 S1 P"io4.in"                               ; microswitch
M574 Z0 P"nil" 										; No endstop

; Z microswitch
M558 K1 P8 C"io8.in" I1 H2 F350:60 T18000 A10 S0.01 R0.2 ; set Z probe type to switch and the dive height + speeds
G31 K1 P500 X0 Y0 Z-0.17                          ; set Z probe trigger value, offset and trigger height -0.8

; Z-Probe
M558 K0 P8 C"io7.in" I1 H5 F350:120 T18000 A5 S0.01 R0.2  ; set Z probe type to switch and the dive height + speeds
G31 K0 P500 X0 Y25 Z1.98                               ; set Z probe trigger value, offset and trigger height

M671 X354:354:-53:-53 Y0:370:370:0 S20        	 	; Define Z belts locations (Front_Left, Back_Left, Back_Right, Front_Right)
M557 X15:285 Y25:275 S40                           	; define mesh grid

; Hotbed
M308 S0 P"temp0" Y"thermistor" T100000 B4138       	; Thermistor
M950 H0 C"out9" T0                                 	; Heater
M307 H0 R0.799 C380.0 D4.51 S0.60 V24.0					; Heater 0 model for 3.x
M140 H0                                            	; Map heated bed to heater 0
M143 H0 S120                                       	; Set temperature limit for heater 0 to 120C
M570 H0 T3											; Start screaming if temp falls 3C below set temp. 

; Hotend
M308 S1 P"1.temp0" Y"pt1000"                      ; configure sensor temp0 as pt1000 on pin 121.temp0
M950 H1 C"1.out0" T1                              ; create nozzle heater output on 121.out0 and map it to sensor 1

; e3d v6
; need to run pid tuning some day
; M307 H1 R2.921 C156.5 D5.20 S1.00 V24.0					 

; DHT22 sensor
; M308 S10 P"0.spi.cs1" Y"dht22"       A"Chamber Temp"    ; Temperature (connected to cs0 port on the temp daughterboard slot
; M308 S11 P"S10.1"     Y"dhthumidity" A"Chamber Hum[%]"  ; Humidity

; Main fans
M950 F0 C"1.out1" Q500                         ; create fan 0 on pin 121.out1 and set its frequency
M106 P0 S0 H-1                                   ; set fan 0 value. Thermostatic control is turned off
M950 F1 C"1.out2" Q500                         ; create fan 1 on pin 121.out2 and set its frequency
M106 P1 S1 H1 T45                                ; set fan 1 value. Thermostatic control is turned on

; Tools
M563 P0 S"v6" D0 H1 F0                ; define tool 0
G10 P0 X0 Y0 Z0                                    	; set tool 0 axis offsets
G10 P0 R0 S0                                       	; set initial tool 0 active and standby temperatures to 0C

; Push buttons and their config

; Miscellaneous
M911 S22 R23 P"M913 X0 Y0 G91 M83 G1 Z3 E-5 F1000" 	; set voltage thresholds and actions to run on power loss
M575 P1 S1 B57600                            		; enable support for PanelDue

; auto select t0 since we only have 1!
M107 ; start with all fans off
T0   ; Select first tool

; Prepare global vars for print macros
;global bed_temp = 0
;global hotend_temp = 0
