# Hello World in x86 Assembly (16-bit OS/2)

A minimal Hello World implementation in x86 16-bit assembly for OS/2 1.x systems, using OpenWatcom tools.

## Installation

### OS/2
1. Install OpenWatcom C/C++ for OS/2
2. Add OpenWatcom's bin directory to your PATH
3. Ensure INCLUDE and LIB environment variables point to OS/2 API directories

## Building and Running

```cmd
:: Assemble with Watcom Assembler
wasm -ms hello.asm

:: Link with OpenWatcom Linker
wlink system os2 file hello.obj

:: Run the program
hello.exe
```

## Code Explanation

The implementation uses OS/2 1.x API through INT 21h calls:
- Uses the SMALL memory model (64KB code, 64KB data)
- DosWrite (function 0x0040) writes to console
- DosExit (function 0x004C) terminates the program

Key differences from MASM:
- Uses OpenWatcom syntax for directives
- Main procedure must be public
- Different segment naming conventions
- System-specific linker directives

## Building Details

OpenWatcom requires specific options:
- `-ms` assembler flag specifies SMALL memory model
- `system os2` linker directive creates proper OS/2 executable
- Default OS/2 libraries are automatically linked

Note: This code targets OS/2 1.x 16-bit environment. For newer versions of OS/2, consider using the 32-bit implementation instead.
