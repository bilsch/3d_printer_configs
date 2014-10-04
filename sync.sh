#!/bin/bash

set -xv

cp ../Marlin-orig/Marlin/Configuration.h marlin/
cp ../Smoothieware/ConfigSamples/AzteegX5Mini/config Smoothieware

git add -A
git commit
