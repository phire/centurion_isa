
L_004c:
004c:    7b 59                  call L_00a7
004e:    a5 c8 03               st AL, [C + 0x03]

L_0051:
0051:    3a                     clr A, #0
0052:    a3 67                  st AL, [0x00bb]
0054:    7b 58                  call L_00ae
0056:    4d                     mov BL, AL
0057:    16 f3                  blt L_004c
0059:    14 2a                  bz L_0085
005b:    7b 51                  call L_00ae
005d:    3c                     srl A, #1
005e:    5b                     mov X, A
005f:    7b 4d                  call L_00ae
0061:    45 16                  mov YH, AL
0063:    7b 49                  call L_00ae
0065:    4c                     mov YL, AL
0066:    90 00 00               ld A, 0x0000
0069:    5e                     mov Z, A
006a:    50 06                  add Y, A

L_006c:
006c:    7b 40                  call L_00ae
006e:    45 12                  mov BH, AL
0070:    7b 3c                  call L_00ae
0072:    4d                     mov BL, AL
0073:    50 82                  add B, Z
0075:    99                     ld A, [B]
0076:    50 60                  add A, Y
0078:    b9                     st A, [B]
0079:    3f                     dec X
007a:    15 f0                  bnz L_006c

L_007c:
007c:    7b 30                  call L_00ae
007e:    c3 3b                  ld BL, [0x00bb]
0080:    14 cf                  bz L_0051

L_0082:
0082:    00                     HALT
0083:    73 c7                  jmp L_004c

L_0085:
0085:    7b 27                  call L_00ae
0087:    5b                     mov X, A
0088:    7b 24                  call L_00ae
008a:    45 10                  mov AH, AL
008c:    7b 20                  call L_00ae
008e:    5c                     mov Y, A
008f:    93 d6                  ld A, [0x0067]
0091:    50 06                  add Y, A
0093:    55 44                  mov X, X
0095:    14 09                  bz L_00a0

L_0097:
0097:    7b 15                  call L_00ae
0099:    a5 61                  st AL, [Y++]
009b:    3f                     dec X
009c:    15 f9                  bnz L_0097
009e:    73 dc                  jmp L_007c

L_00a0:
00a0:    7b 05                  call L_00a7
00a2:    a5 c8 0a               st AL, [C + 0x0a]
00a5:    75 60                  jmp [Y]

L_00a7:
00a7:    85 c8 01               ld AL, [C + 0x01]
00aa:    2c                     srl AL, #1
00ab:    11 fa                  bnc L_00a7
00ad:    09                     ret

L_00ae:
00ae:    85 c8 01               ld AL, [C + 0x01]
00b1:    16 cf                  blt L_0082
00b3:    2c                     srl AL, #1
00b4:    10 cc                  bc L_0082
00b6:    2c                     srl AL, #1
00b7:    11 f5                  bnc L_00ae
00b9:    8e                     ld AL, [C]
00ba:    c0 00                  ld BL, 0x00
00bc:    48                     add BL, AL
00bd:    e3 fc                  st BL, [0x00bb]
00bf:    09                     ret
00c0:    <null bytes>


Start:
0100:    6f 01 11               stcc [0x0111]
0103:    b1 01 bf               st A, [R_01bf|0x01bf]
0106:    f1 01 c1               st B, [R_01c1|0x01c1]
0109:    2a                     clr AL, #0
010a:    1e 01                  bie intState	 ; Branch if interrupts are enabled
010c:    28                     inc AL, #1

intState:
010d:    a0 00                  st AL, 0x00	 ; Store interrupt state (inline variable)
010f:    05                     di

ccFlags:
0110:    80 00                  ld AL, 0x00
0112:    24 13                  srl AL, #4
0114:    32 20                  clr B, #0
0116:    2c                     srl AL, #1
0117:    11 02                  bnc L_011b
0119:    20 20                  inc BH, #1

L_011b:
011b:    2c                     srl AL, #1
011c:    11 02                  bnc L_0120
011e:    20 2f                  inc BH, #16

L_0120:
0120:    2c                     srl AL, #1
0121:    11 02                  bnc L_0125
0123:    20 3f                  inc BL, #16

L_0125:
0125:    2c                     srl AL, #1
0126:    11 02                  bnc L_012a
0128:    20 30                  inc BL, #1

L_012a:
012a:    f1 01 bd               st B, [R_01bd|0x01bd]
012d:    69 01 c3               st X, [R_01c3|0x01c3]
0130:    55 60                  mov A, Y
0132:    b1 01 c5               st A, [R_01c5|0x01c5]
0135:    55 80                  mov A, Z
0137:    b1 01 c7               st A, [R_01c7|0x01c7]
013a:    55 a0                  mov A, S
013c:    b1 01 c9               st A, [R_01c9|0x01c9]
013f:    55 c0                  mov A, C
0141:    b1 01 cb               st A, [R_01cb|0x01cb]
0144:    55 e0                  mov A, P
0146:    b1 01 cd               st A, [R_01cd|0x01cd]
0149:    55 ba 08 01            mov S, 0x0801
014d:    60 01 00               ld X, 0x0100

R_0150:
0150:    93 7d                  ld A, [R_01cf|0x01cf]
0152:    5c                     mov Y, A
0153:    14 07                  bz L_015c
0155:    d3 7a                  ld B, [0x01d1]
0157:    f5 01                  st B, [A++]
0159:    c3 78                  ld BL, [0x01d3]
015b:    e8                     st BL, [A]

