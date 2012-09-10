AUTOMAKE_OPTIONS = foreign
INCLUDES = -I$(top_srcdir)/include
bin_PROGRAMS = fastboot
fastboot_SOURCES = \
	protocol.c \
	engine.c \
	bootimg.c \
	fastboot.c \
	usb_linux.c \
	util_linux.c
fastboot_CFLAGS = -O2 -g -Wall -Wno-unused-parameter

fastboot_LDADD = $(top_srcdir)/libzipfile/libzipfile.a

