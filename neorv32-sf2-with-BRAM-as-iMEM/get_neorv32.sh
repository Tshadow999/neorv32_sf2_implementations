#!/bin/bash

cd "$(dirname "$0")"

git submodule init
git submodule update --init --recursive
cd neorv32
git checkout cfff523c
cd ..