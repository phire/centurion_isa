
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
011a:    a1 04 3d     st AL, (0x043d)
011d:    a1 05 6e     st AL, (0x056e)
0120:    90 00 f0     ld AX, #0x00f0	 ; Stack at 0xf0 ???
0123:    5f           mov SP, AX
0124:    80 f1        ld AL, #0xf1
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
0138:    61 00 1a     ld RT, (0x001a)	 ; Clearly corrupt here
013b:    50 54        add RT, RT
013d:    ff           (0xff)
013e:    ec           (0xec)

Entry_0x13f:
013f:    73 44        jump (PC+0x44) L_0185

L_0141:
    ; Self-modifying code ahead!!!
    ; The function at L_014b probes for DSK board at base address (AL << 16) + 0x40
    ; and, if successful, sends an RTZ command.
    ; These four stores patch the base address in the code below
0141:    a3 09        st AL, (PC+0x9)	 ; 14c
0143:    a3 0d        st AL, (PC+0xd)	 ; 152
0145:    a3 16        st AL, (PC+0x16)
0147:    a3 1a        st AL, (PC+0x1a)
0149:    80 07        ld AL, #0x07

L_014b:
014b:    a1 fd 40     st AL, (0xfd40)	 ; Unit select
014e:    d0 30 00     ld BX, #0x3000	 ; Should be a READ command ?
0151:    c1 fd 45     ld BL, (0xfd45)	 ; Read command register ??? Some flaga ???
0154:    42 23        and BL, BH	 ; command_reg & 0x30
0156:    41 23        sub BL, BH
0158:    15 11        bnz L_016b	 ; Should be 0x30. If not, we decrement AL and repeat the whole thing
015a:    c0 03        ld BL, #0x03
015c:    e1 fd 48     st BL, (0xfd48)	 ; RTZ (recalibrate)
015f:    d0 30 00     ld BX, #0x3000

L_0162:
0162:    c1 fd 45     ld BL, (0xfd45)	 ; Wait for command_reg & 0x30 == 0x30 ( busy ?)
0165:    42 23        and BL, BH
0167:    41 23        sub BL, BH
0169:    15 f7        bnz L_0162

L_016b:
016b:    29           dec! AL
016c:    17 dd        ble L_014b
016e:    09           ret

L_016f:
016f:    90 10 00     ld AX, #0x1000
0172:    5b           or! BX, AX
0173:    5c           mov DX, AX

L_0174:
0174:    8a           ld AL, (RT)
0175:    c0 ff        ld BL, #0xff
0177:    ea           st BL, (RT)
0178:    ca           ld BL, (RT)
0179:    14 0a        bz L_0185
017b:    aa           st AL, (RT)
017c:    50 64        add RT, DX
017e:    90 f0 00     ld AX, #0xf000
0181:    51 40        sub AX, RT
0183:    15 ef        bnz L_0174

L_0185:
0185:    69 03 3d     st RT, (0x033d)	 ; Corrupt here
0188:    55           (0x55)

Entry_0x189:
0189:    42 50        and AH, RL
018b:    32 fd        special30
018d:    55 f1        mov AX, HX
018f:    04           fsi
0190:    a0 50        st AL, #0x50
0192:    32 fe        special30
0194:    70           unknown
0195:    f1 04 a2     st BX, (0x04a2)
0198:    50 32        add BX, BX
019a:    fe 70 55     stb? A, [0x67055]
019d:    2a           clr! AL
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

