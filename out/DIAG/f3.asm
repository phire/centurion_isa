
TEST_0:
9000:    03 6d        (0x36d)
9002:    "CMD AUX MEMORY TEST\r\n\0"

TEST_1:
9018:    04 6d        (0x46d)
901a:    "CMD SEEK TEST\r\n\0"

TEST_2:
902a:    05 31        (0x531)
902c:    "CMD READ TEST\r\n\0"

TEST_3:
903c:    02 ce        (0x2ce)
903e:    "FLOPPY COMMAND BUFFER TEST\r\n\0"

TEST_4:
905b:    05 e8        (0x5e8)
905d:    "FLOPPY SEEK TEST\r\n\0"

TEST_5:
9070:    06 9b        (0x69b)
9072:    "FLOPPY READ TEST\r\n\0"

TEST_6:
9085:    07 47        (0x747)
9087:    "ROM SELF TEST\r\n\n\0"

TEST_7:
9098:    00 00        (0x0)

WriteString:
909a:    85 41        ld.b A, (RT)+
909c:    15 01        bzc L_909f
909e:    09           ret

L_909f:
909f:    7b 02        call (PC+0x02) WriteByte
90a1:    73 f7        jump (PC-0x09) WriteString

WriteByte:
90a3:    c1 f2 00     ld.b C, (0xf200)
90a6:    24 30        srl.b C
90a8:    24 30        srl.b C
90aa:    11 f7        bcc WriteByte
90ac:    a1 f2 01     st.b A, (0xf201)
90af:    09           ret

ReadChar:
90b0:    81 f2 00     ld.b A, (0xf200)
90b3:    2c           srl.b A
90b4:    11 fa        bcc ReadChar
90b6:    81 f2 01     ld.b A, (0xf201)
90b9:    09           ret

WriteHexWord:
90ba:    a5 a2        st.b A, -(SP)
90bc:    45 01        mov.b A, B
90be:    7b 05        call (PC+0x05) WriteHexByte
90c0:    85 a1        ld.b A, (SP)+
90c2:    7b 01        call (PC+0x01) WriteHexByte
90c4:    09           ret

WriteHexByte:
90c5:    a5 a2        st.b A, -(SP)
90c7:    c0 f0        ld.b C, #0xf0
90c9:    42 31        and.b A, C
90cb:    07           fcc
90cc:    26 10        rrc.b A
90ce:    2c           srl.b A
90cf:    2c           srl.b A
90d0:    2c           srl.b A
90d1:    c0 b0        ld.b C, #0xb0
90d3:    40 31        add.b A, C
90d5:    c0 b9        ld.b C, #0xb9
90d7:    49           sub.b C, A
90d8:    19 04        ble L_90de
90da:    c0 07        ld.b C, #0x07
90dc:    40 31        add.b A, C

L_90de:
90de:    7b c3        call (PC-0x3d) WriteByte
90e0:    85 a1        ld.b A, (SP)+
90e2:    c0 0f        ld.b C, #0x0f
90e4:    42 31        and.b A, C
90e6:    c0 b0        ld.b C, #0xb0
90e8:    40 31        add.b A, C
90ea:    c0 b9        ld.b C, #0xb9
90ec:    49           sub.b C, A
90ed:    19 04        ble L_90f3
90ef:    c0 07        ld.b C, #0x07
90f1:    40 31        add.b A, C

L_90f3:
90f3:    7b ae        call (PC-0x52) WriteByte
90f5:    09           ret

FinishTest:
90f6:    a1 f1 0a     st.b A, (0xf10a)
90f9:    81 f2 00     ld.b A, (0xf200)
90fc:    2c           srl.b A
90fd:    11 57        bcc L_9156
90ff:    81 f2 01     ld.b A, (0xf201)
9102:    c0 80        ld.b C, #0x80
9104:    43 31        or.b A, C
9106:    c0 83        ld.b C, #0x83
9108:    49           sub.b C, A
9109:    15 4b        bzc L_9156
910b:    81 01 08     ld.b A, (0x0108)
910e:    14 32        bzs L_9142
9110:    7a 01 12     call @(0x0112)
9113:    "\r\n*** FAIL ***\0"
9122:    a1 f1 0b     st.b A, (0xf10b)
9125:    a1 f1 0c     st.b A, (0xf10c)

PressSpaceThenExit:
9128:    7a 01 12     call @(0x0112)
912b:    "\r\nPRESS SPACE\x07\r\n\0"
913c:    7a 01 02     call @(0x0102)
913f:    72 01 00     jump @(0x0100) ;

