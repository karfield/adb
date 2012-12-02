===
adb is a useful tool for debugging android devices, you can download the
binary from google/android.com(mostly), but it only supports small amount
devices. To support some specific android device, you need to add the VID,
add udev rule, etc.
If you want to support your devices natively of adb, you should change the
usb_vendors.c code, then build the whole android source to get the adb tool.
It cause too much to gain the benity.

This project is to build the adb source standalone out of the Android build
script system. I merged the main adb source with some essential libraries
(libcutils and libzipfile), and add Makefile for it.

* This project has supported fastboot (from 0.1.0).

===
INSTRUCTIONS:

1. After get the source, you can change the usb_vendor_ids.c to add your VID.
    use debian/gen_udev_rules.sh to generate udev rule for those VID.

2. make
    build the adb and fastboot

3. make install
    install the adb and fastboot into /usr/bin/ configure the udev

4. copy 51-android.rules to /etc/udev/rules.d/

===
TO BUILD .DEB PACKAGE

1. Check dpkg tools (dpkg-dev, dh-make, debhelper, fakeroot, etc.)

2. run `dpkg-buildpackage -rfakeroot -b` to generate .deb package
    (To install the package, you could use `sudo dpkg -i ../adb_x.x.x-1.xxx.deb`)

===
OR DOWNLOAD the prebuilt package

https://github.com/downloads/karfield/adb/adb_0.1.0-1_amd64.deb

install the deb by graphic installer or command(`sudo dpkg -i xxx.deb`)

For Mac
===

Howto compile?
git clone this repo. run
 ./autogen.sh
 make install

to support homebrew use
 1. brew create https://github.com/downloads/karfield/adb/adb-mac-1.0.1.tgz

Give a name: Adb4Mac

 2. brew edit Adb4Mac

Modify like this:
    require 'formula'

    class Adb4Mac < Formula
        homepage 'https://git.hub/karfield/adb/'
        url 'https://github.com/downloads/karfield/adb/adb-1.0.1.tgz'
        md5 '308a5476fc096a8a525d07279a6f6aa3' ## dont mod this line, it's auto-gen
        
        def install
           system "./autogen.sh"
           system "./configure", "--prefix=#{prefix}"
           system 'make install'
        end
    end

 3. brew install Adb4Mac

if you don't compile this on your mac, just download the excutable bin files,
   copy them (adb and fastboot) into wherever you wannt.
   OR run install-adb-for-mac.sh(download https://github.com/downloads/karfield/adb/install-adb-for-mac.tar.gz)

Enjoy it!
