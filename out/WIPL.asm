
Start:
0100:    01                     nop
0101:    01                     nop
0102:    01                     nop
0103:    73 03                  jmp [L_0108:+0x3]
0105:    00
0106:    64
0107:    c5 'E'

L_0108:
    ; Entry point
0108:    3a                     clr! A, #0
0109:    b1 00 6c               st A, [0x006c]	 ; Initialize some vars
010c:    b1 00 fc               st A, [0x00fc]
010f:    b1 00 ae               st A, [0x00ae]
0112:    90 05 06               ld A, #0x0506
0115:    b1 00 fe               st A, [0x00fe]
0118:    83 ed                  ld AL, [pc + -0x13]	 ; 0xc5
011a:    a1 04 3d               st AL, [0x043d]	 ; Patch ld AL, #0xc5 instruction at addr 043c
011d:    a1 05 6e               st AL, [0x056e]	 ; Patch ld BL, #0xc5 instruction at addr 056d
0120:    90 00 f0               ld A, #0x00f0	 ; Initialize stack
0123:    5f                     mov S, A
0124:    80 f1                  ld AL, #0xf1	 ; This sends RTZ command to our disks.
0126:    7b 19                  call [L_0141:+0x19]
0128:    80 f5                  ld AL, #0xf5
012a:    7b 15                  call [L_0141:+0x15]
012c:    80 f9                  ld AL, #0xf9
012e:    7b 11                  call [L_0141:+0x11]
0130:    80 fd                  ld AL, #0xfd
0132:    7b 0d                  call [L_0141:+0xd]
0134:    1a 02                  bs1 L_0138
0136:    73 37                  jmp [L_016f:+0x37]

L_0138:
    ; We go here if sense1 switch is set (DIAG board is present)
0138:    61 00 1a               ld X, [0x001a]	 ; RT = (0x001a) - 20
013b:    50 54 ff ec            add X, X, #0xffec	 ; Looks like DIAG overrides our mem test and tells us
013f:    73 44                  jmp [L_0185:+0x44]	 ; size of RAM to use

L_0141:
    ; Self-modifying code ahead!!!
    ; The function at L_014b probes for 8 units on a DSK board at base address (AL << 16) + 0x40
    ; and, if successful, sends an RTZ command.
    ; These four stores patch the base address in the code below
0141:    a3 09                  st AL, [pc + 0x09]	 ; 14c
0143:    a3 0d                  st AL, [pc + 0x0d]	 ; 152
0145:    a3 16                  st AL, [pc + 0x16]	 ; 015d
0147:    a3 1a                  st AL, [pc + 0x1a]	 ; 0163
0149:    80 07                  ld AL, #0x07	 ; Start probing from unit 7

L_014b:
    ; Probe drive units from 7 to 0 and send RTZ command to connected ones
014b:    a1 fd 40               st AL, [0xfd40]	 ; Unit select
014e:    d0 30 00               ld B, #0x3000	 ; BL = 0 (RTZ), BH = value to check flags against
0151:    c1 fd 45               ld BL, [0xfd45]	 ; Read command register ??? Some flaga ???
0154:    42 23                  and BL, BH	 ; command_reg & 0x30
0156:    41 23                  sub BL, BH
0158:    15 11                  bnz L_016b	 ; Should be 0x30. If not, skip this unit (not present)
015a:    c0 03                  ld BL, #0x03
015c:    e1 fd 48               st BL, [0xfd48]	 ; RTZ (recalibrate)
015f:    d0 30 00               ld B, #0x3000

L_0162:
0162:    c1 fd 45               ld BL, [0xfd45]	 ; Wait for command_reg & 0x30 == 0x30; this indicates drive ready
0165:    42 23                  and BL, BH
0167:    41 23                  sub BL, BH
0169:    15 f7                  bnz L_0162

L_016b:
016b:    29                     dec! AL, #1	 ; Next unit, down to 0
016c:    17 dd                  bp L_014b
016e:    09                     ret

L_016f:
    ; Continuation of boot process
016f:    90 10 00               ld A, #0x1000
0172:    5b                     mov X, A
0173:    5c                     mov Y, A	 ; DX = 4096

L_0174:
    ; This locates end of RAM, effectively probing how much RAM we've got
0174:    8a                     ld AL, [X]	 ; Preserve original (RT) value
0175:    c0 ff                  ld BL, #0xff	 ; Try to store 0xff
0177:    ea                     st BL, [X]
0178:    ca                     ld BL, [X]	 ; Load it back
0179:    14 0a                  bz L_0185	 ; Exit if we got zero (failed to store)
017b:    aa                     st AL, [X]	 ; Put original value back
017c:    50 64                  add X, Y	 ; RT += 4096 (page size ?)
017e:    90 f0 00               ld A, #0xf000	 ; Reached 0xf000 ?
0181:    51 40                  sub A, X
0183:    15 ef                  bnz L_0174	 ; Repeat until we reach 0xf000

L_0185:
0185:    69 03 3d               st X, [0x033d]	 ; Store final address of our RAM
0188:    55 42                  mov B, X
018a:    50 32 fd 55            add B, B, #0xfd55
018e:    f1 04 a0               st B, [LoadBuffer0:0x04a0]
0191:    50 32 fe 70            add B, B, #0xfe70
0195:    f1 04 a2               st B, [LoadBuffer1:0x04a2]
0198:    50 32 fe 70            add B, B, #0xfe70
019c:    55 2a                  mov S, B
019e:    d0 fe e5               ld B, #0xfee5
01a1:    50 42                  add B, X	 ; BX = top of RAM - 283
01a3:    f1 02 b6               st B, [0x02b6]	 ; This will be address of our trampoline code
01a6:    80 bd                  ld AL, #0xbd
01a8:    a1 06 18               st AL, [0x0618]
01ab:    90 01 bb               ld A, #0x01bb
01ae:    b1 06 00               st A, [0x0600]
01b1:    80 b1                  ld AL, #0xb1
01b3:    1d 01                  bs4 L_01b6
01b5:    29                     dec! AL, #1

