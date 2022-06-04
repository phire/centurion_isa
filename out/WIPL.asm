
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
0138:    61 00 1a     ld RT, (0x001a)	 ; The binary is clearly corrupt here
013b:    50 54        add RT, RT
013d:    ff           (0xff)
013e:    ec           (0xec)

Entry_0x13f:
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
016c:    17 dd        ble L_014b
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
018c:    fd           st BX, (SP)	 ; This looks like a severely corrupt binary, can't continue
018d:    55 f1        mov AX, HX
018f:    04           fsi
0190:    a0 50        st AL, #0x50
0192:    32 fe        special30
0194:    70           unknown
0195:    f1 04 a2     st BX, (0x04a2)
0198:    50 32        add BX, BX
019a:    fe           st BX, (GX)
019b:    70           unknown
019c:    55 2a        mov SP, BX
019e:    d0 fe e5     ld BX, #0xfee5
01a1:    50 42        add BX, RT
01a3:    f1 02 b6     st BX, (0x02b6)
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

BadUserInput:
    ; The code jumps here when some checks, done on user input (numbers etc), fail
    ; So, we think it's "invalid user input"
01bb:    04           fsi
01bc:    47 4c        unk7 GH, RH
01be:    00           HALT
01bf:    ff           st BX, (HX)
01c0:    02           fsn
01c1:    65 47        ld RT, +0x47(RT)
01c3:    9c           ld AX, (EX)
01c4:    09           ret

Entry_0x1c5:
01c5:    a0 03        st AL, #0x03
01c7:    65 79 05     ld RT, +0x5-(DX)
01ca:    5a           and! BX, AX
01cb:    79 05 36     call #0x0536 PrintString
01ce:    03 42        (0x342)	 ; WIPL version string

Entry_0x1d0:
01d0:    80 8a        ld AL, #0x8a
01d2:    a1 03 44     st AL, (0x0344)
01d5:    7c f5        unknown_7c
01d7:    03 4e        (0x34e)	 ; "NAME"

Entry_0x1d9:
01d9:    79 06 09     call #0x0609 ReadLine
01dc:    03 63        (0x363)	 ; name_buffer

Entry_0x1de:
01de:    79 05 36     call #0x0536 PrintString
01e1:    03 54        (0x354)	 ; "DISK"

Entry_0x1e3:
01e3:    79 06 09     call #0x0609 ReadLine
01e6:    03 74        (0x374)	 ; disk_buffer

Entry_0x1e8:
01e8:    79 05 36     call #0x0536 PrintString
01eb:    03 5a        (0x35a)	 ; "CODE"

Entry_0x1ed:
01ed:    80 01        ld AL, #0x01
01ef:    a1 05 ea     st AL, (0x05ea)
01f2:    79 06 09     call #0x0609 ReadLine
01f5:    03 78        (0x378)	 ; code_buffer

Entry_0x1f7:
01f7:    79 05 36     call #0x0536 PrintString
01fa:    03 60        (0x360)

Entry_0x1fc:
01fc:    05           fci

L_01fd:
01fd:    79 06 78     call #0x0678 L_0678
0200:    03           fcn
0201:    63 90        ld RT, (PC-0x70)
0203:    03           fcn
0204:    74           unknown
0205:    5e           mov EX, AX
0206:    d5 81        ld BX, (EX)+
0208:    31 20        dec BX
020a:    14 10        bz L_021c
020c:    80 a0        ld AL, #0xa0
020e:    c5 88 01     ld BL, +0x1(EX)+
0211:    49           sub! BL, AL
0212:    14 08        bz L_021c
0214:    c5 81        ld BL, (EX)+
0216:    49           sub! BL, AL
0217:    14 03        bz L_021c
0219:    80 f0        ld AL, #0xf0
021b:    49           sub! BL, AL

L_021c:
021c:    45 31        mov AL, BL
021e:    25 11        special20
0220:    d0 f1 40     ld BX, #0xf140
0223:    43 12        or BH, AL
0225:    f1 04 b1     st BX, (0x04b1)
0228:    25 11        special20
022a:    c0 04        ld BL, #0x04
022c:    48           add! BL, AL
022d:    e1 04 ac     st BL, (0x04ac)
0230:    8c           ld AL, (EX)
0231:    c0 b0        ld BL, #0xb0
0233:    49           sub! BL, AL
0234:    16 06        blt L_023c
0236:    80 07        ld AL, #0x07
0238:    41 31        sub AL, BL
023a:    19 03        ble L_023f

