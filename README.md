# basic-rle-in-zig

This project demonstrates a simple Run-Length Encoding (RLE) compression algorithm implemented in Zig. The goal of this project is to learn the Zig programming language and explore the RLE compression concept.

## Table of Contents

- [Introduction](#introduction)
- [Usage](#usage)
- [Example](#example)
- [License](#license)

## Introduction

Run-Length Encoding (RLE) is a basic form of data compression where sequences of the same data value are stored as a single data value and count. For example, the string "AAAA" would be compressed to "A4". This project helped in learning Zig and understanding how to implement a simple compression algorithm.

## Usage

1. Install Zig: Follow the instructions on the [Zig website](https://ziglang.org/download/) to install Zig.

2. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/basic-rle-in-zig.git
    cd basic-rle-in-zig
    ```

3. Build the project:
    ```sh
    zig build-exe src/main.zig
    ```

4. Run the executable:
    ```sh
    ./main <your-string>
    ```

## Example

Running the program with the input `SSaaahilistheGOOat`:

```sh
./main SSaaahilistheGOOat
```

Output:

```
Character '83': 2
Character '97': 3
Character '104': 1
Character '105': 1
Character '108': 1
Character '115': 1
Character '116': 1
Character '71': 1
Character '79': 2
Updated string: S2a3hilistheGO2at
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.


## Update

Now You can input via userInput

![image](https://github.com/ben-blance/basic-rle-in-zig/assets/147723363/c6a161ca-2ccb-4b5a-9b1c-631c5044dd89)