L_01b6:
01b6:    a1 03 77               st AL, [0x0377]
01b9:    73 42                  jmp [L_01fd:+0x42]

BackToPrompt:
    ; The code jumps here when for instance empty string was entered on CODE prompt
    ; According to known behavior, thus jumps back to WIPL prompt, effectively
    ; restarting it
01bb:    04                     ei
    ; We don't currently understand what 47 instruction really does, but this
    ; is the only reference to 0x0265, where a "skip code check" flag is stored.
    ; And we also know that in pristine WIPL, obtained from disk dump, the respective
    ; location contains zero; while in this one, which has been extracted by dumping
    ; from the TOS after it hit the "Stop" loop and the machine has been restarted,
    ; we see a 0xff. So, apparently, this sequence stores an 0xFF at 0x0265
01bc:    47 4c 00 ff 02 65      memcpy #0x01, #0xff, [0x0265]	 ; fill
01c2:    47 9c 09 a0 03 65      memset #0x0a, #0xa0, [0x0365]	 ; fill (0x365), 0xa0, 10
01c8:    79 05 5a               call [L_055a:0x055a]
01cb:    79 05 36               call [PrintString:0x0536]
01ce:    03 42                  (0x342)	 ; WIPL version string
01d0:    80 8a                  ld AL, #0x8a
01d2:    a1 03 44               st AL, [0x0344]
01d5:    7c f5                  call @[pc + -0xb]
01d7:    03 4e                  (0x34e)	 ; "NAME"
01d9:    79 06 09               call [ReadLine:0x0609]
01dc:    03 63                  (0x363)	 ; name_buffer
01de:    79 05 36               call [PrintString:0x0536]
01e1:    03 54                  (0x354)	 ; "DISK"
01e3:    79 06 09               call [ReadLine:0x0609]
01e6:    03 74                  (0x374)	 ; disk_buffer
01e8:    79 05 36               call [PrintString:0x0536]
01eb:    03 5a                  (0x35a)	 ; "CODE"
01ed:    80 01                  ld AL, #0x01
01ef:    a1 05 ea               st AL, [0x05ea]
01f2:    79 06 09               call [ReadLine:0x0609]
01f5:    03 78                  (0x378)	 ; code_buffer
01f7:    79 05 36               call [PrintString:0x0536]
01fa:    03 60                  (0x360)
01fc:    05                     di

L_01fd:
01fd:    79 06 78               call [L_0678:0x0678]
0200:    03 63                  (0x363)	 ; name_buffer
0202:    90 03 74               ld A, #0x0374	 ; disk_buffer
0205:    5e                     mov Z, A
0206:    d5 81                  ld B, [Z++]	 ; String length
0208:    31 20                  dec B, #1
020a:    14 10                  bz L_021c	 ; Just one char means board offset 0
020c:    80 a0                  ld AL, #0xa0	 ; ' ' (space)
020e:    c5 88 01               ld BL, [Z + 0x0001]	 ; Check character[1]
0211:    49                     sub! BL, AL
0212:    14 08                  bz L_021c
0214:    c5 81                  ld BL, [Z++]	 ; BL = *char++
0216:    49                     sub! BL, AL
0217:    14 03                  bz L_021c
0219:    80 f0                  ld AL, #0xf0
021b:    49                     sub! BL, AL	 ; magic_value = 'p' - char

L_021c:
021c:    45 31                  mov AL, BL	 ; magic_value
021e:    25 11                  sll AL, #2
0220:    d0 f1 40               ld B, #0xf140
0223:    43 12                  or BH, AL	 ; DSK0_BASE | (magic_value << 2)
0225:    f1 04 b1               st B, [0x04b1]	 ; Set DSK board address
0228:    25 11                  sll AL, #2
022a:    c0 04                  ld BL, #0x04
022c:    48                     add! BL, AL	 ; dma_mode_byte = magic_value << 4
022d:    e1 04 ac               st BL, [0x04ac]	 ; Patch dma_set_mode insn
0230:    8c                     ld AL, [Z]
0231:    c0 b0                  ld BL, #0xb0	 ; '0'
0233:    49                     sub! BL, AL
0234:    16 06                  blt BackToPrompt_tramp
0236:    80 07                  ld AL, #0x07
0238:    41 31                  sub AL, BL	 ; Valid units 0 - 7
023a:    19 03                  ble L_023f

BackToPrompt_tramp:
023c:    71 01 bb               jmp [BackToPrompt:0x01bb]

L_023f:
023f:    e2 04 b1               st BL, @[0x04b1]	 ; This writes Hawk unit select register
0242:    90 03 78               ld A, #0x0378	 ; code_buffer
0245:    5e                     mov Z, A
0246:    95 81                  ld A, [Z++]	 ; Check string length
0248:    14 06                  bz L_0250
024a:    79 03 c9               call [StrToNum:0x03c9]
    ; EX points at the first non-numeric character after the code
024d:    b1 01 05               st A, [0x0105]	 ; Store entered_disk_code

L_0250:
0250:    60 00 0e               ld X, #0x000e	 ; Track 0 side 0 sector 15
0253:    79 04 b0               call [LoadSector:0x04b0]
0256:    00                     (0x0)
    ; EX is an address of the loaded sector
