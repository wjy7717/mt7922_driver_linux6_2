
PWD = $(shell pwd)
CURRENT	= $(shell uname -r)
MDIR	= drivers/net/wireless/mediatek/mt76
KDIR	= /lib/modules/$(CURRENT)/build
SDIR    = $(PWD)/mt76
DEST = /lib/modules/$(CURRENT)/kernel/$(MDIR)

default:
	make -C $(KDIR) M=$(SDIR) modules

install:
	su -c "cp -v $(SDIR)/mt76.ko $(DEST)/"
	su -c "cp -v $(SDIR)/mt76-connac-lib.ko $(DEST)/"
	su -c "cp -v $(SDIR)/mt7921/mt7921-common.ko $(DEST)/"
	su -c "cp -v $(SDIR)/mt7921/mt7921e.ko $(DEST)/"

clean:
	$(MAKE) -C $(KDIR) M=$(SDIR) clean

.PHONY: modules clean

-include $(KDIR)/Rules.make
