
Start:
0100:    01           nop
0101:    01           nop
0102:    01           nop
0103:    73 03        jump (PC+0x03) L_0108
0105:    00
0106:    64
0107:    c5

L_0108:
    ; Entry point
0108:    3a           clr! AX
0109:    b1 00 6c     st AX, (0x006c)	 ; Initialize some vars
010c:    b1 00 fc     st AX, (0x00fc)
010f:    b1 00 ae     st AX, (0x00ae)
0112:    90 05 06     ld AX, #0x0506
0115:    b1 00 fe     st AX, (0x00fe)
0118:    83 ed        ld AL, (PC-0x13)	 ; 0xc5
011a:    a1 04 3d     st AL, (0x043d)	 ; Patch ld AL, #0xc5 instruction at addr 043c
011d:    a1 05 6e     st AL, (0x056e)	 ; Patch ld BL, #0xc5 instruction at addr 056d
0120:    90 00 f0     ld AX, #0x00f0	 ; Initialize stack
0123:    5f           mov SP, AX
0124:    80 f1        ld AL, #0xf1	 ; This sends RTZ command to our disks.
0126:    7b 19        call (PC+0x19) L_0141
0128:    80 f5        ld AL, #0xf5
012a:    7b 15        call (PC+0x15) L_0141
012c:    80 f9        ld AL, #0xf9
012e:    7b 11        call (PC+0x11) L_0141
0130:    80 fd        ld AL, #0xfd
0132:    7b 0d        call (PC+0x0d) L_0141
0134:    1a 02        bs1 L_0138
0136:    73 37        jump (PC+0x37) L_016f

L_0138:
    ; We go here if sense1 switch is set (DIAG board is present)
0138:    61 00 1a     ld RT, (0x001a)
013b:    50 54        add RT, RT	 ; Wrong disassembly here
013d:    ff           (0xff)
013e:    ec           (0xec)
013f:    73 44        jump (PC+0x44) L_0185

L_0141:
    ; Self-modifying code ahead!!!
    ; The function at L_014b probes for 8 units on a DSK board at base address (AL << 16) + 0x40
    ; and, if successful, sends an RTZ command.
    ; These four stores patch the base address in the code below
0141:    a3 09        st AL, (PC+0x9)	 ; 14c
0143:    a3 0d        st AL, (PC+0xd)	 ; 152
0145:    a3 16        st AL, (PC+0x16)	 ; 015d
0147:    a3 1a        st AL, (PC+0x1a)	 ; 0163
0149:    80 07        ld AL, #0x07	 ; Start probing from unit 7

L_014b:
    ; Probe drive units from 7 to 0 and send RTZ command to connected ones
014b:    a1 fd 40     st AL, (0xfd40)	 ; Unit select
014e:    d0 30 00     ld BX, #0x3000	 ; BL = 0 (RTZ), BH = value to check flags against
0151:    c1 fd 45     ld BL, (0xfd45)	 ; Read command register ??? Some flaga ???
0154:    42 23        and BL, BH	 ; command_reg & 0x30
0156:    41 23        sub BL, BH
0158:    15 11        bnz L_016b	 ; Should be 0x30. If not, skip this unit (not present)
015a:    c0 03        ld BL, #0x03
015c:    e1 fd 48     st BL, (0xfd48)	 ; RTZ (recalibrate)
015f:    d0 30 00     ld BX, #0x3000

L_0162:
0162:    c1 fd 45     ld BL, (0xfd45)	 ; Wait for command_reg & 0x30 == 0x30; this indicates drive ready
0165:    42 23        and BL, BH
0167:    41 23        sub BL, BH
0169:    15 f7        bnz L_0162

L_016b:
016b:    29           dec! AL	 ; Next unit, down to 0
016c:    17 dd        bp L_014b
016e:    09           ret

L_016f:
    ; Continuation of boot process
016f:    90 10 00     ld AX, #0x1000
0172:    5b           or! BX, AX
0173:    5c           mov DX, AX	 ; DX = 4096

L_0174:
    ; This locates end of RAM, effectively probing how much RAM we've got
0174:    8a           ld AL, (RT)	 ; Preserve original (RT) value
0175:    c0 ff        ld BL, #0xff	 ; Try to store 0xff
0177:    ea           st BL, (RT)
0178:    ca           ld BL, (RT)	 ; Load it back
0179:    14 0a        bz L_0185	 ; Exit if we got zero (failed to store)
017b:    aa           st AL, (RT)	 ; Put original value back
017c:    50 64        add RT, DX	 ; RT += 4096 (page size ?)
017e:    90 f0 00     ld AX, #0xf000	 ; Reached 0xf000 ?
0181:    51 40        sub AX, RT
0183:    15 ef        bnz L_0174	 ; Repeat until we reach 0xf000

L_0185:
0185:    69 03 3d     st RT, (0x033d)	 ; Store final address of our RAM
0188:    55 42        mov BX, RT
018a:    50 32        add BX, BX
018c:    fd           st BX, (SP)
018d:    55 f1        mov AX, HX	 ; The code starting from here is definitely disassembled incorrectly
018f:    04           ei
0190:    a0 50        st AL, #0x50
0192:    32 fe        clr HX, 14
0194:    70           unknown
0195:    f1 04 a2     st BX, (0x04a2)
0198:    50 32        add BX, BX
019a:    fe           st BX, (GX)
019b:    70           unknown
019c:    55 2a        mov SP, BX
019e:    d0 fe e5     ld BX, #0xfee5
01a1:    50 42        add BX, RT	 ; BX = top of RAM - 283
01a3:    f1 02 b6     st BX, (0x02b6)	 ; This will be address of our trampoline code
01a6:    80 bd        ld AL, #0xbd
01a8:    a1 06 18     st AL, (0x0618)
01ab:    90 01 bb     ld AX, #0x01bb
01ae:    b1 06 00     st AX, (0x0600)
01b1:    80 b1        ld AL, #0xb1
01b3:    1d 01        bs4 L_01b6
01b5:    29           dec! AL