0257:    85 88 08               ld AL, [Z + 0x0008]	 ; Disk format flag
025a:    28                     inc! AL, #1	 ; Must be equal to 0xff
025b:    14 09                  bz L_0266	 ; Proceed to disk code checking
025d:    04                     ei
025e:    79 05 36               call [PrintString:0x0536]
0261:    03 7f                  (0x37f)	 ; Incorrect disk format
0263:    73 d7                  jmp [BackToPrompt_tramp:-0x29]
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
0266:    95 88 06               ld A, [Z + 0x0006]	 ; Disk code is derived from this value
0269:    3b                     not! A, #0
026a:    c0 80                  ld BL, #0x80	 ; This whole thing rotates AX right WITHOUT carry
026c:    07                     rl
026d:    36 00                  rrc A, #1
026f:    11 02                  bnc L_0273
0271:    43 30                  or AH, BL

L_0273:
0273:    d0 3c b1               ld B, #0x3cb1	 ; Some more obfuscation
0276:    44 32                  xor BH, BL
0278:    54 02                  xor B, A	 ; BX is the final expected value here
027a:    81 02 65               ld AL, [0x0265]	 ; This is "request check" flag. We don't know how/where it's set.
027d:    15 05                  bnz L_0284	 ; If not zero, the check is required
027f:    f1 01 05               st B, [0x0105]	 ; entered_disk_code = expected_entered_disk_code
0282:    73 0f                  jmp [L_0293:+0xf]	 ; Bypass

L_0284:
    ; Check the disk code
0284:    91 01 05               ld A, [0x0105]	 ; AX - entered_disk_code
0287:    59                     sub! B, A	 ; BX = expected_disk_code
0288:    14 09                  bz L_0293	 ; Proceed if there's a match
028a:    04                     ei
028b:    79 05 36               call [PrintString:0x0536]
028e:    03 9f                  (0x39f)	 ; Incorrect disk code
0290:    71 04 9d               jmp [Stop:0x049d]

L_0293:
    ; Disk code is correct. Now we read what we'll call a "boot directory".
    ; Number of starting block is stored at (sector_base + 4) in a scrambled
    ; form. The disk code is used to unscramble it.
0293:    95 88 04               ld A, [Z + 0x0004]	 ; sector_base + 4
0296:    44 10                  xor AH, AL
0298:    d0 3c b1               ld B, #0x3cb1	 ; The same magic constant as used for making the code
029b:    54 02                  xor B, A
029d:    91 01 05               ld A, [0x0105]	 ; entered_disk_code, which we now know is correct
02a0:    50 20                  add A, B	 ; AX = track number here
02a2:    35 03                  sll A, #4
02a4:    5b                     mov X, A	 ; sector = track * 16 (sectors per track)
02a5:    79 04 b0               call [LoadSector:0x04b0]
02a8:    00                     (0x0)
02a9:    95 88 0e               ld A, [Z + 0x000e]	 ; EX is still sector address
02ac:    b1 04 8a               st A, [0x048a]
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
02af:    30 8f                  inc Z, #16	 ; name_on_disk = sector_base + 16, this skips the first entry.
                                          	 ; That first entry looks like a volume name on the image we have.
02b1:    79 05 07               call [memcpy:0x0507]	 ; Before proceeding, we copy part of ourselves to the top of RAM.
                                                    	 ; I guess we're preparing to load the boot file into low memory, which would
                                                    	 ; overwrite us.
                                                    	 ; Calls to the relocated fragment are done via CallHighMem routine
02b4:    01 1b                  (0x11b)	 ; length = 283 bytes
02b6:    7e e5                  (0x7ee5)	 ; destination, set to top_of_ram - 283
02b8:    03 ec                  (0x3ec)	 ; source

L_02ba:
    ; Here we are trying to find our "name" on the disk
    ; Names are stored in a series of entries, 16 bytes each.
    ; Each name is exactly 10 characters long, padded up with spaces. Remaining 6
    ; bytes probably specify file location on the disk.
    ; Entries proceed to following sectors until the table terminated with a word of 0x848d.
    ; This is probably disk's root directory.
02ba:    9c                     ld A, [Z]	 ; Check if we hit the terminator
02bb:    d0 84 8d               ld B, #0x848d
02be:    59                     sub! B, A
02bf:    15 03                  bnz L_02c4	 ; Go back to the prompt if so
02c1:    71 02 3c               jmp [BackToPrompt_tramp:0x023c]

L_02c4:
02c4:    90 03 65               ld A, #0x0365
02c7:    5c                     mov Y, A	 ; DX = name_buffer + 2 - start of entered NAME string, skip over length
02c8:    90 0a 00               ld A, #0x0a00	 ; AH = 10 - maximum length

L_02cb:
02cb:    85 61                  ld AL, [Y++]	 ; c1 = *entered_name++
02cd:    21 00                  dec AH, #1	 ; length--
02cf:    16 23                  blt L_02f4	 ; Proceed if the name matches
02d1:    c5 81                  ld BL, [Z++]	 ; c2 = *name_on_disk
02d3:    49                     sub! BL, AL
02d4:    14 f5                  bz L_02cb	 ; If matches, go chech the next char
02d6:    45 01                  mov AL, AH	 ; Mismatch
02d8:    22 00                  clr AH, #0
02da:    50 08                  add Z, A	 ; name_on_disk += length (remaining) - this skips past the string
02dc:    50 98 00 06            add Z, Z, #0x0006	 ; EX = EX + 6 - this skips over to the next entry
02e0:    d1 04 a0               ld B, [LoadBuffer0:0x04a0]	 ; BX = LoadBuffer0 - sector address
02e3:    50 32 01 90            add B, B, #0x0190	 ; This makes sense as add BX, BX, 400 - point at the end of sector
02e7:    51 82                  sub B, Z
02e9:    15 cf                  bnz L_02ba	 ; Check the next entry if not reached the end
02eb:    3e                     inc X	 ; Go to the next sector
02ec:    90 ff a9               ld A, #0xffa9
02ef:    7b 4b                  call [CallHighMem:+0x4b]	 ; Call (end_of_ram - 87) = LoadSector
02f1:    00                     HALT
02f2:    73 c6                  jmp [L_02ba:-0x3a]	 ; Restart the search from the beginning.
                                                  	 ; EX will point at the beginning of the sector this time!!!

