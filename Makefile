CFLAGS?=-std=c89 -ansi -pedantic -O4 -Wall -fPIC
CC=clang

default: multipart_parser.o
	$(CC) -shared -Wl,-soname,libmultipart.so -o libmultipart.so multipart_parser.o

multipart_parser.o: multipart_parser.c multipart_parser.h	

clean:
	rm -f *.o *.so

INSTALL ?= cp -a
PREFIX ?= /usr/local
INCLUDE_PATH ?= include
LIBRARY_PATH ?= lib

INSTALL_INCLUDE_PATH = $(DESTDIR)$(PREFIX)/$(INCLUDE_PATH)
INSTALL_LIBRARY_PATH = $(DESTDIR)$(PREFIX)/$(LIBRARY_PATH)

install:
	mkdir -p $(INSTALL_LIBRARY_PATH) $(INSTALL_INCLUDE_PATH)
	$(INSTALL) multipart_parser.h $(INSTALL_INCLUDE_PATH)
	$(INSTALL) libmultipart.so $(INSTALL_LIBRARY_PATH)