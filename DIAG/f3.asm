
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
909a:    85 41        unknown
909c:    15 01        b_nz L0
909e:    09           ret 9

L0:
909f:    7b 02        call WriteByte
90a1:    73 f7        jump WriteString

WriteByte:
90a3:    c1 f2 00     c1 A, 0xf200
90a6:    24 30        unknown
90a8:    24 30        unknown
90aa:    11 f7        b1 WriteByte
90ac:    a1 f2 01     stb A, 0xf201
90af:    09           ret 9

ReadChar:
90b0:    81 f2 00     ldb A, 0xf200
90b3:    2c           rotate_right A
90b4:    11 fa        b1 ReadChar
90b6:    81 f2 01     ldb A, 0xf201
90b9:    09           ret 9

WriteHexWord:
90ba:    a5 a2        push_byte A
90bc:    45 01        swap_bytes A
90be:    7b 05        call WriteHexByte
90c0:    85 a1        pop_byte A
90c2:    7b 01        call WriteHexByte
90c4:    09           ret 9

WriteHexByte:
90c5:    a5 a2        push_byte A
90c7:    c0 f0        lib B, 0xf0
90c9:    42 31        and A, B
90cb:    07           clear_carry?
90cc:    26 10        unknown
90ce:    2c           rotate_right A
90cf:    2c           rotate_right A
90d0:    2c           rotate_right A
90d1:    c0 b0        lib B, 0xb0
90d3:    40 31        add A, B
90d5:    c0 b9        lib B, 0xb9
90d7:    49           cmp A, B
90d8:    19 04        b_le L1
90da:    c0 07        lib B, 0x07
90dc:    40 31        add A, B

L1:
90de:    7b c3        call WriteByte
90e0:    85 a1        pop_byte A
90e2:    c0 0f        lib B, 0x0f
90e4:    42 31        and A, B
90e6:    c0 b0        lib B, 0xb0
90e8:    40 31        add A, B
90ea:    c0 b9        lib B, 0xb9
90ec:    49           cmp A, B
90ed:    19 04        b_le L2
90ef:    c0 07        lib B, 0x07
90f1:    40 31        add A, B

L2:
90f3:    7b ae        call WriteByte
90f5:    09           ret 9

FinishTest:
90f6:    a1 f1 0a     stb A, 0xf10a
90f9:    81 f2 00     ldb A, 0xf200
90fc:    2c           rotate_right A
90fd:    11 57        b1 L3
90ff:    81 f2 01     ldb A, 0xf201
9102:    c0 80        lib B, 0x80
9104:    43 31        unknown
9106:    c0 83        lib B, 0x83
9108:    49           cmp A, B
9109:    15 4b        b_nz L3
910b:    81 01 08     ldb A, 0x0108
910e:    14 32        b_z L4
9110:    7a 01 12     call [0x0112]
9113:    "\r\n*** FAIL ***\0"
9122:    a1 f1 0b     stb A, 0xf10b
9125:    a1 f1 0c     stb A, 0xf10c

