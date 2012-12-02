
AUTOMAKE_OPTIONS = foreign
INCLUDES = -I$(top_srcdir)/include
bin_PROGRAMS = adb

if HOST_IS_LINUX
    source_deps = usb_linux.c get_my_path_linux.c
    libs_deps = -lrt -lncurses
endif

if HOST_IS_DARWIN
    source_deps = usb_osx.c get_my_path_darwin.c
    libs_deps = -framework CoreFoundation -framework IOKit -framework Carbon
endif

adb_SOURCES = adb.c console.c transport.c transport_local.c transport_usb.c \
    commandline.c adb_client.c services.c file_sync_client.c utils.c \
    usb_vendors.c fdevent.c sockets.c $(source_deps)

adb_CFLAGS = -O2 -g -Wall -Wno-unused-parameter \
           -DADB_HOST=1 -D_XOPEN_SOURCE -D_GNU_SOURCE -DHAVE_FORKEXEC

LIBS = -lpthread -lz $(libs_deps)

adb_LDADD = $(top_srcdir)/libcutils/libcutils.a $(top_srcdir)/libzipfile/libzipfile.a