L_023c:
023c:    71 01 bb     jump #0x01bb BadUserInput

L_023f:
023f:    e2 04 b1     st BL, @(0x04b1)
0242:    90 03 78     ld AX, #0x0378	 ; code_buffer
0245:    5e           mov EX, AX
0246:    95 81        ld AX, (EX)+
0248:    14 06        bz L_0250
024a:    79 03 c9     call #0x03c9 StrToNum
024d:    b1 01 05     st AX, (0x0105)	 ; InputValue

L_0250:
0250:    60 00 0e     ld RT, #0x000e
0253:    79 04 b0     call #0x04b0 L_04b0
0256:    00           HALT
0257:    85 88 08     ld AL, +0x8(EX)+
025a:    28           inc! AL
025b:    14 09        bz L_0266	 ; Proceed to disk code checking
025d:    04           fsi
025e:    79 05 36     call #0x0536 PrintString
0261:    03 7f        (0x37f)	 ; Incorrect disk format

Entry_0x263:
0263:    73 d7        jump (PC-0x29) L_023c
0265:    ff	 ; This is a "check disk code" flag.
           	 ; If zero, the check will be bypassed.

L_0266:
0266:    95 88 06     ld AX, +0x6(EX)+
0269:    3b           not! AX
026a:    c0 80        ld BL, #0x80
026c:    07           fcc
026d:    36 00        rrc AX
026f:    11 02        bnc L_0273
0271:    43 30        or AH, BL

L_0273:
0273:    d0 3c b1     ld BX, #0x3cb1
0276:    44 32        xor BH, BL
0278:    54 02        xor BX, AX	 ; disk_code = 0x3cb1 ^ AX
027a:    81 02 65     ld AL, (0x0265)
027d:    15 05        bnz L_0284
027f:    f1 01 05     st BX, (0x0105)	 ; InputValue = expected_disk_code
0282:    73 0f        jump (PC+0x0f) L_0293

L_0284:
    ; Check the disk code
0284:    91 01 05     ld AX, (0x0105)	 ; InputValue
0287:    59           sub! BX, AX	 ; BX = expected disk code
0288:    14 09        bz L_0293
028a:    04           fsi
028b:    79 05 36     call #0x0536 PrintString
028e:    03 9f        (0x39f)	 ; Incorrect disk code
0290:    71
0291:    04
0292:    9d

L_0293:
    ; Disk code is correct
0293:    95 88 04     ld AX, +0x4(EX)+
0296:    44 10        xor AH, AL
0298:    d0 3c b1     ld BX, #0x3cb1
029b:    54 02        xor BX, AX
029d:    91 01 05     ld AX, (0x0105)	 ; InputValue
02a0:    50 20        add AX, BX
02a2:    35 03        special30	 ; Should be sll ax, 4
02a4:    5b           or! BX, AX
02a5:    79 04 b0     call #0x04b0 L_04b0
02a8:    00           HALT
02a9:    95 88 0e     ld AX, +0xe(EX)+
02ac:    b1 04 8a     st AX, (0x048a)
02af:    30 8f        special30
02b1:    79 05 07     call #0x0507 L_0507
02b4:    01           nop
02b5:    1b 7e        bs2 L_0335
02b7:    e5 03        st BL, unknown_indexedunknown_indexed
02b9:    ec           st BL, (EX)

L_02ba:
02ba:    9c           ld AX, (EX)
02bb:    d0 84 8d     ld BX, #0x848d
02be:    59           sub! BX, AX
02bf:    15 03        bnz L_02c4
02c1:    71 02 3c     jump #0x023c L_023c

L_02c4:
02c4:    90 03 65     ld AX, #0x0365
02c7:    5c           mov DX, AX
02c8:    90 0a 00     ld AX, #0x0a00

