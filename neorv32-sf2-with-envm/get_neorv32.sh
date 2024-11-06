#!/bin/bash

git submodule init
git submodule update --init --recursive
cd neorv32
git checkout cfff523c
cd ..
