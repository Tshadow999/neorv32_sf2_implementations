#!/bin/bash

./generate_bit_stream.sh

./program.sh

sudo gtkterm -p '/dev/ttyUSB0' -s 19200