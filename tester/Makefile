all: tester

clean:
	rm -f tester

tester: tester.c
	gcc $< -o $@ -fno-stack-protector -z execstack
