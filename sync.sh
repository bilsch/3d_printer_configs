#!/bin/bash

set -xv

rsync  -av ~/Library/Application*Support/Slic3r/ slic3r/
cp ../Marlin-orig/Marlin/Configuration.h marlin/
cp ~/Library/Repetier/slic3r.ini repetier_host/
cp -a /Applications/*.ini kisslicer/

git add -A
git commit
