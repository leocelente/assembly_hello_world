#!/bin/zsh
nasm -f elf32  -o hello_world.o hello_world.asm;
# echo "Assabmled,  now linking"; echo "";
ld -m elf_i386 -o hello_world hello_world.o;
printf "Done.\nOutput:\n\n";
./hello_world