L_015c:
015c:    93 76                  ld A, [R_01d4|0x01d4]
015e:    5e                     mov Z, A
015f:    14 07                  bz L_0168
0161:    d3 73                  ld B, [0x01d6]
0163:    f5 01                  st B, [A++]
0165:    c3 71                  ld BL, [0x01d8]
0167:    e8                     st BL, [A]

L_0168:
0168:    3a                     clr A, #0
0169:    b3 64                  st A, [R_01cf|0x01cf]
016b:    b3 67                  st A, [R_01d4|0x01d4]
016d:    80 c5                  ld AL, 0xc5
016f:    d0 f2 00               ld B, 0xf200
0172:    f6 13 00               mov Device[B + 0x00], AL
0175:    79 03 06               call R_0306
0178:    79 07 af               call WriteString
017b:        str = "* \0"
017e:    91 01 c3               ld A, [R_01c3|0x01c3]
0181:    14 37                  bz L_01ba
0183:    5b                     mov X, A
0184:    31 42                  dec X, #3
0186:    51 46                  sub Y, X
0188:    15 11                  bnz L_019b
018a:    79 07 af               call WriteString
018d:        str = "(TRAP 1) \0"
0197:    31 42                  dec X, #3
0199:    73 13                  jmp L_01ae

L_019b:
019b:    51 48                  sub Z, X
019d:    15 0f                  bnz L_01ae
019f:    79 07 af               call WriteString
01a2:        str = "(TRAP 2) \0"
01ac:    31 42                  dec X, #3

L_01ae:
01ae:    30 42                  inc X, #3
01b0:    6b 1b                  st X, [R_01cd|0x01cd]
01b2:    94 15                  ld A, @[R_01c9|0x01c9]
01b4:    b3 0d                  st A, [R_01c3|0x01c3]
01b6:    30 11 01 c9            inc [R_01c9|0x01c9], #2

L_01ba:
01ba:    71 02 87               jmp R_0287

R_01bd:
01bd:    <null bytes>


R_01bf:
01bf:    <null bytes>


R_01c1:
01c1:    <null bytes>


R_01c3:
01c3:    <null bytes>


R_01c5:
01c5:    <null bytes>


R_01c7:
01c7:    <null bytes>


R_01c9:
01c9:    <null bytes>


R_01cb:
01cb:    <null bytes>


R_01cd:
01cd:    <null bytes>


R_01cf:
01cf:    <null bytes>


R_01d4:
01d4:    <null bytes>


R_01d9:
01d9:    <null bytes>


R_01da:
01da:    <null bytes>


R_01db:
01db:    <null bytes>


R_01dc:
01dc:    <null bytes>


R_01df:
01df:    <null bytes>


R_01e6:
01e6:    <null bytes>


R_01e7:
01e7:    00

R_01e8:
01e8:    00

R_01e9:
01e9:    00

R_01ea:
01ea:    00

R_01eb:
01eb:    00
01ec:    00

R_01ed:
01ed:    00

R_01ee:
01ee:    00

R_01ef:
01ef:    00

R_01f0:
01f0:    91 01 e8               ld A, [R_01e8|0x01e8]
01f3:    15 02                  bnz L_01f7
01f5:    93 d6                  ld A, [R_01cd|0x01cd]

L_01f7:
01f7:    b1 02 73               st A, [R_0273|0x0273]
01fa:    61 01 eb               ld X, [R_01eb|0x01eb]
01fd:    14 06                  bz L_0205
01ff:    d0 01 cf               ld B, 0x01cf
0202:    79 02 75               call R_0275

L_0205:
0205:    61 01 ee               ld X, [R_01ee|0x01ee]
0208:    14 1d                  bz L_0227
020a:    d0 01 d4               ld B, 0x01d4
020d:    79 02 75               call R_0275
0210:    91 01 eb               ld A, [R_01eb|0x01eb]
0213:    51 04                  sub X, A
0215:    17 03                  bp L_021a
0217:    33 40                  not X, #0
0219:    3e                     inc X

L_021a:
021a:    31 41                  dec X, #2
021c:    18 09                  bgt L_0227
021e:    79 01 50               call R_0150
0221:    71 04 11               jmp R_0411
0224:    71
0225:    01
0226:    50

L_0227:
0227:    81 01 0e               ld AL, [intState+1|0x010e]	 ; Restore interrupts state
022a:    15 01                  bnz L_022d
022c:    04                     ei	 ; Zero for enable

