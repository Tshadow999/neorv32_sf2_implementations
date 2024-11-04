import sys


def process_file(input_file):
    with open(input_file, "r") as infile, open("./neorv32_raw_exe.mem", "w") as outfile:
        for hex in infile:
            outfile.write("{:032b}".format(int(hex, 16)) + "\n")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python hex_to_binary.py input_file")
        sys.exit(1)

    input_file = sys.argv[1]

    process_file(input_file)