L_9142:
9142:    7a 01 12     call @(0x0112)
9145:    "\r\n*** PASS ***\0"
9154:    73 d2        jump (PC-0x2e) PressSpaceThenExit

L_9156:
9156:    90 c0 00     ld.w BA, #0xc000
9159:    5f           mov SP, BA
915a:    91 01 1a     ld.w BA, (0x011a)
915d:    5e           mov HL, BA
915e:    95 41        ld.w BA, (RT)+
9160:    50 80        add.w BA, HL
9162:    75 00        jump (A + 0x00)

PrintCtrlCToExit:
9164:    7a 01 12     call @(0x0112)
9167:    "\r\n(CONTROL-C TO EXIT)\r\n\0"
917f:    09           ret

Init:
9180:    3a           clr.w BA
9181:    b1 01 08     st.w BA, (0x0108)
9184:    90 01 e3     ld.w BA, #0x01e3
9187:    50 80        add.w BA, HL
9189:    b1 01 18     st.w BA, (0x0118)
918c:    90 00 c5     ld.w BA, #0x00c5
918f:    50 80        add.w BA, HL
9191:    b1 01 0a     st.w BA, (0x010a)
9194:    90 02 86     ld.w BA, #0x0286
9197:    50 80        add.w BA, HL
9199:    b1 01 0c     st.w BA, (0x010c)
919c:    90 01 64     ld.w BA, #0x0164
919f:    50 80        add.w BA, HL
91a1:    b1 01 06     st.w BA, (0x0106)
91a4:    90 00 b0     ld.w BA, #0x00b0
91a7:    50 80        add.w BA, HL
91a9:    b1 01 02     st.w BA, (0x0102)
91ac:    90 00 9a     ld.w BA, #0x009a
91af:    50 80        add.w BA, HL
91b1:    b1 01 12     st.w BA, (0x0112)
91b4:    90 00 ba     ld.w BA, #0x00ba
91b7:    50 80        add.w BA, HL
91b9:    b1 01 10     st.w BA, (0x0110)
91bc:    90 00 f6     ld.w BA, #0x00f6
91bf:    50 80        add.w BA, HL
91c1:    b1 01 04     st.w BA, (0x0104)
91c4:    90 01 28     ld.w BA, #0x0128
91c7:    50 80        add.w BA, HL
91c9:    b1 01 0e     st.w BA, (0x010e)
91cc:    55 80        mov.w BA, HL
91ce:    b1 01 1a     st.w BA, (0x011a)
91d1:    95 41        ld.w BA, (RT)+
91d3:    b1 01 14     st.w BA, (0x0114)
91d6:    38           inc.w BA
91d7:    b1 01 16     st.w BA, (0x0116)
91da:    55 40        mov.w BA, RT
91dc:    65 a1        ld.w RT, (SP)+
91de:    69 01 00     st.w RT, (0x0100)
91e1:    75 00        jump (A + 0x00)

Fn_1e3:
91e3:    7a 01 0c     call @(0x010c)
91e6:    6d a2        st.w RT, -(SP)
91e8:    60 03 e8     ld.w RT, #0x03e8

L_91eb:
91eb:    82 01 16     ld.b A, @(0x0116)
91ee:    c0 08        ld.b C, #0x08
91f0:    4a           and.b C, A
91f1:    14 2b        bzs L_921e
91f3:    0e           delay 4.5ms
91f4:    3f           dec RT
91f5:    15 f4        bzc L_91eb
91f7:    7a 01 12     call @(0x0112)
91fa:    "*** BUSY DID NOT CLEAR ***\0"
9215:    a1 f1 0b     st.b A, (0xf10b)
9218:    a1 f1 0c     st.b A, (0xf10c)
921b:    72 01 0e     jump @(0x010e) ;

L_921e:
921e:    60 03 e8     ld.w RT, #0x03e8

L_9221:
9221:    2c           srl.b A
9222:    10 2b        bcs L_924f
9224:    0e           delay 4.5ms
9225:    3f           dec RT
9226:    15 f9        bzc L_9221
9228:    7a 01 12     call @(0x0112)
922b:    "*** FOUT NEVER CAME ON ***\0"
9246:    a1 f1 0b     st.b A, (0xf10b)
9249:    a1 f1 0c     st.b A, (0xf10c)
924c:    72 01 0e     jump @(0x010e) ;