L_022d:
022d:    d1 01 bd               ld B, [R_01bd|0x01bd]
0230:    2a                     clr AL, #0
0231:    24 30                  srl BL, #1
0233:    27 10                  rlc AL, #1
0235:    24 33                  srl BL, #4
0237:    27 10                  rlc AL, #1
0239:    25 23                  sll BH, #4
023b:    27 10                  rlc AL, #1
023d:    25 23                  sll BH, #4
023f:    27 10                  rlc AL, #1
0241:    25 13                  sll AL, #4
0243:    a1 01 11               st AL, [ccFlags+1|0x0111]
0246:    90 00 00               ld A, 0x0000
0249:    d7 fe                  mov IL15(P), A
024b:    90 00 00               ld A, 0x0000
024e:    d7 fc                  mov IL15(C), A
0250:    d1 01 c1               ld B, [R_01c1|0x01c1]
0253:    61 01 c3               ld X, [R_01c3|0x01c3]
0256:    91 01 c5               ld A, [R_01c5|0x01c5]
0259:    5c                     mov Y, A
025a:    91 01 c7               ld A, [R_01c7|0x01c7]
025d:    5e                     mov Z, A
025e:    91 01 c9               ld A, [R_01c9|0x01c9]
0261:    5f                     mov S, A
0262:    91 01 cb               ld A, [R_01cb|0x01cb]
0265:    55 0c                  mov C, A
0267:    91 01 cd               ld A, [R_01cd|0x01cd]
026a:    55 0e                  mov P, A
026c:    91 01 bf               ld A, [R_01bf|0x01bf]
026f:    6f 01 11               stcc [0x0111]
0272:    71 00 00               jmp 0x0000

R_0275:
0275:    9d                     ld A, [S]
0276:    b5 21                  st A, [B++]
0278:    5c                     mov Y, A
0279:    8b                     ld AL, [Y]
027a:    a5 21                  st AL, [B++]
027c:    80 79                  ld AL, 0x79
027e:    a5 61                  st AL, [Y++]
0280:    9b                     ld A, [Y]
0281:    b9                     st A, [B]
0282:    90 01 00               ld A, 0x0100
0285:    bb                     st A, [Y]
0286:    09                     ret

R_0287:
0287:    80 f8                  ld AL, 0xf8
0289:    a0 00                  st AL, 0x00
028b:    2e 30 02 8a 01 e6      rpf1 [R_028a|0x028a], [R_01e6|0x01e6]
0291:    e6 fe                  mov A, IL15(P)
0293:    b1 02 47               st A, [R_0247|0x0247]
0296:    e6 fc                  mov A, IL15(C)
0298:    b1 02 4c               st A, [R_024c|0x024c]
029b:    3a                     clr A, #0
029c:    d7 fc                  mov IL15(C), A
029e:    90 07 56               ld A, 0x0756
02a1:    d7 fe                  mov IL15(P), A
02a3:    55 40                  mov A, X
02a5:    7b 0d                  call R_02b4
02a7:    79 03 06               call R_0306
02aa:    71 04 11               jmp R_0411

R_02ad:
02ad:    a1 01 dc               st AL, [R_01dc|0x01dc]
02b0:    c0 02                  ld BL, 0x02
02b2:    73 09                  jmp L_02bd

R_02b4:
02b4:    b1 01 dc               st A, [R_01dc|0x01dc]
02b7:    c0 04                  ld BL, 0x04
02b9:    73 02                  jmp L_02bd

R_02bb:
02bb:    c0 06                  ld BL, 0x06

L_02bd:
02bd:    e5 a2                  st BL, [--S]
02bf:    47 9c 05 c0 01 df      memset 0x06, 0xc0, [R_01df|0x01df]
02c5:    80 06                  ld AL, 0x06
02c7:    46 e2 90 01 df 01 dc   baseconv(e, 2) [R_01df|0x01df], [R_01dc|0x01dc]
02ce:    c5 a1                  ld BL, [S++]
02d0:    7e 43                  push {X, Y}
02d2:    32 40                  clr X, #0
02d4:    45 35                  mov XL, BL
02d6:    55 76 01 df            mov Y, 0x01df

L_02da:
02da:    85 61                  ld AL, [Y++]
02dc:    7b 35                  call WriteChar
02de:    3f                     dec X
02df:    18 f9                  bgt L_02da
02e1:    7f 43                  pop {X, Y}
02e3:    09                     ret

ReadChar:
02e4:    e5 a2                  st BL, [--S]

L_02e6:
02e6:    d0 f2 00               ld B, 0xf200
02e9:    f6 12 00               mov AL, Device[B + 0x00]
02ec:    2c                     srl AL, #1
02ed:    11 f7                  bnc L_02e6
02ef:    f6 12 01               mov AL, Device[B + 0x01]
02f2:    c0 80                  ld BL, 0x80
02f4:    43 31                  or AL, BL
02f6:    c0 e1                  ld BL, 0xe1
02f8:    49                     sub BL, AL
02f9:    16 04                  blt L_02ff
02fb:    80 c1                  ld AL, 0xc1
02fd:    40 31                  add AL, BL

L_02ff:
02ff:    7b 12                  call WriteChar
0301:    c5 a1                  ld BL, [S++]

L_0303:
0303:    a3 0d                  st AL, [R_0312|0x0312]
0305:    09                     ret

R_0306:
0306:    83 0a                  ld AL, [R_0312|0x0312]
0308:    c0 8d                  ld BL, 0x8d
030a:    49                     sub BL, AL
030b:    14 04                  bz L_0311
030d:    80 8d                  ld AL, 0x8d
030f:    7b 02                  call WriteChar

L_0311:
0311:    09                     ret

R_0312:
0312:    00

WriteChar:
0313:    45 10                  mov AH, AL
0315:    d0 f2 00               ld B, 0xf200

