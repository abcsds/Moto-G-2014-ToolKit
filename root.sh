#!/bin/bash

if [ `uname -s` == "Darwin" ]; then
	adb=bin/adb-linux
        fastboot=bin/fastboot-mac
elif [ `uname -s` == "Linux" ]; then
	adb=bin/adb-linux
        fastboot=bin/fastboot-linux
else
        echo "Unsupported OS"
fi

supersu=UPDATE-SuperSU-v2.40.zip
$fastboot boot img/twrp.img
sleep 20
$adb push supersu/$supersu /tmp/.
$adb shell twrp install /tmp/$supersu
$adb reboot-bootloader