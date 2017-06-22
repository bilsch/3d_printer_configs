; Configuration file for Duet WiFi (firmware version 1.17)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool on Sat Jan 07 2017 20:25:17 GMT-0500 (EST)

; General preferences
M111 S0 ; Debugging off
G21 ; Work in millimetres
G90 ; Send absolute coordinates...
M83 ; ...but relative extruder moves
M555 P2 ; Set firmware compatibility to look like Marlin

M667 S1 ; Select CoreXY mode
M208 X0 Y0 Z0 S1 ; Set axis minima
M208 X285 Y285 Z300 S0 ; Set axis maxima

; Endstops
; M574 X1 Y1 Z1 S1 ; Define active high microswitches
M574 E0 S1 X1 Y1 Z1;
M558 P1 X0 Y0 Z0 H5 F120 T5000 ; Set Z probe type to unmodulated, the axes for which it is used and the probe + travel speeds

; Drives
M569 P0 S0 ; Drive 0 goes backwards
M569 P1 S1 ; Drive 1 goes forwards
M569 P2 S1 ; Drive 2 goes forwards
M569 P3 S1 ; Drive 3 goes forwards
M350 Z16 E16 ; Configure microstepping without interpolation
M350 X16 Y16 I1 ; Configure microstepping with interpolation for X/Y only

M92 X200 Y200 Z400 E347.8895 ; Set steps per mm
M566 X300 Y300 Z200 E2400 ; Set maximum instantaneous speed changes (mm/min)
M203 X13000 Y13000 Z1200 E3600 ; Set maximum speeds (mm/min)
M201 X600 Y600 Z150 E150 ; Set accelerations (mm/s^2)
M906 X1000 Y1000 Z1900 E1000 I30 ; Set motor currents (mA) and motor idle factor in per cent
M84 S30 ; Set idle timeout

; hotend heater config on pt100 channel 0
M143 S390 ; Set maximum heater temperature to 290C
M305 P1 X200

; bed heater config on pt100 channel 1
M305 P0 X201
M143 H0 S201

; Tools
M563 P0 D0 H1 ; Define tool 0
G10 P0 X0 Y0 ; Set tool 0 axis offsets
G10 P0 R0 S0 ; Set initial tool 0 active and standby temperatures to 0C

; Network
M550 Pcbot ; Set machine name
M552 P0.0.0.0 S1 ; Enable network and acquire dynamic address via DHCP

; Fans
M106 P0 S1 I0 F500 H-1 ; Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off - part fan
M106 P1 S1 I0 F500 H1 T60 ; Set fan 1 value, PWM signal inversion and frequency. Thermostatic control is turned on - e3d
M106 P2 S0.5 I0 F500 H1 T60 S127 ; Set fan 2 value, PWM signal inversion and frequency. Thermostatic control is turned on - duet

; Custom settings are not configured
M107 ; start with all fans off
; G29 S1 ; load map for compensation