L_01bb:
01bb:    04           fsi
01bc:    47 4c        unk7 GH, RH
01be:    00           HALT
01bf:    ff 02 65     stb? A, [0x70265]
01c2:    47 9c        unk7 GH, EL
01c4:    09           ret
01c5:    a0
01c6:    03
01c7:    65
01c8:    79
01c9:    05
01ca:    5a
01cb:    79
01cc:    05
01cd:    36
01ce:    03
01cf:    42
01d0:    80
01d1:    8a
01d2:    a1
01d3:    03
01d4:    44
01d5:    7c
01d6:    f5
01d7:    03
01d8:    4e
01d9:    79
01da:    06
01db:    09
01dc:    03
01dd:    63
01de:    79
01df:    05
01e0:    36
01e1:    03
01e2:    54
01e3:    79
01e4:    06
01e5:    09
01e6:    03
01e7:    74
01e8:    79
01e9:    05
01ea:    36
01eb:    03
01ec:    5a
01ed:    80
01ee:    01
01ef:    a1
01f0:    05
01f1:    ea
01f2:    79
01f3:    06
01f4:    09
01f5:    03
01f6:    78
01f7:    79
01f8:    05
01f9:    36
01fa:    03
01fb:    60
01fc:    05

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
023c:    71 01 bb     jump #0x01bb L_01bb

L_023f:
023f:    e2 04 b1     st BL, @(0x04b1)
0242:    90 03 78     ld AX, #0x0378
0245:    5e           mov EX, AX
0246:    95 81        ld AX, (EX)+
0248:    14 06        bz L_0250
024a:    79 03 c9     call #0x03c9 L_03c9
024d:    b1 01 05     st AX, (0x0105)

L_0250:
0250:    60 00 0e     ld RT, #0x000e
0253:    79 04 b0     call #0x04b0 L_04b0
0256:    00           HALT
0257:    85 88 08     ld AL, +0x8(EX)+
025a:    28           inc! AL
025b:    14 09        bz L_0266
025d:    04           fsi
025e:    79 05 36     call #0x0536 L_0536
0261:    03           fcn
0262:    7f 73        clear_data_bank??
0264:    d7 ff        ld BX, unknown

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
0278:    54 02        xor BX, AX
027a:    81 02 65     ld AL, (0x0265)
027d:    15 05        bnz L_0284
027f:    f1 01 05     st BX, (0x0105)
0282:    73 0f        jump (PC+0x0f) L_0293

L_0284:
0284:    91 01 05     ld AX, (0x0105)
0287:    59           sub! BX, AX
0288:    14 09        bz L_0293
028a:    04           fsi
028b:    79 05 36     call #0x0536 L_0536
028e:    03           fcn
028f:    9f           ld AX, (HX)
0290:    71 04 9d     jump #0x049d L_049d

L_0293:
0293:    95 88 04     ld AX, +0x4(EX)+
0296:    44 10        xor AH, AL
0298:    d0 3c b1     ld BX, #0x3cb1
029b:    54 02        xor BX, AX
029d:    91 01 05     ld AX, (0x0105)
02a0:    50 20        add AX, BX
02a2:    35 03        special30
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
0335:    fe e5 7b     stb? A, [0x6e57b]
0338:    03           fcn

L_0339:
0339:    71 01 bb     jump #0x01bb L_01bb

L_033c:
033c:    d0 80 00     ld BX, #0x8000
033f:    58           add! BX, AX
0340:    75 20        jump (A + 0x20)
0342:    10, "\nHDIPL 6.2"
034e:    4, "NAME"
0354:    4, "DISK"
035a:    4, "CODE"

Entry_0x360:
0360:    00           HALT
0361:    01           nop
0362:    8c           ld AL, (EX)
0363:    00           HALT
0364:    05           fci
0365:    a0 a0        st AL, #0xa0
0367:    a0 a0        st AL, #0xa0
0369:    a0 a0        st AL, #0xa0
036b:    a0 a0        st AL, #0xa0
036d:    a0 a0        st AL, #0xa0
036f:    a0 a0        st AL, #0xa0
0371:    a0 a0        st AL, #0xa0
0373:    a0 00        st AL, #0x00
0375:    01           nop
0376:    b0 b0 00     st AX, #0xb000
0379:    00           HALT
037a:    a0 a0        st AL, #0xa0
037c:    a0 a0        st AL, #0xa0
037e:    a0
037f:    30, "AB 47 - INCORRECT DISK FORMAT\r"
039f:    28, "AB 48 - INCORRECT DISK CODE\r"