L_01b6:
01b6:    a1 03 77     st AL, (0x0377)
01b9:    73 42        jump (PC+0x42) L_01fd

BackToPrompt:
    ; The code jumps here when for instance empty string was entered on CODE prompt
    ; According to known behavior, thus jumps back to WIPL prompt, effectively
    ; restarting it
01bb:    04           ei
01bc:    47 4c        unk7 GH, RH
01be:    00           HALT
01bf:    ff           st BX, (HX)
01c0:    02           sf
01c1:    65 47        ld RT, unknown_indexed
01c3:    9c           ld AX, (EX)
01c4:    09           ret

Entry_0x1c5:
01c5:    a0 03        st AL, #0x03
01c7:    65 79 05     ld RT, +0x5(DX)+
01ca:    5a           and! BX, AX
01cb:    79 05 36     call #0x0536 PrintString
01ce:    03 42        (0x342)	 ; WIPL version string
01d0:    80 8a        ld AL, #0x8a
01d2:    a1 03 44     st AL, (0x0344)
01d5:    7c f5        call @(PC-0x0b) @0x1cc
01d7:    03 4e        (0x34e)	 ; "NAME"
01d9:    79 06 09     call #0x0609 ReadLine
01dc:    03 63        (0x363)	 ; name_buffer
01de:    79 05 36     call #0x0536 PrintString
01e1:    03 54        (0x354)	 ; "DISK"
01e3:    79 06 09     call #0x0609 ReadLine
01e6:    03 74        (0x374)	 ; disk_buffer
01e8:    79 05 36     call #0x0536 PrintString
01eb:    03 5a        (0x35a)	 ; "CODE"
01ed:    80 01        ld AL, #0x01
01ef:    a1 05 ea     st AL, (0x05ea)
01f2:    79 06 09     call #0x0609 ReadLine
01f5:    03 78        (0x378)	 ; code_buffer
01f7:    79 05 36     call #0x0536 PrintString
01fa:    03 60        (0x360)
01fc:    05           di

L_01fd:
01fd:    79 06 78     call #0x0678 L_0678
0200:    03 63        (0x363)	 ; name_buffer
0202:    90 03 74     ld AX, #0x0374	 ; disk_buffer
0205:    5e           mov EX, AX
0206:    d5 81        ld BX, (EX)+	 ; String length
0208:    31 20        dec BX, 1
020a:    14 10        bz L_021c	 ; Just one char means board offset 0
020c:    80 a0        ld AL, #0xa0	 ; ' ' (space)
020e:    c5 88 01     ld BL, +0x1(EX)	 ; Check character[1]
0211:    49           sub! BL, AL
0212:    14 08        bz L_021c
0214:    c5 81        ld BL, (EX)+	 ; BL = *char++
0216:    49           sub! BL, AL
0217:    14 03        bz L_021c
0219:    80 f0        ld AL, #0xf0
021b:    49           sub! BL, AL	 ; magic_value = 'p' - char

L_021c:
021c:    45 31        mov AL, BL	 ; magic_value
021e:    25 11        sll AL, 2
0220:    d0 f1 40     ld BX, #0xf140
0223:    43 12        or BH, AL	 ; DSK0_BASE | (magic_value << 2)
0225:    f1 04 b1     st BX, (0x04b1)	 ; Set DSK board address
0228:    25 11        sll AL, 2
022a:    c0 04        ld BL, #0x04
022c:    48           add! BL, AL	 ; dma_mode_byte = magic_value << 4
022d:    e1 04 ac     st BL, (0x04ac)	 ; Patch dma_set_mode insn
0230:    8c           ld AL, (EX)
0231:    c0 b0        ld BL, #0xb0	 ; '0'
0233:    49           sub! BL, AL
0234:    16 06        blt BackToPrompt_tramp
0236:    80 07        ld AL, #0x07
0238:    41 31        sub AL, BL	 ; Valid units 0 - 7
023a:    19 03        ble L_023f

BackToPrompt_tramp:
023c:    71 01 bb     jump #0x01bb BackToPrompt

L_023f:
023f:    e2 04 b1     st BL, @(0x04b1)	 ; This writes Hawk unit select register
0242:    90 03 78     ld AX, #0x0378	 ; code_buffer
0245:    5e           mov EX, AX
0246:    95 81        ld AX, (EX)+	 ; Check string length
0248:    14 06        bz L_0250
024a:    79 03 c9     call #0x03c9 StrToNum
    ; EX points at the first non-numeric character after the code
024d:    b1 01 05     st AX, (0x0105)	 ; Store entered_disk_code

L_0250:
0250:    60 00 0e     ld RT, #0x000e	 ; Track 0 side 0 sector 15
0253:    79 04 b0     call #0x04b0 LoadSector
0256:    00           (0x0)
    ; EX is an address of the loaded sector
0257:    85 88 08     ld AL, +0x8(EX)	 ; Disk format flag
025a:    28           inc! AL	 ; Must be equal to 0xff
025b:    14 09        bz L_0266	 ; Proceed to disk code checking
025d:    04           ei
025e:    79 05 36     call #0x0536 PrintString
0261:    03 7f        (0x37f)	 ; Incorrect disk format
0263:    73 d7        jump (PC-0x29) BackToPrompt_tramp
0265:    ff	 ; This is a "check disk code" flag. If zero, the check will be bypassed.
           	 ; In pristine bootloader, read from the disk image, there's a 00 at this location.
           	 ; So, it is patched at runtime. This means there should be a way to bypass the check,
           	 ; but i don't know how and didn't search for it since we now have code recovery tool.
           	 ; Some more info from KenR, which may explain things we see:
           	 ; 
           	 ; The [ Code = ] when booting from the disk was just a simple password to be allowed to read from the disk.
           	 ; It was just a one time security check at boot time.  The [ Code = ] was an added feature to the Centurion
           	 ; system sometime in around 1981.  Why I recall this is because I got hung up with a bug in the first release
           	 ; of the new "Code" feature. Bug was the code value was set to a value the customer picked during disk format
           	 ; and worked fine until the system was rebooted then the code value set no longer worked...!   Yes... what fun
           	 ; this bug was.  The OPSYS system programmer was able to figure out a work around so the customer could get back
           	 ; into the system till the bug was fixed.

