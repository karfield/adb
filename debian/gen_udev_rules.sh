#!/bin/bash

mode=a+r

echo -n "Generating udev rules for Android USB Devices... "

usb_vendor_ids_c=src/usb_vendor_ids.c
rules_file=/etc/udev/rules.d/51-android.rules

while test $# -ne 0; do
    case $1 in

        -c|--vendor-ids-c)
            usb_vendor_ids_c=$2
            shift;;

        -o|--rules-file)
            rules_file=$2
            shift;;

        --)	shift
            break;;

        -*)	echo "$0: invalid option: $1" >&2
            exit 1;;

        *)  break;;
    esac
    shift
done

echo "# Android USB Devices" > $rules_file
vid_list=$(cat $usb_vendor_ids_c | grep "0x" | sed -n "s/0x\([^,]*\).*/\1/p")
for vid in $vid_list; do
    echo "SUBSYSTEM==\"usb\", SYSFS{idVendor}==\"$vid\", MODE=\"0666\"," \
        "GROUP=\"plugdev\"" >> $rules_file
done

chmod $mode $rules_file

echo "[OK]."