L_924f:
924f:    03           fcn
9250:    82 01 14     ld.b A, @(0x0114)
9253:    15 03        bzc L_9258
9255:    65 a1        ld.w RT, (SP)+
9257:    09           ret

L_9258:
9258:    a5 a2        st.b A, -(SP)
925a:    7a 01 12     call @(0x0112)
925d:    "*** \0"
9262:    85 a1        ld.b A, (SP)+
9264:    7a 01 0a     call @(0x010a)
9267:    7a 01 12     call @(0x0112)
926a:    " ERROR ***\r\n\0"
9277:    80 01        ld.b A, #0x01
9279:    a1 01 08     st.b A, (0x0108)
927c:    a1 f1 0b     st.b A, (0xf10b)
927f:    a1 f1 0c     st.b A, (0xf10c)
9282:    65 a1        ld.w RT, (SP)+
9284:    02           fsn
9285:    09           ret

Fn_286:
9286:    6d a2        st.w RT, -(SP)
9288:    0e           delay 4.5ms
9289:    60 03 e8     ld.w RT, #0x03e8

L_928c:
928c:    82 01 16     ld.b A, @(0x0116)
928f:    2c           srl.b A
9290:    2c           srl.b A
9291:    11 2d        bcc L_92c0
9293:    0e           delay 4.5ms
9294:    3f           dec RT
9295:    15 f5        bzc L_928c
9297:    7a 01 12     call @(0x0112)
929a:    "*** FIN DID NOT GO OFF ***\r\n\0"
92b7:    a1 f1 0b     st.b A, (0xf10b)
92ba:    a1 f1 0c     st.b A, (0xf10c)
92bd:    72 01 0e     jump @(0x010e) ;

L_92c0:
92c0:    65 a1        ld.w RT, (SP)+
92c2:    09           ret
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
92ce:    90 01 80     ld.w BA, #0x0180
92d1:    50 80        add.w BA, HL
92d3:    7d 00        call (A + 0x00)
92d5:    f8
92d6:    00
92d7:    7a 01 06     call @(0x0106)
92da:    32 60        clr.w EF
92dc:    60 00 c8     ld.w RT, #0x00c8
92df:    55 60        mov.w BA, EF
92e1:    d0 01 1c     ld.w DC, #0x011c

L_92e4:
92e4:    a5 21        st.b A, (DC)+
92e6:    28           inc.b A
92e7:    28           inc.b A
92e8:    28           inc.b A
92e9:    3f           dec RT
92ea:    15 f8        bzc L_92e4
92ec:    90 ff 37     ld.w BA, #0xff37
92ef:    2f 02        DMA load 0, 2
92f1:    90 01 1c     ld.w BA, #0x011c
92f4:    2f 00        DMA load 0, 0
92f6:    2f 34        DMA load 3, 4
92f8:    2f 06        DMA load 0, 6
92fa:    80 43        ld.b A, #0x43
92fc:    a2 01 14     st.b A, @(0x0114)
92ff:    7a 01 18     call @(0x0118)
9302:    60 00 e6     ld.w RT, #0x00e6
9305:    3a           clr.w BA
9306:    d0 01 1c     ld.w DC, #0x011c

L_9309:
9309:    a5 21        st.b A, (DC)+
930b:    3f           dec RT
930c:    15 fb        bzc L_9309
930e:    90 ff 37     ld.w BA, #0xff37
9311:    2f 02        DMA load 0, 2
9313:    90 01 1c     ld.w BA, #0x011c
9316:    2f 00        DMA load 0, 0
9318:    2f 34        DMA load 3, 4
931a:    2f 06        DMA load 0, 6
931c:    80 44        ld.b A, #0x44
931e:    a2 01 14     st.b A, @(0x0114)
9321:    7a 01 18     call @(0x0118)
9324:    60 00 c8     ld.w RT, #0x00c8
9327:    d0 01 1c     ld.w DC, #0x011c
932a:    55 60        mov.w BA, EF
932c:    45 10        mov.b B, A

L_932e:
932e:    85 21        ld.b A, (DC)+
9330:    41 01        sub.b A, B
9332:    15 10        bzc L_9344
9334:    20 00        inc.b B
9336:    20 00        inc.b B
9338:    20 00        inc.b B
933a:    3f           dec RT
933b:    15 f1        bzc L_932e
933d:    20 70        inc.b F
933f:    7a 01 04     call @(0x0104)
9342:    02           fsn
9343:    da           ld.w DC, (RT)