L_02f4:
    ; NAME found. EX points right after the string in the loaded sector.
    ; Since length of the name is exactly 10 bytes, we have three words,
    ; specifying something. The code below reads them.
02f4:    3a                     clr! A, #0
02f5:    85 81                  ld AL, [Z++]
02f7:    5d                     mov B, A
02f8:    3d                     sll! A, #1
02f9:    58                     add! B, A
02fa:    91 04 a2               ld A, [LoadBuffer1:0x04a2]
02fd:    58                     add! B, A
02fe:    f5 a2                  st B, [--S]
0300:    95 81                  ld A, [Z++]
0302:    61 04 8a               ld X, [0x048a]
0305:    50 04                  add X, A
0307:    85 81                  ld AL, [Z++]
0309:    b5 a2                  st A, [--S]
030b:    90 ff a9               ld A, #0xffa9
030e:    7b 2c                  call [CallHighMem:+0x2c]	 ; Call (end_of_ram - 87) = LoadSector
0310:    01                     nop
0311:    d5 a8 02               ld B, [S + 0x0002]
0314:    3a                     clr! A, #0
0315:    85 28 04               ld AL, [B + 0x0004]
0318:    5b                     mov X, A
0319:    3a                     clr! A, #0
031a:    38                     inc! A, #1

L_031b:
031b:    3f                     dec X
031c:    16 03                  blt L_0321
031e:    3d                     sll! A, #1
031f:    73 fa                  jmp [L_031b:-0x6]

L_0321:
0321:    dd                     ld B, [S]
0322:    bd                     st A, [S]
0323:    80 0f                  ld AL, #0x0f
0325:    4a                     and! BL, AL
0326:    80 04                  ld AL, #0x04
0328:    49                     sub! BL, AL	 ; Here we check something else.
0329:    15 0e                  bnz L_0339	 ; If the check fails, we will jump back to the IPL prompt
032b:    90 ff ff               ld A, #0xffff
032e:    d3 0d                  ld B, [pc + 0x0d]
0330:    58                     add! B, A
0331:    f1 00 fe               st B, [0x00fe]
0334:    90 fe e5               ld A, #0xfee5
0337:    7b 03                  call [CallHighMem:+0x3]	 ; Call (end_of_ram - 283) - boot the file ???

L_0339:
0339:    71 01 bb               jmp [BackToPrompt:0x01bb]

CallHighMem:
033c:    d0 80 00               ld B, #0x8000	 ; BX = end of RAM, patched in the beginning
033f:    58                     add! B, A
0340:    75 20                  jmp [B]
0342:    10, "\nHDIPL 6.2"
034e:    4, "NAME"
0354:    4, "DISK"
035a:    4, "CODE"
0360:    00
0361:    01
0362:    8c
0363:    00	 ; name_buffer
0364:    05
0365:    a0 ' '
0366:    a0 ' '
0367:    a0 ' '
0368:    a0 ' '
0369:    a0 ' '
036a:    a0 ' '
036b:    a0 ' '
036c:    a0 ' '
036d:    a0 ' '
036e:    a0 ' '
036f:    a0 ' '
0370:    a0 ' '
0371:    a0 ' '
0372:    a0 ' '
0373:    a0                     (0xa0)
0374:    00                     HALT	 ; disk_buffer
0375:    01                     nop
0376:    b0 b0                  (0xb0b0)
0378:    00                     HALT	 ; code_buffer
0379:    00                     HALT
037a:    a0 a0                  st AL, #0xa0
037c:    a0 a0                  st AL, #0xa0
037e:    a0 ' '
037f:    30, "AB 47 - INCORRECT DISK FORMAT\r"
039f:    28, "AB 48 - INCORRECT DISK CODE\r"

AsciiToHex:
    ; This function converts one hexadecimal digit from its ASCII representation
    ; to value. Result is returned in BL.
03bd:    c0 b9                  ld BL, #0xb9
03bf:    49                     sub! BL, AL
03c0:    19 03                  ble L_03c5
03c2:    c0 ff                  ld BL, #0xff	 ; -1 is returned on error
03c4:    09                     ret

L_03c5:
03c5:    c0 b0                  ld BL, #0xb0
03c7:    49                     sub! BL, AL
03c8:    09                     ret

StrToNum:
    ; Parses a numeric string, pointed to by EX, and returns the
    ; parsed value in AX. EX is updated to point at the first non-digit character
03c9:    8c                     ld AL, [Z]	 ; Check the first character
03ca:    7b f1                  call [AsciiToHex:-0xf]
03cc:    17 03                  bp L_03d1
03ce:    71 01 bb               jmp [BackToPrompt:0x01bb]	 ; The character is invalid

L_03d1:
    ; A correcr digit has been entered
03d1:    3a                     clr! A, #0
03d2:    b5 a2                  st A, [--S]	 ; value = 0

