import sys
import math


def main(argv: list[str]) -> None:
    file_name: str = argv[1]
    with open(file_name, "rt") as input_file:
        input_data: str = input_file.read()

    lines: list[str] = input_data.split("\n")
    numbers_pairs: list[list[str]] = [it.split(" ") for it in lines]
    for pair in numbers_pairs:
        print(f"Numbers: {pair[0]} {pair[1]}")
        result: int = int(math.sqrt(int(pair[0]) ** 2 + int(pair[1]) ** 2))
        print(f"Result: {result}")


if __name__ == '__main__':
    main(sys.argv)