L_02cb:
02cb:    85 61        ld AL, (DX)+
02cd:    21 00        dec AH
02cf:    16 23        blt L_02f4
02d1:    c5 81        ld BL, (EX)+
02d3:    49           sub! BL, AL
02d4:    14 f5        bz L_02cb
02d6:    45 01        mov AL, AH
02d8:    22 00        clr AH
02da:    50 08        add EX, AX
02dc:    50 98        add EX, EX
02de:    00           HALT
02df:    06           fsc
02e0:    d1 04 a0     ld BX, (0x04a0)
02e3:    50 32        add BX, BX
02e5:    01           nop
02e6:    90 51 82     ld AX, #0x5182
02e9:    15 cf        bnz L_02ba
02eb:    3e           inc RT
02ec:    90 ff a9     ld AX, #0xffa9
02ef:    7b 4b        call (PC+0x4b) L_033c
02f1:    00           HALT
02f2:    73 c6        jump (PC-0x3a) L_02ba

L_02f4:
02f4:    3a           clr! AX
02f5:    85 81        ld AL, (EX)+
02f7:    5d           mov BX, AX
02f8:    3d           sll! AX
02f9:    58           add! BX, AX
02fa:    91 04 a2     ld AX, (0x04a2)
02fd:    58           add! BX, AX
02fe:    f5 a2        st BX, -(SP)

Entry_0x300:
0300:    95 81        ld AX, (EX)+
0302:    61 04 8a     ld RT, (0x048a)
0305:    50 04        add RT, AX
0307:    85 81        ld AL, (EX)+
0309:    b5 a2        st AX, -(SP)
030b:    90 ff a9     ld AX, #0xffa9
030e:    7b 2c        call (PC+0x2c) L_033c
0310:    01           nop
0311:    d5 a8 02     ld BX, +0x2(SP)+
0314:    3a           clr! AX
0315:    85 28 04     ld AL, +0x4(BX)+
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
0328:    49           sub! BL, AL
0329:    15 0e        bnz L_0339
032b:    90 ff ff     ld AX, #0xffff
032e:    d3 0d        ld BX, (PC+0xd)
0330:    58           add! BX, AX
0331:    f1 00 fe     st BX, (0x00fe)
0334:    90

L_0335:
0335:    fe           st BX, (GX)
0336:    e5 7b 03     st BL, unknown_indexed

L_0339:
0339:    71 01 bb     jump #0x01bb BadUserInput

L_033c:
033c:    d0           (0xd0)
033d:    80 00        (0x8000)	 ; This variable stores end of RAM
033f:    58
0340:    75
0341:    20
0342:    10, "\nHDIPL 6.2"
034e:    4, "NAME"
0354:    4, "DISK"
035a:    4, "CODE"

Entry_0x360:
0360:    00           HALT
0361:    01           nop
0362:    8c           ld AL, (EX)
0363:    00           HALT	 ; name_buffer
0364:    05           fci
0365:    a0 a0        st AL, #0xa0
0367:    a0 a0        st AL, #0xa0
0369:    a0 a0        st AL, #0xa0
036b:    a0 a0        st AL, #0xa0
036d:    a0 a0        st AL, #0xa0
036f:    a0 a0        st AL, #0xa0
0371:    a0 a0        st AL, #0xa0
0373:    a0           (0xa0)
0374:    00	 ; disk_buffer
0375:    01
0376:    b0 b0        (0xb0b0)
0378:    00	 ; code_buffer
0379:    00
037a:    a0
037b:    a0
037c:    a0
037d:    a0
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
03cc:    17 03        ble L_03d1
03ce:    71 01 bb     jump #0x01bb BadUserInput	 ; The character is invalid

L_03d1:
    ; A correcr digit has been entered
03d1:    3a           clr! AX
03d2:    b5 a2        st AX, -(SP)	 ; value = 0

L_03d4:
03d4:    85 81        ld AL, (EX)+	 ; Do the conversion again, increment pointer this time
03d6:    7b e5        call (PC-0x1b) AsciiToHex
03d8:    17 05        ble L_03df
03da:    31 80        dec EX	 ; Invalid character, restore the pointer
                            	 ; It now points behind our number
03dc:    95 a1        ld AX, (SP)+	 ; return value
03de:    09           ret

