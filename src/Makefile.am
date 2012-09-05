AUTOMAKE_OPTIONS = foreign
INCLUDES = -I$(top_srcdir)/include
bin_PROGRAMS = adb
adb_SOURCES = \
	adb.c \
	console.c \
	transport.c \
	transport_local.c \
	transport_usb.c \
	commandline.c \
	adb_client.c \
	services.c \
	file_sync_client.c \
	usb_linux.c \
	get_my_path_linux.c \
	utils.c \
	usb_vendors.c \
	fdevent.c \
	sockets.c
adb_CFLAGS = -O2 -g -Wall -Wno-unused-parameter \
		   -DADB_HOST=1 -D_XOPEN_SOURCE -D_GNU_SOURCE -DHAVE_FORKEXEC

LIBS = -lrt -lncurses -lpthread -lz
adb_LDADD = $(top_srcdir)/libcutils/libcutils.a $(top_srcdir)/libzipfile/libzipfile.a