L_9344:
9344:    7a 01 12     call @(0x0112)
9347:    "*** COMMAND BUFFER ERROR ***\0"
9364:    a1 f1 0b     st.b A, (0xf10b)
9367:    a1 f1 0c     st.b A, (0xf10c)
936a:    72 01 0e     jump @(0x010e) ;

Entry_CMD_AUX_MEMORY_TEST:
936d:    90 01 80     ld.w BA, #0x0180
9370:    50 80        add.w BA, HL
9372:    7d 00        call (A + 0x00)
9374:    f8 08 7a     stb? A, [0x0087a]
9377:    01           nop
9378:    06           fsc
9379:    32 60        clr.w EF
937b:    60 3f ff     ld.w RT, #0x3fff
937e:    55 60        mov.w BA, EF
9380:    d0 01 1c     ld.w DC, #0x011c

L_9383:
9383:    a5 21        st.b A, (DC)+
9385:    28           inc.b A
9386:    28           inc.b A
9387:    28           inc.b A
9388:    3f           dec RT
9389:    15 f8        bzc L_9383
938b:    90 c0 00     ld.w BA, #0xc000
938e:    2f 02        DMA load 0, 2
9390:    90 01 1c     ld.w BA, #0x011c
9393:    2f 00        DMA load 0, 0
9395:    2f 34        DMA load 3, 4
9397:    2f 06        DMA load 0, 6
9399:    80 46        ld.b A, #0x46
939b:    a2 01 14     st.b A, @(0x0114)
939e:    7a 01 0c     call @(0x010c)
93a1:    2a           clr.b A
93a2:    a2 01 14     st.b A, @(0x0114)
93a5:    7a 01 0c     call @(0x010c)
93a8:    2a           clr.b A
93a9:    a2 01 14     st.b A, @(0x0114)
93ac:    7a 01 0c     call @(0x010c)
93af:    80 3f        ld.b A, #0x3f
93b1:    a2 01 14     st.b A, @(0x0114)
93b4:    7a 01 0c     call @(0x010c)
93b7:    80 ff        ld.b A, #0xff
93b9:    a2 01 14     st.b A, @(0x0114)
93bc:    7a 01 18     call @(0x0118)
93bf:    60 3f ff     ld.w RT, #0x3fff
93c2:    3a           clr.w BA
93c3:    d0 01 1c     ld.w DC, #0x011c

L_93c6:
93c6:    a5 21        st.b A, (DC)+
93c8:    3f           dec RT
93c9:    15 fb        bzc L_93c6
93cb:    90 c0 00     ld.w BA, #0xc000
93ce:    2f 02        DMA load 0, 2
93d0:    90 01 1c     ld.w BA, #0x011c
93d3:    2f 00        DMA load 0, 0
93d5:    2f 34        DMA load 3, 4
93d7:    2f 06        DMA load 0, 6
93d9:    80 47        ld.b A, #0x47
93db:    a2 01 14     st.b A, @(0x0114)
93de:    7a 01 0c     call @(0x010c)
93e1:    2a           clr.b A
93e2:    a2 01 14     st.b A, @(0x0114)
93e5:    7a 01 0c     call @(0x010c)
93e8:    2a           clr.b A
93e9:    a2 01 14     st.b A, @(0x0114)
93ec:    7a 01 0c     call @(0x010c)
93ef:    80 3f        ld.b A, #0x3f
93f1:    a2 01 14     st.b A, @(0x0114)
93f4:    7a 01 0c     call @(0x010c)
93f7:    80 ff        ld.b A, #0xff
93f9:    a2 01 14     st.b A, @(0x0114)
93fc:    7a 01 18     call @(0x0118)
93ff:    b5 a2        st.w BA, -(SP)
9401:    60 3f ff     ld.w RT, #0x3fff
9404:    d0 01 1c     ld.w DC, #0x011c
9407:    55 60        mov.w BA, EF
9409:    45 10        mov.b B, A

L_940b:
940b:    85 21        ld.b A, (DC)+
940d:    bd           st.w BA, (SP)
940e:    41 01        sub.b A, B
9410:    15 12        bzc L_9424
9412:    20 00        inc.b B
9414:    20 00        inc.b B
9416:    20 00        inc.b B
9418:    3f           dec RT
9419:    15 f0        bzc L_940b
941b:    95 a1        ld.w BA, (SP)+
941d:    20 70        inc.b F
941f:    7a 01 04     call @(0x0104)
9422:    03           fcn
9423:    79

