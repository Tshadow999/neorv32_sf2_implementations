# NEORV32 Flash implementation
In this thesis project I will use Libero to implement the NEORV32 CPU on to an Smart-Fusion 2 FPGA.

# How to use:
This project uses submodules so keep that in mind when cloning.
This is tested on Ubuntu 24.04.1 LTS x86_64.
Libero version: 2023.1

# Generating the project:
First pick a program to run from the `neorv32/sw/example/` directory, if you dont have it run the `get_neorv32.sh` script, that will init the neorv32 submodule and set it to the correct commit. Then it will run the other 2 `.sh` files.
Compile that with the `make all` command. and use `hex2bin.py` converter to create an appropriate memory file. 
Then run the `update_program.sh` script.

# Benchmarking
Inside the coremark_logs directory, there are some benchmarks.
- Standard has no extensions.
- Performance has extensions: `C`, `M`, `Zfinx` and `FAST_MUL_EN`, `FAST_SHIFT_EN` set to `true`.
