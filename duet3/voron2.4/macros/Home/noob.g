M558 F60 A3                              ; fix probe speed to 1mm/s

; G1 X145 Y140 F9000 Z20   ; travel to X,Y of probe point 12mm above bed
G91 ; relative coords
while true
  G1 Z10
  if iterations = 10
    break
  G30 P0 S-1

G92 ; fixed coords