L_9424:
9424:    a1 f1 0b     st.b A, (0xf10b)
9427:    a1 f1 0c     st.b A, (0xf10c)
942a:    f5 a2        st.w DC, -(SP)
942c:    7a 01 12     call @(0x0112)
942f:    "*** ERROR, ADDR=\0"
9440:    95 a1        ld.w BA, (SP)+
9442:    39           dec.w BA
9443:    7a 01 10     call @(0x0110)
9446:    7a 01 12     call @(0x0112)
9449:    " EXP=\0"
944f:    85 a1        ld.b A, (SP)+
9451:    7a 01 0a     call @(0x010a)
9454:    7a 01 12     call @(0x0112)
9457:    " ACT=\0"
945d:    85 a1        ld.b A, (SP)+
945f:    7a 01 0a     call @(0x010a)
9462:    7a 01 12     call @(0x0112)
9465:    " ***\0"
946a:    72 01 0e     jump @(0x010e) ;

Entry_CMD_SEEK_TEST:
946d:    90 01 80     ld.w BA, #0x0180
9470:    50 80        add.w BA, HL
9472:    7d 00        call (A + 0x00)
9474:    f8 08 7a     stb? A, [0x0087a]
9477:    01           nop
9478:    06           fsc
9479:    d0 41 4d     ld.w DC, #0x414d
947c:    90 81 00     ld.w BA, #0x8100
947f:    b5 21        st.w BA, (DC)+
9481:    90 82 ff     ld.w BA, #0x82ff
9484:    b9           st.w BA, (DC)
9485:    90 ff fb     ld.w BA, #0xfffb
9488:    2f 02        DMA load 0, 2
948a:    90 41 4d     ld.w BA, #0x414d
948d:    2f 00        DMA load 0, 0
948f:    2f 34        DMA load 3, 4
9491:    2f 06        DMA load 0, 6
9493:    80 43        ld.b A, #0x43
9495:    a2 01 14     st.b A, @(0x0114)
9498:    7a 01 18     call @(0x0118)
949b:    13 09        bnc L_94a6

L_949d:
949d:    a1 f1 0b     st.b A, (0xf10b)
94a0:    a1 f1 0c     st.b A, (0xf10c)
94a3:    72 01 0e     jump @(0x010e) ;

L_94a6:
94a6:    80 45        ld.b A, #0x45
94a8:    a2 01 14     st.b A, @(0x0114)
94ab:    7a 01 18     call @(0x0118)
94ae:    12 ed        bns L_949d
94b0:    d0 41 4f     ld.w DC, #0x414f
94b3:    90 84 00     ld.w BA, #0x8400
94b6:    b5 21        st.w BA, (DC)+
94b8:    80 83        ld.b A, #0x83
94ba:    a5 21        st.b A, (DC)+
94bc:    3a           clr.w BA
94bd:    b5 21        st.w BA, (DC)+
94bf:    39           dec.w BA
94c0:    a9           st.b A, (DC)
94c1:    38           inc.w BA
94c2:    38           inc.w BA
94c3:    b1 41 b1     st.w BA, (0x41b1)

L_94c6:
94c6:    90 41 4d     ld.w BA, #0x414d
94c9:    2f 00        DMA load 0, 0
94cb:    90 ff f7     ld.w BA, #0xfff7
94ce:    2f 02        DMA load 0, 2
94d0:    2f 34        DMA load 3, 4
94d2:    2f 06        DMA load 0, 6
94d4:    80 43        ld.b A, #0x43
94d6:    a2 01 14     st.b A, @(0x0114)
94d9:    7a 01 18     call @(0x0118)
94dc:    12 bf        bns L_949d
94de:    80 45        ld.b A, #0x45
94e0:    a2 01 14     st.b A, @(0x0114)
94e3:    7a 01 18     call @(0x0118)
94e6:    13 1c        bnc L_9504
94e8:    7a 01 12     call @(0x0112)
94eb:    "TRACK=\0"
94f2:    91 41 52     ld.w BA, (0x4152)
94f5:    7a 01 10     call @(0x0110)
94f8:    7a 01 12     call @(0x0112)
94fb:    "\r\n\0"
94fe:    a1 f1 0b     st.b A, (0xf10b)
9501:    a1 f1 0c     st.b A, (0xf10c)

