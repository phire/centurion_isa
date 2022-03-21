
TEST_0:
9000:    03 6d              0x36d
9002:    "CMD AUX MEMORY TEST\r\n\0"

TEST_1:
9018:    04 6d              0x46d
901a:    "CMD SEEK TEST\r\n\0"

TEST_2:
902a:    05 31              0x531
902c:    "CMD READ TEST\r\n\0"

TEST_3:
903c:    02 ce              0x2ce
903e:    "FLOPPY COMMAND BUFFER TEST\r\n\0"

TEST_4:
905b:    05 e8              0x5e8
905d:    "FLOPPY SEEK TEST\r\n\0"

TEST_5:
9070:    06 9b              0x69b
9072:    "FLOPPY READ TEST\r\n\0"

TEST_6:
9085:    07 47              0x747
9087:    "ROM SELF TEST\r\n\n\0"

TEST_7:
9098:    00 00              0x0

WriteString:
909a:    85 41        ld r?, [r?++]
909c:    15 01        beq L0
909e:    09           ret 9

L0:
909f:    7b 02        call L1
90a1:    73 f7        jump WriteString

L1:
90a3:    c1 f2 00     c1 A, 0xf200
90a6:    24 30        unknown
90a8:    24 30        unknown
90aa:    11 f7        b1 L1
90ac:    a1 f2 01     stb A, 0xf201
90af:    09           ret 9

ReadChar:
90b0:    81 f2 00     ldb A, 0xf200
90b3:    2c           unknown
90b4:    11 fa        b1 ReadChar
90b6:    81 f2 01     ldb A, 0xf201
90b9:    09           ret 9

Fn_0ba:
90ba:    a5 a2        unknown
90bc:    45           unknown
90bd:    01           flag1
90be:    7b 05        call Fn_0c5
90c0:    85 a1        ld r?, [r?++]
90c2:    7b 01        call Fn_0c5
90c4:    09           ret 9

Fn_0c5:
90c5:    a5 a2        unknown
90c7:    c0 f0        subb A, 0xf0
90c9:    42           unknown
90ca:    31 07        unknown
90cc:    26 10        unknown
90ce:    2c           unknown
90cf:    2c           unknown
90d0:    2c           unknown
90d1:    c0 b0        subb A, 0xb0
90d3:    40 31        unknown
90d5:    c0 b9        subb A, 0xb9
90d7:    49           unknown
90d8:    19 04        b9 L2
90da:    c0 07        subb A, 0x07
90dc:    40 31        unknown

L2:
90de:    7b c3        call L1
90e0:    85 a1        ld r?, [r?++]
90e2:    c0 0f        subb A, 0x0f
90e4:    42           unknown
90e5:    31 c0        unknown
90e7:    b0 40 31     b0 A, 0x4031
90ea:    c0 b9        subb A, 0xb9
90ec:    49           unknown
90ed:    19 04        b9 L3
90ef:    c0 07        subb A, 0x07
90f1:    40 31        unknown

L3:
90f3:    7b ae        call L1
90f5:    09           ret 9

FinishTest:
90f6:    a1 f1 0a     stb A, 0xf10a
90f9:    81 f2 00     ldb A, 0xf200
90fc:    2c           unknown
90fd:    11 57        b1 L4
90ff:    81 f2 01     ldb A, 0xf201
9102:    c0 80        subb A, 0x80
9104:    43 31        unknown
9106:    c0 83        subb A, 0x83
9108:    49           unknown
9109:    15 4b        beq L4
910b:    81 01 08     ldb A, 0x0108
910e:    14 32        bne L5
9110:    7a 01 12     call [0x0112]
9113:    "\r\n*** FAIL ***\0"
9122:    a1 f1 0b     stb A, 0xf10b
9125:    a1 f1 0c     stb A, 0xf10c