L_03d4:
03d4:    85 81                  ld AL, [Z++]	 ; Do the conversion again, increment pointer this time
03d6:    7b e5                  call [AsciiToHex:-0x1b]
03d8:    17 05                  bp L_03df
03da:    31 80                  dec Z, #1	 ; Invalid character, restore the pointer
                                         	 ; It now points behind our number
03dc:    95 a1                  ld A, [S++]	 ; return value
03de:    09                     ret

L_03df:
03df:    9d                     ld A, [S]	 ; AX = value
03e0:    ed                     st BL, [S]	 ; (SP) = digit
03e1:    3d                     sll! A, #1
03e2:    5d                     mov B, A	 ; BX = value << 1
03e3:    35 01                  sll A, #2
03e5:    58                     add! B, A	 ; BX = (value << 1) + (value << 3) = value * 10
03e6:    3a                     clr! A, #0	 ; AX = digit
03e7:    8d                     ld AL, [S]
03e8:    58                     add! B, A	 ; BX += digit
03e9:    fd                     st B, [S]	 ; value = value * 10 + digit
03ea:    73 e8                  jmp [L_03d4:-0x18]

RelocatablePart:
    ; This code is copied to high RAM (top - 283) and operates from there
    ; Note that it includes Hawk disk driver. The code is apparently fully relocatable
03ec:    95 a1                  ld A, [S++]
03ee:    95 a1                  ld A, [S++]
03f0:    b3 36                  st A, [pc + 0x36]
03f2:    95 a1                  ld A, [S++]
03f4:    30 05                  inc A, #6
03f6:    b3 5c                  st A, [pc + 0x5c]
03f8:    3a                     clr! A, #0
03f9:    39                     dec! A, #1
03fa:    b3 5e                  st A, [pc + 0x5e]
03fc:    7b 53                  call [L_0451:+0x53]
03fe:    d0 00 4c               ld B, #0x004c
0401:    59                     sub! B, A
0402:    15 26                  bnz L_042a
0404:    95 88 1b               ld A, [Z + 0x001b]
0407:    b3 40                  st A, [pc + 0x40]
0409:    50 48                  add Z, X
040b:    30 80                  inc Z, #1
040d:    7b 31                  call [L_0440:+0x31]
040f:    30 80                  inc Z, #1

L_0411:
0411:    7b 2d                  call [L_0440:+0x2d]
0413:    45 33                  mov BL, BL
0415:    14 13                  bz L_042a

L_0417:
0417:    d5 81                  ld B, [Z++]
0419:    93 2e                  ld A, [pc + 0x2e]
041b:    58                     add! B, A
041c:    99                     ld A, [B]
041d:    50 60                  add A, Y
041f:    b9                     st A, [B]
0420:    31 41                  dec X, #2
0422:    18 f3                  bgt L_0417

L_0424:
0424:    85 81                  ld AL, [Z++]
0426:    73 e9                  jmp [L_0411:-0x17]
0428:    00
0429:    00

L_042a:
042a:    55 44                  mov X, X
042c:    14 0c                  bz L_043a
042e:    55 40                  mov A, X
0430:    39                     dec! A, #1
0431:    67                     unknown
0432:    4a                     and! BL, AL
0433:    86                     unknown
0434:    50 46                  add Y, X
0436:    50 48                  add Z, X
0438:    73 ea                  jmp [L_0424:-0x16]

L_043a:
043a:    32 80                  clr Z, #0
043c:    80 c5                  ld AL, #0xc5
043e:    75 60                  jmp [Y]

L_0440:
0440:    c5 81                  ld BL, [Z++]
0442:    16 0d                  blt L_0451
0444:    3a                     clr! A, #0
0445:    85 81                  ld AL, [Z++]
0447:    bd                     st A, [S]
0448:    90 00 00               ld A, #0x0000
044b:    5c                     mov Y, A
044c:    95 81                  ld A, [Z++]
044e:    50 06                  add Y, A
0450:    09                     ret

L_0451:
0451:    6d a2                  st X, [--S]
0453:    90 00 00               ld A, #0x0000
0456:    65 08 01               ld X, [A + 0x0001]
0459:    90 00 00               ld A, #0x0000
045c:    38                     inc! A, #1
045d:    b3 fb                  st A, [pc + -0x5]
045f:    50 04                  add X, A
0461:    d3 c5                  ld B, [pc + -0x3b]
0463:    59                     sub! B, A
0464:    11 30                  bnc L_0496
0466:    3a                     clr! A, #0
0467:    b3 f1                  st A, [pc + -0xf]
0469:    93 e9                  ld A, [pc + -0x17]
046b:    30 02                  inc A, #3
046d:    b3 e5                  st A, [pc + -0x1b]
046f:    65 08 01               ld X, [A + 0x0001]
0472:    5d                     mov B, A
0473:    98                     ld A, [A]
0474:    17 20                  bp L_0496
0476:    3a                     clr! A, #0
0477:    85 28 02               ld AL, [B + 0x0002]
047a:    28                     inc! AL, #1
047b:    14 20                  bz Stop
047d:    29                     dec! AL, #1
047e:    5d                     mov B, A
047f:    3d                     sll! A, #1
0480:    58                     add! B, A
0481:    93 1f                  ld A, [LoadBuffer1:+0x1f]
0483:    58                     add! B, A
0484:    94 ce                  ld A, @[pc + -0x32]
0486:    f3 cc                  st B, [pc + -0x34]
0488:    3b                     not! A, #0
0489:    60 57 79               ld X, #0x5779
048c:    50 04                  add X, A
048e:    7b 20                  call [LoadSector:+0x20]
0490:    01                     nop
0491:    63 c1                  ld X, [pc + -0x3f]
0493:    65 48 01               ld X, [X + 0x0001]

