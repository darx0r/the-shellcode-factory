# The Shellcode Factory
minimal environment for shellcode development in linux.
For now supports x86.

## HOWTO
1. edit shellcode.asm file
2. execute "make asm=shellcode.asm"
3. Wow !

## Example
a quick example of exit(0) shellcode:

```ASM
section .text
global _start

_start:
    xor ebx, ebx
    xor eax, eax
    inc eax
    int 0x80
```
saved as examples/shellcode.asm.

make asm=examples/shellcode.asm
```
::: x86 Shellcode Factory :::


::: Your piece of art :::

examples/shellcode.out:     file format elf32-i386


Disassembly of section .text:

08048060 <_start>:
 8048060:   31 db                   xor    ebx,ebx
 8048062:   31 c0                   xor    eax,eax
 8048064:   40                      inc    eax
 8048065:   cd 80                   int    0x80

::: shellcode buffer generator :::

\x31\xdb\x31\xc0\x40\xcd\x80

::: done, look at examples/shellcode.bin :::
::: length: 7
```

examples/shellcode.bin contains our precious shellcode :)

## Requirements
* nasm
* ld (gcc-multilib on x86_64)
* objdump