PressSpaceThenExit:
9128:    7a 01 12     call [0x0112]
912b:    "\r\nPRESS SPACE\x07\r\n\0"
913c:    7a 01 02     call [0x0102]
913f:    72 01 00     jump [{N:#06x}] ;

L4:
9142:    7a 01 12     call [0x0112]
9145:    "\r\n*** PASS ***\0"
9154:    73 d2        jump PressSpaceThenExit

L3:
9156:    90 c0 00     liw A, 0xc000
9159:    5f           mov sp, A
915a:    91 01 1a     ldw A, 0x011a
915d:    5e           unknown
915e:    95 41        unknown
9160:    50 80        add A, indexBase
9162:    75 00        unknown jump PrintCtrlCToExit

PrintCtrlCToExit:
9164:    7a 01 12     call [0x0112]
9167:    "\r\n(CONTROL-C TO EXIT)\r\n\0"
917f:    09           ret 9

Init:
9180:    3a           clear A
9181:    b1 01 08     stw A, 0x0108
9184:    90 01 e3     liw A, 0x01e3
9187:    50 80        add A, indexBase
9189:    b1 01 18     stw A, 0x0118
918c:    90 00 c5     liw A, 0x00c5
918f:    50 80        add A, indexBase
9191:    b1 01 0a     stw A, 0x010a
9194:    90 02 86     liw A, 0x0286
9197:    50 80        add A, indexBase
9199:    b1 01 0c     stw A, 0x010c
919c:    90 01 64     liw A, 0x0164
919f:    50 80        add A, indexBase
91a1:    b1 01 06     stw A, 0x0106
91a4:    90 00 b0     liw A, 0x00b0
91a7:    50 80        add A, indexBase
91a9:    b1 01 02     stw A, 0x0102
91ac:    90 00 9a     liw A, 0x009a

L5:
91af:    50 80        add A, indexBase
91b1:    b1 01 12     stw A, 0x0112
91b4:    90 00 ba     liw A, 0x00ba
91b7:    50 80        add A, indexBase
91b9:    b1 01 10     stw A, 0x0110
91bc:    90 00 f6     liw A, 0x00f6
91bf:    50 80        add A, indexBase
91c1:    b1 01 04     stw A, 0x0104
91c4:    90 01 28     liw A, 0x0128
91c7:    50 80        add A, indexBase
91c9:    b1 01 0e     stw A, 0x010e
91cc:    55 80        alu5 r?, r?
91ce:    b1 01 1a     stw A, 0x011a
91d1:    95 41        unknown
91d3:    b1 01 14     stw A, 0x0114
91d6:    38           unknown
91d7:    b1 01 16     stw A, 0x0116
91da:    55 40        alu5 r?, r?
91dc:    65 a1        unknown
91de:    69 01 00     69 A, 0x0100
91e1:    75 00        unknown jump Fn_1e3

Fn_1e3:
91e3:    7a 01 0c     call [0x010c]
91e6:    6d a2        unknown
91e8:    60 03 e8     60 A, 0x03e8

L11:
91eb:    82           unknown
91ec:    01           nop
91ed:    16 c0        b6 L5
91ef:    08           flag8
91f0:    4a           unknown
91f1:    14 2b        b_z L6
91f3:    0e           delay 4.5ms
91f4:    3f           unknown
91f5:    15 f4        b_nz L11
91f7:    7a 01 12     call [0x0112]
91fa:    "*** BUSY DID NOT CLEAR ***\0"
9215:    a1 f1 0b     stb A, 0xf10b
9218:    a1 f1 0c     stb A, 0xf10c
921b:    72 01 0e     jump [{N:#06x}] ;

L6:
921e:    60 03 e8     60 A, 0x03e8

L10:
9221:    2c           rotate_right A
9222:    10 2b        b0 L7
9224:    0e           delay 4.5ms
9225:    3f           unknown
9226:    15 f9        b_nz L10
9228:    7a 01 12     call [0x0112]
922b:    "*** FOUT NEVER CAME ON ***\0"
9246:    a1 f1 0b     stb A, 0xf10b
9249:    a1 f1 0c     stb A, 0xf10c
924c:    72 01 0e     jump [{N:#06x}] ;

L7:
924f:    03           flag3
9250:    82           unknown
9251:    01           nop
9252:    14 15        b_z L8
9254:    03           flag3
9255:    65 a1        unknown
9257:    09           ret 9
9258:    a5
9259:    a2
925a:    7a
925b:    01
925c:    12
925d:    "*** \0"
9262:    85 a1        pop_byte A
9264:    7a 01 0a     call [0x010a]
9267:    7a
9268:    01

L8:
9269:    12
926a:    " ERROR ***\r\n\0"
9277:    80 01        lib A, 0x01
9279:    a1 01 08     stb A, 0x0108
927c:    a1 f1 0b     stb A, 0xf10b
927f:    a1 f1 0c     stb A, 0xf10c
9282:    65 a1        unknown
9284:    02           flag2
9285:    09           ret 9

Fn_286:
9286:    6d a2        unknown
9288:    0e           delay 4.5ms
9289:    60 03 e8     60 A, 0x03e8

L14:
928c:    82           unknown
928d:    01           nop
928e:    16 2c        b6 L12
9290:    2c           rotate_right A
9291:    11 2d        b1 L13
9293:    0e           delay 4.5ms
9294:    3f           unknown
9295:    15 f5        b_nz L14
9297:    7a 01 12     call [0x0112]
929a:    "*** FIN DID NOT GO OFF ***\r\n\0"
92b7:    a1 f1 0b     stb A, 0xf10b
92ba:    a1
92bb:    f1

L12:
92bc:    0c           unknown
92bd:    72 01 0e     jump [{N:#06x}] ;

L13:
92c0:    65 a1        unknown
92c2:    09           ret 9
92c3:    90
92c4:    01
92c5:    80
92c6:    50
92c7:    80
92c8:    7d
92c9:    00
92ca:    f8
92cb:    08
92cc:    73
92cd:    09

Entry_FLOPPY_COMMAND_BUFFER_TEST:
92ce:    90 01 80     liw A, 0x0180
92d1:    50 80        add A, indexBase
92d3:    7d 00        call A + 0x00
92d5:    f8           unknown
92d6:    00           HALT
92d7:    7a 01 06     call [0x0106]
92da:    32 60        unknown
92dc:    60 00 c8     60 A, 0x00c8
92df:    55 60        alu5 r?, r?
92e1:    d0 01 1c     liw B, 0x011c

L15:
92e4:    a5 21        unknown
92e6:    28           unknown
92e7:    28           unknown
92e8:    28           unknown
92e9:    3f           unknown
92ea:    15 f8        b_nz L15
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
9305:    3a           clear A
9306:    d0 01 1c     liw B, 0x011c

L16:
9309:    a5 21        unknown
930b:    3f           unknown
930c:    15 fb        b_nz L16
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
9327:    d0 01 1c     liw B, 0x011c
932a:    55 60        alu5 r?, r?
932c:    45           unknown
932d:    10 85        b0 L17
932f:    21 41        unknown
9331:    01           nop
9332:    15 10        b_nz L18
9334:    20 00        unknown
9336:    20 00        unknown
9338:    20 00        unknown
933a:    3f           unknown
933b:    15 f1        b_nz L19
933d:    20 70        unknown
933f:    7a 01 04     call [0x0104]
9342:    02           flag2
9343:    da           unknown

L18:
9344:    7a 01 12     call [0x0112]
9347:    "*** COMMAND BUFFER ERROR ***\0"
9364:    a1 f1 0b     stb A, 0xf10b
9367:    a1 f1 0c     stb A, 0xf10c
936a:    72 01 0e     jump [{N:#06x}] ;

Entry_CMD_AUX_MEMORY_TEST:
936d:    90 01 80     liw A, 0x0180
9370:    50 80        add A, indexBase
9372:    7d 00        call A + 0x00
9374:    f8           unknown
9375:    08           flag8
9376:    7a 01 06     call [0x0106]
9379:    32 60        unknown
937b:    60 3f ff     60 A, 0x3fff
937e:    55 60        alu5 r?, r?
9380:    d0 01 1c     liw B, 0x011c

L38:
9383:    a5 21        unknown
9385:    28           unknown
9386:    28           unknown
9387:    28           unknown
9388:    3f           unknown
9389:    15 f8        b_nz L38
938b:    90 c0 00     liw A, 0xc000
938e:    2f 02        unknown
9390:    90

L21:
9391:    01           nop
9392:    1c 2f        b?? L22
9394:    00           HALT
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
93c2:    3a           clear A

L22:
93c3:    d0 01 1c     liw B, 0x011c

L20:
93c6:    a5 21        unknown
93c8:    3f           unknown
93c9:    15 fb        b_nz L20
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
9404:    d0 01 1c     liw B, 0x011c
9407:    55 60        alu5 r?, r?
9409:    45           unknown
940a:    10 85        b0 L21
940c:    21 bd        unknown
940e:    41 01        unknown
9410:    15 12        b_nz L23
9412:    20 00        unknown
9414:    20 00        unknown
9416:    20 00        unknown
9418:    3f           unknown
9419:    15 f0        b_nz L24
941b:    95 a1        unknown
941d:    20 70        unknown
941f:    7a 01 04     call [0x0104]
9422:    03           flag3
9423:    79

L23:
9424:    a1 f1 0b     stb A, 0xf10b
9427:    a1 f1 0c     stb A, 0xf10c
942a:    f5 a2        unknown
942c:    7a 01 12     call [0x0112]
942f:    "*** ERROR, ADDR=\0"
9440:    95 a1        unknown
9442:    39           unknown
9443:    7a 01 10     call [0x0110]
9446:    7a 01 12     call [0x0112]
9449:    " EXP=\0"
944f:    85 a1        pop_byte A
9451:    7a 01 0a     call [0x010a]
9454:    7a 01 12     call [0x0112]
9457:    " ACT=\0"
945d:    85 a1        pop_byte A
945f:    7a 01 0a     call [0x010a]
9462:    7a 01 12     call [0x0112]
9465:    " ***\0"
946a:    72 01 0e     jump [{N:#06x}] ;

Entry_CMD_SEEK_TEST:
946d:    90 01 80     liw A, 0x0180
9470:    50 80        add A, indexBase
9472:    7d 00        call A + 0x00
9474:    f8           unknown
9475:    08           flag8
9476:    7a 01 06     call [0x0106]
9479:    d0 41 4d     liw B, 0x414d
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
949b:    13 09        b3 L39

L40:
949d:    a1 f1 0b     stb A, 0xf10b
94a0:    a1 f1 0c     stb A, 0xf10c
94a3:    72 01 0e     jump [{N:#06x}] ;

L39:
94a6:    80 45        lib A, 0x45
94a8:    a2 01 14     call_alt [0x0114]
94ab:    7a 01 18     call [0x0118]
94ae:    12 ed        b2 L40
94b0:    d0 41 4f     liw B, 0x414f
94b3:    90 84 00     liw A, 0x8400
94b6:    b5 21        unknown
94b8:    80 83        lib A, 0x83
94ba:    a5 21        unknown
94bc:    3a           clear A
94bd:    b5 21        unknown
94bf:    39           unknown
94c0:    a9           unknown
94c1:    38           unknown
94c2:    38           unknown
94c3:    b1 41 b1     stw A, 0x41b1

L43:
94c6:    90 41 4d     liw A, 0x414d
94c9:    2f 00        unknown
94cb:    90 ff f7     liw A, 0xfff7
94ce:    2f 02        unknown
94d0:    2f 34        unknown
94d2:    2f 06        unknown
94d4:    80 43        lib A, 0x43
94d6:    a2 01 14     call_alt [0x0114]
94d9:    7a 01 18     call [0x0118]
94dc:    12 bf        b2 L40
94de:    80 45        lib A, 0x45
94e0:    a2 01 14     call_alt [0x0114]
94e3:    7a 01 18     call [0x0118]
94e6:    13 1c        b3 L41
94e8:    7a 01 12     call [0x0112]
94eb:    "TRACK=\0"
94f2:    91 41 52     ldw A, 0x4152
94f5:    7a 01 10     call [0x0110]
94f8:    7a 01 12     call [0x0112]
94fb:    "\r\n\0"
94fe:    a1 f1 0b     stb A, 0xf10b
9501:    a1 f1 0c     stb A, 0xf10c

L41:
9504:    91 41 b1     ldw A, 0x41b1
9507:    16 1a        b6 L42
9509:    d1 41 52     d1 A, 0x4152
950c:    50 20        unknown
950e:    b1 41 52     stw A, 0x4152
9511:    d0 03 36     liw B, 0x0336
9514:    59           unknown
9515:    15 af        b_nz L43
9517:    3a           clear A
9518:    39           unknown
9519:    b1 41 b1     stw A, 0x41b1
951c:    80 10        lib A, 0x10
951e:    a1 41 50     stb A, 0x4150
9521:    73 a3        jump L43

L42:
9523:    91 41 52     ldw A, 0x4152
9526:    39           unknown
9527:    b1 41 52     stw A, 0x4152
952a:    17 9a        b7 L43
952c:    7a 01 04     call [0x0104]
952f:    04           flag4
9530:    79 90 01     call L44
9533:    80 50        lib A, 0x50
9535:    80 7d        lib A, 0x7d
9537:    00           HALT
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
9553:    12 44        b2 L45
9555:    90 41 4d     liw A, 0x414d
9558:    5c           unknown
9559:    90 81 00     liw A, 0x8100
955c:    b5 61        unknown
955e:    90 84 00     liw A, 0x8400
9561:    b5 61        unknown
9563:    80 83        lib A, 0x83
9565:    a5 61        unknown
9567:    3a           clear A
9568:    b5 61        unknown
956a:    80 85        lib A, 0x85
956c:    a5 61        unknown
956e:    d0 10 00     liw B, 0x1000

L46:
9571:    e5 61        unknown
9573:    90 01 90     liw A, 0x0190
9576:    b5 61        unknown
9578:    20 30        unknown
957a:    21 20        unknown
957c:    15 f3        b_nz L46
957e:    80 ff        lib A, 0xff
9580:    ab           unknown

L50:
9581:    90 ff c3     liw A, 0xffc3
9584:    2f 02        unknown
9586:    90 41 4d     liw A, 0x414d
9589:    2f 00        unknown
958b:    2f 34        unknown
958d:    2f 06        unknown
958f:    80 43        lib A, 0x43
9591:    a2 01 14     call_alt [0x0114]
9594:    7a 01 18     call [0x0118]
9597:    13 09        b3 L47

L45:
9599:    a1 f1 0b     stb A, 0xf10b
959c:    a1 f1 0c     stb A, 0xf10c
959f:    72 01 0e     jump [{N:#06x}] ;

L47:
95a2:    90 e6 ff     liw A, 0xe6ff
95a5:    2f 02        unknown
95a7:    90 01 1c     liw A, 0x011c
95aa:    2f 00        unknown
95ac:    2f 34        unknown
95ae:    2f 06        unknown
95b0:    80 45        lib A, 0x45
95b2:    a2 01 14     call_alt [0x0114]
95b5:    7a 01 18     call [0x0118]
95b8:    13 16        b3 L48
95ba:    7a 01 12     call [0x0112]
95bd:    "TRACK=\0"
95c4:    91 41 52     ldw A, 0x4152
95c7:    7a 01 10     call [0x0110]
95ca:    7a 01 12     call [0x0112]
95cd:    "\r\n\0"

L48:
95d0:    91 41 52     ldw A, 0x4152
95d3:    15 01        b_nz L49
95d5:    38           unknown

L49:
95d6:    3d           unknown
95d7:    b1 41 52     stw A, 0x4152
95da:    d0 03 36     liw B, 0x0336
95dd:    59           unknown
95de:    19 a1        b_le L50
95e0:    a1 f1 0a     stb A, 0xf10a
95e3:    7a 01 04     call [0x0104]
95e6:    05           flag5
95e7:    3d           unknown

Entry_FLOPPY_SEEK_TEST:
95e8:    90 01 80     liw A, 0x0180
95eb:    50 80        add A, indexBase
95ed:    7d 00        call A + 0x00
95ef:    f8           unknown
95f0:    00           HALT
95f1:    7a 01 06     call [0x0106]
95f4:    d0 41 4d     liw B, 0x414d
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
9615:    13 09        b3 L26

L27:
9617:    a1 f1 0b     stb A, 0xf10b
961a:    a1 f1 0c     stb A, 0xf10c
961d:    72 01 0e     jump [{N:#06x}] ;

L26:
9620:    80 45        lib A, 0x45
9622:    a2 01 14     call_alt [0x0114]
9625:    7a 01 18     call [0x0118]
9628:    12 ed        b2 L27
962a:    d0 41 4f     liw B, 0x414f
962d:    90 83 01     liw A, 0x8301
9630:    b9           unknown
9631:    80 01        lib A, 0x01
9633:    a1 41 b1     stb A, 0x41b1

L30:
9636:    90 41 4d     liw A, 0x414d
9639:    2f 00        unknown
963b:    90 ff fb     liw A, 0xfffb
963e:    2f 02        unknown
9640:    2f 34        unknown
9642:    2f 06        unknown
9644:    80 43        lib A, 0x43
9646:    a2 01 14     call_alt [0x0114]
9649:    7a 01 18     call [0x0118]
964c:    12 c9        b2 L27
964e:    80 45        lib A, 0x45
9650:    a2 01 14     call_alt [0x0114]
9653:    7a 01 18     call [0x0118]
9656:    13 1c        b3 L28
9658:    7a 01 12     call [0x0112]
965b:    "TRACK=\0"
9662:    81 41 50     ldb A, 0x4150
9665:    7a 01 0a     call [0x010a]
9668:    7a 01 12     call [0x0112]
966b:    "\r\n\0"
966e:    a1 f1 0b     stb A, 0xf10b
9671:    a1 f1 0c     stb A, 0xf10c

L28:
9674:    81 41 b1     ldb A, 0x41b1
9677:    16 14        b6 L29
9679:    c1 41 50     c1 A, 0x4150
967c:    40 31        add A, B
967e:    a1 41 50     stb A, 0x4150
9681:    c0 4b        lib B, 0x4b
9683:    49           cmp A, B
9684:    15 b0        b_nz L30
9686:    80 ff        lib A, 0xff
9688:    a1 41 b1     stb A, 0x41b1
968b:    73 a9        jump L30

L29:
968d:    81 41 50     ldb A, 0x4150
9690:    29           unknown
9691:    a1 41 50     stb A, 0x4150
9694:    17 a0        b7 L30
9696:    7a 01 04     call [0x0104]
9699:    05           flag5
969a:    f4           unknown

Entry_FLOPPY_READ_TEST:
969b:    90 01 80     liw A, 0x0180
969e:    50 80        add A, indexBase
96a0:    7d 00        call A + 0x00
96a2:    f8           unknown
96a3:    00           HALT
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
96bd:    12 3d        b2 L31
96bf:    90 41 4d     liw A, 0x414d
96c2:    5c           unknown
96c3:    90 81 01     liw A, 0x8101
96c6:    b5 61        unknown
96c8:    90 83 01     liw A, 0x8301
96cb:    b5 61        unknown
96cd:    d0 10 00     liw B, 0x1000

L32:
96d0:    80 88        lib A, 0x88
96d2:    a5 61        unknown
96d4:    e5 61        unknown
96d6:    2a           unknown
96d7:    a5 61        unknown
96d9:    90 01 90     liw A, 0x0190
96dc:    b5 61        unknown
96de:    20 30        unknown
96e0:    21 20        unknown
96e2:    15 ec        b_nz L32

L35:
96e4:    90 ff ab     liw A, 0xffab
96e7:    2f 02        unknown
96e9:    90 41 4d     liw A, 0x414d
96ec:    2f 00        unknown
96ee:    2f 34        unknown
96f0:    2f 06        unknown
96f2:    80 43        lib A, 0x43
96f4:    a2 01 14     call_alt [0x0114]
96f7:    7a 01 18     call [0x0118]
96fa:    13 09        b3 L33

L31:
96fc:    a1 f1 0b     stb A, 0xf10b
96ff:    a1 f1 0c     stb A, 0xf10c
9702:    72 01 0e     jump [{N:#06x}] ;

L33:
9705:    90 e6 ff     liw A, 0xe6ff
9708:    2f 02        unknown
970a:    90 01 1c     liw A, 0x011c
970d:    2f 00        unknown
970f:    2f 34        unknown
9711:    2f 06        unknown
9713:    80 45        lib A, 0x45
9715:    a2 01 14     call_alt [0x0114]
9718:    7a 01 18     call [0x0118]
971b:    13 16        b3 L34
971d:    7a 01 12     call [0x0112]
9720:    "TRACK=\0"
9727:    81 41 50     ldb A, 0x4150
972a:    7a 01 0a     call [0x010a]
972d:    7a 01 12     call [0x0112]
9730:    "\r\n\0"

L34:
9733:    81 41 50     ldb A, 0x4150
9736:    2d           unknown
9737:    a1 41 50     stb A, 0x4150
973a:    c0 4b        lib B, 0x4b
973c:    49           cmp A, B
973d:    19 a5        b_le L35
973f:    a1 f1 0a     stb A, 0xf10a
9742:    7a 01 04     call [0x0104]
9745:    06           flag6
9746:    a7           unknown

Entry_ROM_SELF_TEST:
9747:    90 01 80     liw A, 0x0180
974a:    50 80        add A, indexBase
974c:    7d 00        call A + 0x00
974e:    00           HALT
974f:    00           HALT
9750:    55 86        alu5 r?, r?
9752:    3a           clear A

L36:
9753:    85 61        unknown
9755:    40 10        unknown
9757:    d0 07 96     liw B, 0x0796
975a:    50 82        unknown
975c:    51 62        sub? r?, r?
975e:    15 f3        b_nz L36
9760:    8b 41        unknown
9762:    01           nop
9763:    15 18        b_nz L37
9765:    7a 01 12     call [0x0112]
9768:    "\n\r*** PASS ***\0"
9777:    a1 f1 0a     stb A, 0xf10a
977a:    72 01 0e     jump [{N:#06x}] ;

L37:
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