L_0318:
0318:    f6 12 00               mov AL, Device[B + 0x00]
031b:    24 11                  srl AL, #2
031d:    11 f9                  bnc L_0318
031f:    45 01                  mov AL, AH
0321:    f6 13 01               mov Device[B + 0x01], AL
0324:    c0 8d                  ld BL, 0x8d
0326:    49                     sub BL, AL
0327:    15 da                  bnz L_0303
0329:    80 8a                  ld AL, 0x8a
032b:    45 10                  mov AH, AL
032d:    d0 f2 00               ld B, 0xf200

L_0330:
0330:    f6 12 00               mov AL, Device[B + 0x00]
0333:    24 11                  srl AL, #2
0335:    11 f9                  bnc L_0330
0337:    45 01                  mov AL, AH
0339:    f6 13 01               mov Device[B + 0x01], AL
033c:    80 8d                  ld AL, 0x8d
033e:    73 c3                  jmp L_0303

R_0340:
0340:    b0 00 00               st A, 0x0000
0343:    f0 00 00               st B, 0x0000
0346:    6d a2                  st X, [--S]
0348:    47 9c 03 00 03 8d      memset 0x04, 0x00, [R_038d|0x038d]

L_034e:
034e:    60 03 b0               ld X, 0x03b0

R_0351:
0351:    47 9c 02 00 03 91      memset 0x03, 0x00, [NumBuffer|0x0391]

L_0357:
0357:    7b 8b                  call ReadChar
0359:    a3 5d                  st AL, [L_03b7+1|0x03b8]
035b:    c0 cc                  ld BL, 0xcc
035d:    49                     sub BL, AL
035e:    15 04                  bnz L_0364
0360:    a0 00                  st AL, 0x00
0362:    73 f3                  jmp L_0357

L_0364:
0364:    c0 b9                  ld BL, 0xb9
0366:    49                     sub BL, AL
0367:    18 15                  bgt L_037e
0369:    c0 b0                  ld BL, 0xb0
036b:    49                     sub BL, AL
036c:    16 26                  blt L_0394

AddHexDigitToNumBuffer:
036e:    a3 1d                  st AL, [R_038d|0x038d]
0370:    46 02 5c 10 03 91      mulbig(0, 2) 0x10, [NumBuffer|0x0391]
0376:    83 1b                  ld AL, [0x0393]	 ; [NumBuffer] = [NumBuffer] * 16 + BL
0378:    40 31                  add AL, BL
037a:    a3 17                  st AL, [0x0393]
037c:    73 d9                  jmp L_0357

L_037e:
037e:    c0 c6                  ld BL, 0xc6
0380:    49                     sub BL, AL
0381:    18 11                  bgt L_0394
0383:    c0 c1                  ld BL, 0xc1
0385:    49                     sub BL, AL
0386:    16 0c                  blt L_0394
0388:    80 0a                  ld AL, 0x0a
038a:    48                     add BL, AL
038b:    73 e1                  jmp AddHexDigitToNumBuffer

R_038d:
038d:    00

R_038e:
038e:    00
038f:    00
0390:    00

NumBuffer:
0391:    00	 ; A 3-byte buffer, used for entering numeric values
0392:    00
0393:    00

L_0394:
0394:    75 40                  jmp [X]

R_0396:
0396:    46 22 50 03 91 03 8e   mulbig(2, 2) [NumBuffer|0x0391], [R_038e|0x038e]
039d:    73 18                  jmp L_03b7

R_039f:
039f:    46 22 60 03 91 03 8e   unkbig6(2, 2) [NumBuffer|0x0391], [R_038e|0x038e]
03a6:    12 69                  bn R_0411
03a8:    73 0d                  jmp L_03b7

R_03aa:
03aa:    46 02 5c ff 03 91      mulbig(0, 2) 0xff, [NumBuffer|0x0391]

R_03b0:
03b0:    46 22 00 03 91 03 8e   addbig(2, 2) [NumBuffer|0x0391], [R_038e|0x038e]

L_03b7:
03b7:    80 00                  ld AL, 0x00
03b9:    c0 ab                  ld BL, 0xab
03bb:    49                     sub BL, AL
03bc:    14 90                  bz L_034e
03be:    c0 ad                  ld BL, 0xad
03c0:    49                     sub BL, AL
03c1:    15 05                  bnz L_03c8
03c3:    60 03 aa               ld X, 0x03aa
03c6:    73 89                  jmp R_0351

L_03c8:
03c8:    c0 aa                  ld BL, 0xaa
03ca:    49                     sub BL, AL
03cb:    15 06                  bnz L_03d3
03cd:    60 03 96               ld X, 0x0396
03d0:    71 03 51               jmp R_0351

L_03d3:
03d3:    c0 af                  ld BL, 0xaf
03d5:    49                     sub BL, AL
03d6:    15 06                  bnz L_03de
03d8:    60 03 9f               ld X, 0x039f
03db:    71 03 51               jmp R_0351

L_03de:
03de:    65 a1                  ld X, [S++]
03e0:    c0 a0                  ld BL, 0xa0
03e2:    49                     sub BL, AL
03e3:    14 0f                  bz L_03f4
03e5:    c0 ac                  ld BL, 0xac
03e7:    49                     sub BL, AL
03e8:    14 0a                  bz L_03f4
03ea:    c0 8d                  ld BL, 0x8d
03ec:    49                     sub BL, AL
03ed:    14 05                  bz L_03f4
03ef:    65 a1                  ld X, [S++]
03f1:    71 04 11               jmp R_0411

