AUTOMAKE_OPTIONS = foreign
INCLUDES = -I$(top_srcdir)/include
bin_PROGRAMS = fastboot

if HOST_IS_LINUX
   source_deps = usb_linux.c util_linux.c
   libs_deps = -lncurses
endif

if HOST_IS_DARWIN
   source_deps = usb_osx.c util_osx.c
   libs_deps = -framework CoreFoundation -framework IOKit -framework Carbon
endif

fastboot_SOURCES = protocol.c engine.c bootimg.c fastboot.c $(source_deps)
LIBS = -lpthread -lz $(libs_deps)
fastboot_CFLAGS = -O2 -g -Wall -Wno-unused-parameter
fastboot_LDADD = $(top_srcdir)/libzipfile/libzipfile.a

