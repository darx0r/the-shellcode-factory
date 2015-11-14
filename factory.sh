#!/bin/sh

if [ $# -ne 1 ]; then
    echo usage: $0 shellcode.asm
    exit 1
fi

asm=$1
name=${asm%%.*}

echo -e "\n::: x86 Shellcode Factory :::\n"

nasm -felf32 $asm
ld -melf_i386 -o $name.out $name.o

echo -e "\n::: Your piece of art :::"
objdump -d -Mintel $name.out

echo -e "\n::: shellcode buffer generator :::\n"
objdump -d $name.out | grep '[0-9a-f]:' | grep -v 'file' | cut -f2 -d: | cut -f1-6 -d' ' | tr -s ' ' | tr '\t' ' ' | sed 's/ $//g' | sed 's/ /\\x/g' | paste -d '' -s | tee $name.bin 
echo -ne `cat $name.bin` > $name.bin

echo -e "\n::: done, look at $name.bin :::"
echo -n "::: length: "
wc -c $name.bin | cut -f1 -d' ' 