L_03f4:
03f4:    91 03 41               ld A, [R_0340+1|0x0341]
03f7:    47 42 02 03 8e 00      memcpy 0x03, [R_038e|0x038e], [A]
03fd:    83 8e                  ld AL, [R_038d|0x038d]
03ff:    15 03                  bnz L_0404
0401:    61 03 44               ld X, [R_0344|0x0344]

L_0404:
0404:    83 b2                  ld AL, [L_03b7+1|0x03b8]
0406:    09                     ret
0407:    47
0408:    40
0409:    02
040a:    01
040b:    e7 'g'
040c:    01
040d:    dc '\'
040e:    79
040f:    02
0410:    bb ';'	 ; '	 ; '	 ; '

R_0411:
0411:    2a                     clr AL, #0
0412:    a1 03 61               st AL, [R_0361|0x0361]
0415:    79 03 06               call R_0306
0418:    80 be                  ld AL, 0xbe
041a:    79 03 13               call WriteChar
041d:    79 02 e4               call ReadChar
0420:    c0 da                  ld BL, 0xda
0422:    49                     sub BL, AL
0423:    18 ec                  bgt R_0411
0425:    d0 00 c1               ld B, 0x00c1
0428:    49                     sub BL, AL
0429:    16 e6                  blt R_0411
042b:    35 20                  sll B, #1
042d:    90 07 b9               ld A, 0x07b9
0430:    58                     add B, A
0431:    99                     ld A, [B]
0432:    14 dd                  bz R_0411
0434:    16 04                  blt L_043a
0436:    b3 29                  st A, [0x0461]
0438:    73 25                  jmp L_045f

L_043a:
043a:    d0 80 00               ld B, 0x8000
043d:    59                     sub B, A
043e:    f3 21                  st B, [0x0461]
0440:    47 9c 08 00 01 e7      memset 0x09, 0x00, [R_01e7|0x01e7]
0446:    60 01 e7               ld X, 0x01e7

L_0449:
0449:    90 01 f0               ld A, 0x01f0
044c:    51 40                  sub A, X
044e:    14 c1                  bz R_0411
0450:    55 40                  mov A, X
0452:    d0 04 58               ld B, 0x0458
0455:    79 03 40               call R_0340

R_0458:
0458:    30 42                  inc X, #3
045a:    c0 ac                  ld BL, 0xac
045c:    49                     sub BL, AL
045d:    14 ea                  bz L_0449

L_045f:
045f:    3a                     clr A, #0
0460:    71 00 00               jmp 0x0000
0463:    47
0464:    40
0465:    02
0466:    01
0467:    e7 'g'
0468:    01
0469:    d9 'Y'

L_046a:
046a:    79 06 0b               call R_060b
046d:    79 02 ad               call R_02ad
0470:    80 ad                  ld AL, 0xad
0472:    79 03 13               call WriteChar

L_0475:
0475:    90 01 e7               ld A, 0x01e7
0478:    d0 04 84               ld B, 0x0484
047b:    79 03 40               call R_0340
047e:    81 01 e9               ld AL, [R_01e9|0x01e9]
0481:    79 06 1f               call R_061f

R_0484:
0484:    46 02 0c 01 01 d9      addbig(0, 2) 0x01, [R_01d9|0x01d9]
048a:    81 03 12               ld AL, [R_0312|0x0312]
048d:    c0 8d                  ld BL, 0x8d
048f:    49                     sub BL, AL
0490:    15 03                  bnz L_0495
0492:    71 04 11               jmp R_0411

L_0495:
0495:    c0 ac                  ld BL, 0xac
0497:    49                     sub BL, AL
0498:    14 db                  bz L_0475
049a:    73 ce                  jmp L_046a

R_049c:
049c:    39                     dec A, #1

R_049d:
049d:    39                     dec A, #1

R_049e:
049e:    39                     dec A, #1

R_049f:
049f:    39                     dec A, #1

R_04a0:
04a0:    39                     dec A, #1

R_04a1:
04a1:    39                     dec A, #1

R_04a2:
04a2:    39                     dec A, #1

R_04a3:
04a3:    39                     dec A, #1

R_04a4:
04a4:    5b                     mov X, A
04a5:    3d                     sll A, #1
04a6:    d0 01 cd               ld B, 0x01cd
04a9:    58                     add B, A
04aa:    55 26                  mov Y, B
04ac:    80 a0                  ld AL, 0xa0
04ae:    79 03 13               call WriteChar

L_04b1:
04b1:    9b                     ld A, [Y]
04b2:    79 02 b4               call R_02b4
04b5:    80 ad                  ld AL, 0xad
04b7:    79 03 13               call WriteChar

L_04ba:
04ba:    90 01 e7               ld A, 0x01e7
04bd:    d0 04 c7               ld B, 0x04c7
04c0:    79 03 40               call R_0340
04c3:    d1 01 e8               ld B, [R_01e8|0x01e8]
04c6:    fb                     st B, [Y]

R_04c7:
04c7:    d5 61                  ld B, [Y++]
04c9:    3e                     inc X
04ca:    18 0c                  bgt L_04d8
04cc:    c0 8d                  ld BL, 0x8d
04ce:    49                     sub BL, AL
04cf:    14 07                  bz L_04d8
04d1:    c0 ac                  ld BL, 0xac
04d3:    49                     sub BL, AL
04d4:    14 e4                  bz L_04ba
04d6:    73 d9                  jmp L_04b1

