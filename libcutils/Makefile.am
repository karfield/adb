AUTOMAKE_OPTIONS = foreign
INCLUDES = -I$(top_srcdir)/include
noinst_LIBRARIES = libcutils.a
minimal_source_for_adb = \
	socket_inaddr_any_server.c \
	socket_local_server.c \
	socket_loopback_server.c \
	socket_local_client.c \
	socket_loopback_client.c \
	socket_network_client.c \
	sockets.c \
	properties.c \
	threads.c \
	abort_socket.c
libcutils_a_SOURCES=$(minimal_source_for_adb)
libcutils_a_CFLAGS = -O2 -g -Wall -DANDROID_SMP=0 -DLIBC_STATIC -DDLMALLOC_DEBUG \
					-DHAVE_PTHREADS -DHOST_OS=linux

