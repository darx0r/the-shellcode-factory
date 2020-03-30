#!/bin/sh

if [ $# -ne 1 ]; then
    echo usage: $0 shellcode.asm
    exit 1
fi

asm=$1
name=${asm%%.*}

# Why /bin/echo rather than just 'echo' ?

# '/bin/echo' is the GNU echo binary, 'echo' usually refers to the shell
# built-in function, and some popular shells don't handle the '-e' option
# When GNU echo does.
# By "popular shells" I mean default /bin/sh in Debian/Ubuntu based
# distribution is now dash which echo built-in doesn't handle '-e'

/bin/echo -e "::: x86(-64) Shellcode Factory :::"

# Checks if arch is specified, if not 32 bits is the default
header=$(head -n 1 $asm)
if ! echo $header | grep -E 'BITS ?(32|64)';then
	tmpfile="/tmp/tmp_asm"
	echo "BITS 32" > $tmpfile
	cat $asm >> $tmpfile
 	nasm -f bin $tmpfile -o $asm.bin
 else
 	nasm -f bin $asm -o $asm.bin
	fi

code=$(xxd -p $asm.bin | tr -d '\n')
code_sz=${#code}
i=0

/bin/echo -e '\n::: Your shellcode ready to go :::'

awk "BEGIN {binstr=\"$code\"
for(i=1;i<$code_sz;i=i+2)
{
	printf \"\\\\x%s\", substr(binstr, i, 2)
}}"

# Setting code_sz to the real size rather than the hexdump size
code_sz=$((code_sz/2))
/bin/echo -e "\n\n::: Your shellcode size : $code_sz :::"
