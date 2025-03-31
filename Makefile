CC=gcc
CFLAGS=-g -O0

vuln: vuln.c
    $(CC) $(CFLAGS) -o vuln vuln.c

.PHONY: clean
clean:
    rm -f vuln
