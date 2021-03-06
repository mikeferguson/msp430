#MSP430 Sandbox
This is a sandbox full of stuff/garbage for the TI MSP430 (mostly targeting
launchpad hardware right now).

Do not expect anything here to work as (not) advertised.

#Setup of development environment (Ubuntu 12.04):

## gcc and libc
* `sudo apt-get install gcc-msp430 msp430-libc mspdebug msp430mcu`

## gdb
 * sudo apt-get install gdb-msp430 (this will probably fail, complaining about overwriting gdb __init__.py, so:)
   * `cd /var/cache/apt/archives/`
   * `sudo dpkg -i --force-overwrite gdb-msp430-<lots of crap>.deb`

#Connecting to Launchpad

```
$> sudo mspdebug rf2500
MSPDebug version 0.18 - debugging tool for MSP430 MCUs
Copyright (C) 2009-2011 Daniel Beer <dlbeer@gmail.com>
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Trying to open interface 1 on 092
Initializing FET...
FET protocol version is 30394216
Configured for Spy-Bi-Wire
Set Vcc: 3000 mV
Device ID: 0x2553
Device: MSP430G2553
Code memory starts at 0xc000
Number of breakpoints: 2

Available commands:
    =         delbreak  gdb       load      opt       reset     simio     
    alias     dis       help      locka     prog      run       step      
    break     erase     hexout    md        read      set       sym       
    cgraph    exit      isearch   mw        regs      setbreak  

Available options:
    color           gdb_loop        iradix          
    fet_block_size  gdbc_xfer_size  quiet           

Type "help <topic>" for more information.
Press Ctrl+D to quit.

(mspdebug) prog main.elf
Erasing...
Programming...
Writing  122 bytes to c000 [section: .text]...
Writing   32 bytes to ffe0 [section: .vectors]...

(mspdebug) run
Running. Press Ctrl+C to interrupt...
```