L_04d8:
04d8:    71 04 11               jmp R_0411
04db:    47
04dc:    40
04dd:    02
04de:    01
04df:    e7 'g'
04e0:    01
04e1:    d9 'Y'

R_04e2:
04e2:    79 05 8f               call R_058f
04e5:    47 80 02 01 ea 01 e7   memcmp 0x03, [R_01ea|0x01ea], [R_01e7|0x01e7]
04ec:    18 ea                  bgt L_04d8
04ee:    79 03 06               call R_0306
04f1:    47 9c 0f ae 05 a6      memset 0x10, 0xae, [R_05a6|0x05a6]
04f7:    47 40 02 01 d9 01 dc   memcpy 0x03, [R_01d9|0x01d9], [R_01dc|0x01dc]
04fe:    79 02 bb               call R_02bb
0501:    80 a0                  ld AL, 0xa0
0503:    79 03 13               call WriteChar
0506:    79 03 13               call WriteChar
0509:    60 05 a6               ld X, 0x05a6
050c:    81 01 db               ld AL, [R_01db|0x01db]
050f:    d0 00 0f               ld B, 0x000f
0512:    5a                     and B, A
0513:    55 26                  mov Y, B

L_0515:
0515:    31 60                  dec Y, #1
0517:    16 0f                  blt L_0528
0519:    80 a0                  ld AL, 0xa0
051b:    79 03 13               call WriteChar
051e:    79 03 13               call WriteChar
0521:    79 03 13               call WriteChar
0524:    a5 41                  st AL, [X++]
0526:    73 ed                  jmp L_0515

L_0528:
0528:    47 80 02 01 ea 01 d9   memcmp 0x03, [R_01ea|0x01ea], [R_01d9|0x01d9]
052f:    18 2b                  bgt L_055c
0531:    79 06 0b               call R_060b
0534:    46 02 0c 01 01 d9      addbig(0, 2) 0x01, [R_01d9|0x01d9]
053a:    c0 ff                  ld BL, 0xff
053c:    49                     sub BL, AL
053d:    14 06                  bz L_0545
053f:    c0 a0                  ld BL, 0xa0
0541:    49                     sub BL, AL
0542:    11 01                  bnc L_0545
0544:    aa                     st AL, [X]

L_0545:
0545:    3e                     inc X
0546:    79 02 ad               call R_02ad
0549:    80 a0                  ld AL, 0xa0
054b:    79 03 13               call WriteChar
054e:    80 0f                  ld AL, 0x0f
0550:    c1 01 db               ld BL, [R_01db|0x01db]
0553:    4a                     and BL, AL
0554:    15 d2                  bnz L_0528
0556:    79 05 7e               call R_057e
0559:    71 04 e2               jmp R_04e2

L_055c:
055c:    2a                     clr AL, #0
055d:    aa                     st AL, [X]
055e:    90 00 0f               ld A, 0x000f
0561:    5b                     mov X, A
0562:    d1 01 da               ld B, [R_01da|0x01da]
0565:    5a                     and B, A
0566:    51 24                  sub X, B
0568:    3f                     dec X

L_0569:
0569:    3e                     inc X
056a:    18 0d                  bgt L_0579
056c:    80 a0                  ld AL, 0xa0
056e:    79 03 13               call WriteChar
0571:    79 03 13               call WriteChar
0574:    79 03 13               call WriteChar
0577:    73 f0                  jmp L_0569

L_0579:
0579:    7b 03                  call R_057e
057b:    71 04 11               jmp R_0411

R_057e:
057e:    6d a2                  st X, [--S]
0580:    60 05 a3               ld X, 0x05a3

L_0583:
0583:    85 41                  ld AL, [X++]
0585:    14 05                  bz L_058c
0587:    79 03 13               call WriteChar
058a:    73 f7                  jmp L_0583

L_058c:
058c:    65 a1                  ld X, [S++]
058e:    09                     ret

R_058f:
058f:    d0 f2 00               ld B, 0xf200
0592:    f6 12 00               mov AL, Device[B + 0x00]
0595:    2c                     srl AL, #1
0596:    11 0a                  bnc L_05a2
0598:    f6 12 01               mov AL, Device[B + 0x01]
059b:    21 12                  dec AL, #3
059d:    15 03                  bnz L_05a2
059f:    60 04 11               ld X, 0x0411

L_05a2:
05a2:    09                     ret

R_05a3:
05a3:    a0 a0                  st AL, 0xa0
05a5:    a0 00                  st AL, 0x00
05a7:    <null bytes>