L_9504:
9504:    91 41 b1     ld.w BA, (0x41b1)
9507:    16 1a        blt L_9523
9509:    d1 41 52     ld.w DC, (0x4152)
950c:    50 20        add.w BA, DC
950e:    b1 41 52     st.w BA, (0x4152)
9511:    d0 03 36     ld.w DC, #0x0336
9514:    59           sub.w DC, BA
9515:    15 af        bzc L_94c6
9517:    3a           clr.w BA
9518:    39           dec.w BA
9519:    b1 41 b1     st.w BA, (0x41b1)
951c:    80 10        ld.b A, #0x10
951e:    a1 41 50     st.b A, (0x4150)
9521:    73 a3        jump (PC-0x5d) L_94c6

L_9523:
9523:    91 41 52     ld.w BA, (0x4152)
9526:    39           dec.w BA
9527:    b1 41 52     st.w BA, (0x4152)
952a:    17 9a        ble L_94c6
952c:    7a 01 04     call @(0x0104)
952f:    04           fsi
9530:    79 90 01     call #0x9001 L_9001
9533:    80 50        ld.b A, #0x50
9535:    80 7d        ld.b A, #0x7d
9537:    00           HALT
9538:    f8 08 7a     stb? A, [0x0087a]
953b:    01           nop
953c:    06           fsc
953d:    80 41        ld.b A, #0x41
953f:    a2 01 14     st.b A, @(0x0114)
9542:    7a 01 0c     call @(0x010c)
9545:    2a           clr.b A
9546:    a2 01 14     st.b A, @(0x0114)
9549:    7a 01 0c     call @(0x010c)
954c:    2a           clr.b A
954d:    a2 01 14     st.b A, @(0x0114)
9550:    7a 01 18     call @(0x0118)
9553:    12 44        bns L_9599
9555:    90 41 4d     ld.w BA, #0x414d
9558:    5c           mov EF, BA
9559:    90 81 00     ld.w BA, #0x8100
955c:    b5 61        st.w BA, (EF)+
955e:    90 84 00     ld.w BA, #0x8400
9561:    b5 61        st.w BA, (EF)+
9563:    80 83        ld.b A, #0x83
9565:    a5 61        st.b A, (EF)+
9567:    3a           clr.w BA
9568:    b5 61        st.w BA, (EF)+
956a:    80 85        ld.b A, #0x85
956c:    a5 61        st.b A, (EF)+
956e:    d0 10 00     ld.w DC, #0x1000

L_9571:
9571:    e5 61        st.b C, (EF)+
9573:    90 01 90     ld.w BA, #0x0190
9576:    b5 61        st.w BA, (EF)+
9578:    20 30        inc.b C
957a:    21 20        dec.b D
957c:    15 f3        bzc L_9571
957e:    80 ff        ld.b A, #0xff
9580:    ab           st.b A, (EF)

L_9581:
9581:    90 ff c3     ld.w BA, #0xffc3
9584:    2f 02        DMA load 0, 2
9586:    90 41 4d     ld.w BA, #0x414d
9589:    2f 00        DMA load 0, 0
958b:    2f 34        DMA load 3, 4
958d:    2f 06        DMA load 0, 6
958f:    80 43        ld.b A, #0x43
9591:    a2 01 14     st.b A, @(0x0114)
9594:    7a 01 18     call @(0x0118)
9597:    13 09        bnc L_95a2

L_9599:
9599:    a1 f1 0b     st.b A, (0xf10b)
959c:    a1 f1 0c     st.b A, (0xf10c)
959f:    72 01 0e     jump @(0x010e) ;

L_95a2:
95a2:    90 e6 ff     ld.w BA, #0xe6ff
95a5:    2f 02        DMA load 0, 2
95a7:    90 01 1c     ld.w BA, #0x011c
95aa:    2f 00        DMA load 0, 0
95ac:    2f 34        DMA load 3, 4
95ae:    2f 06        DMA load 0, 6
95b0:    80 45        ld.b A, #0x45
95b2:    a2 01 14     st.b A, @(0x0114)
95b5:    7a 01 18     call @(0x0118)
95b8:    13 16        bnc L_95d0
95ba:    7a 01 12     call @(0x0112)
95bd:    "TRACK=\0"
95c4:    91 41 52     ld.w BA, (0x4152)
95c7:    7a 01 10     call @(0x0110)
95ca:    7a 01 12     call @(0x0112)
95cd:    "\r\n\0"

L_95d0:
95d0:    91 41 52     ld.w BA, (0x4152)
95d3:    15 01        bzc L_95d6
95d5:    38           inc.w BA

L_95d6:
95d6:    3d           sll.w BA
95d7:    b1 41 52     st.w BA, (0x4152)
95da:    d0 03 36     ld.w DC, #0x0336
95dd:    59           sub.w DC, BA
95de:    19 a1        ble L_9581
95e0:    a1 f1 0a     st.b A, (0xf10a)
95e3:    7a 01 04     call @(0x0104)
95e6:    05           fci
95e7:    3d           sll.w BA

