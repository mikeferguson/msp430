#################################################
# adapted from 
# http://sourceforge.net/apps/mediawiki/mspgcc/index.php?title=Example:Makefile

TARGET=main
MCU=msp430g2553

SOURCES = test_launchpad.c

#################################################
CFLAGS  = -mmcu=$(MCU) -g -Os -Wall
LDFLAGS = -mmcu=$(MCU) -Wl,-Map=$(TARGET).map
ODFLAGS = -S -t

#################################################
CC  = msp430-gcc
LD  = msp430-ld
AR  = msp430-ar
AS  = msp430-gcc
CP  = msp430-objcopy
OD  = msp430-objdump

#################################################
OBJECTS = $(SOURCES:.c=.o)

#################################################
all: $(TARGET).elf $(TARGET).hex

$(TARGET).elf: $(OBJECTS)
	echo "Linking $@"
	$(CC) $(OBJECTS) $(LDFLAGS) $(LIBS) -o $@
	$(OD) $(ODFLAGS) -d $(TARGET).elf > $(TARGET).lst

%.hex: %.elf
	$(CP) -O ihex $< $@

%.o: %.c
	echo "Compiling $<"
	$(CC) -c $(CFLAGS) -o $@ $<

%.lst: %.c
	$(CC) -c $(ASFLAGS) -Wa,-anlhd $< > $@

.SILENT:
.PHONY:	clean
clean:
	-$(RM) $(OBJECTS)
	-$(RM) $(TARGET).*
	-$(RM) $(SOURCES:.c=.lst)