05b7:    47
05b8:    80
05b9:    02
05ba:    01
05bb:    ea 'j'
05bc:    01
05bd:    e7 'g'
05be:    18
05bf:    17
05c0:    7b
05c1:    cd 'M'
05c2:    47
05c3:    40
05c4:    02
05c5:    01
05c6:    e7 'g'
05c7:    01
05c8:    d9 'Y'
05c9:    81
05ca:    01
05cb:    ef 'o'
05cc:    79
05cd:    06
05ce:    1f
05cf:    46
05d0:    02
05d1:    0c
05d2:    01
05d3:    01
05d4:    e7 'g'
05d5:    73
05d6:    e0 '`'
05d7:    71
05d8:    04
05d9:    11
05da:    47
05db:    80
05dc:    02
05dd:    01
05de:    ea 'j'
05df:    01
05e0:    e7 'g'
05e1:    18
05e2:    f4 't'
05e3:    7b
05e4:    aa '*'
05e5:    47
05e6:    40
05e7:    02
05e8:    01
05e9:    e7 'g'
05ea:    01
05eb:    d9 'Y'
05ec:    79
05ed:    06
05ee:    0b
05ef:    a5 '%'
05f0:    a2 '"'
05f1:    47
05f2:    40
05f3:    02
05f4:    01
05f5:    ed 'm'
05f6:    01
05f7:    d9 'Y'
05f8:    85
05f9:    a1 '!'
05fa:    79
05fb:    06
05fc:    1f
05fd:    46
05fe:    02
05ff:    0c
0600:    01
0601:    01
0602:    e7 'g'
0603:    46
0604:    02
0605:    0c
0606:    01
0607:    01
0608:    ed 'm'
0609:    73
060a:    cf 'O'

R_060b:
060b:    81 03 61               ld AL, [R_0361|0x0361]
060e:    14 04                  bz L_0614
0610:    82 01 da               ld AL, @[R_01da|0x01da]
0613:    09                     ret

L_0614:
0614:    79 06 47               call R_0647
0617:    88                     ld AL, [A]
0618:    2e 20 02 8a 01 e6      wpf1 [R_028a|0x028a], [R_01e6|0x01e6]
061e:    09                     ret

R_061f:
061f:    c1 03 61               ld BL, [R_0361|0x0361]
0622:    14 0e                  bz L_0632
0624:    a2 01 da               st AL, @[R_01da|0x01da]
0627:    45 12                  mov BH, AL
0629:    82 01 da               ld AL, @[R_01da|0x01da]
062c:    4d                     mov BL, AL
062d:    41 23                  sub BL, BH
062f:    15 2c                  bnz L_065d
0631:    09                     ret

L_0632:
0632:    a5 a2                  st AL, [--S]
0634:    79 06 47               call R_0647
0637:    c5 a1                  ld BL, [S++]
0639:    e8                     st BL, [A]
063a:    45 32                  mov BH, BL
063c:    88                     ld AL, [A]
063d:    2e 20 02 8a 01 e6      wpf1 [R_028a|0x028a], [R_01e6|0x01e6]
0643:    49                     sub BL, AL
0644:    15 17                  bnz L_065d
0646:    09                     ret

R_0647:
0647:    91 01 d9               ld A, [R_01d9|0x01d9]
064a:    34 02                  srl A, #3
064c:    a0 00                  st AL, 0x00
064e:    2e 20 02 8a 06 4d      wpf1 [R_028a|0x028a], [R_064d|0x064d]
0654:    91 01 da               ld A, [R_01da|0x01da]
0657:    d0 f8 00               ld B, 0xf800
065a:    53 20                  or A, B
065c:    09                     ret

L_065d:
065d:    a5 a2                  st AL, [--S]
065f:    45 21                  mov AL, BH
0661:    a5 a2                  st AL, [--S]
0663:    47 8c 02 03 f0 00 01 d9 memcmp 0x03, 0x03f000, [R_01d9|0x01d9]
066b:    16 03                  blt L_0670
066d:    95 a1                  ld A, [S++]
066f:    09                     ret

L_0670:
0670:    47 40 02 01 d9 01 dc   memcpy 0x03, [R_01d9|0x01d9], [R_01dc|0x01dc]
0677:    79 03 06               call R_0306
067a:    79 07 af               call WriteString
067d:        str = "MEMORY ERROR AT ADDRESS: \0"
0697:    79 02 bb               call R_02bb
069a:    79 07 af               call WriteString
069d:        str = "    EXPECTED=\0"
06ab:    85 a1                  ld AL, [S++]
06ad:    79 02 ad               call R_02ad
06b0:    79 07 af               call WriteString
06b3:        str = ", ACTUAL=\0"
06bd:    85 a1                  ld AL, [S++]
06bf:    79 02 ad               call R_02ad
06c2:    79 03 06               call R_0306
06c5:    09                     ret
06c6:    91
06c7:    01
06c8:    e8 'h'
06c9:    3b
06ca:    2f
06cb:    02
06cc:    91
06cd:    01
06ce:    eb 'k'
06cf:    2f
06d0:    00
06d1:    81
06d2:    01
06d3:    ef 'o'
06d4:    25
06d5:    11
06d6:    28
06d7:    25
06d8:    11
06d9:    a3 '#'
06da:    01
06db:    2f
06dc:    04
06dd:    2f
06de:    06
06df:    71
06e0:    04
06e1:    11

R_06e2:
06e2:    79 02 e4               call ReadChar
06e5:    c0 c5                  ld BL, 0xc5
06e7:    49                     sub BL, AL
06e8:    14 08                  bz L_06f2
06ea:    c0 c4                  ld BL, 0xc4
06ec:    49                     sub BL, AL
06ed:    14 06                  bz L_06f5

L_06ef:
06ef:    71 04 11               jmp R_0411

L_06f2:
06f2:    2a                     clr AL, #0
06f3:    73 02                  jmp L_06f7

L_06f5:
06f5:    80 01                  ld AL, 0x01