Entry_0x3bd:
03bd:    c0 b9        ld BL, #0xb9
03bf:    49           sub! BL, AL
03c0:    19 03        ble L_03c5
03c2:    c0 ff        ld BL, #0xff
03c4:    09           ret

L_03c5:
03c5:    c0 b0        ld BL, #0xb0
03c7:    49           sub! BL, AL
03c8:    09           ret

L_03c9:
03c9:    8c           ld AL, (EX)
03ca:    7b f1        call (PC-0x0f) Entry_0x3bd
03cc:    17 03        ble L_03d1
03ce:    71 01 bb     jump #0x01bb L_01bb

L_03d1:
03d1:    3a           clr! AX
03d2:    b5 a2        st AX, -(SP)
03d4:    85 81        ld AL, (EX)+
03d6:    7b e5        call (PC-0x1b) Entry_0x3bd
03d8:    17 05        ble L_03df
03da:    31 80        dec EX
03dc:    95 a1        ld AX, (SP)+
03de:    09           ret

L_03df:
03df:    9d           ld AX, (SP)
03e0:    ed           st BL, (SP)
03e1:    3d           sll! AX
03e2:    5d           mov BX, AX
03e3:    35 01        special30
03e5:    58           add! BX, AX
03e6:    3a           clr! AX
03e7:    8d           ld AL, (SP)
03e8:    58           add! BX, AX
03e9:    fd 73 e8     stb? A, [0x573e8]
03ec:    95 a1        ld AX, (SP)+
03ee:    95 a1        ld AX, (SP)+
03f0:    b3 36        st AX, (PC+0x36)
03f2:    95 a1        ld AX, (SP)+
03f4:    30 05        special30
03f6:    b3 5c        st AX, (PC+0x5c)
03f8:    3a           clr! AX
03f9:    39           dec! AX
03fa:    b3 5e        st AX, (PC+0x5e)
03fc:    7b 53        call (PC+0x53) L_0451
03fe:    d0 00 4c     ld BX, #0x004c
0401:    59           sub! BX, AX
0402:    15 26        bnz L_042a
0404:    95 88 1b     ld AX, +0x1b(EX)+
0407:    b3 40        st AX, (PC+0x40)
0409:    50 48        add EX, RT
040b:    30 80        inc EX
040d:    7b 31        call (PC+0x31) L_0440
040f:    30 80        inc EX

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
0420:    31 41        special30
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
043a:    32 80        clr EX
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
0456:    65 08 01     ld RT, +0x1(AX)+
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
046b:    30 02        special30
046d:    b3 e5        st AX, (PC-0x1b)
046f:    65 08 01     ld RT, +0x1(AX)+
0472:    5d           mov BX, AX
0473:    98           ld AX, (AX)
0474:    17 20        ble L_0496
0476:    3a           clr! AX
0477:    85 28 02     ld AL, +0x2(BX)+
047a:    28           inc! AL
047b:    14 20        bz L_049d
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
048e:    7b 20        call (PC+0x20) L_04b0
0490:    01           nop
0491:    63 c1        ld RT, (PC-0x3f)
0493:    65 48 01     ld RT, +0x1(RT)+

L_0496:
0496:    7b 18        call (PC+0x18) L_04b0
0498:    00           HALT
0499:    65 a1        ld RT, (SP)+
049b:    73 a3        jump (PC-0x5d) L_0440

L_049d:
049d:    00           HALT
049e:    73 fd        jump (PC-0x03) L_049d
04a0:    7d
04a1:    55
04a2:    7b
04a3:    c5

L_04a4:
04a4:    2f 00        dma_load_addr WX
04a6:    90 fe 6f     ld AX, #0xfe6f
04a9:    2f 02        dma_load_count WX
04ab:    2f 04        dma_set_mode 0
04ad:    2f 06        dma_enable
04af:    09           ret

