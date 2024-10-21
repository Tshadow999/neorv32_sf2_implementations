input = "../neorv32-sf2-with-envm/neorv32/sw/example/demo_blink_led/main.c";
output = "output.mem";

def hex2bin():
    with open(input) as file:
        for line in file:
            print(line.strip())


if __name__ == "__main__":
    hex2bin();
