
PWD = $(shell pwd)
KERNEL_VERSION	= $(shell uname -r)
MDIR	= drivers/net/wireless/mediatek/mt76
KDIR	= /lib/modules/$(KERNEL_VERSION)/build
WIFI_DEST = /lib/modules/$(KERNEL_VERSION)/kernel/drivers/net/wireless/mediatek/mt76
BT_DEST = /lib/modules/$(KERNEL_VERSION)/kernel/drivers/bluetooth

default:
	make -C $(KDIR) M=$(PWD)/mt76 modules -j $(shell nproc)
	make -C $(KDIR) M=$(PWD)/bluetooth modules

install:
	su -c "cp -v $(PWD)/mt76/mt76.ko $(WIFI_DEST)/"
	su -c "cp -v $(PWD)/mt76/mt76-connac-lib.ko $(WIFI_DEST)/"
	su -c "cp -v $(PWD)/mt76/mt7921/mt7921-common.ko $(WIFI_DEST)/mt7921/"
	su -c "cp -v $(PWD)/mt76/mt7921/mt7921e.ko $(WIFI_DEST)/mt7921/"
	su -c "cp -v $(PWD)/bluetooth/btusb.ko $(BT_DEST)/"

clean:
	$(MAKE) -C $(KDIR) M=$(PWD)/mt76 clean
	$(MAKE) -C $(KDIR) M=$(PWD)/bluetooth clean

.PHONY: modules clean

-include $(KDIR)/Rules.make