L_0266:
0266:    95 88 06     ld AX, +0x6(EX)	 ; Disk code is derived from this value
0269:    3b           not! AX
026a:    c0 80        ld BL, #0x80	 ; This whole thing rotates AX right WITHOUT carry
026c:    07           rl
026d:    36 00        rrc AX, 1
026f:    11 02        bnc L_0273
0271:    43 30        or AH, BL

L_0273:
0273:    d0 3c b1     ld BX, #0x3cb1	 ; Some more obfuscation
0276:    44 32        xor BH, BL
0278:    54 02        xor BX, AX	 ; BX is the final expected value here
027a:    81 02 65     ld AL, (0x0265)	 ; This is "request check" flag. We don't know how/where it's set.
027d:    15 05        bnz L_0284	 ; If not zero, the check is required
027f:    f1 01 05     st BX, (0x0105)	 ; entered_disk_code = expected_entered_disk_code
0282:    73 0f        jump (PC+0x0f) L_0293	 ; Bypass

L_0284:
    ; Check the disk code
0284:    91 01 05     ld AX, (0x0105)	 ; AX - entered_disk_code
0287:    59           sub! BX, AX	 ; BX = expected_disk_code
0288:    14 09        bz L_0293	 ; Proceed if there's a match
028a:    04           ei
028b:    79 05 36     call #0x0536 PrintString
028e:    03 9f        (0x39f)	 ; Incorrect disk code
0290:    71 04 9d     jump #0x049d Stop

L_0293:
    ; Disk code is correct
0293:    95 88 04     ld AX, +0x4(EX)	 ; sector_base + 4
0296:    44 10        xor AH, AL
0298:    d0 3c b1     ld BX, #0x3cb1	 ; The same magic constant as used for making the code
029b:    54 02        xor BX, AX
029d:    91 01 05     ld AX, (0x0105)	 ; entered_disk_code, which we now know is correct
02a0:    50 20        add AX, BX	 ; More mathemagic
02a2:    35 03        sll AX, 4
02a4:    5b           or! BX, AX
    ; There's definitely some code discontinuity here. The exact reason is unknown,
    ; but this allows to suppose that during installation the IPL is composed of
    ; several parts. Disk driver will be different for different controller.
    ; Accorting to KenR:
    ; 
    ; the WIPL command had to also write a small disk I/O driver into track zero so
    ; once the track is loaded into the system memory the program like HDIPL 6.2  now
    ; knows how to read the files from a Hawk disk platter.  The WIPL data written on
    ; to a CMD disk would have a CMD I/O driver and the data written on to a Finch disk
    ; would have a Finch I/O driver as part of the IPL track.
    ; 
    ; So, well, this ends up reloading sector 14 because RT has not been touched, since
    ; the previous call, and the routine itself takes care to preserve it.
