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
::: x86(-64) Shellcode Factory :::

::: Your shellcode ready to go :::
\x31\xdb\x31\xc0\x40\xcd\x80

::: Your shellcode size : 7 :::
```

examples/shellcode.asm.bin contains our precious shellcode :)

## Requirements
* nasm
* xxd (usually bundled with your Linux distribution)
* awk (usually bundled with your Linux distribution)