L_03df:
03df:    9d           ld AX, (SP)	 ; AX = value
03e0:    ed           st BL, (SP)	 ; (SP) = digit
03e1:    3d           sll! AX
03e2:    5d           mov BX, AX	 ; BX = value << 1
03e3:    35 01        special30	 ; should be sll AX, 2
03e5:    58           add! BX, AX	 ; BX = (value << 1) + (value << 3) = value * 10
03e6:    3a           clr! AX	 ; AX = digit
03e7:    8d           ld AL, (SP)
03e8:    58           add! BX, AX	 ; BX += digit
03e9:    fd           st BX, (SP)	 ; value = value * 10 + digit
03ea:    73 e8        jump (PC-0x18) L_03d4
03ec:    95
03ed:    a1
03ee:    95
03ef:    a1
03f0:    b3
03f1:    36
03f2:    95
03f3:    a1
03f4:    30
03f5:    05
03f6:    b3
03f7:    5c
03f8:    3a
03f9:    39
03fa:    b3
03fb:    5e
03fc:    7b
03fd:    53
03fe:    d0
03ff:    00
0400:    4c
0401:    59
0402:    15
0403:    26
0404:    95
0405:    88
0406:    1b
0407:    b3
0408:    40
0409:    50
040a:    48
040b:    30
040c:    80
040d:    7b
040e:    31
040f:    30
0410:    80
0411:    7b
0412:    2d
0413:    45
0414:    33
0415:    14
0416:    13
0417:    d5
0418:    81
0419:    93
041a:    2e
041b:    58
041c:    99
041d:    50
041e:    60
041f:    b9
0420:    31
0421:    41
0422:    18
0423:    f3
0424:    85
0425:    81
0426:    73
0427:    e9
0428:    00
0429:    00
042a:    55
042b:    44
042c:    14
042d:    0c
042e:    55
042f:    40
0430:    39
0431:    67
0432:    4a
0433:    86
0434:    50
0435:    46
0436:    50
0437:    48
0438:    73
0439:    ea
043a:    32
043b:    80
043c:    80
043d:    c5
043e:    75	 ; This should jump to 0x125, but that isn't a valid location
           	 ; Most likely our binary is corrupt around here
043f:    60
0440:    c5
0441:    81
0442:    16
0443:    0d
0444:    3a
0445:    85
0446:    81
0447:    bd
0448:    90
0449:    00
044a:    00
044b:    5c
044c:    95
044d:    81
044e:    50
044f:    06
0450:    09
0451:    6d
0452:    a2
0453:    90
0454:    00
0455:    00
0456:    65
0457:    08
0458:    01
0459:    90
045a:    00
045b:    00
045c:    38
045d:    b3
045e:    fb
045f:    50
0460:    04
0461:    d3
0462:    c5
0463:    59
0464:    11
0465:    30
0466:    3a
0467:    b3
0468:    f1
0469:    93
046a:    e9
046b:    30
046c:    02
046d:    b3
046e:    e5
046f:    65
0470:    08
0471:    01
0472:    5d
0473:    98
0474:    17
0475:    20
0476:    3a
0477:    85
0478:    28
0479:    02
047a:    28
047b:    14
047c:    20
047d:    29
047e:    5d
047f:    3d
0480:    58
0481:    93
0482:    1f
0483:    58
0484:    94
0485:    ce
0486:    f3
0487:    cc
0488:    3b
0489:    60
048a:    57
048b:    79
048c:    50
048d:    04
048e:    7b
048f:    20
0490:    01
0491:    63
0492:    c1
0493:    65
0494:    48
0495:    01
0496:    7b
0497:    18
0498:    00
0499:    65
049a:    a1
049b:    73
049c:    a3

Stop:
049d:    00
049e:    73
049f:    fd
04a0:    7d
04a1:    55

LoadAddress:
04a2:    7b c5        (0x7bc5)

SetDmaForSectorLoad:
04a4:    2f 00        dma_load_addr WX
04a6:    90 fe 6f     ld AX, #0xfe6f	 ; 400 bytes == 1 sector
04a9:    2f 02        dma_load_count WX
04ab:    2f 04        dma_set_mode 0
04ad:    2f 06        dma_enable
04af:    09           ret

L_04b0:
    ; I think the function which starts here loads a list of sectors.
    ; Perhaps we're dealing with a filesystem here