L_0496:
0496:    7b 18                  call [LoadSector:+0x18]
0498:    00                     HALT
0499:    65 a1                  ld X, [S++]
049b:    73 a3                  jmp [L_0440:-0x5d]

Stop:
049d:    00                     HALT
049e:    73 fd                  jmp [Stop:-0x3]

LoadBuffer0:
04a0:    7d 55                  (0x7d55)

LoadBuffer1:
04a2:    7b c5                  (0x7bc5)

SetDmaForSectorLoad:
04a4:    2f 00                  ld_dma_addr A
04a6:    90 fe 6f               ld A, #0xfe6f	 ; 400 bytes == 1 sector
04a9:    2f 02                  ld_dma_count A
04ab:    2f 04                  ld_dma_mode A
04ad:    2f 06                  enable_dma
04af:    09                     ret

LoadSector:
    ; This function loads one sector from the drive.
    ; CHS address of the sector to read needs to be placed into X (RT) register
    ; in HAWK native format (CCCCCCCC CCCHSSSS) before calling this function.
    ; This routine uses two buffers, whose addresses are stored in two
    ; variables above. The buffer to use is chosen by the literal byte
    ; argument: 0 or 1. Address of the buffer is returned in EX.
04b0:    90 f1 40               ld A, #0xf140
04b3:    5e                     mov Z, A	 ; EX = DSK_BASE
04b4:    93 ea                  ld A, [LoadBuffer0:-0x16]	 ; AX = LoadBuffer0
04b6:    c5 41                  ld BL, [X++]
04b8:    14 02                  bz L_04bc	 ; If literal argument is not 0...
04ba:    93 e6                  ld A, [LoadBuffer1:-0x1a]	 ; .. then AX = LoadBuffer1

L_04bc:
04bc:    b3 10                  st A, [pc + 0x10]	 ; Preserve loading address (patch instruction at 04cd)
04be:    7b e4                  call [SetDmaForSectorLoad:-0x1c]	 ; Setup DMA to read
04c0:    7b 1f                  call [SeekToTrack:+0x1f]
04c2:    80 00                  ld AL, #0x00
04c4:    a5 88 08               st AL, [Z + 0x0008]	 ; READ command
04c7:    7b 2c                  call [WaitForDataReady:+0x2c]
    ; Upon completion status register value will be in AX
04c9:    24 00                  srl AH, #1	 ; Check HAWK_STATUS & 0x0100
04cb:    15 05                  bnz L_04d2	 ; If bit set, recalibrate, seek and retry (read error)
04cd:    90 7d 55               ld A, #0x7d55	 ; AX = loading address (this insn is patched)
04d0:    5e                     mov Z, A
04d1:    09                     ret

L_04d2:
04d2:    80 03                  ld AL, #0x03
04d4:    a5 88 08               st AL, [Z + 0x0008]	 ; RTZ command
04d7:    7b 22                  call [WaitForHawkCmdCompletion:+0x22]
04d9:    8c                     ld AL, [Z]
04da:    a5 88 0b               st AL, [Z + 0x000b]
04dd:    93 ef                  ld A, [pc + -0x11]	 ; AX = loading address (from the patched insn)
04df:    73 db                  jmp [L_04bc:-0x25]	 ; Retry

SeekToTrack:
04e1:    7b 18                  call [WaitForHawkCmdCompletion:+0x18]
04e3:    95 a8 02               ld A, [S + 0x0002]
04e6:    d0 3f ff               ld B, #0x3fff
04e9:    5a                     and! B, A
04ea:    f5 88 01               st B, [Z + 0x0001]	 ; Write sector address register
04ed:    80 02                  ld AL, #0x02	 ; SEEK command
04ef:    a5 88 08               st AL, [Z + 0x0008]
04f2:    7b 07                  call [WaitForHawkCmdCompletion:+0x7]
04f4:    09                     ret

WaitForDataReady:
    ; This location is only called when READ operation is initiated.
    ; I suggest it waits for data transfer to end.
04f5:    85 88 04               ld AL, [Z + 0x0004]	 ; HAWK status
04f8:    2c                     srl! AL, #1	 ; Wait for STATUS & 0x01 == 0
04f9:    10 fa                  bc WaitForDataReady

WaitForHawkCmdCompletion:
    ; And this waits for a generic operation completion
04fb:    95 88 04               ld A, [Z + 0x0004]	 ; HAWK status
04fe:    c0 30                  ld BL, #0x30	 ; Wait for STATUS & 0x30 == 0x30
0500:    42 31                  and AL, BL
0502:    49                     sub! BL, AL
0503:    15 f6                  bnz WaitForHawkCmdCompletion
0505:    09                     ret
0506:    00

memcpy:
    ; This is the end of a fragment, which gets copied to top of RAM.
    ; This function preserves DX and EX
0507:    95 41                  ld A, [X++]	 ; length = arg[0, 1]
                                           	 ; I completely fail to understand these two instructions. I mean - i understand what they mean,
                                           	 ; but what's the real purpose of this fragment here ? In pristine on-disk WIPL it looks the same.
                                           	 ; Is this patched during installation ?
0509:    5d                     mov B, A
050a:    71 05 0d               jmp [0x050d]
050d:    f5 a2                  st B, [--S]	 ; push length
050f:    59                     sub! B, A	 ; length = min(AX, BX)
0510:    19 21                  ble L_0533
0512:    da                     ld B, [X]	 ; arg[2, 3]
0513:    79 06 9a               call [L_069a:0x069a]
0516:    a0 ' '

