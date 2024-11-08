input = "../neorv32-sf2-with-envm/neorv32/sw/example/coremark/neorv32_raw_exe.hex";
output = open("../neorv32-sf2-with-envm/mem_files/coremark.mem", "w");

lookup = {
    "0" : "0000",
    "1" : "0001",
    "2" : "0010",
    "3" : "0011",
    "4" : "0100",
    "5" : "0101",
    "6" : "0110",
    "7" : "0111",
    "8" : "1000",
    "9" : "1001",
    "a" : "1010",
    "b" : "1011",
    "c" : "1100",
    "d" : "1101",
    "e" : "1110",
    "f" : "1111",
    "\n": "\n",
}

def hex2bin():
    with open(input) as file:
        for line in file:
            for char in line:
                output.write(lookup[char]);
            pass;
    output.close();


if __name__ == "__main__":
    hex2bin();
