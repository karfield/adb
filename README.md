===
adb is a useful tool for debugging android devices, you can download the
binary from google/android.com, but it only supports small amount devices. To
support some specific android device, you need to add the VID/PID, add udev
rule, etc.
If you want to support your devices natively of adb, you should change the
usb_vendors.c code, then build the whole android source to get the adb tool.
It cause too much to gain the benity.

This project is to build the adb source standalone out of the Android build
script system. I merged the main adb source with some essential libraries
(libcutils and libzipfile), and add Makefile for it.

===
INSTRUCTIONS:

1. After get the source, you can change the usb_vendors.c to add your VID/PID.

2. make
    build the adb tool binary

3. make install
    install the adb to /usr/bin/ configure the udev

4. copy 51-android.rules to /etc/udev/rules.d/

===
TO BUILD .DEB PACKAGE

1. Check dpkg tools (dpkg-dev, dh-make, debhelper, fakeroot, etc.)

2. run `dpkg-buildpackage -rfakeroot -b` to generate .deb package
    (To install the package, you could use `sudo dpkg -i ../adb_x.x.x-1.xxx.deb`)

Enjoy it!