L_0517:
0517:    dd                     ld B, [S]	 ; BX = length
0518:    55 60                  mov A, Y	 ; Preserve DX
051a:    bd                     st A, [S]
051b:    95 41                  ld A, [X++]	 ; dest
051d:    5c                     mov Y, A
051e:    95 41                  ld A, [X++]	 ; src
0520:    6d a2                  st X, [--S]	 ; push RT, will use as back counter
0522:    55 24                  mov X, B	 ; RT = length

L_0524:
    ; Copy RT bytes from (AX) to (DX)
0524:    3f                     dec X
0525:    17 06                  bp L_052d
0527:    65 a1                  ld X, [S++]	 ; pop RT
0529:    95 a1                  ld A, [S++]	 ; pop DX
052b:    5c                     mov Y, A
052c:    09                     ret

L_052d:
052d:    c5 01                  ld BL, [A++]
052f:    e5 61                  st BL, [Y++]
0531:    73 f1                  jmp [L_0524:-0xf]

L_0533:
0533:    bd                     st A, [S]
0534:    73 e1                  jmp [L_0517:-0x1f]

PrintString:
0536:    7b 22                  call [L_055a:+0x22]
0538:    7e 45                  push {X, Y, Z}
053a:    9a                     ld A, [X]
053b:    5c                     mov Y, A
053c:    55 98 f2 00            mov Z, Z, #0xf200
0540:    65 61                  ld X, [Y++]
0542:    19 11                  ble L_0555

L_0544:
0544:    85 61                  ld AL, [Y++]
0546:    c0 e0                  ld BL, #0xe0
0548:    49                     sub! BL, AL
0549:    16 05                  blt L_0550
054b:    c0 20                  ld BL, #0x20
054d:    49                     sub! BL, AL
054e:    45 31                  mov AL, BL

L_0550:
0550:    7b 12                  call [PrintChar:+0x12]
0552:    3f                     dec X
0553:    18 ef                  bgt L_0544

L_0555:
0555:    7f 45                  pop {X, Y, Z}
0557:    30 41                  inc X, #2
0559:    09                     ret

L_055a:
055a:    80 8d                  ld AL, #0x8d
055c:    c3 42                  ld BL, [pc + 0x42]
055e:    49                     sub! BL, AL
055f:    14 02                  bz L_0563
0561:    7b 01                  call [PrintChar:+0x1]

L_0563:
0563:    09                     ret

PrintChar:
0564:    7e 81                  push {Z}
0566:    55 98 f2 00            mov Z, Z, #0xf200	 ; Serisl port 0 base address
056a:    f6 19 0d               st AL, +0xd(Z)
056d:    c0 c5                  ld BL, #0xc5	 ; Set up baud rate ?
056f:    f6 39 00               st BL, +0x0(Z)
0572:    c0 8c                  ld BL, #0x8c
0574:    49                     sub! BL, AL	 ; If character is 0x0c (form feed)...
0575:    14 13                  bz L_058a	 ; Print with a delay
0577:    c0 8d                  ld BL, #0x8d
0579:    49                     sub! BL, AL	 ; If character is \r...
057a:    15 14                  bnz L_0590
057c:    7b 17                  call [RawPrintChar:+0x17]
057e:    80 8a                  ld AL, #0x8a	 ; Add \n
0580:    7b 13                  call [RawPrintChar:+0x13]
0582:    80 8d                  ld AL, #0x8d
0584:    a3 1a                  st AL, [pc + 0x1a]	 ; (0x5a0) - preserve the original character ???
0586:    0e                     dly
0587:    7f 81                  pop {Z}
0589:    09                     ret

L_058a:
058a:    7b 09                  call [RawPrintChar:+0x9]
058c:    0e                     dly
058d:    7f 81                  pop {Z}
058f:    09                     ret

L_0590:
0590:    7b 03                  call [RawPrintChar:+0x3]
0592:    7f 81                  pop {Z}
0594:    09                     ret

RawPrintChar:
0595:    f6 38 00               ld BL, +0x0(Z)
0598:    24 31                  srl BL, #2
059a:    11 f9                  bnc RawPrintChar
059c:    f6 19 01               st AL, +0x1(Z)
059f:    a0 bd                  st AL, #0xbd	 ; Shouldn't this be ld ?
05a1:    09                     ret
05a2:    f6 'v'
05a3:    38
05a4:    0f
05a5:    0a
05a6:    55
05a7:    98
05a8:    f2 'r'
05a9:    00
05aa:    f6 'v'
05ab:    18
05ac:    00
05ad:    2c
05ae:    10
05af:    0f
05b0:    f6 'v'
05b1:    18
05b2:    01
05b3:    f6 'v'
05b4:    18
05b5:    03
05b6:    f6 'v'
05b7:    18
05b8:    05
05b9:    f6 'v'
05ba:    18
05bb:    07
05bc:    2a
05bd:    73
05be:    e3 'c'
05bf:    f6 'v'
05c0:    18
05c1:    01
05c2:    73
05c3:    de '^'

L_05c4:
05c4:    7e 81                  push {Z}
05c6:    55 98 f2 00            mov Z, Z, #0xf200
05ca:    83 a2                  ld AL, [pc + -0x5e]
05cc:    f6 19 00               st AL, +0x0(Z)
05cf:    90 05 a6               ld A, #0x05a6
05d2:    d7 6e                  st A, [0x006e]
05d4:    3a                     clr! A, #0
05d5:    d7 60                  st A, [0x0060]
05d7:    80 06                  ld AL, #0x06
05d9:    f6 19 0a               st AL, +0xa(Z)
05dc:    f6 19 0e               st AL, +0xe(Z)

