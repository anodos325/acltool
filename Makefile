CC = gcc
CFLAGS = -Wall
CFLAGS += -g
CPPFLAGS += -I/usr/include/sys
LDADD += -lacl

DEPS = acltool.h acl.h
OBJ = acltool.o util_nfs4.o util_posix1e.o

%.o: %.c $(DEPS)
	$(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@$< $

acltool: $(OBJ)
	gcc $(CFLAGS) $(CPPFLAGS) -o $@ $^ $(LDADD)

clean:
	rm *.o
