#!/bin/sh

rmmod mt7921e mt7921-common mt76-connac-lib mt76 btusb

modprobe mac80211
insmod mt76/mt76.ko
insmod mt76/mt76-connac-lib.ko
insmod mt76/mt7921/mt7921-common.ko
insmod mt76/mt7921/mt7921e.ko
insmod bluetooth/btusb.ko