02a5:    79 04 b0     call #0x04b0 LoadSector
02a8:    00           (0x0)
02a9:    95 88 0e     ld AX, +0xe(EX)	 ; EX is still sector address
02ac:    b1 04 8a     st AX, (0x048a)
    ; And here we start searching for a bootable file (let's say so).
    ; The boot directory (let's say so) is composed of 16-byte entries.
    ; Each entry contains exactly 10 characters of a file name and 6 bytes of some
    ; data (would be logical to assume file start and length, at least).
    ; On the very first entry we start our search at (sector_base + 16), this
    ; makes sense because the first 16 bytes of sector 14 (where we start from)
    ; are occupied by special boot information (format flag, key, etc), which
    ; we've checked above.
    ; The search goes on to next sector(s), until we hit an entry, starting with
    ; 0x84 0x8d bytes. In the disk image we have we see these bytes prefixing
    ; what we think is a data file name.
    ; It's also a bit strange to see search starting from sector 14, because we know
    ; that sector 14 contains bad block table, and in the image we have it indeed
    ; looks like a bad block table. Nevertheless, the table isn't going to contain any
    ; valid sensible 10 ASCII characters, so we'll just skip over it.
    ; Perhaps there are variations of media format, which don't suggest the use ot a
    ; bad block table, we don't know.
02af:    30 8f        inc EX, 16	 ; name_on_disk = sector_base + 16
                                	 ; Before proceeding, we copy part of ourselves to the top of RAM.
                                	 ; I guess we're preparing to load the boot file into low memory, which would
                                	 ; overwrite us.
                                	 ; Calls to the relocated fragment are done via CallHighMem routine
02b1:    79 05 07     call #0x0507 memcpy
02b4:    01 1b        (0x11b)	 ; length = 283 bytes
02b6:    7e e5        (0x7ee5)	 ; destination, set to top_of_ram - 283
02b8:    03 ec        (0x3ec)	 ; source

L_02ba:
    ; Here we are trying to find our "name" on the disk
    ; Names are stored starting at sector 15 in a series of entries, 16 bytes each.
    ; Each name is exactly 10 characters long, padded up with spaces. Remaining 6
    ; bytes probably specify file location on the disk.
    ; Entries proceed to following sectors until the table terminated with a word of 0x848d.
    ; This is probably disk's root directory.
02ba:    9c           ld AX, (EX)	 ; Check if we hit the terminator
02bb:    d0 84 8d     ld BX, #0x848d
02be:    59           sub! BX, AX
02bf:    15 03        bnz L_02c4	 ; Go back to the prompt if so
02c1:    71 02 3c     jump #0x023c BackToPrompt_tramp

L_02c4:
02c4:    90 03 65     ld AX, #0x0365
02c7:    5c           mov DX, AX	 ; DX = name_buffer + 2 - start of entered NAME string, skip over length
02c8:    90 0a 00     ld AX, #0x0a00	 ; AH = 10 - maximum length

L_02cb:
02cb:    85 61        ld AL, (DX)+	 ; c1 = *entered_name++
02cd:    21 00        dec AH, 1	 ; length--
02cf:    16 23        blt L_02f4	 ; Proceed if the name matches
02d1:    c5 81        ld BL, (EX)+	 ; c2 = *name_on_disk
02d3:    49           sub! BL, AL
02d4:    14 f5        bz L_02cb	 ; If matches, go chech the next char
02d6:    45 01        mov AL, AH	 ; Mismatch
02d8:    22 00        clr AH, 0
02da:    50 08        add EX, AX	 ; name_on_disk += length (remaining) - this skips past the string
02dc:    50 98        add EX, EX	 ; EX = EX + 6 - this skips over to the next entry
02de:    00           HALT
02df:    06           sl
02e0:    d1 04 a0     ld BX, (0x04a0)	 ; BX = LoadBuffer0 - sector address
02e3:    50 32        add BX, BX	 ; This makes sense as add BX, BX, 400 - point at the end of sector
02e5:    01           nop
02e6:    90           (0x90)
02e7:    51 82        sub BX, EX
02e9:    15 cf        bnz L_02ba	 ; Check the next entry if not reached the end
02eb:    3e           inc RT	 ; Go to the next sector
02ec:    90 ff a9     ld AX, #0xffa9
02ef:    7b 4b        call (PC+0x4b) CallHighMem	 ; Call (end_of_ram - 87) = LoadSector
02f1:    00           HALT
02f2:    73 c6        jump (PC-0x3a) L_02ba	 ; Restart the search from the beginning.
                                           	 ; EX will point at the beginning of the sector this time!!!

L_02f4:
    ; NAME found. EX points right after the string in the loaded sector.
    ; Since length of the name is exactly 10 bytes, we have three words,
    ; specifying something. The code below reads them.
02f4:    3a           clr! AX
02f5:    85 81        ld AL, (EX)+
02f7:    5d           mov BX, AX
02f8:    3d           sll! AX
02f9:    58           add! BX, AX
02fa:    91 04 a2     ld AX, (0x04a2)
02fd:    58           add! BX, AX
02fe:    f5 a2        st BX, -(SP)
0300:    95 81        ld AX, (EX)+
0302:    61 04 8a     ld RT, (0x048a)
0305:    50 04        add RT, AX
0307:    85 81        ld AL, (EX)+
0309:    b5 a2        st AX, -(SP)
030b:    90 ff a9     ld AX, #0xffa9
030e:    7b 2c        call (PC+0x2c) CallHighMem	 ; Call (end_of_ram - 87) = LoadSector
0310:    01           nop
0311:    d5 a8 02     ld BX, +0x2(SP)
0314:    3a           clr! AX
0315:    85 28 04     ld AL, +0x4(BX)
0318:    5b           or! BX, AX
0319:    3a           clr! AX
031a:    38           inc! AX

L_031b:
031b:    3f           dec RT
031c:    16 03        blt L_0321
031e:    3d           sll! AX
031f:    73 fa        jump (PC-0x06) L_031b

L_0321:
0321:    dd           ld BX, (SP)
0322:    bd           st AX, (SP)
0323:    80 0f        ld AL, #0x0f
0325:    4a           and! BL, AL
0326:    80 04        ld AL, #0x04
0328:    49           sub! BL, AL	 ; Here we check something else.
0329:    15 0e        bnz L_0339	 ; If the check fails, we will jump back to the IPL prompt
032b:    90 ff ff     ld AX, #0xffff
032e:    d3 0d        ld BX, (PC+0xd)
0330:    58           add! BX, AX
0331:    f1 00 fe     st BX, (0x00fe)
0334:    90 fe e5     ld AX, #0xfee5
0337:    7b 03        call (PC+0x03) CallHighMem	 ; Call (end_of_ram - 283) - boot the file ???

L_0339:
0339:    71 01 bb     jump #0x01bb BackToPrompt

CallHighMem:
033c:    d0 80 00     ld BX, #0x8000	 ; BX = end of RAM, patched in the beginning
033f:    58           add! BX, AX
0340:    75 20        jump (A + 0x20)
0342:    10, "\nHDIPL 6.2"
034e:    4, "NAME"
0354:    4, "DISK"
035a:    4, "CODE"
0360:    00           HALT
0361:    01           nop
0362:    8c           ld AL, (EX)
0363:    00           HALT	 ; name_buffer
0364:    05           di
0365:    a0 a0        st AL, #0xa0
0367:    a0 a0        st AL, #0xa0
0369:    a0 a0        st AL, #0xa0
036b:    a0 a0        st AL, #0xa0
036d:    a0 a0        st AL, #0xa0
036f:    a0 a0        st AL, #0xa0
0371:    a0 a0        st AL, #0xa0
0373:    a0           (0xa0)
0374:    00           HALT	 ; disk_buffer
0375:    01           nop
0376:    b0 b0        (0xb0b0)
0378:    00           HALT	 ; code_buffer
0379:    00           HALT
037a:    a0 a0        st AL, #0xa0
037c:    a0 a0        st AL, #0xa0
037e:    a0
037f:    30, "AB 47 - INCORRECT DISK FORMAT\r"
039f:    28, "AB 48 - INCORRECT DISK CODE\r"

AsciiToHex:
    ; This function converts one hexadecimal digit from its ASCII representation
    ; to value. Result is returned in BL.
03bd:    c0 b9        ld BL, #0xb9
03bf:    49           sub! BL, AL
03c0:    19 03        ble L_03c5
03c2:    c0 ff        ld BL, #0xff	 ; -1 is returned on error
03c4:    09           ret

L_03c5:
03c5:    c0 b0        ld BL, #0xb0
03c7:    49           sub! BL, AL
03c8:    09           ret

StrToNum:
    ; Parses a numeric string, pointed to by EX, and returns the
    ; parsed value in AX. EX is updated to point at the first non-digit character
03c9:    8c           ld AL, (EX)	 ; Check the first character
03ca:    7b f1        call (PC-0x0f) AsciiToHex
03cc:    17 03        bp L_03d1
03ce:    71 01 bb     jump #0x01bb BackToPrompt	 ; The character is invalid

L_03d1:
    ; A correcr digit has been entered
03d1:    3a           clr! AX
03d2:    b5 a2        st AX, -(SP)	 ; value = 0

L_03d4:
03d4:    85 81        ld AL, (EX)+	 ; Do the conversion again, increment pointer this time
03d6:    7b e5        call (PC-0x1b) AsciiToHex
03d8:    17 05        bp L_03df
03da:    31 80        dec EX, 1	 ; Invalid character, restore the pointer
                               	 ; It now points behind our number
03dc:    95 a1        ld AX, (SP)+	 ; return value
03de:    09           ret

L_03df:
03df:    9d           ld AX, (SP)	 ; AX = value
03e0:    ed           st BL, (SP)	 ; (SP) = digit
03e1:    3d           sll! AX
03e2:    5d           mov BX, AX	 ; BX = value << 1
03e3:    35 01        sll AX, 2	 ; should be sll AX, 2
03e5:    58           add! BX, AX	 ; BX = (value << 1) + (value << 3) = value * 10
03e6:    3a           clr! AX	 ; AX = digit
03e7:    8d           ld AL, (SP)
03e8:    58           add! BX, AX	 ; BX += digit
03e9:    fd           st BX, (SP)	 ; value = value * 10 + digit
03ea:    73 e8        jump (PC-0x18) L_03d4

RelocatablePart:
    ; This code is copied to high RAM (top - 283) and operates from there
    ; Note that it includes Hawk disk driver. The code is apparently fully relocatable
03ec:    95 a1        ld AX, (SP)+
03ee:    95 a1        ld AX, (SP)+
03f0:    b3 36        st AX, (PC+0x36)
03f2:    95 a1        ld AX, (SP)+
03f4:    30 05        inc AX, 6
03f6:    b3 5c        st AX, (PC+0x5c)
03f8:    3a           clr! AX
03f9:    39           dec! AX
03fa:    b3 5e        st AX, (PC+0x5e)
03fc:    7b 53        call (PC+0x53) L_0451
03fe:    d0 00 4c     ld BX, #0x004c
0401:    59           sub! BX, AX
0402:    15 26        bnz L_042a
0404:    95 88 1b     ld AX, +0x1b(EX)
0407:    b3 40        st AX, (PC+0x40)
0409:    50 48        add EX, RT
040b:    30 80        inc EX, 1
040d:    7b 31        call (PC+0x31) L_0440
040f:    30 80        inc EX, 1

L_0411:
0411:    7b 2d        call (PC+0x2d) L_0440
0413:    45 33        mov BL, BL
0415:    14 13        bz L_042a

L_0417:
0417:    d5 81        ld BX, (EX)+
0419:    93 2e        ld AX, (PC+0x2e)
041b:    58           add! BX, AX
041c:    99           ld AX, (BX)
041d:    50 60        add AX, DX
041f:    b9           st AX, (BX)
0420:    31 41        dec RT, 2
0422:    18 f3        bgt L_0417

L_0424:
0424:    85 81        ld AL, (EX)+
0426:    73 e9        jump (PC-0x17) L_0411
0428:    00
0429:    00

L_042a:
042a:    55 44        mov RT, RT
042c:    14 0c        bz L_043a
042e:    55 40        mov AX, RT
0430:    39           dec! AX
0431:    67 4a        ld RT, unknown
0433:    86 50        ld AL, unknown
0435:    46 50        unk6 AH, RL
0437:    48           add! BL, AL
0438:    73 ea        jump (PC-0x16) L_0424

L_043a:
043a:    32 80        clr EX, 0
043c:    80 c5        ld AL, #0xc5
043e:    75 60        jump (A + 0x60)

L_0440:
0440:    c5 81        ld BL, (EX)+
0442:    16 0d        blt L_0451
0444:    3a           clr! AX
0445:    85 81        ld AL, (EX)+
0447:    bd           st AX, (SP)
0448:    90 00 00     ld AX, #0x0000
044b:    5c           mov DX, AX
044c:    95 81        ld AX, (EX)+
044e:    50 06        add DX, AX
0450:    09           ret

L_0451:
0451:    6d a2        st RT, -(SP)
0453:    90 00 00     ld AX, #0x0000
0456:    65 08 01     ld RT, +0x1(AX)
0459:    90 00 00     ld AX, #0x0000
045c:    38           inc! AX
045d:    b3 fb        st AX, (PC-0x5)
045f:    50 04        add RT, AX
0461:    d3 c5        ld BX, (PC-0x3b)
0463:    59           sub! BX, AX
0464:    11 30        bnc L_0496
0466:    3a           clr! AX
0467:    b3 f1        st AX, (PC-0xf)
0469:    93 e9        ld AX, (PC-0x17)
046b:    30 02        inc AX, 3
046d:    b3 e5        st AX, (PC-0x1b)
046f:    65 08 01     ld RT, +0x1(AX)
0472:    5d           mov BX, AX
0473:    98           ld AX, (AX)
0474:    17 20        bp L_0496
0476:    3a           clr! AX
0477:    85 28 02     ld AL, +0x2(BX)
047a:    28           inc! AL
047b:    14 20        bz Stop
047d:    29           dec! AL
047e:    5d           mov BX, AX
047f:    3d           sll! AX
0480:    58           add! BX, AX
0481:    93 1f        ld AX, (PC+0x1f)
0483:    58           add! BX, AX
0484:    94 ce        ld AX, @(PC-0x32)
0486:    f3 cc        st BX, (PC-0x34)
0488:    3b           not! AX
0489:    60 57 79     ld RT, #0x5779
048c:    50 04        add RT, AX
048e:    7b 20        call (PC+0x20) LoadSector
0490:    01           nop
0491:    63 c1        ld RT, (PC-0x3f)
0493:    65 48 01     ld RT, +0x1(RT)

L_0496:
0496:    7b 18        call (PC+0x18) LoadSector
0498:    00           HALT
0499:    65 a1        ld RT, (SP)+
049b:    73 a3        jump (PC-0x5d) L_0440

Stop:
049d:    00           HALT
049e:    73 fd        jump (PC-0x03) Stop

LoadBuffer0:
04a0:    7d 55        (0x7d55)

LoadBuffer1:
04a2:    7b c5        (0x7bc5)

SetDmaForSectorLoad:
04a4:    2f 00        dma_load_addr WX
04a6:    90 fe 6f     ld AX, #0xfe6f	 ; 400 bytes == 1 sector
04a9:    2f 02        dma_load_count WX
04ab:    2f 04        dma_set_mode 0
04ad:    2f 06        dma_enable
04af:    09           ret

LoadSector:
    ; This function loads one sector from the drive.
    ; CHS address of the sector to read needs to be placed into X (RT) register
    ; in HAWK native format (CCCCCCCC CCCHSSSS) before calling this function.
    ; This routine uses two buffers, whose addresses are stored in two
    ; variables above. The buffer to use is chosen by the literal byte
    ; argument: 0 or 1. Address of the buffer is returned in EX.
04b0:    90 f1 40     ld AX, #0xf140
04b3:    5e           mov EX, AX	 ; EX = DSK_BASE
04b4:    93 ea        ld AX, (PC-0x16)	 ; AX = LoadBuffer0
04b6:    c5 41        ld BL, (RT)+
04b8:    14 02        bz L_04bc	 ; If literal argument is not 0...
04ba:    93 e6        ld AX, (PC-0x1a)	 ; .. then AX = LoadBuffer1

L_04bc:
04bc:    b3 10        st AX, (PC+0x10)	 ; Preserve loading address (patch instruction at 04cd)
04be:    7b e4        call (PC-0x1c) SetDmaForSectorLoad	 ; Setup DMA to read
04c0:    7b 1f        call (PC+0x1f) SeekToTrack
04c2:    80 00        ld AL, #0x00
04c4:    a5 88 08     st AL, +0x8(EX)	 ; READ command
04c7:    7b 2c        call (PC+0x2c) WaitForDataReady
    ; Upon completion status register value will be in AX
04c9:    24 00        srl AH, 1	 ; Check HAWK_STATUS & 0x0100
04cb:    15 05        bnz L_04d2	 ; If bit set, recalibrate, seek and retry (read error)
04cd:    90 7d 55     ld AX, #0x7d55	 ; AX = loading address (this insn is patched)
04d0:    5e           mov EX, AX
04d1:    09           ret

L_04d2:
04d2:    80 03        ld AL, #0x03
04d4:    a5 88 08     st AL, +0x8(EX)	 ; RTZ command
04d7:    7b 22        call (PC+0x22) WaitForHawkCmdCompletion
04d9:    8c           ld AL, (EX)
04da:    a5 88 0b     st AL, +0xb(EX)
04dd:    93 ef        ld AX, (PC-0x11)	 ; AX = loading address (from the patched insn)
04df:    73 db        jump (PC-0x25) L_04bc	 ; Retry

SeekToTrack:
04e1:    7b 18        call (PC+0x18) WaitForHawkCmdCompletion
04e3:    95 a8 02     ld AX, +0x2(SP)
04e6:    d0 3f ff     ld BX, #0x3fff
04e9:    5a           and! BX, AX
04ea:    f5 88 01     st BX, +0x1(EX)	 ; Write sector address register
04ed:    80 02        ld AL, #0x02	 ; SEEK command
04ef:    a5 88 08     st AL, +0x8(EX)
04f2:    7b 07        call (PC+0x07) WaitForHawkCmdCompletion
04f4:    09           ret

WaitForDataReady:
    ; This location is only called when READ operation is initiated.
    ; I suggest it waits for data transfer to end.
04f5:    85 88 04     ld AL, +0x4(EX)	 ; HAWK status
04f8:    2c           srl! AL	 ; Wait for STATUS & 0x01 == 0
04f9:    10 fa        bc WaitForDataReady

WaitForHawkCmdCompletion:
    ; And this waits for a generic operation completion
04fb:    95 88 04     ld AX, +0x4(EX)	 ; HAWK status
04fe:    c0 30        ld BL, #0x30	 ; Wait for STATUS & 0x30 == 0x30
0500:    42 31        and AL, BL
0502:    49           sub! BL, AL
0503:    15 f6        bnz WaitForHawkCmdCompletion
0505:    09           ret
0506:    00

memcpy:
    ; This is the end of a fragment, which gets copied to top of RAM.
    ; This function preserves DX and EX
0507:    95 41        ld AX, (RT)+	 ; length = arg[0, 1]
                                  	 ; I completely fail to understand these two instructions. I mean - i understand what they mean,
                                  	 ; but what's the real purpose of this fragment here ? In pristine on-disk WIPL it looks the same.
                                  	 ; Is this patched during installation ?
0509:    5d           mov BX, AX
050a:    71 05 0d     jump #0x050d 0x50d
050d:    f5 a2        st BX, -(SP)	 ; push length
050f:    59           sub! BX, AX	 ; length = min(AX, BX)
0510:    19 21        ble L_0533
0512:    da           ld BX, (RT)	 ; arg[2, 3]
0513:    79 06 9a     call #0x069a L_069a
0516:    a0

L_0517:
0517:    dd           ld BX, (SP)	 ; BX = length
0518:    55 60        mov AX, DX	 ; Preserve DX
051a:    bd           st AX, (SP)
051b:    95 41        ld AX, (RT)+	 ; dest
051d:    5c           mov DX, AX
051e:    95 41        ld AX, (RT)+	 ; src
0520:    6d a2        st RT, -(SP)	 ; push RT, will use as back counter
0522:    55 24        mov RT, BX	 ; RT = length

L_0524:
    ; Copy RT bytes from (AX) to (DX)
0524:    3f           dec RT
0525:    17 06        bp L_052d
0527:    65 a1        ld RT, (SP)+	 ; pop RT
0529:    95 a1        ld AX, (SP)+	 ; pop DX
052b:    5c           mov DX, AX
052c:    09           ret

L_052d:
052d:    c5 01        ld BL, (AX)+
052f:    e5 61        st BL, (DX)+
0531:    73 f1        jump (PC-0x0f) L_0524

L_0533:
0533:    bd           st AX, (SP)
0534:    73 e1        jump (PC-0x1f) L_0517

PrintString:
0536:    7b 22        call (PC+0x22) L_055a
0538:    7e 45        long_call
053a:    9a           ld AX, (RT)
053b:    5c           mov DX, AX
053c:    55 98        mov EX, EX
053e:    f2 00 65     st BX, @(0x0065)
0541:    61 19 11     ld RT, (0x1911)

L_0544:
0544:    85 61        ld AL, (DX)+
0546:    c0 e0        ld BL, #0xe0
0548:    49           sub! BL, AL
0549:    16 05        blt L_0550
054b:    c0 20        ld BL, #0x20
054d:    49           sub! BL, AL
054e:    45 31        mov AL, BL

L_0550:
0550:    7b 12        call (PC+0x12) L_0564
0552:    3f           dec RT
0553:    18 ef        bgt L_0544
0555:    7f 45        clear_data_bank??
0557:    30 41        inc RT, 2
0559:    09           ret

L_055a:
055a:    80 8d        ld AL, #0x8d
055c:    c3 42        ld BL, (PC+0x42)
055e:    49           sub! BL, AL
055f:    14 02        bz L_0563
0561:    7b 01        call (PC+0x01) L_0564

L_0563:
0563:    09           ret

L_0564:
0564:    7e 81        long_call
0566:    55 98        mov EX, EX
0568:    f2 00 f6     st BX, @(0x00f6)
056b:    19 0d        ble L_057a
056d:    c0 c5        ld BL, #0xc5
056f:    f6 39        st BX, unknown
0571:    00           HALT
0572:    c0 8c        ld BL, #0x8c
0574:    49           sub! BL, AL
0575:    14 13        bz L_058a
0577:    c0 8d        ld BL, #0x8d
0579:    49           sub! BL, AL

L_057a:
057a:    15 14        bnz L_0590
057c:    7b 17        call (PC+0x17) L_0595
057e:    80 8a        ld AL, #0x8a
0580:    7b 13        call (PC+0x13) L_0595
0582:    80 8d        ld AL, #0x8d
0584:    a3 1a        st AL, (PC+0x1a)
0586:    0e           delay 4.5ms
0587:    7f 81        clear_data_bank??
0589:    09           ret

L_058a:
058a:    7b 09        call (PC+0x09) L_0595
058c:    0e           delay 4.5ms
058d:    7f 81        clear_data_bank??
058f:    09           ret

L_0590:
0590:    7b 03        call (PC+0x03) L_0595
0592:    7f 81        clear_data_bank??
0594:    09           ret

L_0595:
0595:    f6 38        st BX, unknown
0597:    00           HALT
0598:    24 31        srl BL, 2
059a:    11 f9        bnc L_0595
059c:    f6 19        st BX, unknown
059e:    01           nop
059f:    a0 bd        st AL, #0xbd
05a1:    09           ret
05a2:    f6
05a3:    38
05a4:    0f
05a5:    0a
05a6:    55
05a7:    98
05a8:    f2
05a9:    00
05aa:    f6
05ab:    18
05ac:    00
05ad:    2c
05ae:    10
05af:    0f
05b0:    f6
05b1:    18
05b2:    01
05b3:    f6
05b4:    18
05b5:    03
05b6:    f6
05b7:    18
05b8:    05
05b9:    f6
05ba:    18
05bb:    07
05bc:    2a
05bd:    73
05be:    e3
05bf:    f6
05c0:    18
05c1:    01
05c2:    73
05c3:    de

L_05c4:
05c4:    7e 81        long_call
05c6:    55 98        mov EX, EX
05c8:    f2 00 83     st BX, @(0x0083)
05cb:    a2 f6 19     st AL, @(0xf619)
05ce:    00           HALT
05cf:    90 05 a6     ld AX, #0x05a6
05d2:    d7 6e        ld BX, unknown
05d4:    3a           clr! AX
05d5:    d7 60        ld BX, unknown
05d7:    80 06        ld AL, #0x06
05d9:    f6 19        st BX, unknown
05db:    0a           reti
05dc:    f6 19        st BX, unknown
05de:    0e           delay 4.5ms

L_05df:
05df:    e6 60        st BL, unknown
05e1:    45 10        mov AH, AL
05e3:    14 fa        bz L_05df
05e5:    c0 80        ld BL, #0x80
05e7:    43 31        or AL, BL
05e9:    c0 00        ld BL, #0x00
05eb:    15 03        bnz L_05f0
05ed:    79 05 64     call #0x0564 L_0564

L_05f0:
05f0:    c0 e0        ld BL, #0xe0
05f2:    49           sub! BL, AL
05f3:    16 05        blt L_05fa
05f5:    c0 20        ld BL, #0x20
05f7:    49           sub! BL, AL
05f8:    45 31        mov AL, BL

L_05fa:
05fa:    c0 8a        ld BL, #0x8a
05fc:    49           sub! BL, AL
05fd:    15 07        bnz L_0606
05ff:    d0 06 6f     ld BX, #0x066f
0602:    14 02        bz L_0606
0604:    55 24        mov RT, BX

L_0606:
0606:    7f 81        clear_data_bank??
0608:    09           ret

ReadLine:
    ; This routine supposedly reads a line from the terminal; i didn't care
    ; about the guts.
    ; The line is prefixed by 16-bit length, just like strings we print.
    ; It is also supposed to be padded with spaces (0xA0) up to a certain
    ; fixed length of at least 10 chars. NAME comparison wouldn't work without
    ; it as it compares exactly 10 characters.
0609:    93 f5        ld AX, (PC-0xb)
060b:    b3 58        st AX, (PC+0x58)
060d:    90 06 6f     ld AX, #0x066f
0610:    b3 ee        st AX, (PC-0x12)
0612:    9a           ld AX, (RT)
0613:    6d a2        st RT, -(SP)
0615:    38           inc! AX
0616:    5b           or! BX, AX
0617:    80 bd        ld AL, #0xbd
0619:    79 05 64     call #0x0564 L_0564

L_061c:
061c:    7b a6        call (PC-0x5a) L_05c4
061e:    c0 88        ld BL, #0x88
0620:    49           sub! BL, AL
0621:    14 05        bz L_0628
0623:    c0 95        ld BL, #0x95
0625:    49           sub! BL, AL
0626:    15 1c        bnz L_0644

L_0628:
0628:    d5 a4        ld BX, unknown_indexed
062a:    a3 0c        st AL, (PC+0xc)
062c:    30 20        inc BX, 1
062e:    51 42        sub BX, RT
0630:    14 0c        bz L_063e
0632:    80 a0        ld AL, #0xa0
0634:    79 05 64     call #0x0564 L_0564
0637:    80 95        ld AL, #0x95
0639:    7c fa        call @(PC-0x06) @0x635
063b:    3f           dec RT
063c:    73 de        jump (PC-0x22) L_061c

L_063e:
063e:    80 86        ld AL, #0x86
0640:    7c f3        call @(PC-0x0d) @0x635
0642:    73 d8        jump (PC-0x28) L_061c

L_0644:
0644:    c0 8d        ld BL, #0x8d
0646:    49           sub! BL, AL
0647:    14 12        bz L_065b
0649:    a3 0c        st AL, (PC+0xc)
064b:    95 a4        ld AX, unknown_indexed
064d:    d0 00 85     ld BX, #0x0085
0650:    58           add! BX, AX
0651:    51 42        sub BX, RT
0653:    17 06        bp L_065b
0655:    3e           inc RT
0656:    80 b0        ld AL, #0xb0
0658:    aa           st AL, (RT)
0659:    73 c1        jump (PC-0x3f) L_061c

L_065b:
065b:    95 a4        ld AX, unknown_indexed
065d:    38           inc! AX
065e:    51 40        sub AX, RT
0660:    65 a1        ld RT, (SP)+
0662:    b5 45        st AX, unknown_indexed
0664:    d0 01 bb     ld BX, #0x01bb
0667:    f3 97        st BX, (PC-0x69)
0669:    22 30        clr BL, 0
066b:    e1 05 ea     st BL, (0x05ea)
066e:    09           ret
066f:    65
0670:    a1
0671:    3a
0672:    b5
0673:    45
0674:    63
0675:    ef
0676:    73
0677:    ec

L_0678:
0678:    95 41        ld AX, (RT)+
067a:    6d a2        st RT, -(SP)
067c:    55 64        mov RT, DX
067e:    6d a2        st RT, -(SP)
0680:    65 01        ld RT, (AX)+
0682:    5c           mov DX, AX

L_0683:
0683:    3f           dec RT
0684:    16 0e        blt L_0694
0686:    8b           ld AL, (DX)
0687:    c0 e1        ld BL, #0xe1
0689:    49           sub! BL, AL
068a:    16 04        blt L_0690
068c:    80 c1        ld AL, #0xc1
068e:    40 31        add AL, BL

L_0690:
0690:    a5 61        st AL, (DX)+
0692:    73 ef        jump (PC-0x11) L_0683

L_0694:
0694:    95 a1        ld AX, (SP)+
0696:    5c           mov DX, AX
0697:    65 a1        ld RT, (SP)+
0699:    09           ret

L_069a:
069a:    6d a2        st RT, -(SP)
069c:    5b           or! BX, AX
069d:    85 a4        ld AL, unknown_indexed

L_069f:
069f:    3f           dec RT
06a0:    17 04        bp L_06a6
06a2:    65 a1        ld RT, (SP)+
06a4:    3e           inc RT
06a5:    09           ret

L_06a6:
06a6:    a5 21        st AL, (BX)+
06a8:    73 f5        jump (PC-0x0b) L_069f
06aa:    00
06ab:    00
06ac:    00
06ad:    00
06ae:    00
06af:    00
