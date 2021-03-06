; Configuration file for Duet WiFi (firmware version 1.17)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool on Sat Jan 07 2017 20:25:17 GMT-0500 (EST)

; General preferences
M111 S0 ; Debugging off
G21 ; Work in millimetres
G90 ; Send absolute coordinates...
M83 ; ...but relative extruder moves
M555 P1 ; Set firmware compatibility to look like RepRapFirmare
M575 P1 S1 B57600 ; enable the PanelDue

M667 S1 ; Select CoreXY mode

; Network
M550 Pcbot                            ; Set machine name
M552 S1                                   ; Enable network
;*** Access point is configured manually via M587
M586 P0 S1                                ; Enable HTTP
M586 P1 S0                                ; Disable FTP
M586 P2 S0                                ; Disable Telnet

; Drives
M569 P0 S0 ; X Drive 0 goes backwards
M569 P1 S0 ; Y Drive 1 goes backwards
M569 P2 S1 ; Z Drive - not used
M569 P3 S0 ; E0 Drive 3 goes backwards
; M569 P4 S1 ; E1 Drive 4 goes forwards

; Drives for z, 3 independent
M569 P5 S1 ; left front
M569 P6 S1 ; left back
M569 P7 S1 ; right center
M350 Z16 ; Configure microstepping without interpolation
M350 E16 X16 Y16 I1 ; Configure microstepping with interpolation for X/Y only

; Self Leveling configuration: (Needs to be posted before M350 microstepping)
; -Drive Selection
; -Leadscrews position
M584 X0 Y1 Z5:6:7 E3 ; Three Z motors connected to driver outputs 5, 6 and 7
M671 X0:145:295 Y145:295:145 S10 ; leadscrews at front left, rear left and front middle

; steps and speeds/feeds
M92 X200 Y200 Z1600 E415 I1 ; bondtech BMG with 1.8deg steppers base value
M906 X1500 Y1500 Z1600 E700 I30 ; Set motor currents (mA) and motor idle factor in per cent
M566 X600 Y600 Z150 E300 ; Set maximum instantaneous speed changes (mm/min)
M203 X18000 Y18000 Z200 E1600 ; Set maximum speeds (mm/min) 2280 is volcano v6 is 900
M201 X1500 Y1500 Z1000 E800 ; Set accelerations (mm/s^2)
M84 S30 ; Set idle timeout

; Axis Limits
M208 X0 Y0 Z0 S1                          ; Set axis minima
M208 X290 Y290 Z300 S0                    ; Set axis maxima

; Endstops
M574 X1 S1 P"xstop"                                ; configure active-high endstop for low end on X via pin xstop
M574 Y1 S1 P"ystop"                                ; configure active-high endstop for low end on Y via pin ystop
; M574 Z1 S1 P"zstop"                                ; configure active-high endstop for low end on z via pin zstop
M574 Z1 S2                                         ; configure Z-probe endstop for low end on Z

; Z-Probe
M558 P1 C"zprobe.in" H5 F120 T6000             ; set Z probe type to unmodulated and the dive height + speeds
G31 P500 X0 Y0 Z1.41                           ; set Z probe trigger value, offset and trigger height


; Heaters
M308 S0 P"bedtemp" Y"thermistor" T100000 B4138     ; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"bedheat" T0                              ; create bed heater output on bedheat and map it to sensor 0
M143 H0 S120                                       ; set temperature limit for heater 0 to 120C
M307 H0 B0 S1.00                                   ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                            ; map heated bed to heater 0
M308 S1 P"spi.cs1" Y"rtd-max31865"                 ; configure sensor 1 as thermocouple via CS pin spi.cs1
M950 H1 C"e0heat" T1                               ; create nozzle heater output on e0heat and map it to sensor 1
M143 H1 S490                                       ; set temperature limit for heater 1 to 490C
M307 H1 B0 S1.00                                   ; disable bang-bang mode for heater  and set PWM limit


; Fans
; M950 F0 C"duex.fan4" Q500                          ; create fan 0 on pin fan0 and set its frequency
; M106 P0 S0 H-1 C"Tool 1 part fan"                  ; set fan 0 value. Thermostatic control is turned off
; M950 F1 C"duex.fan5" Q500                        ; create fan 1 on pin fan1 and set its frequency
; M106 P1 S1 H-1 C"Tool 2 part fan"                ; set fan 1 value. Thermostatic control is turned off


; M950 F0 C"fan0" Q500                         ; create fan 1 on pin fan1 and set its frequency
; M106 P0 C"Hotend fan" S1 H1 T45:60                               ; set fan 1 value. Thermostatic control is turned on

M950 F0 C"fan0" Q500                          ; create fan 2 on pin fan3 and set its frequency
M106 P0 C"Hotend fan" S1 H1 T45:60            ; Set fan 2 value, PWM signal inversion and frequency. Thermostatic control is turned on - duet

M950 F1 C"fan1" Q500                   ; create fan 1 on pin fan1 and set its frequency
M106 P1 C"Part cooling fan" S1 H-1                                     ; set fan 1 value. Thermostatic control is turned off

M950 F3 C"duex.fan6" Q500                          ; create fan 3 on pin fan4 and set its frequency. Note this is an LED to light up the work space
M106 P3 S0 H-1 C"LED"                              ; Set fan 3 value, PWM signal inversion and frequency. Thermostatic control is turned off

; Tools
M563 P0 D0 H1 F0                                   ; define tool 0
G10 P0 X0 Y0 Z0                                    ; set tool 0 axis offsets
G10 P0 R0 S0                                       ; set initial tool 0 active and standby temperatures to 0C
; M563 P1 D1 H2 F1                                   ; define tool 1
; G10 P1 X0 Y0 Z0                                    ; set tool 1 axis offsets
; G10 P1 R0 S0                                       ; set initial tool 1 active and standby temperatures to 0C

; zprobe, mini-ir probe
; still need to run https://duet3d.dozuki.com/Wiki/Test_and_calibrate_the_Z_probe
; M558 P1 C"^zprobe.in" H5 F100 T2000
; M558 H30                                           ;*** Remove this line after delta calibration has been done and new delta parameters have been saved

; zprobe sensitivity / offsets - this needs to be after M558!
; G31 Z1.41 
; G31 X0 Y0

; Miscellaneous
M911 S10 R11 P"M913 X0 Y0 G91 M83 G1 Z3 E-5 F1000" ; set voltage thresholds and actions to run on power loss

; Custom settings are not configured
;G29 S1 ; load mesh for printing
M107 ; start with all fans off
T0   ; Select first tool

; default part cooling fans to off
M106 P0 S0
M106 P1 S0

; default pump and LED to off as well
; M106 P2 S0
M106 P3 S0

; pressure advance tinkering - dummy values
M572 D0 S0.05 ; set K-factor