L_04b0:
04b0:    90 f1 40     ld AX, #0xf140
04b3:    5e           mov EX, AX
04b4:    93 ea        ld AX, (PC-0x16)
04b6:    c5 41        ld BL, (RT)+
04b8:    14 02        bz L_04bc
04ba:    93 e6        ld AX, (PC-0x1a)

L_04bc:
04bc:    b3 10        st AX, (PC+0x10)
04be:    7b e4        call (PC-0x1c) L_04a4
04c0:    7b 1f        call (PC+0x1f) L_04e1
04c2:    80 00        ld AL, #0x00
04c4:    a5 88 08     st AL, +0x8(EX)+
04c7:    7b 2c        call (PC+0x2c) L_04f5
04c9:    24 00        srl* AH
04cb:    15 05        bnz L_04d2
04cd:    90 7d 55     ld AX, #0x7d55
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

L_0536:
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
05c4:    7e
05c5:    81
05c6:    55
05c7:    98
05c8:    f2
05c9:    00
05ca:    83
05cb:    a2
05cc:    f6
05cd:    19
05ce:    00
05cf:    90
05d0:    05
05d1:    a6
05d2:    d7
05d3:    6e
05d4:    3a
05d5:    d7
05d6:    60
05d7:    80
05d8:    06
05d9:    f6
05da:    19
05db:    0a
05dc:    f6
05dd:    19
05de:    0e
05df:    e6
05e0:    60
05e1:    45
05e2:    10
05e3:    14
05e4:    fa
05e5:    c0
05e6:    80
05e7:    43
05e8:    31
05e9:    c0
05ea:    00
05eb:    15
05ec:    03
05ed:    79
05ee:    05
05ef:    64
05f0:    c0
05f1:    e0
05f2:    49
05f3:    16
05f4:    05
05f5:    c0
05f6:    20
05f7:    49
05f8:    45
05f9:    31
05fa:    c0
05fb:    8a
05fc:    49
05fd:    15
05fe:    07
05ff:    d0
0600:    06
0601:    6f
0602:    14
0603:    02
0604:    55
0605:    24
0606:    7f
0607:    81
0608:    09
0609:    93
060a:    f5
060b:    b3
060c:    58
060d:    90
060e:    06
060f:    6f
0610:    b3
0611:    ee
0612:    9a
0613:    6d
0614:    a2
0615:    38
0616:    5b
0617:    80
0618:    bd
0619:    79
061a:    05
061b:    64
061c:    7b
061d:    a6
061e:    c0
061f:    88
0620:    49
0621:    14
0622:    05
0623:    c0
0624:    95
0625:    49
0626:    15
0627:    1c
0628:    d5
0629:    a4
062a:    a3
062b:    0c
062c:    30
062d:    20
062e:    51
062f:    42
0630:    14
0631:    0c
0632:    80
0633:    a0
0634:    79
0635:    05
0636:    64
0637:    80
0638:    95
0639:    7c
063a:    fa
063b:    3f
063c:    73
063d:    de
063e:    80
063f:    86
0640:    7c
0641:    f3
0642:    73
0643:    d8
0644:    c0
0645:    8d
0646:    49
0647:    14
0648:    12
0649:    a3
064a:    0c
064b:    95
064c:    a4
064d:    d0
064e:    00
064f:    85
0650:    58
0651:    51
0652:    42
0653:    17
0654:    06
0655:    3e
0656:    80
0657:    b0
0658:    aa
0659:    73
065a:    c1
065b:    95
065c:    a4
065d:    38
065e:    51
065f:    40
0660:    65
0661:    a1
0662:    b5
0663:    45
0664:    d0
0665:    01
0666:    bb
0667:    f3
0668:    97
0669:    22
066a:    30
066b:    e1
066c:    05
066d:    ea
066e:    09
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