L_05df:
05df:    e6                     unknown
05e0:    60 45 10               ld X, #0x4510
05e3:    14 fa                  bz L_05df
05e5:    c0 80                  ld BL, #0x80
05e7:    43 31                  or AL, BL
05e9:    c0 00                  ld BL, #0x00
05eb:    15 03                  bnz L_05f0
05ed:    79 05 64               call [PrintChar:0x0564]

L_05f0:
05f0:    c0 e0                  ld BL, #0xe0
05f2:    49                     sub! BL, AL
05f3:    16 05                  blt L_05fa
05f5:    c0 20                  ld BL, #0x20
05f7:    49                     sub! BL, AL
05f8:    45 31                  mov AL, BL

L_05fa:
05fa:    c0 8a                  ld BL, #0x8a
05fc:    49                     sub! BL, AL
05fd:    15 07                  bnz L_0606
05ff:    d0 06 6f               ld B, #0x066f
0602:    14 02                  bz L_0606
0604:    55 24                  mov X, B

L_0606:
0606:    7f 81                  pop {Z}
0608:    09                     ret

ReadLine:
    ; This routine supposedly reads a line from the terminal; i didn't care
    ; about the guts.
    ; The line is prefixed by 16-bit length, just like strings we print.
    ; It is also supposed to be padded with spaces (0xA0) up to a certain
    ; fixed length of at least 10 chars. NAME comparison wouldn't work without
    ; it as it compares exactly 10 characters.
0609:    93 f5                  ld A, [pc + -0xb]
060b:    b3 58                  st A, [pc + 0x58]
060d:    90 06 6f               ld A, #0x066f
0610:    b3 ee                  st A, [pc + -0x12]
0612:    9a                     ld A, [X]
0613:    6d a2                  st X, [--S]
0615:    38                     inc! A, #1
0616:    5b                     mov X, A
0617:    80 bd                  ld AL, #0xbd
0619:    79 05 64               call [PrintChar:0x0564]

L_061c:
061c:    7b a6                  call [L_05c4:-0x5a]
061e:    c0 88                  ld BL, #0x88
0620:    49                     sub! BL, AL
0621:    14 05                  bz L_0628
0623:    c0 95                  ld BL, #0x95
0625:    49                     sub! BL, AL
0626:    15 1c                  bnz L_0644

L_0628:
0628:    d5 a4                  ld B, @[S]
062a:    a3 0c                  st AL, [pc + 0x0c]
062c:    30 20                  inc B, #1
062e:    51 42                  sub B, X
0630:    14 0c                  bz L_063e
0632:    80 a0                  ld AL, #0xa0
0634:    79 05 64               call [PrintChar:0x0564]
0637:    80 95                  ld AL, #0x95
0639:    7c fa                  call @[pc + -0x6]
063b:    3f                     dec X
063c:    73 de                  jmp [L_061c:-0x22]

L_063e:
063e:    80 86                  ld AL, #0x86
0640:    7c f3                  call @[pc + -0xd]
0642:    73 d8                  jmp [L_061c:-0x28]

L_0644:
0644:    c0 8d                  ld BL, #0x8d
0646:    49                     sub! BL, AL
0647:    14 12                  bz L_065b
0649:    a3 0c                  st AL, [pc + 0x0c]
064b:    95 a4                  ld A, @[S]
064d:    d0 00 85               ld B, #0x0085
0650:    58                     add! B, A
0651:    51 42                  sub B, X
0653:    17 06                  bp L_065b
0655:    3e                     inc X
0656:    80 b0                  ld AL, #0xb0
0658:    aa                     st AL, [X]
0659:    73 c1                  jmp [L_061c:-0x3f]

L_065b:
065b:    95 a4                  ld A, @[S]
065d:    38                     inc! A, #1
065e:    51 40                  sub A, X
0660:    65 a1                  ld X, [S++]
0662:    b5 45                  st A, @[X++]
0664:    d0 01 bb               ld B, #0x01bb
0667:    f3 97                  st B, [pc + -0x69]
0669:    22 30                  clr BL, #0
066b:    e1 05 ea               st BL, [0x05ea]
066e:    09                     ret
066f:    65
0670:    a1 '!'
0671:    3a
0672:    b5 '5'
0673:    45
0674:    63
0675:    ef 'o'
0676:    73
0677:    ec 'l'

L_0678:
0678:    95 41                  ld A, [X++]
067a:    6d a2                  st X, [--S]
067c:    55 64                  mov X, Y
067e:    6d a2                  st X, [--S]
0680:    65 01                  ld X, [A++]
0682:    5c                     mov Y, A

L_0683:
0683:    3f                     dec X
0684:    16 0e                  blt L_0694
0686:    8b                     ld AL, [Y]
0687:    c0 e1                  ld BL, #0xe1
0689:    49                     sub! BL, AL
068a:    16 04                  blt L_0690
068c:    80 c1                  ld AL, #0xc1
068e:    40 31                  add AL, BL

L_0690:
0690:    a5 61                  st AL, [Y++]
0692:    73 ef                  jmp [L_0683:-0x11]

L_0694:
0694:    95 a1                  ld A, [S++]
0696:    5c                     mov Y, A
0697:    65 a1                  ld X, [S++]
0699:    09                     ret

L_069a:
069a:    6d a2                  st X, [--S]
069c:    5b                     mov X, A
069d:    85 a4                  ld AL, @[S]

L_069f:
069f:    3f                     dec X
06a0:    17 04                  bp L_06a6
06a2:    65 a1                  ld X, [S++]
06a4:    3e                     inc X
06a5:    09                     ret

L_06a6:
06a6:    a5 21                  st AL, [B++]
06a8:    73 f5                  jmp [L_069f:-0xb]
06aa:    00
06ab:    00
06ac:    00
06ad:    00
06ae:    00
06af:    00