Entry_FLOPPY_SEEK_TEST:
95e8:    90 01 80     ld.w BA, #0x0180
95eb:    50 80        add.w BA, HL
95ed:    7d 00        call (A + 0x00)
95ef:    f8
95f0:    00
95f1:    7a 01 06     call @(0x0106)
95f4:    d0 41 4d     ld.w DC, #0x414d
95f7:    90 81 01     ld.w BA, #0x8101
95fa:    b5 21        st.w BA, (DC)+
95fc:    80 82        ld.b A, #0x82
95fe:    a9           st.b A, (DC)
95ff:    90 ff fc     ld.w BA, #0xfffc
9602:    2f 02        DMA load 0, 2
9604:    90 41 4d     ld.w BA, #0x414d
9607:    2f 00        DMA load 0, 0
9609:    2f 34        DMA load 3, 4
960b:    2f 06        DMA load 0, 6
960d:    80 43        ld.b A, #0x43
960f:    a2 01 14     st.b A, @(0x0114)
9612:    7a 01 18     call @(0x0118)
9615:    13 09        bnc L_9620

L_9617:
9617:    a1 f1 0b     st.b A, (0xf10b)
961a:    a1 f1 0c     st.b A, (0xf10c)
961d:    72 01 0e     jump @(0x010e) ;

L_9620:
9620:    80 45        ld.b A, #0x45
9622:    a2 01 14     st.b A, @(0x0114)
9625:    7a 01 18     call @(0x0118)
9628:    12 ed        bns L_9617
962a:    d0 41 4f     ld.w DC, #0x414f
962d:    90 83 01     ld.w BA, #0x8301
9630:    b9           st.w BA, (DC)
9631:    80 01        ld.b A, #0x01
9633:    a1 41 b1     st.b A, (0x41b1)

L_9636:
9636:    90 41 4d     ld.w BA, #0x414d
9639:    2f 00        DMA load 0, 0
963b:    90 ff fb     ld.w BA, #0xfffb
963e:    2f 02        DMA load 0, 2
9640:    2f 34        DMA load 3, 4
9642:    2f 06        DMA load 0, 6
9644:    80 43        ld.b A, #0x43
9646:    a2 01 14     st.b A, @(0x0114)
9649:    7a 01 18     call @(0x0118)
964c:    12 c9        bns L_9617
964e:    80 45        ld.b A, #0x45
9650:    a2 01 14     st.b A, @(0x0114)
9653:    7a 01 18     call @(0x0118)
9656:    13 1c        bnc L_9674
9658:    7a 01 12     call @(0x0112)
965b:    "TRACK=\0"
9662:    81 41 50     ld.b A, (0x4150)
9665:    7a 01 0a     call @(0x010a)
9668:    7a 01 12     call @(0x0112)
966b:    "\r\n\0"
966e:    a1 f1 0b     st.b A, (0xf10b)
9671:    a1 f1 0c     st.b A, (0xf10c)

L_9674:
9674:    81 41 b1     ld.b A, (0x41b1)
9677:    16 14        blt L_968d
9679:    c1 41 50     ld.b C, (0x4150)
967c:    40 31        add.b A, C
967e:    a1 41 50     st.b A, (0x4150)
9681:    c0 4b        ld.b C, #0x4b
9683:    49           sub.b C, A
9684:    15 b0        bzc L_9636
9686:    80 ff        ld.b A, #0xff
9688:    a1 41 b1     st.b A, (0x41b1)
968b:    73 a9        jump (PC-0x57) L_9636

L_968d:
968d:    81 41 50     ld.b A, (0x4150)
9690:    29           dec.b A
9691:    a1 41 50     st.b A, (0x4150)
9694:    17 a0        ble L_9636
9696:    7a 01 04     call @(0x0104)
9699:    05           fci
969a:    f4 90        st.w DC, @(PC-0x70)
969c:    01           nop
969d:    80 50        ld.b A, #0x50
969f:    80 7d        ld.b A, #0x7d
96a1:    00           HALT
96a2:    f8 00 7a     stb? A, [0x0007a]
96a5:    01           nop
96a6:    06           fsc
96a7:    80 41        ld.b A, #0x41
96a9:    a2 01 14     st.b A, @(0x0114)
96ac:    7a 01 0c     call @(0x010c)
96af:    2a           clr.b A
96b0:    a2 01 14     st.b A, @(0x0114)
96b3:    7a 01 0c     call @(0x010c)
96b6:    2a           clr.b A
96b7:    a2 01 14     st.b A, @(0x0114)
96ba:    7a 01 18     call @(0x0118)
96bd:    12 3d        bns L_96fc
96bf:    90 41 4d     ld.w BA, #0x414d
96c2:    5c           mov EF, BA
96c3:    90 81 01     ld.w BA, #0x8101
96c6:    b5 61        st.w BA, (EF)+
96c8:    90 83 01     ld.w BA, #0x8301
96cb:    b5 61        st.w BA, (EF)+
96cd:    d0 10 00     ld.w DC, #0x1000

