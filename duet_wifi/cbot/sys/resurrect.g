; File "0:/gcodes/basketball-stand-jumpman.gcode" resume print after print paused at 2020-01-01 22:02
G21
M140 P0 S55.0
T-1 P0
G92 X91.507 Y88.075 Z7.040
G60 S1
G10 P1 S0 R0
G10 P0 S200 R200
T0 P0
M98 P"resurrect-prologue.g"
M116
M290 X0.000 Y0.000 Z-0.040 R0
T-1 P0
T0 P6
G10 L2 P1 X0.00 Y0.00 Z0.00
G10 L2 P2 X0.00 Y0.00 Z0.00
G10 L2 P3 X0.00 Y0.00 Z0.00
G10 L2 P4 X0.00 Y0.00 Z0.00
G10 L2 P5 X0.00 Y0.00 Z0.00
G10 L2 P6 X0.00 Y0.00 Z0.00
G10 L2 P7 X0.00 Y0.00 Z0.00
G10 L2 P8 X0.00 Y0.00 Z0.00
G10 L2 P9 X0.00 Y0.00 Z0.00
G54
M106 S0.40
M106 P0 S0.40
M106 P1 S0.00
M106 P3 S0.00
M106 P4 S0.00
M106 P5 S0.00
M106 P6 S0.00
M106 P7 S0.00
M106 P8 S0.00
M116
G92 E0.00000
M83
M23 "0:/gcodes/basketball-stand-jumpman.gcode"
M26 S3574348 P0.000
G0 F6000 Z9.000
G0 F6000 X91.507 Y88.075
G0 F6000 Z7.000
G1 F4278.0 P0
G21
M24
