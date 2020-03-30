SRCS = checksum.c unicode.c
OBJS = $(SRCS:.c=.o)
DEPS = $(SRCS:.c=.d)

PREFIX ?= /usr/local
LIBDIR ?= $(PREFIX)/lib

SPARSE_VERSION := $(shell sparse --version 2>/dev/null)

override CFLAGS += -Wall -fno-strict-aliasing -I$(CURDIR)/../include

libapfs.a: $(OBJS)
	@echo '  Assembling library archive...'
	@ar rcs $@ $^

%.o: %.c
	@echo '  Compiling $<...'
	@gcc $(CFLAGS) -o $@ -MMD -MP -c $<
ifdef SPARSE_VERSION
	@sparse $(CFLAGS) $<
endif

-include $(DEPS)

install: libapfs.a
	install -d $(LIBDIR)
	install -t $(LIBDIR) libapfs.a
uninstall:
	rm -f $(LIBDIR)/libapfs.a
clean:
	rm -f $(OBJS) $(DEPS) libapfs.a
.PHONY: uninstall clean
