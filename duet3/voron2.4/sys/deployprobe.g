; ***********************************************************
; Euclid Probe Moving Z Dock Deploy Probe Macro M401
; RRF3.X Firmware Example
; saveas system/deployprobe.g
; comments and echo statements throughout are provided for convenience
; ***********************************************************

; bed layout
;  __________________________________________________________________________
;  |                                                                        |
;  |                                                                        |
;  |                                                                        |
;  |                                                                        |
;  |                                                                        |
;  |                                                                        |
;  |                                                                        |
;  |                                                                        |
;  |                                                                        |
;  |                                                                        |
;  |                                * Probe Ready Position                  |
;  |                                  X60 Y292                              |
;  |                                                                        |
;  |                                                                        |
;  | * Dock staging position                                                |
;  |   X20 Y292                                                             |
;  |                                                                        |
;  |                                                                        |
;  | * Dock Exit Position                                                   | 
;  |   X=60 Y292                                                            |
;  |                                                                        |
;  |                                                                        |
;  |                                                                        |
;  |                                                                        |
;  |                                                                        |
;  |   X0 Y0    X30 Y0       X100 Y0                                        |
;  | * Dock   * Dock Side  * Dock Preflight                                 |
;  |________________________________________________________________________| 
;
echo "Running deployprobe.g"
if !move.axes[0].homed || !move.axes[1].homed     ; If the printer hasn't been homed, home it
   M98 P"0:/sys/homexy.g" 

; uncomment next line to echo the probe deploy state 
echo "Object Model Deployuser token =" ^sensors.probes[0].deployedByUser

M564 H1 S0                    ; Allow movement BEYOND axes boundaries (for Y to reach probe dock)

echo "Probe Value =" ^sensors.probes[0].value[0]

if sensors.probes[0].value[0]!=1000    ; if sensor is value other than 1000 do this
  ; uncomment next line to echo the probe deploy state 
  echo "deployuser token = " ^sensors.probes[0].deployedByUser
  echo "Probe State = " ^sensors.probes[0].value[0]
  abort "deployprobe start value Probe already picked up.  Manually return probe to the dock"

; if we're here we know it's becasue the above is true which I assume is because you have an NC switch as a probe.
echo "Passed first logic test to deploy probe"

;; note this just moves right over the probe and drops z to pick it up

G0 X0 Y270              ; move to Preflight Position
M400                          ; wait for moves to finish
G91                           ; realtive coordiantes

echo "Probe Pickup while loop running"

; uncomment next line to echo the probe deplot state 
echo "Object Model Deployuser token (before while loop) = " ^sensors.probes[0].deployedByUser

G90                           ; absolute coordinates
G1 X0 Y297 F3000                ; move over dock
G4 S1                         ; pause for pickup 
M400                          ; wait for moves to finish

if sensors.probes[0].value[0] = 1000
   abort "probe pickup failed please investigate"
   break

G4 P250                       ; pause 1 seconds
echo "Probe Value =" ^sensors.probes[0].value[0]
G1 X60 Y297 F1200               ;  slide probe out of dock - slowly
M400
G4 P250                       ; pause 1 seconds

if sensors.probes[0].value[0]=0;
    echo "probe pickup successful"
else
    abort "probe pickup appears to have failed please investigate"

G90                           ; absolute positioning
G1 X0 Y0 F9000        ; move bed to clear probe from build surface 
M400                          ; wait for moves to finish

M564 H1 S1                    ; Restrict movement to within axes boundaries (for normal Y movement)

echo "Macro deployprobe.g complete"