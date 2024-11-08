#!/bin/bash

# Adds the neorv submodule if it hasnt been added
if [ ! -d "neorv32/" ]; then
    ./get_neorv32.sh
fi

./generate_bit_stream.sh

./program.sh

sudo gtkterm -p '/dev/ttyUSB0' -s 19200