04b0:    90 f1 40     ld AX, #0xf140
04b3:    5e           mov EX, AX
04b4:    93 ea        ld AX, (PC-0x16)	 ; Load AX from 0x04a0
04b6:    c5 41        ld BL, (RT)+
04b8:    14 02        bz L_04bc
04ba:    93 e6        ld AX, (PC-0x1a)	 ; AX = LoadAddress

L_04bc:
04bc:    b3 10        st AX, (PC+0x10)	 ; Preserve loading address (patch instruction below)
04be:    7b e4        call (PC-0x1c) SetDmaForSectorLoad	 ; Setup DMA to read
04c0:    7b 1f        call (PC+0x1f) L_04e1
04c2:    80 00        ld AL, #0x00
04c4:    a5 88 08     st AL, +0x8(EX)+
04c7:    7b 2c        call (PC+0x2c) L_04f5
04c9:    24 00        srl* AH
04cb:    15 05        bnz L_04d2
04cd:    90 7d 55     ld AX, #0x7d55	 ; AX = loading address (this insn is patched)
04d0:    5e           mov EX, AX
04d1:    09           ret

L_04d2:
04d2:    80 03        ld AL, #0x03
04d4:    a5 88 08     st AL, +0x8(EX)+
04d7:    7b 22        call (PC+0x22) L_04fb
04d9:    8c           ld AL, (EX)
04da:    a5 88 0b     st AL, +0xb(EX)+
04dd:    93 ef        ld AX, (PC-0x11)
04df:    73 db        jump (PC-0x25) L_04bc

L_04e1:
04e1:    7b 18        call (PC+0x18) L_04fb
04e3:    95 a8 02     ld AX, +0x2(SP)+
04e6:    d0 3f ff     ld BX, #0x3fff
04e9:    5a           and! BX, AX
04ea:    f5 88 01     st BX, +0x1(EX)+
04ed:    80 02        ld AL, #0x02
04ef:    a5 88 08     st AL, +0x8(EX)+
04f2:    7b 07        call (PC+0x07) L_04fb
04f4:    09           ret

L_04f5:
04f5:    85 88 04     ld AL, +0x4(EX)+
04f8:    2c           srl! AL
04f9:    10 fa        bc L_04f5

L_04fb:
04fb:    95 88 04     ld AX, +0x4(EX)+
04fe:    c0 30        ld BL, #0x30
0500:    42 31        and AL, BL
0502:    49           sub! BL, AL
0503:    15 f6        bnz L_04fb
0505:    09           ret
0506:    00

L_0507:
0507:    95 41        ld AX, (RT)+
0509:    5d           mov BX, AX
050a:    71 05 0d     jump #0x050d 0x50d
050d:    f5 a2        st BX, -(SP)
050f:    59           sub! BX, AX
0510:    19 21        ble L_0533
0512:    da           ld BX, (RT)
0513:    79 06 9a     call #0x069a L_069a
0516:    a0

L_0517:
0517:    dd           ld BX, (SP)
0518:    55 60        mov AX, DX
051a:    bd           st AX, (SP)
051b:    95 41        ld AX, (RT)+
051d:    5c           mov DX, AX
051e:    95 41        ld AX, (RT)+
0520:    6d a2        st RT, -(SP)
0522:    55 24        mov RT, BX

L_0524:
0524:    3f           dec RT
0525:    17 06        ble L_052d
0527:    65 a1        ld RT, (SP)+
0529:    95 a1        ld AX, (SP)+
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
0557:    30 41        special30
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
0598:    24 31        special20
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
    ; This routine supposedly reads a line from the terminal
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
062c:    30 20        inc BX
062e:    51 42        sub BX, RT
0630:    14 0c        bz L_063e
0632:    80 a0        ld AL, #0xa0
0634:    79 05 64     call #0x0564 L_0564
0637:    80 95        ld AL, #0x95
0639:    7c fa        unknown_7c
063b:    3f           dec RT
063c:    73 de        jump (PC-0x22) L_061c

L_063e:
063e:    80 86        ld AL, #0x86
0640:    7c f3        unknown_7c
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
0653:    17 06        ble L_065b
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
0669:    22 30        clr BL
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
06a0:    17 04        ble L_06a6
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
