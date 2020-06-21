#!/bin/bash

# This script will rebuild BLIS, and then
# build the appropriate Linux Image for FireSim execution using
# FireMarshal and Spike
echo "Build and Test BLIS Tests Workload"

RDIR=$(pwd)
MARSHALDIR=$(pwd)/../../../software/firemarshal
rm -rf overlay/root/blis/
cd $MARSHALDIR
rm images/blis-tests*
./marshal -v --no-disk --workdir $RDIR build blis-tests.json
./marshal -v --no-disk --workdir $RDIR launch --spike blis-tests.json
cd $RDIR