L_06f7:
06f7:    a1 01 0e               st AL, [intState+1|0x010e]
06fa:    73 f3                  jmp L_06ef

R_06fc:
06fc:    c6                     acquire_semaphore
06fd:    05                     di
06fe:    32 c0                  clr C, #0
0700:    3a                     clr A, #0
0701:    d7 0c                  mov IL0(C), A
0703:    2f 08                  ld_isr A
0705:    90 01 00               ld A, 0x0100
0708:    d7 0e                  mov IL0(P), A
070a:    47 40 19 07 1c 01 00   memcpy 0x1a, [R_071c|0x071c], [Start|0x0100]
0711:    47 40 1f 07 36 01 40   memcpy 0x20, [R_0736|0x0736], [0x0140]
0718:    0a                     reti
0719:    71 01 00               jmp Start

R_071c:
071c:    2e 0c f8 01 40         wpf 0xf8, [0x0140]
0721:    2a                     clr AL, #0
0722:    a1 f2 0d               st AL, [0xf20d]
0725:    a1 f1 4b               st AL, [0xf14b]
0728:    a1 f1 4d               st AL, [0xf14d]
072b:    a1 f2 1d               st AL, [0xf21d]
072e:    3a                     clr A, #0
072f:    5d                     mov B, A
0730:    5b                     mov X, A
0731:    5c                     mov Y, A
0732:    5e                     mov Z, A
0733:    71 fd 00               jmp L_fd00

R_0736:
0736:    00
0737:    01
0738:    02
0739:    03
073a:    04
073b:    05
073c:    06
073d:    07
073e:    08
073f:    09
0740:    0a
0741:    0b
0742:    0c
0743:    0d
0744:    0e
0745:    0f
0746:    10
0747:    11
0748:    12
0749:    13
074a:    14
074b:    15
074c:    16
074d:    17
074e:    18
074f:    19
0750:    1a
0751:    1b
0752:    1c
0753:    1d
0754:    7e
0755:    7f

R_0756:
0756:    a0 00                  st AL, 0x00
0758:    e6 0e                  mov A, IL0(P)
075a:    b0 00 00               st A, 0x0000
075d:    90 07 65               ld A, 0x0765
0760:    d7 0e                  mov IL0(P), A
0762:    0a                     reti
0763:    73 f1                  jmp R_0756

R_0765:
0765:    79 03 06               call R_0306
0768:    79 07 af               call WriteString
076b:        str = "LEVEL-15 INTERRUPT, CODE=\0"
0785:    83 d0                  ld AL, [R_0756+1|0x0757]
0787:    79 02 ad               call R_02ad
078a:    79 07 af               call WriteString
078d:        str = ", Z=\0"
0792:    e6 f8                  mov A, IL15(Z)
0794:    79 02 b4               call R_02b4
0797:    79 07 af               call WriteString
079a:        str = ", PC=\0"
07a0:    93 b9                  ld A, [0x075b]
07a2:    79 02 b4               call R_02b4
07a5:    79 03 06               call R_0306
07a8:    55 ba 08 01            mov S, 0x0801
07ac:    71 04 11               jmp R_0411

WriteString:
07af:    85 41                  ld AL, [X++]
07b1:    15 01                  bnz L_07b4
07b3:    09                     ret

L_07b4:
07b4:    79 03 13               call WriteChar
07b7:    73 f6                  jmp WriteString

R_07b9:
07b9:    04                     ei
07ba:    9d                     ld A, [S]
07bb:    04                     ei
07bc:    9e                     ld A, [C]
07bd:    04                     ei
07be:    a3 84                  st AL, [0x0744]
07c0:    db                     ld B, [Y]
07c1:    00                     HALT
07c2:    00                     HALT
07c3:    85                     unknown
07c4:    b7                     unknown
07c5:    81 f0 84               ld AL, [0xf084]
07c8:    07                     rl
07c9:    06                     sl
07ca:    e2 00 00               st BL, @[0x0000]
07cd:    00                     HALT
07ce:    00                     HALT
07cf:    06                     sl
07d0:    fc                     st B, [Z]
07d1:    84 63                  ld AL, @[0x0836]
07d3:    00                     HALT
07d4:    00                     HALT
07d5:    00                     HALT
07d6:    00                     HALT
07d7:    04                     ei
07d8:    a4 00                  st AL, @[0x07da]
07da:    00                     HALT
07db:    00                     HALT
07dc:    00                     HALT
07dd:    04                     ei
07de:    a2 85 da               st AL, @[R_85da|0x85da]
07e1:    86                     disable_parity_trap
07e2:    c6                     acquire_semaphore
07e3:    04                     ei
07e4:    9c                     ld A, [Z]
07e5:    00                     HALT
07e6:    00                     HALT
07e7:    04                     ei
07e8:    9f                     ld A, [P]
07e9:    04                     ei
07ea:    a0 04                  st AL, 0x04
07ec:    a1 00 00               st AL, [0x0000]
07ef:    <null bytes>


R_0801:
0801:    <null bytes>


R_81f0:
81f0:    <null bytes>


R_8407:
8407:    <null bytes>


R_8463:
8463:    <null bytes>


R_84db:
84db:    <null bytes>


R_85b7:
85b7:    <null bytes>


R_85da:
85da:    <null bytes>


R_86c6:
86c6:    <null bytes>


L_fd00:
fd00:    <null bytes>