L_96d0:
96d0:    80 88        ld.b A, #0x88
96d2:    a5 61        st.b A, (EF)+
96d4:    e5 61        st.b C, (EF)+
96d6:    2a           clr.b A
96d7:    a5 61        st.b A, (EF)+
96d9:    90 01 90     ld.w BA, #0x0190
96dc:    b5 61        st.w BA, (EF)+
96de:    20 30        inc.b C
96e0:    21 20        dec.b D
96e2:    15 ec        bzc L_96d0

L_96e4:
96e4:    90 ff ab     ld.w BA, #0xffab
96e7:    2f 02        DMA load 0, 2
96e9:    90 41 4d     ld.w BA, #0x414d
96ec:    2f 00        DMA load 0, 0
96ee:    2f 34        DMA load 3, 4
96f0:    2f 06        DMA load 0, 6
96f2:    80 43        ld.b A, #0x43
96f4:    a2 01 14     st.b A, @(0x0114)
96f7:    7a 01 18     call @(0x0118)
96fa:    13 09        bnc L_9705

L_96fc:
96fc:    a1 f1 0b     st.b A, (0xf10b)
96ff:    a1 f1 0c     st.b A, (0xf10c)
9702:    72 01 0e     jump @(0x010e) ;

L_9705:
9705:    90 e6 ff     ld.w BA, #0xe6ff
9708:    2f 02        DMA load 0, 2
970a:    90 01 1c     ld.w BA, #0x011c
970d:    2f 00        DMA load 0, 0
970f:    2f 34        DMA load 3, 4
9711:    2f 06        DMA load 0, 6
9713:    80 45        ld.b A, #0x45
9715:    a2 01 14     st.b A, @(0x0114)
9718:    7a 01 18     call @(0x0118)
971b:    13 16        bnc L_9733
971d:    7a 01 12     call @(0x0112)
9720:    "TRACK=\0"
9727:    81 41 50     ld.b A, (0x4150)
972a:    7a 01 0a     call @(0x010a)
972d:    7a 01 12     call @(0x0112)
9730:    "\r\n\0"

L_9733:
9733:    81 41 50     ld.b A, (0x4150)
9736:    2d           sll.b A
9737:    a1 41 50     st.b A, (0x4150)
973a:    c0 4b        ld.b C, #0x4b
973c:    49           sub.b C, A
973d:    19 a5        ble L_96e4
973f:    a1 f1 0a     st.b A, (0xf10a)
9742:    7a 01 04     call @(0x0104)
9745:    06           fsc
9746:    a7 90        st.b A, unknown
9748:    01           nop
9749:    80 50        ld.b A, #0x50
974b:    80 7d        ld.b A, #0x7d
974d:    00           HALT
974e:    00           HALT
974f:    00           HALT
9750:    55 86        mov.w EF, HL
9752:    3a           clr.w BA

L_9753:
9753:    85 61        ld.b A, (EF)+
9755:    40 10        add.b B, A
9757:    d0 07 96     ld.w DC, #0x0796
975a:    50 82        add.w DC, HL
975c:    51 62        sub.w DC, EF
975e:    15 f3        bzc L_9753
9760:    8b           ld.b A, (EF)
9761:    41 01        sub.b A, B
9763:    15 18        bzc L_977d
9765:    7a 01 12     call @(0x0112)
9768:    "\n\r*** PASS ***\0"
9777:    a1 f1 0a     st.b A, (0xf10a)
977a:    72 01 0e     jump @(0x010e) ;

L_977d:
977d:    7a 01 12     call @(0x0112)
9780:    "*** FAIL ***\0"
978d:    a1 f1 0b     st.b A, (0xf10b)
9790:    a1 f1 0c     st.b A, (0xf10c)
9793:    72 01 0e     jump @(0x010e) ;
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