PressSpaceThenExit:
9128:    7a 01 12     call [0x0112]
912b:    "\r\nPRESS SPACE\x07\r\n\0"
913c:    7a 01 02     call [0x0102]
913f:    72 01 00     jump [{N:#06x}] ;

L5:
9142:    7a 01 12     call [0x0112]
9145:    "\r\n*** PASS ***\0"
9154:    73 d2        jump PressSpaceThenExit

L4:
9156:    90 c0 00     liw A, 0xc000
9159:    5f           unknown
915a:    91 01 1a     ldw A, 0x011a
915d:    5e           unknown
915e:    95           unknown
915f:    41 50        unknown
9161:    80 75        lib A, 0x75
9163:    00           unknown

PrintCtrlCToExit:
9164:    7a 01 12     call [0x0112]
9167:    "\r\n(CONTROL-C TO EXIT)\r\n\0"
917f:    09           ret 9

Init:
9180:    3a           xor A, A
9181:    b1 01 08     stw A, 0x0108
9184:    90 01 e3     liw A, 0x01e3
9187:    50 80        add r?, r?
9189:    b1 01 18     stw A, 0x0118
918c:    90 00 c5     liw A, 0x00c5
918f:    50 80        add r?, r?
9191:    b1 01 0a     stw A, 0x010a
9194:    90 02 86     liw A, 0x0286
9197:    50 80        add r?, r?
9199:    b1 01 0c     stw A, 0x010c
919c:    90 01 64     liw A, 0x0164
919f:    50 80        add r?, r?
91a1:    b1 01 06     stw A, 0x0106
91a4:    90 00 b0     liw A, 0x00b0
91a7:    50 80        add r?, r?
91a9:    b1 01 02     stw A, 0x0102
91ac:    90 00 9a     liw A, 0x009a

L7:
91af:    50 80        add r?, r?
91b1:    b1 01 12     stw A, 0x0112
91b4:    90 00 ba     liw A, 0x00ba
91b7:    50 80        add r?, r?
91b9:    b1 01 10     stw A, 0x0110
91bc:    90 00 f6     liw A, 0x00f6
91bf:    50 80        add r?, r?
91c1:    b1 01 04     stw A, 0x0104
91c4:    90 01 28     liw A, 0x0128
91c7:    50 80        add r?, r?
91c9:    b1 01 0e     stw A, 0x010e
91cc:    55 80        alu5 r?, r?
91ce:    b1 01 1a     stw A, 0x011a
91d1:    95           unknown
91d2:    41 b1        unknown
91d4:    01           flag1
91d5:    14 38        bne L6
91d7:    b1 01 16     stw A, 0x0116
91da:    55 40        alu5 r?, r?
91dc:    65           unknown
91dd:    a1 69 01     stb A, 0x6901
91e0:    00           unknown
91e1:    75           unknown
91e2:    00           unknown

Fn_1e3:
91e3:    7a 01 0c     call [0x010c]
91e6:    6d a2        unknown
91e8:    60 03 e8     60 A, 0x03e8

L14:
91eb:    82           unknown
91ec:    01           flag1
91ed:    16 c0        b6 L7
91ef:    08           flag8
91f0:    4a           unknown
91f1:    14 2b        bne L8
91f3:    0e           unknown
91f4:    3f           unknown
91f5:    15 f4        beq L14
91f7:    7a 01 12     call [0x0112]
91fa:    "*** BUSY DID NOT CLEAR ***\0"
9215:    a1 f1 0b     stb A, 0xf10b
9218:    a1 f1 0c     stb A, 0xf10c
921b:    72 01 0e     jump [{N:#06x}] ;

L8:
921e:    60 03 e8     60 A, 0x03e8

L13:
9221:    2c           unknown
9222:    10 2b        b0 L9
9224:    0e           unknown
9225:    3f           unknown
9226:    15 f9        beq L13
9228:    7a 01 12     call [0x0112]
922b:    "*** FOUT NEVER CAME ON ***\0"
9246:    a1 f1 0b     stb A, 0xf10b
9249:    a1 f1 0c     stb A, 0xf10c
924c:    72 01 0e     jump [{N:#06x}] ;

L9:
924f:    03           flag3
9250:    82           unknown
9251:    01           flag1
9252:    14 15        bne L10
9254:    03           flag3
9255:    65           unknown
9256:    a1 09 a5     stb A, 0x09a5
9259:    a2 7a 01     call_alt [0x7a01]
925c:    12
925d:    "*** \0"
9262:    85 a1        ld r?, [r?++]
9264:    7a 01 0a     call [0x010a]
9267:    7a
9268:    01

L10:
9269:    12
926a:    " ERROR ***\r\n\0"
9277:    80 01        lib A, 0x01
9279:    a1 01 08     stb A, 0x0108
927c:    a1 f1 0b     stb A, 0xf10b
927f:    a1 f1 0c     stb A, 0xf10c
9282:    65           unknown
9283:    a1 02 09     stb A, 0x0209

Fn_286:
9286:    6d a2        unknown
9288:    0e           unknown
9289:    60 03 e8     60 A, 0x03e8

L23:
928c:    82           unknown
928d:    01           flag1
928e:    16 2c        b6 L15
9290:    2c           unknown
9291:    11 2d        b1 L16
9293:    0e           unknown
9294:    3f           unknown
9295:    15 f5        beq L23
9297:    7a 01 12     call [0x0112]
929a:    "*** FIN DID NOT GO OFF ***\r\n\0"
92b7:    a1 f1 0b     stb A, 0xf10b
92ba:    a1
92bb:    f1

L15:
92bc:    0c           unknown
92bd:    72 01 0e     jump [{N:#06x}] ;

L16:
92c0:    65           unknown
92c1:    a1 09 90     stb A, 0x0990
92c4:    01           flag1
92c5:    80 50        lib A, 0x50
92c7:    80 7d        lib A, 0x7d
92c9:    00           unknown
92ca:    f8           unknown
92cb:    08           flag8
92cc:    73 09        jump L17

Entry_FLOPPY_COMMAND_BUFFER_TEST:
92ce:    90 01 80     liw A, 0x0180
92d1:    50 80        add r?, r?
92d3:    7d 00        call A + 0x00
92d5:    f8           unknown
92d6:    00           unknown

L17:
92d7:    7a 01 06     call [0x0106]
92da:    32 60        unknown
92dc:    60 00 c8     60 A, 0x00c8
92df:    55 60        alu5 r?, r?
92e1:    d0 01 1c     subw A, 0x011c

L18:
92e4:    a5 21        unknown
92e6:    28           unknown
92e7:    28           unknown
92e8:    28           unknown
92e9:    3f           unknown
92ea:    15 f8        beq L18
92ec:    90 ff 37     liw A, 0xff37
92ef:    2f 02        unknown
92f1:    90 01 1c     liw A, 0x011c
92f4:    2f 00        unknown
92f6:    2f 34        unknown
92f8:    2f 06        unknown
92fa:    80 43        lib A, 0x43
92fc:    a2 01 14     call_alt [0x0114]
92ff:    7a 01 18     call [0x0118]
9302:    60 00 e6     60 A, 0x00e6
9305:    3a           xor A, A
9306:    d0 01 1c     subw A, 0x011c

L19:
9309:    a5 21        unknown
930b:    3f           unknown
930c:    15 fb        beq L19
930e:    90 ff 37     liw A, 0xff37
9311:    2f 02        unknown
9313:    90 01 1c     liw A, 0x011c
9316:    2f 00        unknown
9318:    2f 34        unknown
931a:    2f 06        unknown
931c:    80 44        lib A, 0x44
931e:    a2 01 14     call_alt [0x0114]
9321:    7a 01 18     call [0x0118]
9324:    60 00 c8     60 A, 0x00c8
9327:    d0 01 1c     subw A, 0x011c
932a:    55 60        alu5 r?, r?
932c:    45           unknown
932d:    10 85        b0 L20
932f:    21 41        unknown
9331:    01           flag1
9332:    15 10        beq L21
9334:    20 00        unknown
9336:    20 00        unknown
9338:    20 00        unknown
933a:    3f           unknown
933b:    15 f1        beq L22
933d:    20 70        unknown
933f:    7a 01 04     call [0x0104]
9342:    02           flag2
9343:    da           unknown

L21:
9344:    7a 01 12     call [0x0112]
9347:    "*** COMMAND BUFFER ERROR ***\0"
9364:    a1 f1 0b     stb A, 0xf10b
9367:    a1 f1 0c     stb A, 0xf10c
936a:    72 01 0e     jump [{N:#06x}] ;

Entry_CMD_AUX_MEMORY_TEST:
936d:    90 01 80     liw A, 0x0180
9370:    50 80        add r?, r?
9372:    7d 00        call A + 0x00
9374:    f8           unknown
9375:    08           flag8
9376:    7a 01 06     call [0x0106]
9379:    32 60        unknown
937b:    60 3f ff     60 A, 0x3fff
937e:    55 60        alu5 r?, r?
9380:    d0 01 1c     subw A, 0x011c

L41:
9383:    a5 21        unknown
9385:    28           unknown
9386:    28           unknown
9387:    28           unknown
9388:    3f           unknown
9389:    15 f8        beq L41
938b:    90 c0 00     liw A, 0xc000
938e:    2f 02        unknown
9390:    90

L25:
9391:    01           flag1
9392:    1c 2f        b?? L26
9394:    00           unknown
9395:    2f 34        unknown
9397:    2f 06        unknown
9399:    80 46        lib A, 0x46
939b:    a2 01 14     call_alt [0x0114]
939e:    7a 01 0c     call [0x010c]
93a1:    2a           unknown
93a2:    a2 01 14     call_alt [0x0114]
93a5:    7a 01 0c     call [0x010c]
93a8:    2a           unknown
93a9:    a2 01 14     call_alt [0x0114]
93ac:    7a 01 0c     call [0x010c]
93af:    80 3f        lib A, 0x3f
93b1:    a2 01 14     call_alt [0x0114]
93b4:    7a 01 0c     call [0x010c]
93b7:    80 ff        lib A, 0xff
93b9:    a2 01 14     call_alt [0x0114]
93bc:    7a 01 18     call [0x0118]
93bf:    60 3f ff     60 A, 0x3fff
93c2:    3a           xor A, A

L26:
93c3:    d0 01 1c     subw A, 0x011c

L24:
93c6:    a5 21        unknown
93c8:    3f           unknown
93c9:    15 fb        beq L24
93cb:    90 c0 00     liw A, 0xc000
93ce:    2f 02        unknown
93d0:    90 01 1c     liw A, 0x011c
93d3:    2f 00        unknown
93d5:    2f 34        unknown
93d7:    2f 06        unknown
93d9:    80 47        lib A, 0x47
93db:    a2 01 14     call_alt [0x0114]
93de:    7a 01 0c     call [0x010c]
93e1:    2a           unknown
93e2:    a2 01 14     call_alt [0x0114]
93e5:    7a 01 0c     call [0x010c]
93e8:    2a           unknown
93e9:    a2 01 14     call_alt [0x0114]
93ec:    7a 01 0c     call [0x010c]
93ef:    80 3f        lib A, 0x3f
93f1:    a2 01 14     call_alt [0x0114]
93f4:    7a 01 0c     call [0x010c]
93f7:    80 ff        lib A, 0xff
93f9:    a2 01 14     call_alt [0x0114]
93fc:    7a 01 18     call [0x0118]
93ff:    b5 a2        unknown
9401:    60 3f ff     60 A, 0x3fff
9404:    d0 01 1c     subw A, 0x011c
9407:    55 60        alu5 r?, r?
9409:    45           unknown
940a:    10 85        b0 L25
940c:    21 bd        unknown
940e:    41 01        unknown
9410:    15 12        beq L27
9412:    20 00        unknown
9414:    20 00        unknown
9416:    20 00        unknown
9418:    3f           unknown
9419:    15 f0        beq L28
941b:    95           unknown
941c:    a1 20 70     stb A, 0x2070
941f:    7a 01 04     call [0x0104]
9422:    03           flag3
9423:    79           unknown

L27:
9424:    a1 f1 0b     stb A, 0xf10b
9427:    a1 f1 0c     stb A, 0xf10c
942a:    f5 a2        unknown
942c:    7a 01 12     call [0x0112]
942f:    "*** ERROR, ADDR=\0"
9440:    95           unknown
9441:    a1 39 7a     stb A, 0x397a
9444:    01           flag1
9445:    10 7a        b0 L53
9447:    01           flag1
9448:    12
9449:    " EXP=\0"
944f:    85 a1        ld r?, [r?++]
9451:    7a 01 0a     call [0x010a]
9454:    7a 01 12     call [0x0112]
9457:    " ACT=\0"
945d:    85 a1        ld r?, [r?++]
945f:    7a 01 0a     call [0x010a]
9462:    7a 01 12     call [0x0112]
9465:    " ***\0"
946a:    72 01 0e     jump [{N:#06x}] ;

Entry_CMD_SEEK_TEST:
946d:    90 01 80     liw A, 0x0180
9470:    50 80        add r?, r?
9472:    7d 00        call A + 0x00
9474:    f8           unknown
9475:    08           flag8
9476:    7a 01 06     call [0x0106]
9479:    d0 41 4d     subw A, 0x414d
947c:    90 81 00     liw A, 0x8100
947f:    b5 21        unknown
9481:    90 82 ff     liw A, 0x82ff
9484:    b9           unknown
9485:    90 ff fb     liw A, 0xfffb
9488:    2f 02        unknown
948a:    90 41 4d     liw A, 0x414d
948d:    2f 00        unknown
948f:    2f 34        unknown
9491:    2f 06        unknown
9493:    80 43        lib A, 0x43
9495:    a2 01 14     call_alt [0x0114]
9498:    7a 01 18     call [0x0118]
949b:    13 09        b3 L42

L43:
949d:    a1 f1 0b     stb A, 0xf10b
94a0:    a1 f1 0c     stb A, 0xf10c
94a3:    72 01 0e     jump [{N:#06x}] ;

L42:
94a6:    80 45        lib A, 0x45
94a8:    a2 01 14     call_alt [0x0114]
94ab:    7a 01 18     call [0x0118]
94ae:    12 ed        b2 L43
94b0:    d0 41 4f     subw A, 0x414f
94b3:    90 84 00     liw A, 0x8400
94b6:    b5 21        unknown
94b8:    80 83        lib A, 0x83
94ba:    a5 21        unknown
94bc:    3a           xor A, A
94bd:    b5 21        unknown
94bf:    39           unknown
94c0:    a9           unknown

L53:
94c1:    38           unknown
94c2:    38           unknown
94c3:    b1 41 b1     stw A, 0x41b1

L46:
94c6:    90 41 4d     liw A, 0x414d
94c9:    2f 00        unknown
94cb:    90 ff f7     liw A, 0xfff7
94ce:    2f 02        unknown
94d0:    2f 34        unknown
94d2:    2f 06        unknown
94d4:    80 43        lib A, 0x43
94d6:    a2 01 14     call_alt [0x0114]
94d9:    7a 01 18     call [0x0118]
94dc:    12 bf        b2 L43
94de:    80 45        lib A, 0x45
94e0:    a2 01 14     call_alt [0x0114]
94e3:    7a 01 18     call [0x0118]
94e6:    13 1c        b3 L44
94e8:    7a 01 12     call [0x0112]
94eb:    "TRACK=\0"
94f2:    91 41 52     ldw A, 0x4152
94f5:    7a 01 10     call [0x0110]
94f8:    7a 01 12     call [0x0112]
94fb:    "\r\n\0"
94fe:    a1 f1 0b     stb A, 0xf10b
9501:    a1 f1 0c     stb A, 0xf10c

L44:
9504:    91 41 b1     ldw A, 0x41b1
9507:    16 1a        b6 L45
9509:    d1 41 52     d1 A, 0x4152
950c:    50 20        add r?, r?
950e:    b1 41 52     stw A, 0x4152
9511:    d0 03 36     subw A, 0x0336
9514:    59           unknown
9515:    15 af        beq L46
9517:    3a           xor A, A
9518:    39           unknown
9519:    b1 41 b1     stw A, 0x41b1
951c:    80 10        lib A, 0x10
951e:    a1 41 50     stb A, 0x4150
9521:    73 a3        jump L46

L45:
9523:    91 41 52     ldw A, 0x4152
9526:    39           unknown
9527:    b1 41 52     stw A, 0x4152
952a:    17 9a        b7 L46
952c:    7a 01 04     call [0x0104]
952f:    04           flag4
9530:    79           unknown

Entry_CMD_READ_TEST:
9531:    90 01 80     liw A, 0x0180
9534:    50 80        add r?, r?
9536:    7d 00        call A + 0x00
9538:    f8           unknown
9539:    08           flag8
953a:    7a 01 06     call [0x0106]
953d:    80 41        lib A, 0x41
953f:    a2 01 14     call_alt [0x0114]
9542:    7a 01 0c     call [0x010c]
9545:    2a           unknown
9546:    a2 01 14     call_alt [0x0114]
9549:    7a 01 0c     call [0x010c]
954c:    2a           unknown
954d:    a2 01 14     call_alt [0x0114]
9550:    7a 01 18     call [0x0118]
9553:    12 44        b2 L47
9555:    90 41 4d     liw A, 0x414d
9558:    5c           unknown
9559:    90 81 00     liw A, 0x8100
955c:    b5 61        unknown
955e:    90 84 00     liw A, 0x8400
9561:    b5 61        unknown
9563:    80 83        lib A, 0x83
9565:    a5 61        unknown
9567:    3a           xor A, A
9568:    b5 61        unknown
956a:    80 85        lib A, 0x85
956c:    a5 61        unknown
956e:    d0 10 00     subw A, 0x1000

L48:
9571:    e5           unknown
9572:    61 90 01     61 A, 0x9001
9575:    90 b5 61     liw A, 0xb561
9578:    20 30        unknown
957a:    21 20        unknown
957c:    15 f3        beq L48
957e:    80 ff        lib A, 0xff
9580:    ab           unknown

L52:
9581:    90 ff c3     liw A, 0xffc3
9584:    2f 02        unknown
9586:    90 41 4d     liw A, 0x414d
9589:    2f 00        unknown
958b:    2f 34        unknown
958d:    2f 06        unknown
958f:    80 43        lib A, 0x43
9591:    a2 01 14     call_alt [0x0114]
9594:    7a 01 18     call [0x0118]
9597:    13 09        b3 L49

L47:
9599:    a1 f1 0b     stb A, 0xf10b
959c:    a1 f1 0c     stb A, 0xf10c
959f:    72 01 0e     jump [{N:#06x}] ;

L49:
95a2:    90 e6 ff     liw A, 0xe6ff
95a5:    2f 02        unknown
95a7:    90 01 1c     liw A, 0x011c
95aa:    2f 00        unknown
95ac:    2f 34        unknown
95ae:    2f 06        unknown
95b0:    80 45        lib A, 0x45
95b2:    a2 01 14     call_alt [0x0114]
95b5:    7a 01 18     call [0x0118]
95b8:    13 16        b3 L50
95ba:    7a 01 12     call [0x0112]
95bd:    "TRACK=\0"
95c4:    91 41 52     ldw A, 0x4152
95c7:    7a 01 10     call [0x0110]
95ca:    7a 01 12     call [0x0112]
95cd:    "\r\n\0"

L50:
95d0:    91 41 52     ldw A, 0x4152
95d3:    15 01        beq L51
95d5:    38           unknown

L51:
95d6:    3d           unknown
95d7:    b1 41 52     stw A, 0x4152
95da:    d0 03 36     subw A, 0x0336
95dd:    59           unknown
95de:    19 a1        b9 L52
95e0:    a1 f1 0a     stb A, 0xf10a
95e3:    7a 01 04     call [0x0104]
95e6:    05           flag5
95e7:    3d           unknown

Entry_FLOPPY_SEEK_TEST:
95e8:    90 01 80     liw A, 0x0180
95eb:    50 80        add r?, r?
95ed:    7d 00        call A + 0x00
95ef:    f8           unknown
95f0:    00           unknown
95f1:    7a 01 06     call [0x0106]
95f4:    d0 41 4d     subw A, 0x414d
95f7:    90 81 01     liw A, 0x8101
95fa:    b5 21        unknown
95fc:    80 82        lib A, 0x82
95fe:    a9           unknown
95ff:    90 ff fc     liw A, 0xfffc
9602:    2f 02        unknown
9604:    90 41 4d     liw A, 0x414d
9607:    2f 00        unknown
9609:    2f 34        unknown
960b:    2f 06        unknown
960d:    80 43        lib A, 0x43
960f:    a2 01 14     call_alt [0x0114]
9612:    7a 01 18     call [0x0118]
9615:    13 09        b3 L29

L30:
9617:    a1 f1 0b     stb A, 0xf10b
961a:    a1 f1 0c     stb A, 0xf10c
961d:    72 01 0e     jump [{N:#06x}] ;

L29:
9620:    80 45        lib A, 0x45
9622:    a2 01 14     call_alt [0x0114]
9625:    7a 01 18     call [0x0118]
9628:    12 ed        b2 L30
962a:    d0 41 4f     subw A, 0x414f
962d:    90 83 01     liw A, 0x8301
9630:    b9           unknown
9631:    80 01        lib A, 0x01
9633:    a1 41 b1     stb A, 0x41b1

L33:
9636:    90 41 4d     liw A, 0x414d
9639:    2f 00        unknown
963b:    90 ff fb     liw A, 0xfffb
963e:    2f 02        unknown
9640:    2f 34        unknown
9642:    2f 06        unknown
9644:    80 43        lib A, 0x43
9646:    a2 01 14     call_alt [0x0114]
9649:    7a 01 18     call [0x0118]
964c:    12 c9        b2 L30
964e:    80 45        lib A, 0x45
9650:    a2 01 14     call_alt [0x0114]
9653:    7a 01 18     call [0x0118]
9656:    13 1c        b3 L31
9658:    7a 01 12     call [0x0112]
965b:    "TRACK=\0"
9662:    81 41 50     ldb A, 0x4150
9665:    7a 01 0a     call [0x010a]
9668:    7a 01 12     call [0x0112]
966b:    "\r\n\0"
966e:    a1 f1 0b     stb A, 0xf10b
9671:    a1 f1 0c     stb A, 0xf10c

L31:
9674:    81 41 b1     ldb A, 0x41b1
9677:    16 14        b6 L32
9679:    c1 41 50     c1 A, 0x4150
967c:    40 31        unknown
967e:    a1 41 50     stb A, 0x4150
9681:    c0 4b        subb A, 0x4b
9683:    49           unknown
9684:    15 b0        beq L33
9686:    80 ff        lib A, 0xff
9688:    a1 41 b1     stb A, 0x41b1
968b:    73 a9        jump L33

L32:
968d:    81 41 50     ldb A, 0x4150
9690:    29           unknown
9691:    a1 41 50     stb A, 0x4150
9694:    17 a0        b7 L33
9696:    7a 01 04     call [0x0104]
9699:    05           flag5
969a:    f4           unknown

Entry_FLOPPY_READ_TEST:
969b:    90 01 80     liw A, 0x0180
969e:    50 80        add r?, r?
96a0:    7d 00        call A + 0x00
96a2:    f8           unknown
96a3:    00           unknown
96a4:    7a 01 06     call [0x0106]
96a7:    80 41        lib A, 0x41
96a9:    a2 01 14     call_alt [0x0114]
96ac:    7a 01 0c     call [0x010c]
96af:    2a           unknown
96b0:    a2 01 14     call_alt [0x0114]
96b3:    7a 01 0c     call [0x010c]
96b6:    2a           unknown
96b7:    a2 01 14     call_alt [0x0114]
96ba:    7a 01 18     call [0x0118]
96bd:    12 3d        b2 L34
96bf:    90 41 4d     liw A, 0x414d
96c2:    5c           unknown
96c3:    90 81 01     liw A, 0x8101
96c6:    b5 61        unknown
96c8:    90 83 01     liw A, 0x8301
96cb:    b5 61        unknown
96cd:    d0 10 00     subw A, 0x1000

L35:
96d0:    80 88        lib A, 0x88
96d2:    a5 61        unknown
96d4:    e5           unknown
96d5:    61 2a a5     61 A, 0x2aa5
96d8:    61 90 01     61 A, 0x9001
96db:    90 b5 61     liw A, 0xb561
96de:    20 30        unknown
96e0:    21 20        unknown
96e2:    15 ec        beq L35

L38:
96e4:    90 ff ab     liw A, 0xffab
96e7:    2f 02        unknown
96e9:    90 41 4d     liw A, 0x414d
96ec:    2f 00        unknown
96ee:    2f 34        unknown
96f0:    2f 06        unknown
96f2:    80 43        lib A, 0x43
96f4:    a2 01 14     call_alt [0x0114]
96f7:    7a 01 18     call [0x0118]
96fa:    13 09        b3 L36

L34:
96fc:    a1 f1 0b     stb A, 0xf10b
96ff:    a1 f1 0c     stb A, 0xf10c
9702:    72 01 0e     jump [{N:#06x}] ;

L36:
9705:    90 e6 ff     liw A, 0xe6ff
9708:    2f 02        unknown
970a:    90 01 1c     liw A, 0x011c
970d:    2f 00        unknown
970f:    2f 34        unknown
9711:    2f 06        unknown
9713:    80 45        lib A, 0x45
9715:    a2 01 14     call_alt [0x0114]
9718:    7a 01 18     call [0x0118]
971b:    13 16        b3 L37
971d:    7a 01 12     call [0x0112]
9720:    "TRACK=\0"
9727:    81 41 50     ldb A, 0x4150
972a:    7a 01 0a     call [0x010a]
972d:    7a 01 12     call [0x0112]
9730:    "\r\n\0"

L37:
9733:    81 41 50     ldb A, 0x4150
9736:    2d           unknown
9737:    a1 41 50     stb A, 0x4150
973a:    c0 4b        subb A, 0x4b
973c:    49           unknown
973d:    19 a5        b9 L38
973f:    a1 f1 0a     stb A, 0xf10a
9742:    7a 01 04     call [0x0104]
9745:    06           flag6
9746:    a7           unknown

Entry_ROM_SELF_TEST:
9747:    90 01 80     liw A, 0x0180
974a:    50 80        add r?, r?
974c:    7d 00        call A + 0x00
974e:    00           unknown
974f:    00           unknown
9750:    55 86        alu5 r?, r?
9752:    3a           xor A, A

L39:
9753:    85 61        ld r?, [r?++]
9755:    40 10        unknown
9757:    d0 07 96     subw A, 0x0796
975a:    50 82        add r?, r?
975c:    51 62        sub? r?, r?
975e:    15 f3        beq L39
9760:    8b 41        unknown
9762:    01           flag1
9763:    15 18        beq L40
9765:    7a 01 12     call [0x0112]
9768:    "\n\r*** PASS ***\0"
9777:    a1 f1 0a     stb A, 0xf10a
977a:    72 01 0e     jump [{N:#06x}] ;

L40:
977d:    7a 01 12     call [0x0112]
9780:    "*** FAIL ***\0"
978d:    a1 f1 0b     stb A, 0xf10b
9790:    a1 f1 0c     stb A, 0xf10c
9793:    72 01 0e     jump [{N:#06x}] ;
9796:    8c
9797:    00
9798:    00
9799:    00
979a:    00
979b:    00
979c:    00
979d:    00
979e:    00
979f:    00
