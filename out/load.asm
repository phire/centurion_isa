
SyscallVector:
0100:    71 80 00               jmp R_8000

CurrentProcess:
0103:    01 ea                  StartProcess
0105:    01
0106:    19
0107:    01
0108:    b6 '6'

DevicesPtr:
0109:    01 ba                  Devices
010b:    01
010c:    e4 'd'
010d:    04
010e:    45
010f:    88
0110:    cc 'L'
0111:    00
0112:    13
0113:    00
0114:    00
0115:    28
0116:    01
0117:    ea 'j'
0118:    00
0119:    00
011a:    00
011b:    00
011c:    ff
011d:    04 5b                  CenturionVI_String
011f:    ff
0120:    04
0121:    43
0122:    00
0123:    00
0124:    00
0125:    01

EarlyInitDevicesPtr:
0126:    04 3e                  EarlyInitDevices
0128:    <null bytes>

013b:    ff
013c:    ff
013d:    ff
013e:    00
013f:    00
0140:    00
0141:    00
0142:    ff
0143:    ff
0154:    01
0155:    e2 'b'
0156:    00
0157:    00
0158:    00
0159:    00
015a:    00
015b:    00
015c:    00
015d:    00
015e:    01
015f:    a1 '!'
0160:    3c

PageTableOne:
0161:    1f
0162:    01
0163:    02
0164:    03
0165:    04
0166:    05
0167:    06
0168:    07
0169:    08
016a:    09
016b:    0a
016c:    0b
016d:    0c
016e:    0d
016f:    0e
0170:    0f
0171:    10
0172:    11
0173:    12
0174:    13
0175:    14
0176:    15
0177:    16
0178:    17
0179:    18
017a:    19
017b:    1a
017c:    1b
017d:    1c
017e:    1d
017f:    7e
0180:    7f

PageTableTwo:
0181:    1f
0182:    01
0183:    02
0184:    03
0185:    04
0186:    05
0187:    06
0188:    07
0189:    08
018a:    09
018b:    0a
018c:    0b
018d:    0c
018e:    0d
018f:    0e
0190:    0f
0191:    10
0192:    11
0193:    12
0194:    13
0195:    14
0196:    15
0197:    16
0198:    17
0199:    18
019a:    19
019b:    1a
019c:    1b
019d:    1c
019e:    1d
019f:    7e
01a0:    7f

R_01a1:
01a1:    00                     HALT
01a2:    00                     HALT
01a3:    00                     HALT
01a4:    00                     HALT
01a5:    00                     HALT
01a6:    00                     HALT
01a7:    00                     HALT
01a8:    00                     HALT
01a9:    00                     HALT
01aa:    b6                     unknown
01ab:    56                     unknown
01ac:    <null bytes>


R_01b6:
01b6:    01                     nop
01b7:    ea                     st BL, [X]
01b8:    00                     HALT
01b9:    00                     HALT

Devices:
01ba:    02 46                  Device_CRT0
01bc:    02 71                  Device_DISK0
01be:    02 8a                  Device_DISK1
01c0:    02 a3                  Device_DISK2
01c2:    02 bc                  Device_DISK3
01c4:    02 d5                  Device_DISK4
01c6:    02 ee                  Device_DISK5
01c8:    03 07                  Device_DISK6
01ca:    03 20                  Device_DISK7
01cc:    03 39                  Device_DISK10
01ce:    03 52                  Device_DISK11
01d0:    03 6b                  Device_DISK12
01d2:    03 84                  Device_DISK13
01d4:    03 9d                  Device_DISK20
01d6:    03 b6                  Device_DISK21
01d8:    03 cf                  Device_DISK22
01da:    03 e8                  Device_DISK23
01dc:    04 01                  Device_DISK24
01de:    04 1a                  Device_DISK25

DevicesEnd:
01e0:    00 00                  (0x0)

R_01e2:
01e2:    ff                     st B, [P]
01e3:    ff                     st B, [P]

R_01e4:
01e4:    00                     HALT
01e5:    02                     sf
01e6:    02                     sf
01e7:    46
01e8:    00
01e9:    00

StartProcess:
01ea:    01                     nop
01eb:    00                     HALT	 ; Current open file? Number open files?
01ec:    00                     HALT
01ed:    00                     HALT

StartProcess_File?:
01ee:    04 45                  R_0445
01f0:    04
01f1:    13

StartProcess_ErrorDevice:
01f2:    02 46                  Device_CRT0
01f4:    00
01f5:    00

StartProcess_TopOfMemory:
01f6:    ef ff                  (0xefff)
01f8:    ef                     st BL, [P]
01f9:    ff                     st B, [P]
01fa:    00                     HALT
01fb:    00                     HALT
01fc:    01                     nop
01fd:    00                     HALT
01fe:    00                     HALT
01ff:    00                     HALT
0200:    0a                     reti
0201:    04                     ei
0202:    5b                     mov X, A
0203:    <null bytes>


L_0211:
0211:    <null bytes>

021c:    ff                     st B, [P]
021d:    ff                     st B, [P]
021e:    00                     HALT
021f:    00                     HALT
0220:    1f 01                  b?F L_0223
0222:    02                     sf

L_0223:
0223:    03                     rf
0224:    04                     ei
0225:    05                     di
0226:    06                     sl
0227:    07                     rl
0228:    08                     cl
0229:    09                     ret
022a:    0a
022b:    0b
022c:    0c
022d:    0d
022e:    0e
022f:    0f
0230:    10
0231:    11
0232:    12
0233:    13
0234:    14
0235:    15
0236:    16
0237:    17
0238:    18
0239:    19
023a:    1a
023b:    1b
023c:    1c
023d:    1d
023e:    7e
023f:    7f
0240:    fd '}'
0241:    00
0242:    00
0243:    00
0244:    00
0245:    00

Device_CRT0:
0246:    c7                     "G"
0247:    02 01                  (0x201)
0249:    04 33                  R_0433

Device_CRT0_Obj:
024b:    c2 1f                  CrtDeviceObj
024d:    c3 d2 d4 b0 a0 a0      "CRT0  "
0253:    00                     HALT
0254:    00                     HALT
0255:    f2 00                  L_f200
0257:    00
0258:    00                     HALT
0259:    00                     HALT
025a:    00                     HALT
025b:    00                     HALT

Device_CRT0_Lock:
025c:    00                     (0x0)
025d:    83
025e:    18
025f:    c5 'E'
0260:    00
0261:    00
0262:    00
0263:    b6 56                  R_b656
0265:    00
0266:    00
0267:    00
0268:    00
0269:    00
026a:    00
026b:    ff
026c:    ff
026d:    ff
026e:    ff
026f:    ff
0270:    ff

Device_DISK0:
0271:    57                     "W"
0272:    04 00                  (0x400)
0274:    04 34                  R_0434

Device_DISK0_Obj:
0276:    b6 b4                  R_b6b4
0278:    c4 c9 d3 cb b0 a0      "DISK0 "
027e:    00
027f:    00                     HALT
0280:    f1 40                  L_f140
0282:    03
0283:    2a                     clr AL, #0
0284:    00                     HALT
0285:    05                     di
0286:    f2 5a 00               st B, @[0x5a00]
0289:    64 57                  ld X, @[0x02e2|+0x57]
028b:    04 01                  (0x401)
028d:    04 34                  R_0434

Device_DISK1_Obj:
028f:    b6 b6                  HawkDeviceObj
0291:    c4 c9 d3 cb b1 a0      "DISK1 "
0297:    00
0298:    00                     HALT
0299:    f1 40                  L_f140
029b:    03
029c:    2a                     clr AL, #0
029d:    01                     nop
029e:    05                     di
029f:    f2 5a 00               st B, @[0x5a00]
02a2:    64 57                  ld X, @[0x02fb|+0x57]
02a4:    04 02                  (0x402)
02a6:    04 35                  R_0435

Device_DISK2_Obj:
02a8:    b6 b6                  HawkDeviceObj
02aa:    c4 c9 d3 cb b2 a0      "DISK2 "
02b0:    00
02b1:    00                     HALT
02b2:    f1 40                  L_f140
02b4:    03
02b5:    2a                     clr AL, #0
02b6:    02                     sf
02b7:    05                     di
02b8:    f2 5a 00               st B, @[0x5a00]
02bb:    64 57                  ld X, @[0x0314|+0x57]
02bd:    04 03                  (0x403)
02bf:    04 35                  R_0435

Device_DISK3_Obj:
02c1:    b6 b6                  HawkDeviceObj
02c3:    c4 c9 d3 cb b3 a0      "DISK3 "
02c9:    00                     HALT
02ca:    00                     HALT
02cb:    f1 40                  L_f140
02cd:    03
02ce:    2a                     clr AL, #0
02cf:    03                     rf
02d0:    05                     di
02d1:    f2 5a 00               st B, @[0x5a00]
02d4:    64 57                  ld X, @[0x032d|+0x57]
02d6:    04 04                  (0x404)
02d8:    04 36                  R_0436

Device_DISK4_Obj:
02da:    b6 b6                  HawkDeviceObj
02dc:    c4 c9 d3 cb b4 a0      "DISK4 "
02e2:    00                     HALT
02e3:    00                     HALT
02e4:    f1 40                  L_f140
02e6:    03
02e7:    2a                     clr AL, #0
02e8:    04                     ei
02e9:    05                     di
02ea:    f2 5a 00               st B, @[0x5a00]
02ed:    64 57                  ld X, @[0x0346|+0x57]
02ef:    04 05                  (0x405)
02f1:    04 36                  R_0436

Device_DISK5_Obj:
02f3:    b6 b6                  HawkDeviceObj
02f5:    c4 c9 d3 cb b5 a0      "DISK5 "
02fb:    00                     HALT
02fc:    00                     HALT
02fd:    f1 40                  L_f140
02ff:    03
0300:    2a                     clr AL, #0
0301:    05                     di
0302:    05                     di
0303:    f2 5a 00               st B, @[0x5a00]
0306:    64 57                  ld X, @[0x035f|+0x57]
0308:    04 06                  (0x406)
030a:    04 37                  R_0437

Device_DISK6_Obj:
030c:    b6 b6                  HawkDeviceObj
030e:    c4 c9 d3 cb b6 a0      "DISK6 "
0314:    00
0315:    00                     HALT
0316:    f1 40                  L_f140
0318:    03
0319:    2a                     clr AL, #0
031a:    06                     sl
031b:    05                     di
031c:    f2 5a 00               st B, @[0x5a00]
031f:    64 57                  ld X, @[0x0378|+0x57]
0321:    04 07                  (0x407)
0323:    04 37                  R_0437

Device_DISK7_Obj:
0325:    b6 b6                  HawkDeviceObj
0327:    c4 c9 d3 cb b7 a0      "DISK7 "
032d:    00
032e:    00                     HALT
032f:    f1 40                  L_f140
0331:    03
0332:    2a                     clr AL, #0
0333:    07                     rl
0334:    05                     di
0335:    f2 5a 00               st B, @[0x5a00]
0338:    64 57                  ld X, @[0x0391|+0x57]
033a:    04 0a                  (0x40a)
033c:    04 39                  R_0439

Device_DISK10_Obj:
033e:    bc 5c                  FfcDeviceObj
0340:    c4 c9 d3 cb b1 b0      "DISK10"
0346:    00
0347:    00                     HALT
0348:    08 00                  L_0800
034a:    00                     HALT
034b:    60 01 05               ld X, 0x0105
034e:    f2 06 00               st B, @[0x0600]
0351:    64 57                  ld X, @[0x03aa|+0x57]
0353:    04 0b                  (0x40b)
0355:    04 3a                  R_043a

Device_DISK11_Obj:
0357:    bc 5c                  FfcDeviceObj
0359:    c4 c9 d3 cb b1 b1      "DISK11"
035f:    00
0360:    00
0361:    08 00                  L_0800
0363:    00
0364:    60
0365:    02
0366:    05
0367:    f2 'r'
0368:    06
0369:    00
036a:    64

Device_DISK12:
036b:    57                     "W"
036c:    04 0c                  (0x40c)
036e:    04 3b                  R_043b

Device_DISK12_Obj:
0370:    bc 5c                  FfcDeviceObj
0372:    c4 c9 d3 cb b1 b2      "DISK12"
0378:    00
0379:    00                     HALT
037a:    08 00                  L_0800
037c:    00                     HALT
037d:    60 04 05               ld X, 0x0405
0380:    f2 06 00               st B, @[0x0600]
0383:    64 57                  ld X, @[0x03dc|+0x57]
0385:    04 0d                  (0x40d)
0387:    04 3c                  R_043c

Device_DISK13_Obj:
0389:    bc 5c                  FfcDeviceObj
038b:    c4 c9 d3 cb b1 b3      "DISK13"
0391:    00
0392:    00                     HALT
0393:    08 00                  L_0800
0395:    00                     HALT
0396:    60 08 05               ld X, 0x0805
0399:    f2 06 00               st B, @[0x0600]
039c:    64 57                  ld X, @[0x03f5|+0x57]
039e:    04 14                  (0x414)
03a0:    04 3d                  R_043d

Device_DISK20_Obj:
03a2:    c5 ee                  CmdDeviceObj
03a4:    c4 c9 d3 cb b2 b0      "DISK20"
03aa:    00
03ab:    00                     HALT
03ac:    f8 08                  L_f808
03ae:    08                     cl
03af:    03                     rf
03b0:    00                     HALT
03b1:    05                     di
03b2:    f2 ff 00               st B, @[0xff00]
03b5:    64 57                  ld X, @[0x040e|+0x57]
03b7:    04 15                  (0x415)
03b9:    04 3d                  R_043d

Device_DISK21_Obj:
03bb:    c5 ee                  CmdDeviceObj
03bd:    c4 c9 d3 cb b2 b1      "DISK21"
03c3:    00
03c4:    00                     HALT
03c5:    f8 08                  L_f808
03c7:    08                     cl
03c8:    03                     rf
03c9:    01                     nop
03ca:    05                     di
03cb:    f2 ff 00               st B, @[0xff00]
03ce:    64 57                  ld X, @[0x0427|+0x57]
03d0:    04 16                  (0x416)
03d2:    04 3d                  R_043d

Device_DISK22_Obj:
03d4:    c5 ee                  CmdDeviceObj
03d6:    c4 c9 d3 cb b2 b2      "DISK22"
03dc:    00
03dd:    00                     HALT
03de:    f8 08                  L_f808
03e0:    08                     cl
03e1:    03                     rf
03e2:    02                     sf
03e3:    05                     di
03e4:    f2 ff 00               st B, @[0xff00]
03e7:    64 57                  ld X, @[0x0440|+0x57]
03e9:    04 17                  (0x417)
03eb:    04 3d                  R_043d

Device_DISK23_Obj:
03ed:    c5 ee                  CmdDeviceObj
03ef:    c4 c9 d3 cb b2 b3      "DISK23"
03f5:    00
03f6:    00                     HALT
03f7:    f8 08                  L_f808
03f9:    08                     cl
03fa:    03                     rf
03fb:    03                     rf
03fc:    05                     di
03fd:    f2 ff 00               st B, @[0xff00]
0400:    64 57                  ld X, @[0x0459|+0x57]
0402:    04 18                  (0x418)
0404:    04 3d                  R_043d

Device_DISK24_Obj:
0406:    c5 ee                  CmdDeviceObj
0408:    c4 c9 d3 cb b2 b4      "DISK24"
040e:    00
040f:    00                     HALT
0410:    f8 08                  L_f808
0412:    08                     cl
0413:    03                     rf
0414:    04                     ei
0415:    05                     di
0416:    f2 ff 00               st B, @[0xff00]
0419:    64 57                  ld X, @[0x0472|+0x57]
041b:    04 19                  (0x419)
041d:    04 3d                  R_043d

Device_DISK25_Obj:
041f:    c5 ee                  CmdDeviceObj
0421:    c4 c9 d3 cb b2 b5      "DISK25"
0427:    00
0428:    00                     HALT
0429:    f8 08                  L_f808
042b:    08                     cl
042c:    03                     rf
042d:    05                     di
042e:    05                     di
042f:    f2 ff 00               st B, @[0xff00]
0432:    64 00                  ld X, @[R_0434|0x0434|+0x0]

R_0434:
0434:    <null bytes>


R_0435:
0435:    00                     HALT

R_0436:
0436:    00                     HALT

R_0437:
0437:    00                     HALT
0438:    00                     HALT

R_0439:
0439:    00                     HALT

R_043a:
043a:    00                     HALT

R_043b:
043b:    00                     HALT

R_043c:
043c:    00                     HALT

R_043d:
043d:    00                     HALT

EarlyInitDevices:
    ; Null terminated list of Device objects to early-initialize at boot
043e:    c2 1f                  CrtDeviceObj
0440:    00
0441:    00
0442:    ff

R_0443:
0443:    ff                     st B, [P]
0444:    00                     HALT

R_0445:
0445:    00                     HALT
0446:    ff                     st B, [P]
0447:    ff                     st B, [P]
0448:    00                     HALT
0449:    ff                     st B, [P]
044a:    ff                     st B, [P]
044b:    00                     HALT
044c:    ff                     st B, [P]
044d:    ff                     st B, [P]
044e:    00                     HALT
044f:    ff                     st B, [P]
0450:    ff                     st B, [P]
0451:    a0 a0                  st AL, 0xa0
0453:    a0 a0                  st AL, 0xa0
0455:    a0 a0                  st AL, 0xa0
0457:    a0 a0                  st AL, 0xa0
0459:    a0 a0                  st AL, 0xa0

CenturionVI_String:
045b:    23, "CENTURION VI (1,H10,F4)"
0474:    71
0475:    cd 'M'
0476:    d1 'Q'
0477:    ff
0478:    ff
0479:    ff
047a:    ff
047b:    ff
047c:    ff
047d:    ff
047e:    ff
047f:    ff
0480:    ff
0481:    ff
0482:    ff
0483:    ff
0484:    ff
0485:    ff
0486:    ff
0487:    ff
0488:    ff
0489:    ff
048a:    ff
048b:    ff
048c:    ff
048d:    ff
048e:    ff
048f:    <null bytes>

05ef:    8d
05f0:    8d
05f1:    ff

R_05f2:
05f2:    ff                     st B, [P]
05f3:    ff                     st B, [P]
05f4:    ff                     st B, [P]
05f5:    ff                     st B, [P]
05f6:    ff                     st B, [P]
05f7:    ff                     st B, [P]
05f8:    ff                     st B, [P]
05f9:    ff                     st B, [P]
05fa:    ff                     st B, [P]
05fb:    ff                     st B, [P]
05fc:    ff                     st B, [P]
05fd:    ff                     st B, [P]
05fe:    ff                     st B, [P]
05ff:    ff                     st B, [P]
0600:    ff                     st B, [P]
0601:    ff                     st B, [P]
0602:    ff                     st B, [P]
0603:    ff                     st B, [P]
0604:    ff                     st B, [P]
0605:    ff                     st B, [P]
0606:    ff                     st B, [P]
0607:    ff                     st B, [P]
0608:    ff                     st B, [P]
0609:    ff                     st B, [P]
060a:    ff                     st B, [P]
060b:    ff                     st B, [P]
060c:    ff                     st B, [P]
060d:    ff                     st B, [P]
060e:    ff                     st B, [P]
060f:    ff                     st B, [P]
0610:    ff                     st B, [P]
0611:    ff                     st B, [P]
0612:    ff                     st B, [P]
0613:    ff                     st B, [P]
0614:    ff                     st B, [P]
0615:    ff                     st B, [P]
0616:    ff                     st B, [P]
0617:    ff                     st B, [P]
0618:    ff                     st B, [P]
0619:    ff                     st B, [P]
061a:    ff                     st B, [P]
061b:    ff                     st B, [P]
061c:    ff                     st B, [P]
061d:    ff                     st B, [P]
061e:    ff                     st B, [P]
061f:    ff                     st B, [P]
0620:    ff                     st B, [P]
0621:    ff                     st B, [P]
0622:    ff                     st B, [P]
0623:    ff                     st B, [P]
0624:    ff                     st B, [P]
0625:    ff                     st B, [P]
0626:    ff                     st B, [P]
0627:    ff                     st B, [P]
0628:    ff                     st B, [P]
0629:    ff                     st B, [P]
062a:    ff                     st B, [P]
062b:    ff                     st B, [P]
062c:    ff                     st B, [P]
062d:    ff                     st B, [P]
062e:    ff                     st B, [P]
062f:    ff                     st B, [P]
0630:    ff                     st B, [P]
0631:    ff                     st B, [P]
0632:    ff                     st B, [P]
0633:    ff                     st B, [P]
0634:    ff                     st B, [P]
0635:    ff                     st B, [P]
0636:    ff                     st B, [P]
0637:    ff                     st B, [P]
0638:    ff                     st B, [P]
0639:    ff                     st B, [P]
063a:    ff                     st B, [P]
063b:    ff                     st B, [P]
063c:    ff                     st B, [P]
063d:    ff                     st B, [P]
063e:    ff                     st B, [P]
063f:    ff                     st B, [P]
0640:    ff                     st B, [P]
0641:    ff                     st B, [P]
0642:    ff                     st B, [P]
0643:    ff                     st B, [P]
0644:    ff                     st B, [P]
0645:    ff                     st B, [P]
0646:    ff                     st B, [P]
0647:    ff                     st B, [P]
0648:    ff                     st B, [P]
0649:    ff                     st B, [P]
064a:    ff                     st B, [P]
064b:    ff                     st B, [P]
064c:    ff                     st B, [P]
064d:    ff                     st B, [P]
064e:    ff                     st B, [P]
064f:    ff                     st B, [P]
0650:    ff                     st B, [P]
0651:    ff                     st B, [P]
0652:    ff                     st B, [P]
0653:    ff                     st B, [P]
0654:    ff                     st B, [P]
0655:    ff                     st B, [P]
0656:    ff                     st B, [P]
0657:    ff                     st B, [P]
0658:    ff                     st B, [P]
0659:    ff                     st B, [P]
065a:    ff                     st B, [P]
065b:    ff                     st B, [P]
065c:    ff                     st B, [P]
065d:    ff                     st B, [P]
065e:    ff                     st B, [P]
065f:    ff                     st B, [P]
0660:    ff                     st B, [P]
0661:    ff                     st B, [P]
0662:    ff                     st B, [P]
0663:    ff                     st B, [P]
0664:    ff                     st B, [P]
0665:    ff                     st B, [P]
0666:    ff                     st B, [P]
0667:    ff                     st B, [P]
0668:    ff                     st B, [P]
0669:    ff                     st B, [P]
066a:    ff                     st B, [P]
066b:    ff                     st B, [P]
066c:    ff                     st B, [P]
066d:    ff                     st B, [P]
066e:    ff                     st B, [P]
066f:    ff                     st B, [P]
0670:    ff                     st B, [P]
0671:    ff                     st B, [P]
0672:    ff                     st B, [P]
0673:    ff                     st B, [P]
0674:    ff                     st B, [P]
0675:    ff                     st B, [P]
0676:    ff                     st B, [P]
0677:    ff                     st B, [P]
0678:    ff                     st B, [P]
0679:    ff                     st B, [P]
067a:    ff                     st B, [P]
067b:    ff                     st B, [P]
067c:    ff                     st B, [P]
067d:    ff                     st B, [P]
067e:    ff                     st B, [P]
067f:    ff                     st B, [P]
0680:    ff                     st B, [P]
0681:    ff                     st B, [P]
0682:    ff                     st B, [P]
0683:    ff                     st B, [P]
0684:    ff                     st B, [P]
0685:    ff                     st B, [P]
0686:    ff                     st B, [P]
0687:    ff                     st B, [P]
0688:    ff                     st B, [P]
0689:    ff                     st B, [P]
068a:    ff                     st B, [P]
068b:    ff                     st B, [P]
068c:    ff                     st B, [P]
068d:    ff                     st B, [P]
068e:    ff                     st B, [P]
068f:    ff                     st B, [P]
0690:    ff                     st B, [P]
0691:    ff                     st B, [P]
0692:    ff                     st B, [P]
0693:    ff                     st B, [P]
0694:    ff                     st B, [P]
0695:    ff                     st B, [P]
0696:    ff                     st B, [P]
0697:    ff                     st B, [P]
0698:    ff                     st B, [P]
0699:    ff                     st B, [P]
069a:    ff                     st B, [P]
069b:    ff                     st B, [P]
069c:    ff                     st B, [P]
069d:    ff                     st B, [P]
069e:    ff                     st B, [P]
069f:    ff                     st B, [P]
06a0:    ff                     st B, [P]
06a1:    ff                     st B, [P]
06a2:    ff                     st B, [P]
06a3:    ff                     st B, [P]
06a4:    ff                     st B, [P]
06a5:    ff                     st B, [P]
06a6:    ff                     st B, [P]
06a7:    ff                     st B, [P]
06a8:    ff                     st B, [P]
06a9:    ff                     st B, [P]
06aa:    ff                     st B, [P]
06ab:    ff                     st B, [P]
06ac:    ff                     st B, [P]
06ad:    ff                     st B, [P]
06ae:    ff                     st B, [P]
06af:    ff                     st B, [P]
06b0:    ff                     st B, [P]
06b1:    ff                     st B, [P]
06b2:    ff                     st B, [P]
06b3:    ff                     st B, [P]
06b4:    ff                     st B, [P]
06b5:    ff                     st B, [P]
06b6:    ff                     st B, [P]
06b7:    ff                     st B, [P]
06b8:    ff                     st B, [P]
06b9:    ff                     st B, [P]
06ba:    ff                     st B, [P]
06bb:    ff                     st B, [P]
06bc:    ff                     st B, [P]
06bd:    ff                     st B, [P]
06be:    ff                     st B, [P]
06bf:    ff                     st B, [P]
06c0:    ff                     st B, [P]
06c1:    ff                     st B, [P]
06c2:    ff                     st B, [P]
06c3:    ff                     st B, [P]
06c4:    ff                     st B, [P]
06c5:    ff                     st B, [P]
06c6:    ff                     st B, [P]
06c7:    ff                     st B, [P]
06c8:    ff                     st B, [P]
06c9:    ff                     st B, [P]
06ca:    ff                     st B, [P]
06cb:    ff                     st B, [P]
06cc:    ff                     st B, [P]
06cd:    ff                     st B, [P]
06ce:    ff                     st B, [P]
06cf:    ff                     st B, [P]
06d0:    ff                     st B, [P]
06d1:    ff                     st B, [P]
06d2:    ff                     st B, [P]
06d3:    ff                     st B, [P]
06d4:    ff                     st B, [P]
06d5:    ff                     st B, [P]
06d6:    ff                     st B, [P]
06d7:    ff                     st B, [P]
06d8:    ff                     st B, [P]
06d9:    ff                     st B, [P]
06da:    ff                     st B, [P]
06db:    ff                     st B, [P]
06dc:    ff                     st B, [P]
06dd:    ff                     st B, [P]
06de:    ff                     st B, [P]
06df:    ff                     st B, [P]
06e0:    ff                     st B, [P]
06e1:    ff                     st B, [P]
06e2:    ff                     st B, [P]
06e3:    ff                     st B, [P]
06e4:    ff                     st B, [P]
06e5:    ff                     st B, [P]
06e6:    ff                     st B, [P]
06e7:    ff                     st B, [P]
06e8:    ff                     st B, [P]
06e9:    ff                     st B, [P]
06ea:    ff                     st B, [P]
06eb:    ff                     st B, [P]
06ec:    ff                     st B, [P]
06ed:    ff                     st B, [P]
06ee:    ff                     st B, [P]
06ef:    ff                     st B, [P]
06f0:    ff                     st B, [P]
06f1:    ff                     st B, [P]
06f2:    ff                     st B, [P]
06f3:    <null bytes>


L_0800:
0800:    <null bytes>


R_8000:
8000:    71 83 3f               jmp R_833f
8003:    71
8004:    80
8005:    5a

R_8006:
8006:    7b 44                  call L_804c
8008:    f7                     ?F7?
8009:    7b 48                  call L_8053
800b:    09                     ret

R_800c:
800c:    7b 3e                  call L_804c
800e:    dd                     ld B, [S]
800f:    a5 2c 05               st AL, @[B + 0x05]
8012:    73 3f                  jmp L_8053

R_8014:
8014:    7b 36                  call L_804c
8016:    dd                     ld B, [S]
8017:    85 2c 05               ld AL, @[B + 0x05]
801a:    73 37                  jmp L_8053

R_801c:
801c:    45 11                  mov AL, AL
801e:    16 15                  blt L_8035
8020:    7b 2a                  call L_804c
8022:    dd                     ld B, [S]
8023:    d5 2c 05               ld B, @[B + 0x05]
8026:    49                     sub BL, AL
8027:    18 0c                  bgt L_8035
8029:    38                     inc A, #1
802a:    3d                     sll A, #1
802b:    dd                     ld B, [S]
802c:    d5 28 05               ld B, [B + 0x05]
802f:    58                     add B, A
8030:    d9                     ld B, [B]
8031:    22 00                  clr AH, #0
8033:    73 1e                  jmp L_8053

L_8035:
8035:    22 00                  clr AH, #0
8037:    21 00                  dec AH, #1
8039:    73 18                  jmp L_8053

R_803b:
803b:    3d                     sll A, #1
803c:    50 71 00 05            add A, [Y + 0x0005], A
8040:    14 10                  bz L_8052

R_8042:
8042:    7b 2f                  call L_8073
8044:    7d 04                  call @[A]
8046:    73 12                  jmp R_805a

R_8048:
8048:    7b 29                  call L_8073
804a:    75 20                  jmp [B]

L_804c:
804c:    c6                     unknown
804d:    2e 0c 78 01 81         wpf 0x78, [PageTableTwo|0x0181]

L_8052:
8052:    09                     ret

L_8053:
8053:    2e 0c 78 01 61         wpf 0x78, [PageTableOne|0x0161]
8058:    b6                     unknown
8059:    09                     ret

R_805a:
805a:    b3 14                  st A, [0x8070|+0x14]
805c:    91 01 03               ld A, [CurrentProcess|0x0103]
805f:    2e 0d f8 00 36         wpf 0xf8, [A + 0x36]
8064:    3a                     clr A, #0
8065:    7e 01                  push {A}
8067:    7e 41                  push {X}
8069:    31 a0                  dec S, #1
806b:    60 80 6f               ld X, R_806f|0x806f
806e:    0f                     rsys

R_806f:
806f:    90 00 00               ld A, 0x0000
8072:    09                     ret

L_8073:
    ; LongCall?
8073:    b3 1b                  st A, [0x8090|+0x1b]
8075:    91 01 03               ld A, [CurrentProcess|0x0103]
8078:    2e 0d fb 00 36         wpf 0xfb, [A + 0x36]
807d:    2e 0c 7b 01 81         wpf 0x7b, [PageTableTwo|0x0181]
8082:    90 00 03               ld A, 0x0003
8085:    7e 01                  push {A}
8087:    7e 41                  push {X}
8089:    31 a0                  dec S, #1
808b:    60 80 8f               ld X, R_808f|0x808f
808e:    0f                     rsys

R_808f:
808f:    90 00 00               ld A, 0x0000
8092:    09                     ret

R_8093:
8093:    ff                     st B, [P]
8094:    ff                     st B, [P]
8095:    00                     HALT
8096:    00                     HALT
8097:    0f                     rsys
8098:    <null bytes>


R_80ae:
80ae:    00                     HALT

R_80af:
80af:    00                     HALT

R_80b0:
80b0:    00                     HALT

R_80b1:
80b1:    00                     HALT
80b2:    82 00 02               ld AL, @[0x0002]
80b5:    00                     HALT
80b6:    50

R_80b7:
80b7:    80 c5                  ld AL, 0xc5
80b9:    00                     HALT
80ba:    00                     HALT

R_80bb:
80bb:    00                     HALT
80bc:    81 00 02               ld AL, [0x0002]
80bf:    00                     HALT
80c0:    0e                     dly
80c1:    81 2c 00               ld AL, [0x2c00]
80c4:    00                     HALT

R_80c5:
80c5:    9, "STAND BY\r"

R_80d0:
80d0:    29, "ABORT XXX @ XXXX, XXXX, XXXX\r"
80ef:    44, "CD:XX, LVL:XX, MAP:XX, IAD:XXXX, EAD:XXXXXX\r"
811d:    13, "OPSYS ABORTED"

R_812c:
812c:    12, "MEMORY LOCK\r"
813a:    00
813b:    82
813c:    00
813d:    02
813e:    00
813f:    50
8140:    00
8141:    00
8142:    00
8143:    00
8144:    00
8145:    80
8146:    00
8147:    01
8148:    00
8149:    50
814a:    81
814b:    6c
814c:    00
814d:    00
814e:    ff
814f:    ff
8150:    00
8151:    00
8152:    0f
8153:    <null bytes>


R_816c:
816c:    <null bytes>


R_81bc:
81bc:    <null bytes>


R_8234:
8234:    1, "\x0c"
8237:    37, "MAX DISK# (M)=XX, SYSTEM DISK (S)=XX\r"
825e:    37, "ENTER NEW SYSTEM DATE: MMDDYY \x08\x08\x08\x08\x08\x08\x08"
8285:    18, "ILLEGAL SET STMNT\r"
8299:    22, "ILLOGICAL SYSTEM DISK\r"
82b1:    31, "PREVIOUS SYSTEM DATE: \x00\x00/\x00\x00/\x00\x00\r"
82d2:    29, "PARITY CIRCUITRY INOPERATIVE\r"
82f1:    33, "ENTER SYSTEM TIME: HHMMSS \x08\x08\x08\x08\x08\x08\x08"
8314:    14, "DOS 6.4 - D\n\r\n"
8324:    1, "\r"
8327:    "@SYS\0"
832c:    "@TX000\0"
8333:    "@SYS\0"
8338:    "@OJX00\0"

R_833f:
833f:    7e 03                  push {A, B}
8341:    2a                     clr AL, #0
8342:    a1 01 41               st AL, [0x0141]
8345:    b6                     unknown
8346:    85 a8 04               ld AL, [S + 0x04]
8349:    a3 71                  st AL, [0x83bc|+0x71]
834b:    16 6d                  blt L_83ba
834d:    c0 4c                  ld BL, 0x4c
834f:    49                     sub BL, AL
8350:    14 39                  bz L_838b
8352:    c0 56                  ld BL, 0x56
8354:    49                     sub BL, AL
8355:    14 34                  bz L_838b
8357:    29                     dec AL, #1
8358:    14 31                  bz L_838b
835a:    85 a8 08               ld AL, [S + 0x08]
835d:    c0 07                  ld BL, 0x07
835f:    4a                     and BL, AL
8360:    21 33                  dec BL, #4
8362:    16 27                  blt L_838b
8364:    d1 01 03               ld B, [CurrentProcess|0x0103]
8367:    c5 28 59               ld BL, [B + 0x59]
836a:    e6 a8                  mov A, IL10(Z)
836c:    49                     sub BL, AL
836d:    17 04                  bp L_8373
836f:    20 39                  inc BL, #10
8371:    18 18                  bgt L_838b

L_8373:
8373:    d4 f0                  ld B, @[0x8365|-0x10]
8375:    85 28 02               ld AL, [B + 0x02]
8378:    17 0d                  bp L_8387
837a:    79 86 12               call Yield
837d:    e6 a8                  mov A, IL10(Z)
837f:    d4 e4                  ld B, @[0x8365|-0x1c]
8381:    a5 28 59               st AL, [B + 0x59]
8384:    85 28 03               ld AL, [B + 0x03]

L_8387:
8387:    29                     dec AL, #1
8388:    a5 28 02               st AL, [B + 0x02]

L_838b:
838b:    3a                     clr A, #0
838c:    85 a8 04               ld AL, [S + 0x04]
838f:    c1 89 ac               ld BL, [NumSyscalls|0x89ac]
8392:    49                     sub BL, AL
8393:    18 25                  bgt L_83ba
8395:    3d                     sll A, #1
8396:    d0 88 cc               ld B, SyscallTable|0x88cc
8399:    f1 01 0f               st B, [0x010f]
839c:    58                     add B, A	 ; Calculate syscall table offset
839d:    99                     ld A, [B]	 ; read function ptr
839e:    14 1a                  bz L_83ba
83a0:    b3 03                  st A, [0x83a5|+0x3]	 ; modify jump instruction below
83a2:    7f 03                  pop {A, B}	 ; restore registers
83a4:    71 80 00               jmp R_8000	 ; jump to syscall

R_83a7:
83a7:    7e 03                  push {A, B}
83a9:    79 88 05               call R_8805
83ac:    89                     ld AL, [B]
83ad:    21 11                  dec AL, #2
83af:    15 03                  bnz L_83b4
83b1:    7f 03                  pop {A, B}
83b3:    09                     ret

L_83b4:
83b4:    7f 03                  pop {A, B}
83b6:    65 a1                  ld X, [S++]
83b8:    73 00                  jmp L_83ba

L_83ba:
83ba:    90 00 00               ld A, 0x0000
83bd:    55 42                  mov B, X
83bf:    79 84 e4               call Syscall_Abort
83c2:    09                         abort_code = (0x9)

Syscall_68:
83c3:    90 9c 32               ld A, R_9c32|0x9c32
83c6:    59                     sub B, A
83c7:    15 f1                  bnz L_83ba
83c9:    5b                     mov X, A
83ca:    2a                     clr AL, #0
83cb:    a5 a8 04               st AL, [S + 0x04]
83ce:    0f                     rsys

Syscall_56:
83cf:    b3 13                  st A, [0x83e4|+0x13]
83d1:    95 a8 05               ld A, [S + 0x05]
83d4:    65 a8 03               ld X, [S + 0x03]
83d7:    6d a8 05               st X, [S + 0x05]
83da:    65 a9 01               ld X, [S++ + 0x01]
83dd:    b5 a8 01               st A, [S + 0x01]
83e0:    85 41                  ld AL, [X++]
83e2:    ad                     st AL, [S]
83e3:    90 00 00               ld A, 0x0000
83e6:    71 83 3f               jmp R_833f

Syscall_1a:
83e9:    b3 f9                  st A, [0x83e4|-0x7]
83eb:    55 22                  mov B, B
83ed:    15 07                  bnz L_83f6
83ef:    79 88 05               call R_8805
83f2:    3a                     clr A, #0
83f3:    a9                     st AL, [B]
83f4:    73 02                  jmp L_83f8

L_83f6:
83f6:    55 24                  mov X, B

L_83f8:
83f8:    80 04                  ld AL, 0x04

L_83fa:
83fa:    a5 a8 04               st AL, [S + 0x04]
83fd:    93 e5                  ld A, [0x83e4|-0x1b]
83ff:    0f                     rsys

Syscall_0d:
8400:    b3 e2                  st A, [0x83e4|-0x1e]
8402:    7e 21                  push {B}
8404:    7b a1                  call R_83a7
8406:    7f 21                  pop {B}
8408:    80 05                  ld AL, 0x05
840a:    73 ee                  jmp L_83fa

Syscall_6a:
840c:    b3 d6                  st A, [0x83e4|-0x2a]
840e:    91 01 39               ld A, [0x0139]
8411:    14 05                  bz L_8418
8413:    5b                     mov X, A
8414:    80 06                  ld AL, 0x06
8416:    73 e2                  jmp L_83fa

L_8418:
8418:    79 84 e4               call Syscall_Abort
841b:    1f                         abort_code = (0x1f)

Syscall_6e:
841c:    b3 c6                  st A, [0x83e4|-0x3a]
841e:    95 a8 01               ld A, [S + 0x01]
8421:    d1 01 03               ld B, [CurrentProcess|0x0103]
8424:    b5 28 5a               st A, [B + 0x5a]
8427:    91 01 5a               ld A, [0x015a]
842a:    2e 4d 87 20 46         wpf32 0x87, [B + 0x46]
842f:    2e 0e 7f 00            wpf 0x7f, [A]
8433:    6d a8 01               st X, [S + 0x01]
8436:    91 01 58               ld A, [0x0158]
8439:    14 dd                  bz L_8418
843b:    5b                     mov X, A
843c:    80 07                  ld AL, 0x07
843e:    73 ba                  jmp L_83fa

Syscall_6f:
8440:    95 a8 04               ld A, [S + 0x04]
8443:    b3 13                  st A, [R_8458|0x8458|+0x13]
8445:    6e                     unknown
8446:    84 58                  ld AL, @[0x84a0|+0x58]
8448:    65 a8 01               ld X, [S + 0x01]
844b:    91 01 03               ld A, [CurrentProcess|0x0103]
844e:    95 08 5a               ld A, [A + 0x5a]
8451:    b5 a8 01               st A, [S + 0x01]
8454:    80 04                  ld AL, 0x04
8456:    73 a2                  jmp L_83fa

R_8458:
8458:    00                     HALT
8459:    00                     HALT

R_845a:
845a:    3a                     clr A, #0
845b:    b5 88 19               st A, [Z + 0x19]
845e:    55 80                  mov A, Z
8460:    b5 a2                  st A, [--S]
8462:    6d a2                  st X, [--S]
8464:    61 01 20               ld X, [0x0120]
8467:    dc                     ld B, [Z]

L_8468:
8468:    9a                     ld A, [X]
8469:    16 0b                  blt L_8476
846b:    41 30                  sub AH, BL
846d:    15 03                  bnz L_8472
846f:    3a                     clr A, #0
8470:    39                     dec A, #1
8471:    ba                     st A, [X]

L_8472:
8472:    30 44                  inc X, #5
8474:    73 f2                  jmp L_8468

L_8476:
8476:    3b                     not A, #0
8477:    15 f9                  bnz L_8472
8479:    20 30                  inc BL, #1
847b:    e5 a2                  st BL, [--S]
847d:    85 88 07               ld AL, [Z + 0x07]
8480:    5b                     mov X, A
8481:    3e                     inc X
8482:    95 88 04               ld A, [Z + 0x04]
8485:    5c                     mov Y, A
8486:    50 46                  add Y, X
8488:    50 46                  add Y, X
848a:    50 46                  add Y, X

L_848c:
848c:    3f                     dec X
848d:    16 26                  blt L_84b5
848f:    90 ff fd               ld A, 0xfffd
8492:    50 06                  add Y, A
8494:    3a                     clr A, #0
8495:    8b                     ld AL, [Y]
8496:    16 f4                  blt L_848c
8498:    3d                     sll A, #1
8499:    d1 01 09               ld B, [DevicesPtr|0x0109]
849c:    58                     add B, A
849d:    99                     ld A, [B]
849e:    5e                     mov Z, A
849f:    8c                     ld AL, [Z]
84a0:    14 ea                  bz L_848c
84a2:    95 88 05               ld A, [Z + 0x05]
84a5:    14 e5                  bz L_848c
84a7:    32 01                  clr A, #1
84a9:    cd                     ld BL, [S]
84aa:    7e 63                  push {Y, Z}
84ac:    55 86                  mov Y, Z
84ae:    79 80 3b               call R_803b
84b1:    7f 63                  pop {Y, Z}
84b3:    73 d7                  jmp L_848c

L_84b5:
84b5:    85 a1                  ld AL, [S++]
84b7:    65 a1                  ld X, [S++]
84b9:    95 a1                  ld A, [S++]
84bb:    5e                     mov Z, A
84bc:    9c                     ld A, [Z]
84bd:    c1 01 1f               ld BL, [0x011f]
84c0:    49                     sub BL, AL
84c1:    15 03                  bnz L_84c6
84c3:    79 b6 4c               call R_b64c

L_84c6:
84c6:    90 85 ad               ld A, R_85ad|0x85ad
84c9:    5c                     mov Y, A
84ca:    9c                     ld A, [Z]
84cb:    d5 61                  ld B, [Y++]

L_84cd:
84cd:    c9                     ld BL, [B]
84ce:    49                     sub BL, AL
84cf:    15 05                  bnz L_84d6
84d1:    c0 ff                  ld BL, 0xff
84d3:    e5 6c fe               st BL, @[Y + -0x2]

L_84d6:
84d6:    d5 61                  ld B, [Y++]
84d8:    15 f3                  bnz L_84cd
84da:    79 ad 88               call R_ad88
84dd:    09                     ret

Syscall_AbortAL:
84de:    7e 09                  push {A, B, X, Y, Z}
84e0:    45 31                  mov AL, BL
84e2:    73 03                  jmp L_84e7

Syscall_Abort:
84e4:    7e 09                  push {A, B, X, Y, Z}
84e6:    8a                     ld AL, [X]

L_84e7:
84e7:    22 00                  clr AH, #0
84e9:    a3 79                  st AL, [0x8564|+0x79]
84eb:    d0 a0 a0               ld B, 0xa0a0
84ee:    f1 80 d8               st B, [R_80d8|0x80d8]
84f1:    79 b5 54               call R_b554
84f4:    80 da                  ld AL, 0xda
84f6:    91 01 03               ld A, [CurrentProcess|0x0103]
84f9:    5e                     mov Z, A
84fa:    3a                     clr A, #0
84fb:    a1 01 25               st AL, [0x0125]
84fe:    79 84 5a               call R_845a
8501:    95 88 04               ld A, [Z + 0x04]
8504:    85 08 06               ld AL, [A + 0x06]
8507:    16 5a                  blt L_8563
8509:    9d                     ld A, [S]
850a:    79 cd 4d               call FormatHexWord
850d:    80 e4                      dest = R_80e4
850f:    95 a8 02               ld A, [S + 0x02]
8512:    79 cd 4d               call FormatHexWord
8515:    80 ea                      dest = R_80ea
8517:    55 40                  mov A, X
8519:    79 cd 4d               call FormatHexWord
851c:    80 de                      dest = R_80de
851e:    90 80 d0               ld A, R_80d0|0x80d0
8521:    b1 80 b7               st A, [R_80b7|0x80b7]
8524:    d0 80 b1               ld B, R_80b1|0x80b1
8527:    79 8b 33               call DoFileOpInner

L_852a:
852a:    81 80 b1               ld AL, [R_80b1|0x80b1]
852d:    16 fb                  blt L_852a
852f:    91 01 01               ld A, [0x0101]

L_8532:
8532:    16 fe                  blt L_8532
8534:    61 01 03               ld X, [CurrentProcess|0x0103]
8537:    14 2a                  bz L_8563
8539:    79 88 05               call R_8805
853c:    89                     ld AL, [B]
853d:    14 07                  bz L_8546
853f:    90 80 00               ld A, 0x8000
8542:    51 40                  sub A, X
8544:    10 1d                  bc L_8563

L_8546:
8546:    85 48 12               ld AL, [X + 0x12]
8549:    c0 80                  ld BL, 0x80
854b:    4a                     and BL, AL
854c:    14 15                  bz L_8563
854e:    95 48 0a               ld A, [X + 0x0a]
8551:    b3 0c                  st A, [0x855f|+0xc]
8553:    95 48 0e               ld A, [X + 0x0e]
8556:    b3 09                  st A, [0x8561|+0x9]
8558:    7f 09                  pop {A, B, X, Y, Z}
855a:    65 a1                  ld X, [S++]
855c:    66 05                  jsys Syscall_05
855e:    06                         arg1 = (0x6)
855f:    00                     HALT
8560:    00                     HALT
8561:    00                     HALT
8562:    00                     HALT

L_8563:
8563:    c0 00                  ld BL, 0x00
8565:    7b 0d                  call L_8574
8567:    ff                     st B, [P]

Syscall_6c:
8568:    32 20                  clr B, #0
856a:    55 89 01 03            mov Z, [CurrentProcess|0x0103]
856e:    45 11                  mov AL, AL
8570:    73 07                  jmp L_8579

Syscall_0a:
8572:    c0 00                  ld BL, 0x00

L_8574:
8574:    91 01 03               ld A, [CurrentProcess|0x0103]
8577:    5e                     mov Z, A
8578:    8a                     ld AL, [X]

L_8579:
8579:    28                     inc AL, #1
857a:    14 04                  bz L_8580
857c:    29                     dec AL, #1
857d:    a5 88 14               st AL, [Z + 0x14]

L_8580:
8580:    e5 88 13               st BL, [Z + 0x13]
8583:    2a                     clr AL, #0
8584:    a1 01 25               st AL, [0x0125]
8587:    47 5d 00 fb 80 00      unkblk5 0x01, 0xfb, [Z + 0x00]
858d:    d5 88 08               ld B, [Z + 0x08]
8590:    85 28 13               ld AL, [B + 0x13]
8593:    2d                     sll AL, #1
8594:    2c                     srl AL, #1
8595:    a5 28 13               st AL, [B + 0x13]
8598:    2e 0d f8 80 36         wpf 0xf8, [Z + 0x36]
859d:    55 ba 81 bc            mov S, R_81bc|0x81bc
85a1:    79 84 5a               call R_845a
85a4:    8c                     ld AL, [Z]
85a5:    14 03                  bz L_85aa
85a7:    71 88 11               jmp R_8811

L_85aa:
85aa:    71 86 31               jmp R_8631

R_85ad:
85ad:    01                     nop
85ae:    1c 01                  bs3 L_85b1
85b0:    1f

L_85b1:
85b1:    01                     nop
85b2:    3b                     not A, #0

L_85b3:
85b3:    01                     nop
85b4:    3c                     srl A, #1
85b5:    01                     nop
85b6:    3d                     sll A, #1
85b7:    00                     HALT
85b8:    00                     HALT

R_85b9:
85b9:    3a                     clr A, #0
85ba:    85 41                  ld AL, [X++]

L_85bc:
85bc:    d0 01 00               ld B, 0x0100
85bf:    58                     add B, A
85c0:    f5 a2                  st B, [--S]
85c2:    d1 01 03               ld B, [CurrentProcess|0x0103]
85c5:    c5 28 01               ld BL, [B + 0x01]	 ; 1eb
85c8:    85 a4                  ld AL, @[S]
85ca:    49                     sub BL, AL
85cb:    15 05                  bnz L_85d2
85cd:    d5 a1                  ld B, [S++]
85cf:    09                     ret

L_85d0:
85d0:    7b 40                  call Yield

L_85d2:
85d2:    85 a4                  ld AL, @[S]
85d4:    17 fa                  bp L_85d0
85d6:    91 01 03               ld A, [CurrentProcess|0x0103]
85d9:    85 08 01               ld AL, [A + 0x01]
85dc:    d5 a1                  ld B, [S++]
85de:    a9                     st AL, [B]
85df:    09                     ret

Syscall_06:
85e0:    85 41                  ld AL, [X++]

Syscall_12:
85e2:    a3 0d                  st AL, [0x85f1|+0xd]
85e4:    55 40                  mov A, X
85e6:    51 10 7f ff            sub A, A, 0x7fff
85ea:    17 03                  bp L_85ef
85ec:    79 83 a7               call R_83a7

L_85ef:
85ef:    90 00 00               ld A, 0x0000
85f2:    7b c8                  call L_85bc
85f4:    0f                     rsys

Syscall_Flush:
85f5:    95 41                  ld A, [X++]
85f7:    7b 03                  call L_85fc
85f9:    0f                     rsys

FlushFn:
85fa:    95 41                  ld A, [X++]

L_85fc:
85fc:    7e 01                  push {A}

L_85fe:
85fe:    85 a4                  ld AL, @[S]
8600:    17 0c                  bp L_860e
8602:    91 01 03               ld A, [CurrentProcess|0x0103]
8605:    95 08 32               ld A, [A + 0x32]
8608:    14 04                  bz L_860e
860a:    7b 06                  call Yield	 ; Is this yield?
860c:    73 f0                  jmp L_85fe

L_860e:
860e:    30 a1                  inc S, #2
8610:    4d                     mov BL, AL
8611:    09                     ret

Yield:
8612:    2a                     clr AL, #0
8613:    a1 01 41               st AL, [0x0141]
8616:    81 01 25               ld AL, [0x0125]
8619:    15 0e                  bnz L_8629
861b:    7b 14                  call R_8631
861d:    09                     ret
861e:    7e
861f:    81
8620:    55
8621:    89
8622:    01
8623:    03
8624:    79
8625:    86
8626:    f5 'u'
8627:    7f
8628:    81

L_8629:
8629:    09                     ret

Syscall_Yield:
862a:    7b e6                  call Yield
862c:    0f                     rsys

Syscall_0b:
862d:    90 00 00               ld A, 0x0000
8630:    0f                     rsys

R_8631:
8631:    d1 01 03               ld B, [CurrentProcess|0x0103]
8634:    7e 45                  push {X, Y, Z}
8636:    55 a0                  mov A, S
8638:    b5 28 10               st A, [B + 0x10]
863b:    3a                     clr A, #0
863c:    b4 f4                  st A, @[0x8632|-0xc]	 ; Clear CurrentProcess
863e:    55 ba 88 52            mov S, R_8852|0x8852	 ; Setup Temporary stack

R_8642:
8642:    60 88 25               ld X, R_8825|0x8825

L_8645:
8645:    95 41                  ld A, [X++]
8647:    15 17                  bnz L_8660
8649:    a1 01 41               st AL, [0x0141]
864c:    61 01 07               ld X, [0x0107]
864f:    6b f2                  st X, [0x8643|-0xe]
8651:    82 01 5c               ld AL, @[0x015c]
8654:    16 03                  blt R_8659
8656:    71 87 30               jmp R_8730

R_8659:
8659:    81 01 3e               ld AL, [0x013e]
865c:    14 e4                  bz R_8642
865e:    73 1f                  jmp R_867f

L_8660:
8660:    6b e1                  st X, [0x8643|-0x1f]
8662:    5e                     mov Z, A
8663:    d0 04 00               ld B, 0x0400
8666:    cc                     ld BL, [Z]
8667:    14 dc                  bz L_8645
8669:    42 23                  and BL, BH
866b:    15 d8                  bnz L_8645
866d:    b1 01 03               st A, [CurrentProcess|0x0103]
8670:    79 86 f5               call R_86f5
8673:    95 88 10               ld A, [Z + 0x10]
8676:    15 03                  bnz L_867b
8678:    71 86 f1               jmp R_86f1

L_867b:
867b:    5f                     mov S, A
867c:    7f 45                  pop {X, Y, Z}
867e:    09                     ret

R_867f:
867f:    90 88 52               ld A, R_8852|0x8852
8682:    5f                     mov S, A
8683:    61 01 09               ld X, [DevicesPtr|0x0109]
8686:    2a                     clr AL, #0
8687:    4c                     mov YL, AL
8688:    80 c1                  ld AL, 0xc1
868a:    45 10                  mov AH, AL

L_868c:
868c:    d5 41                  ld B, [X++]
868e:    15 03                  bnz L_8693
8690:    71 87 27               jmp R_8727

L_8693:
8693:    20 70                  inc YL, #1
8695:    89                     ld AL, [B]
8696:    42 01                  and AL, AH
8698:    44 01                  xor AL, AH
869a:    15 f0                  bnz L_868c
869c:    85 28 13               ld AL, [B + 0x13]
869f:    16 eb                  blt L_868c
86a1:    14 e9                  bz L_868c
86a3:    81 01 3e               ld AL, [0x013e]
86a6:    29                     dec AL, #1
86a7:    a4 fb                  st AL, @[0x86a4|-0x5]

R_86a9:
86a9:    f1 87 f6               st B, [R_87f6|0x87f6]
86ac:    45 71                  mov AL, YL
86ae:    29                     dec AL, #1
86af:    a0 00                  st AL, 0x00
86b1:    2a                     clr AL, #0
86b2:    a5 28 13               st AL, [B + 0x13]
86b5:    61 01 07               ld X, [0x0107]

L_86b8:
86b8:    95 41                  ld A, [X++]
86ba:    15 03                  bnz L_86bf
86bc:    71 87 3c               jmp R_873c

L_86bf:
86bf:    b1 01 03               st A, [CurrentProcess|0x0103]
86c2:    5e                     mov Z, A
86c3:    95 88 08               ld A, [Z + 0x08]
86c6:    51 20                  sub A, B
86c8:    15 ee                  bnz L_86b8
86ca:    8c                     ld AL, [Z]
86cb:    c0 40                  ld BL, 0x40
86cd:    4a                     and BL, AL
86ce:    15 af                  bnz R_867f

R_86d0:
86d0:    7b 23                  call R_86f5
86d2:    80 01                  ld AL, 0x01
86d4:    cc                     ld BL, [Z]
86d5:    43 13                  or BL, AL
86d7:    80 ef                  ld AL, 0xef
86d9:    4a                     and BL, AL
86da:    ec                     st BL, [Z]
86db:    80 02                  ld AL, 0x02
86dd:    c5 88 12               ld BL, [Z + 0x12]
86e0:    43 13                  or BL, AL
86e2:    e5 88 12               st BL, [Z + 0x12]
86e5:    91 01 42               ld A, [0x0142]
86e8:    b5 88 34               st A, [Z + 0x34]
86eb:    90 ff ff               ld A, 0xffff
86ee:    b5 88 32               st A, [Z + 0x32]

R_86f1:
86f1:    79 85 72               call Syscall_0a
86f4:    ff                     st B, [P]

R_86f5:
86f5:    47 41 0f 01 61 80 36   memcpy 0x10, [PageTableOne|0x0161], [Z + 0x36]
86fc:    2e 0d f8 80 36         wpf 0xf8, [Z + 0x36]
8701:    2e 0d fb 80 36         wpf 0xfb, [Z + 0x36]
8706:    2e 0c 7b 01 81         wpf 0x7b, [PageTableTwo|0x0181]
870b:    2e 0d fd 80 36         wpf 0xfd, [Z + 0x36]
8710:    2e 4d 84 80 46         wpf32 0x84, [Z + 0x46]
8715:    91 01 39               ld A, [0x0139]
8718:    14 0c                  bz L_8726
871a:    91 01 56               ld A, [0x0156]
871d:    2e 4d 86 80 46         wpf32 0x86, [Z + 0x46]
8722:    2e 0e 7e 00            wpf 0x7e, [A]

L_8726:
8726:    09                     ret

R_8727:
8727:    3a                     clr A, #0
8728:    82 01 5c               ld AL, @[0x015c]
872b:    17 03                  bp R_8730
872d:    71 86 42               jmp R_8642

R_8730:
8730:    5c                     mov Y, A
8731:    30 60                  inc Y, #1
8733:    d1 01 09               ld B, [DevicesPtr|0x0109]
8736:    3d                     sll A, #1
8737:    58                     add B, A
8738:    d9                     ld B, [B]
8739:    71 86 a9               jmp R_86a9

R_873c:
873c:    91 01 07               ld A, [0x0107]
873f:    5c                     mov Y, A

L_8740:
8740:    95 61                  ld A, [Y++]
8742:    15 03                  bnz L_8747
8744:    71 87 d7               jmp R_87d7

L_8747:
8747:    c8                     ld BL, [A]
8748:    15 f6                  bnz L_8740
874a:    5e                     mov Z, A
874b:    95 88 0c               ld A, [Z + 0x0c]
874e:    38                     inc A, #1
874f:    d5 88 0a               ld B, [Z + 0x0a]
8752:    59                     sub B, A
8753:    34 2a                  srl B, #11
8755:    31 20                  dec B, #1
8757:    18 10                  bgt L_8769
8759:    14 07                  bz L_8762
875b:    55 82                  mov B, Z
875d:    79 af 9e               call R_af9e
8760:    16 75                  blt R_87d7

L_8762:
8762:    55 82                  mov B, Z
8764:    79 af 9e               call R_af9e
8767:    16 6e                  blt R_87d7

L_8769:
8769:    79 86 f5               call R_86f5
876c:    d1 01 5c               ld B, [0x015c]
876f:    30 20                  inc B, #1

L_8771:
8771:    89                     ld AL, [B]
8772:    31 20                  dec B, #1
8774:    a5 21                  st AL, [B++]
8776:    16 04                  blt L_877c
8778:    30 20                  inc B, #1
877a:    73 f5                  jmp L_8771

L_877c:
877c:    d3 78                  ld B, [R_87f6|0x87f6|+0x78]
877e:    f5 88 08               st B, [Z + 0x08]
8781:    85 28 1a               ld AL, [B + 0x1a]
8784:    a5 88 28               st AL, [Z + 0x28]
8787:    95 28 1f               ld A, [B + 0x1f]
878a:    14 06                  bz L_8792
878c:    8c                     ld AL, [Z]
878d:    c0 40                  ld BL, 0x40
878f:    43 13                  or BL, AL
8791:    ec                     st BL, [Z]

L_8792:
8792:    85 88 12               ld AL, [Z + 0x12]
8795:    c0 21                  ld BL, 0x21
8797:    53 02                  or B, A
8799:    e5 88 12               st BL, [Z + 0x12]
879c:    3a                     clr A, #0
879d:    b5 88 02               st A, [Z + 0x02]
87a0:    b5 88 14               st A, [Z + 0x14]
87a3:    32 20                  clr B, #0
87a5:    c5 88 16               ld BL, [Z + 0x16]
87a8:    77 32 00 0a            div B, B, 0x000a
87ac:    55 20                  mov A, B
87ae:    39                     dec A, #1
87af:    d5 88 17               ld B, [Z + 0x17]
87b2:    67 9e a0 02            memset A, 0xa0, [B]
87b6:    95 88 04               ld A, [Z + 0x04]
87b9:    5c                     mov Y, A
87ba:    c1 86 b0               ld BL, [R_86b0|0x86b0]
87bd:    3a                     clr A, #0
87be:    3b                     not A, #0
87bf:    e5 61                  st BL, [Y++]
87c1:    b5 61                  st A, [Y++]
87c3:    e5 61                  st BL, [Y++]
87c5:    b5 61                  st A, [Y++]
87c7:    e5 61                  st BL, [Y++]
87c9:    b5 61                  st A, [Y++]
87cb:    e5 61                  st BL, [Y++]
87cd:    b5 61                  st A, [Y++]
87cf:    55 80                  mov A, Z
87d1:    b1 01 03               st A, [CurrentProcess|0x0103]
87d4:    71 86 d0               jmp R_86d0

R_87d7:
87d7:    d1 01 5c               ld B, [0x015c]
87da:    81 86 b0               ld AL, [R_86b0|0x86b0]
87dd:    5c                     mov Y, A
87de:    89                     ld AL, [B]

L_87df:
87df:    41 71                  sub AL, YL
87e1:    15 03                  bnz L_87e6
87e3:    71 86 59               jmp R_8659

L_87e6:
87e6:    85 21                  ld AL, [B++]
87e8:    17 f5                  bp L_87df
87ea:    31 20                  dec B, #1
87ec:    45 71                  mov AL, YL
87ee:    a9                     st AL, [B]
87ef:    90 80 c5               ld A, R_80c5|0x80c5
87f2:    b1 80 b7               st A, [R_80b7|0x80b7]
87f5:    90 00 00               ld A, 0x0000
87f8:    d0 80 b1               ld B, R_80b1|0x80b1
87fb:    79 8b 00               call R_8b00

L_87fe:
87fe:    84 f9                  ld AL, @[0x87f9|-0x7]
8800:    16 fc                  blt L_87fe
8802:    71 86 7f               jmp R_867f

R_8805:
8805:    d1 01 03               ld B, [CurrentProcess|0x0103]
8808:    3a                     clr A, #0
8809:    85 28 01               ld AL, [B + 0x01]
880c:    d0 88 72               ld B, R_8872|0x8872
880f:    58                     add B, A
8810:    09                     ret

R_8811:
8811:    55 ba 88 cc            mov S, SyscallTable|0x88cc
8815:    79 85 b9               call R_85b9
8818:    3b                         arg1 = (0x3b)
8819:    55 ba 82 34            mov S, R_8234|0x8234
881d:    7b e6                  call R_8805
881f:    80 02                  ld AL, 0x02
8821:    a9                     st AL, [B]
8822:    3a                     clr A, #0
8823:    66 04                  jsys Syscall_04

R_8825:
8825:    00 00                      arg1 = L_0000
8827:    00 ad                      arg2 = L_00ad
8829:    c8                         arg3 = (0xc8)
882a:    <null bytes>


R_8852:
8852:    fd                     st B, [S]
8853:    fd                     st B, [S]
8854:    fd                     st B, [S]
8855:    fd                     st B, [S]
8856:    fd                     st B, [S]
8857:    fd                     st B, [S]
8858:    fd                     st B, [S]
8859:    fd                     st B, [S]
885a:    fd                     st B, [S]
885b:    fd                     st B, [S]
885c:    fd                     st B, [S]
885d:    fd                     st B, [S]

L_885e:
885e:    fd                     st B, [S]
885f:    fd                     st B, [S]
8860:    fd                     st B, [S]
8861:    fd                     st B, [S]
8862:    fd                     st B, [S]
8863:    fd                     st B, [S]
8864:    fd                     st B, [S]
8865:    fd                     st B, [S]
8866:    fd                     st B, [S]
8867:    fd                     st B, [S]
8868:    fd                     st B, [S]
8869:    fd                     st B, [S]
886a:    fd                     st B, [S]
886b:    fd                     st B, [S]
886c:    fd                     st B, [S]
886d:    fd                     st B, [S]
886e:    fd                     st B, [S]
886f:    fd                     st B, [S]
8870:    fd                     st B, [S]
8871:    fd                     st B, [S]

R_8872:
8872:    02                     sf
8873:    02                     sf
8874:    02                     sf
8875:    02                     sf
8876:    02                     sf
8877:    02                     sf
8878:    02                     sf
8879:    02                     sf
887a:    02                     sf
887b:    02                     sf
887c:    02                     sf
887d:    02                     sf
887e:    02                     sf
887f:    02                     sf
8880:    02                     sf
8881:    02                     sf
8882:    02                     sf
8883:    02                     sf
8884:    02                     sf
8885:    02                     sf
8886:    02                     sf
8887:    02                     sf
8888:    02                     sf
8889:    02                     sf
888a:    02                     sf
888b:    02                     sf
888c:    02                     sf
888d:    02                     sf
888e:    02                     sf
888f:    02                     sf
8890:    02                     sf
8891:    02                     sf
8892:    02                     sf
8893:    02                     sf
8894:    02                     sf
8895:    02                     sf
8896:    02                     sf
8897:    02                     sf
8898:    02                     sf
8899:    02                     sf
889a:    02                     sf
889b:    02                     sf
889c:    02                     sf
889d:    02                     sf
889e:    02                     sf
889f:    02                     sf
88a0:    02                     sf
88a1:    02                     sf
88a2:    02                     sf
88a3:    02                     sf
88a4:    <null bytes>


L_88a6:
88a6:    <null bytes>


SyscallTable:
88cc:    8a 3b                  Syscall_00
88ce:    ab 1b                  Syscall_01
88d0:    8d 21                  Syscall_02
88d2:    8d 9a                  Syscall_03
88d4:    8c e1                  Syscall_04
88d6:    aa 17                  Syscall_05

L_88d8:
88d8:    85 e0                  Syscall_06
88da:    86 2a                  Syscall_Yield
88dc:    85 f5                  Syscall_Flush
88de:    84 e4                  Syscall_Abort
88e0:    85 72                  Syscall_0a
88e2:    86 2d                  Syscall_0b
88e4:    8a 9a                  Syscall_0c
88e6:    84 00                  Syscall_0d
88e8:    8f 8f                  Syscall_OpenFile?
88ea:    8a fa                  Syscall_0f
88ec:    8b 26                  Syscall_DoFileOp
88ee:    ab 87                  Syscall_11
88f0:    85 e2                  Syscall_12
88f2:    ab f3                  Syscall_13
88f4:    b5 c4                  Syscall_14
88f6:    b3 ba                  Syscall_15
88f8:    ab 92                  Syscall_16
88fa:    ab fc                  Syscall_17
88fc:    9b 8b                  Syscall_18
88fe:    89 ad                  Syscall_19
8900:    83 e9                  Syscall_1a
8902:    b3 a2                  Syscall_1b
8904:    b3 f0                  Syscall_1c
8906:    b4 18                  Syscall_1d
8908:    95 e1                  Syscall_1e
890a:    96 05                  Syscall_1f
890c:    95 62                  Syscall_20
890e:    aa 1e                  Syscall_21
8910:    95 87                  Syscall_22
8912:    b5 db                  Syscall_23
8914:    95 09                  Syscall_24
8916:    95 3a                  Syscall_25
8918:    96 35                  Syscall_26
891a:    96 74                  Syscall_27
891c:    96 9d                  Syscall_28
891e:    96 bf                  Syscall_29
8920:    98 12                  Syscall_2a
8922:    b5 3f                  Syscall_divide
8924:    b5 45                  Syscall_multiply
8926:    b5 4b                  Syscall_2e
8928:    b5 4b                  Syscall_2e
892a:    98 4c                  Syscall_2f
892c:    98 48                  Syscall_30
892e:    99 6f                  Syscall_31
8930:    96 d5                  Syscall_32
8932:    99 5e                  Syscall_33
8934:    96 dd                  Syscall_34
8936:    99 84                  Syscall_35

L_8938:
8938:    99 6b                  Syscall_36
893a:    98 d3                  Syscall_37
893c:    98 e1                  Syscall_38
893e:    98 a2                  Syscall_39
8940:    98 bc                  Syscall_3a
8942:    95 d4                  Syscall_3b
8944:    95 f7                  Syscall_3c
8946:    95 57                  Syscall_3d
8948:    00 00                  (0x0)
894a:    95 7c                  Syscall_3f
894c:    00 00                  (0x0)
894e:    94 fd                  Syscall_41
8950:    95 28                  Syscall_42
8952:    96 10                  Syscall_43
8954:    96 97                  Syscall_44
8956:    95 cb                  Syscall_45
8958:    95 ee                  Syscall_46
895a:    95 4c                  Syscall_47
895c:    95 71                  Syscall_48
895e:    94 f1                  Syscall_49
8960:    95 15                  Syscall_4a
8962:    b4 34                  Syscall_4b
8964:    b5 9b                  Syscall_4c
8966:    94 56                  Syscall_4d
8968:    94 d5                  Syscall_4e
896a:    8f ec                  Syscall_4f
896c:    90 40                  Syscall_50
896e:    8f e1                  Syscall_51
8970:    8c a3                  Syscall_52
8972:    b5 df                  Syscall_53
8974:    8f a0                  Syscall_54
8976:    b5 c8                  Syscall_55
8978:    83 cf                  Syscall_56
897a:    8c f8                  Syscall_57
897c:    00 00                  (0x0)
897e:    af 96                  Syscall_59
8980:    b0 26                  Syscall_5a
8982:    8d cf                  Syscall_5b
8984:    b1 91                  Syscall_5c
8986:    b2 14                  Syscall_5d
8988:    af d4                  Syscall_5e
898a:    b3 45                  Syscall_5f
898c:    b3 52                  Syscall_60
898e:    00 00                  (0x0)
8990:    8d 6f                  Syscall_62
8992:    b0 12                  Syscall_63
8994:    90 00                  Syscall_64
8996:    90 0e                  Syscall_65
8998:    89 b9                  Syscall_66
899a:    92 e0                  Syscall_67
899c:    83 c3                  Syscall_68
899e:    b2 f3                  Syscall_69
89a0:    84 0c                  Syscall_6a
89a2:    84 de                  Syscall_AbortAL
89a4:    85 68                  Syscall_6c
89a6:    8e d8                  Syscall_6d
89a8:    84 1c                  Syscall_6e
89aa:    84 40                  Syscall_6f

NumSyscalls:
89ac:    6f                     (0x6f)

Syscall_19:
89ad:    3a                     clr A, #0
89ae:    39                     dec A, #1
89af:    7e 03                  push {A, B}
89b1:    79 85 b9               call R_85b9
89b4:    1c                         arg1 = (0x1c)
89b5:    3a                     clr A, #0
89b6:    71 aa 25               jmp R_aa25

Syscall_66:
89b9:    7b 01                  call R_89bc
89bb:    0f                     rsys

R_89bc:
89bc:    7e 03                  push {A, B}
89be:    79 8a a6               call LookupDeviceInstance
89c1:    99                     ld A, [B]
89c2:    dd                     ld B, [S]
89c3:    59                     sub B, A
89c4:    11 04                  bnc L_89ca

L_89c6:
89c6:    7f 03                  pop {A, B}
89c8:    3a                     clr A, #0
89c9:    09                     ret

L_89ca:
89ca:    d5 a8 02               ld B, [S + 0x02]
89cd:    b5 a2                  st A, [--S]
89cf:    3a                     clr A, #0
89d0:    39                     dec A, #1
89d1:    66 65                  jsys Syscall_65
89d3:    00 00                      arg1 = (0x0)
89d5:    55 22                  mov B, B
89d7:    15 0e                  bnz L_89e7
89d9:    30 a1                  inc S, #2

L_89db:
89db:    30 a1                  inc S, #2
89dd:    95 a1                  ld A, [S++]
89df:    98                     ld A, [A]
89e0:    d0 ff ff               ld B, 0xffff
89e3:    79 84 e4               call Syscall_Abort
89e6:    0a                         abort_code = (0xa)

L_89e7:
89e7:    d5 a1                  ld B, [S++]
89e9:    59                     sub B, A
89ea:    14 4a                  bz L_8a36
89ec:    3a                     clr A, #0
89ed:    d5 a8 02               ld B, [S + 0x02]
89f0:    66 65                  jsys Syscall_65
89f2:    00 00                      arg1 = (0x0)
89f4:    5d                     mov B, A
89f5:    14 e4                  bz L_89db
89f7:    d5 a8 02               ld B, [S + 0x02]
89fa:    b5 a2                  st A, [--S]
89fc:    3a                     clr A, #0
89fd:    85 28 01               ld AL, [B + 0x01]
8a00:    d1 01 03               ld B, [CurrentProcess|0x0103]
8a03:    c5 28 06               ld BL, [B + 0x06]
8a06:    2d                     sll AL, #1
8a07:    2c                     srl AL, #1
8a08:    10 02                  bc L_8a0c
8a0a:    40 31                  add AL, BL

L_8a0c:
8a0c:    77 10 00 03            div A, A, 0x0003
8a10:    94 ef                  ld A, @[0x8a01|-0x11]
8a12:    95 08 04               ld A, [A + 0x04]
8a15:    38                     inc A, #1
8a16:    58                     add B, A
8a17:    99                     ld A, [B]
8a18:    b3 13                  st A, [0x8a2d|+0x13]
8a1a:    9d                     ld A, [S]
8a1b:    b9                     st A, [B]
8a1c:    d3 0f                  ld B, [0x8a2d|+0xf]
8a1e:    47 45 18 20 02 00 02   memcpy 0x19, [B + 0x02], [A + 0x02]
8a25:    47 9d 00 7e 00 ff      memset 0x01, 0x7e, [A + -0x1]
8a2b:    66 17                  jsys Syscall_17
8a2d:    00 00                      arg1 = (0x0)
8a2f:    95 a1                  ld A, [S++]
8a31:    98                     ld A, [A]
8a32:    dd                     ld B, [S]
8a33:    59                     sub B, A
8a34:    10 90                  bc L_89c6

L_8a36:
8a36:    7f 03                  pop {A, B}
8a38:    3a                     clr A, #0
8a39:    39                     dec A, #1
8a3a:    09                     ret

Syscall_00:
8a3b:    55 20                  mov A, B
8a3d:    79 b2 d1               call AssertIsSystemPtr
8a40:    95 28 06               ld A, [B + 0x06]
8a43:    7c f9                  call @[0x8a3e|-0x7]
8a45:    7b 01                  call Syscall_00_inner
8a47:    0f                     rsys

Syscall_00_inner:
8a48:    7e 45                  push {X, Y, Z}
8a4a:    55 28                  mov Z, B
8a4c:    7b 58                  call LookupDeviceInstance
8a4e:    5b                     mov X, A
8a4f:    55 26                  mov Y, B
8a51:    95 48 05               ld A, [X + 0x05]
8a54:    15 04                  bnz R_8a5a
8a56:    79 84 e4               call Syscall_Abort
8a59:    14                         abort_code = (0x14)

R_8a5a:
8a5a:    79 80 14               call R_8014
8a5d:    15 05                  bnz L_8a64
8a5f:    85 4c 03               ld AL, @[X + 0x03]
8a62:    14 05                  bz L_8a69

L_8a64:
8a64:    79 86 12               call Yield
8a67:    73 f1                  jmp R_8a5a

L_8a69:
8a69:    3a                     clr A, #0
8a6a:    85 88 03               ld AL, [Z + 0x03]
8a6d:    a3 26                  st AL, [0x8a95|+0x26]
8a6f:    19 21                  ble L_8a92
8a71:    79 80 1c               call R_801c
8a74:    15 1c                  bnz L_8a92
8a76:    f3 15                  st B, [0x8a8d|+0x15]
8a78:    14 18                  bz L_8a92
8a7a:    91 01 03               ld A, [CurrentProcess|0x0103]
8a7d:    85 08 01               ld AL, [A + 0x01]
8a80:    28                     inc AL, #1
8a81:    79 80 0c               call R_800c
8a84:    a5 4c 03               st AL, @[X + 0x03]
8a87:    80 80                  ld AL, 0x80
8a89:    ac                     st AL, [Z]
8a8a:    55 40                  mov A, X
8a8c:    d0 00 00               ld B, 0x0000
8a8f:    71 80 48               jmp R_8048

L_8a92:
8a92:    9c                     ld A, [Z]
8a93:    d0 00 00               ld B, 0x0000
8a96:    79 84 e4               call Syscall_Abort
8a99:    23                         abort_code = (0x23)

Syscall_0c:
8a9a:    51 50 7f ff            sub A, X, 0x7fff
8a9e:    10 03                  bc L_8aa3
8aa0:    79 83 a7               call R_83a7

L_8aa3:
8aa3:    7b 01                  call LookupDeviceInstance
8aa5:    0f                     rsys

LookupDeviceInstance:
    ; Not entirely sure
    ; Seems to gets the device instance struct corrosponding to byte at [B + 1]
    ; Result in B
8aa6:    6d a2                  st X, [--S]
8aa8:    61 01 03               ld X, [CurrentProcess|0x0103]
8aab:    99                     ld A, [B]
8aac:    b3 0f                  st A, [R_8abd|0x8abd|+0xf]
8aae:    3a                     clr A, #0
8aaf:    85 28 01               ld AL, [B + 0x01]	 ; 0x81
8ab2:    17 12                  bp L_8ac6	 ; if B < 0x80
8ab4:    2d                     sll AL, #1
8ab5:    2c                     srl AL, #1	 ; Remove top bit
8ab6:    c5 48 06               ld BL, [X + 0x06]
8ab9:    49                     sub BL, AL
8aba:    16 0f                  blt L_8acb

abort_code0A:
8abc:    90 00 00               ld A, 0x0000
8abf:    d0 ff ff               ld B, 0xffff
8ac2:    79 84 e4               call Syscall_Abort
8ac5:    0a                         abort_code = (0xa)

L_8ac6:
8ac6:    c5 48 06               ld BL, [X + 0x06]
8ac9:    40 31                  add AL, BL

L_8acb:
8acb:    c5 48 07               ld BL, [X + 0x07]
8ace:    49                     sub BL, AL
8acf:    18 eb                  bgt abort_code0A
8ad1:    5d                     mov B, A
8ad2:    3d                     sll A, #1
8ad3:    58                     add B, A
8ad4:    65 48 04               ld X, [X + 0x04]
8ad7:    50 24                  add X, B
8ad9:    3a                     clr A, #0
8ada:    85 41                  ld AL, [X++]
8adc:    16 de                  blt abort_code0A
8ade:    3d                     sll A, #1
8adf:    d1 01 09               ld B, [DevicesPtr|0x0109]
8ae2:    58                     add B, A
8ae3:    d9                     ld B, [B]
8ae4:    f5 a2                  st B, [--S]
8ae6:    89                     ld AL, [B]
8ae7:    14 d3                  bz abort_code0A
8ae9:    d0 00 10               ld B, 0x0010
8aec:    4a                     and BL, AL
8aed:    14 06                  bz L_8af5
8aef:    9a                     ld A, [X]
8af0:    5d                     mov B, A
8af1:    38                     inc A, #1
8af2:    15 01                  bnz L_8af5
8af4:    5d                     mov B, A

L_8af5:
8af5:    95 a1                  ld A, [S++]
8af7:    65 a1                  ld X, [S++]
8af9:    09                     ret

Syscall_0f:
8afa:    79 83 a7               call R_83a7
8afd:    7b 01                  call R_8b00
8aff:    0f                     rsys

R_8b00:
8b00:    7e 45                  push {X, Y, Z}
8b02:    5b                     mov X, A
8b03:    55 28                  mov Z, B
8b05:    8a                     ld AL, [X]
8b06:    c0 80                  ld BL, 0x80
8b08:    4a                     and BL, AL
8b09:    15 09                  bnz L_8b14
8b0b:    55 40                  mov A, X
8b0d:    d0 ff ff               ld B, 0xffff
8b10:    79 84 e4               call Syscall_Abort
8b13:    0b                         abort_code = (0xb)

L_8b14:
8b14:    85 48 11               ld AL, [X + 0x11]
8b17:    14 0a                  bz L_8b23
8b19:    2a                     clr AL, #0
8b1a:    a5 48 11               st AL, [X + 0x11]
8b1d:    a5 4c 03               st AL, @[X + 0x03]
8b20:    a5 4c 14               st AL, @[X + 0x14]

L_8b23:
8b23:    71 8a 5a               jmp R_8a5a

Syscall_DoFileOp:
    ; B is a FileOp struct
8b26:    55 20                  mov A, B
8b28:    79 b2 d1               call AssertIsSystemPtr	 ; Assert B is System Pointer
8b2b:    95 28 06               ld A, [B + 0x06]
8b2e:    7c f9                  call @[0x8b29|-0x7]	 ; Assert [B + 0x0006] is System pointer
8b30:    7b 01                  call DoFileOpInner
8b32:    0f                     rsys

DoFileOpInner:
8b33:    f5 a2                  st B, [--S]
8b35:    99                     ld A, [B]
8b36:    b1 8a bd               st A, [R_8abd|0x8abd]
8b39:    79 8a a6               call LookupDeviceInstance
8b3c:    f5 a2                  st B, [--S]
8b3e:    d5 08 01               ld B, [A + 0x01]	 ; FileOp+01, device type?
8b41:    c0 04                  ld BL, 0x04
8b43:    41 23                  sub BL, BH
8b45:    14 07                  bz L_8b4e	 ; if FileOP+01 == 4
8b47:    d5 a1                  ld B, [S++]	 ; pop DeviceInstance
8b49:    d5 a1                  ld B, [S++]	 ; B = FileOP struct
8b4b:    71 8a 48               jmp Syscall_00_inner	 ; Special case?

L_8b4e:
8b4e:    79 8d e4               call R_8de4
8b51:    c5 08 02               ld BL, [A + 0x02]
8b54:    e1 8c 13               st BL, [R_8c13|0x8c13]
8b57:    9d                     ld A, [S]
8b58:    15 03                  bnz L_8b5d
8b5a:    71 8a bc               jmp abort_code0A

L_8b5d:
8b5d:    b1 8c 0f               st A, [R_8c0f|0x8c0f]
8b60:    85 08 06               ld AL, [A + 0x06]
8b63:    d0 00 0f               ld B, 0x000f
8b66:    5a                     and B, A
8b67:    f3 2c                  st B, [0x8b95|+0x2c]
8b69:    80 02                  ld AL, 0x02
8b6b:    49                     sub BL, AL
8b6c:    15 25                  bnz L_8b93
8b6e:    95 a1                  ld A, [S++]
8b70:    dd                     ld B, [S]
8b71:    6d a0                  st X, [S]
8b73:    5b                     mov X, A
8b74:    55 60                  mov A, Y
8b76:    b5 a2                  st A, [--S]
8b78:    55 80                  mov A, Z
8b7a:    b5 a2                  st A, [--S]
8b7c:    55 28                  mov Z, B
8b7e:    95 88 06               ld A, [Z + 0x06]
8b81:    5c                     mov Y, A
8b82:    90 01 00               ld A, 0x0100
8b85:    85 88 03               ld AL, [Z + 0x03]
8b88:    b3 0b                  st A, [0x8b95|+0xb]
8b8a:    29                     dec AL, #1
8b8b:    14 0e                  bz L_8b9b
8b8d:    29                     dec AL, #1
8b8e:    15 03                  bnz L_8b93
8b90:    71 8c 37               jmp R_8c37

L_8b93:
8b93:    9c                     ld A, [Z]
8b94:    d0 00 00               ld B, 0x0000
8b97:    79 84 e4               call Syscall_Abort
8b9a:    0c                         abort_code = (0xc)

L_8b9b:
8b9b:    7b 7d                  call L_8c1a
8b9d:    14 04                  bz L_8ba3

L_8b9f:
8b9f:    80 01                  ld AL, 0x01
8ba1:    73 51                  jmp R_8bf4

L_8ba3:
8ba3:    7b 5e                  call L_8c03
8ba5:    01                     nop
8ba6:    91 01 1d               ld A, [0x011d]
8ba9:    d5 48 0b               ld B, [X + 0x0b]
8bac:    58                     add B, A
8bad:    99                     ld A, [B]
8bae:    80 84                  ld AL, 0x84
8bb0:    41 01                  sub AL, AH
8bb2:    14 eb                  bz L_8b9f
8bb4:    f5 a2                  st B, [--S]
8bb6:    90 8d 00               ld A, 0x8d00
8bb9:    85 21                  ld AL, [B++]
8bbb:    41 01                  sub AL, AH
8bbd:    15 0e                  bnz L_8bcd
8bbf:    95 a1                  ld A, [S++]
8bc1:    93 51                  ld A, [0x8c14|+0x51]
8bc3:    38                     inc A, #1
8bc4:    b5 48 09               st A, [X + 0x09]
8bc7:    3a                     clr A, #0
8bc8:    b5 48 0b               st A, [X + 0x0b]
8bcb:    73 ce                  jmp L_8b9b

L_8bcd:
8bcd:    85 21                  ld AL, [B++]
8bcf:    41 01                  sub AL, AH
8bd1:    15 fa                  bnz L_8bcd
8bd3:    91 01 1d               ld A, [0x011d]
8bd6:    51 20                  sub A, B
8bd8:    b5 48 0b               st A, [X + 0x0b]
8bdb:    95 a1                  ld A, [S++]
8bdd:    5b                     mov X, A
8bde:    51 20                  sub A, B
8be0:    39                     dec A, #1
8be1:    d5 88 04               ld B, [Z + 0x04]
8be4:    59                     sub B, A
8be5:    19 03                  ble L_8bea
8be7:    95 88 04               ld A, [Z + 0x04]

L_8bea:
8bea:    b5 61                  st A, [Y++]

L_8bec:
8bec:    c5 41                  ld BL, [X++]
8bee:    e5 61                  st BL, [Y++]
8bf0:    39                     dec A, #1
8bf1:    18 f9                  bgt L_8bec
8bf3:    ab                     st AL, [Y]

R_8bf4:
8bf4:    c0 ff                  ld BL, 0xff
8bf6:    e1 01 3b               st BL, [0x013b]

R_8bf9:
8bf9:    ac                     st AL, [Z]
8bfa:    95 a1                  ld A, [S++]
8bfc:    5e                     mov Z, A
8bfd:    95 a1                  ld A, [S++]
8bff:    5c                     mov Y, A
8c00:    65 a1                  ld X, [S++]
8c02:    09                     ret

L_8c03:
8c03:    85 41                  ld AL, [X++]
8c05:    a3 11                  st AL, [0x8c18|+0x11]
8c07:    91 01 1d               ld A, [0x011d]
8c0a:    b3 0a                  st A, [0x8c16|+0xa]
8c0c:    79 b5 f2               call R_b5f2

R_8c0f:
8c0f:    00 00                      arg1 = L_0000
8c11:    01 90                      arg2 = L_0190

R_8c13:
8c13:    00                         arg3 = (0x0)
8c14:    00 00                      arg4 = L_0000
8c16:    00 00                      arg5 = L_0000
8c18:    00                         arg6 = (0x0)
8c19:    09                     ret

L_8c1a:
8c1a:    9d                     ld A, [S]
8c1b:    95 08 09               ld A, [A + 0x09]
8c1e:    b3 f4                  st A, [0x8c14|-0xc]
8c20:    d5 88 06               ld B, [Z + 0x06]
8c23:    f5 a2                  st B, [--S]
8c25:    d1 01 1d               ld B, [0x011d]
8c28:    f5 88 06               st B, [Z + 0x06]
8c2b:    55 82                  mov B, Z
8c2d:    79 89 bc               call R_89bc
8c30:    d5 a1                  ld B, [S++]
8c32:    f5 88 06               st B, [Z + 0x06]
8c35:    5d                     mov B, A
8c36:    09                     ret

R_8c37:
8c37:    2a                     clr AL, #0
8c38:    db                     ld B, [Y]
8c39:    14 b9                  bz R_8bf4
8c3b:    31 20                  dec B, #1
8c3d:    45 22                  mov BH, BH
8c3f:    14 04                  bz L_8c45
8c41:    32 02                  clr A, #2
8c43:    73 af                  jmp R_8bf4

L_8c45:
8c45:    7b d3                  call L_8c1a
8c47:    15 3a                  bnz L_8c83
8c49:    7b b8                  call L_8c03
8c4b:    01                     nop
8c4c:    95 48 0b               ld A, [X + 0x0b]
8c4f:    d1 01 1d               ld B, [0x011d]
8c52:    58                     add B, A
8c53:    f5 a2                  st B, [--S]
8c55:    db                     ld B, [Y]
8c56:    58                     add B, A
8c57:    f5 48 0b               st B, [X + 0x0b]
8c5a:    90 01 8f               ld A, 0x018f
8c5d:    59                     sub B, A
8c5e:    17 0e                  bp L_8c6e
8c60:    95 a1                  ld A, [S++]
8c62:    3a                     clr A, #0
8c63:    b5 48 0b               st A, [X + 0x0b]
8c66:    93 ac                  ld A, [0x8c14|-0x54]
8c68:    38                     inc A, #1
8c69:    b5 48 09               st A, [X + 0x09]
8c6c:    73 c9                  jmp R_8c37

L_8c6e:
8c6e:    65 a1                  ld X, [S++]
8c70:    95 61                  ld A, [Y++]
8c72:    39                     dec A, #1
8c73:    67 4a 64               memcpy A, [Y], [X]
8c76:    38                     inc A, #1
8c77:    50 04                  add X, A
8c79:    c0 8d                  ld BL, 0x8d
8c7b:    ea                     st BL, [X]
8c7c:    7b 85                  call L_8c03
8c7e:    02                     sf
8c7f:    2a                     clr AL, #0
8c80:    71 8b f4               jmp R_8bf4

L_8c83:
8c83:    80 ff                  ld AL, 0xff
8c85:    a1 01 3b               st AL, [0x013b]
8c88:    55 82                  mov B, Z
8c8a:    66 19                  jsys Syscall_19
8c8c:    5d                     mov B, A
8c8d:    14 05                  bz L_8c94
8c8f:    80 02                  ld AL, 0x02
8c91:    71 8b f9               jmp R_8bf9

L_8c94:
8c94:    79 8d e4               call R_8de4
8c97:    55 82                  mov B, Z
8c99:    79 8a a6               call LookupDeviceInstance
8c9c:    55 24                  mov X, B
8c9e:    f1 8c 0f               st B, [R_8c0f|0x8c0f]
8ca1:    73 94                  jmp R_8c37

Syscall_52:
8ca3:    79 8a a6               call LookupDeviceInstance
8ca6:    b5 a2                  st A, [--S]
8ca8:    55 60                  mov A, Y
8caa:    b5 a2                  st A, [--S]
8cac:    55 26                  mov Y, B
8cae:    15 04                  bnz L_8cb4
8cb0:    30 43                  inc X, #4
8cb2:    73 27                  jmp L_8cdb

L_8cb4:
8cb4:    95 41                  ld A, [X++]
8cb6:    32 20                  clr B, #0
8cb8:    4d                     mov BL, AL
8cb9:    50 26                  add Y, B
8cbb:    40 03                  add BL, AH
8cbd:    80 1b                  ld AL, 0x1b
8cbf:    49                     sub BL, AL
8cc0:    17 09                  bp L_8ccb
8cc2:    55 40                  mov A, X
8cc4:    d0 ff ff               ld B, 0xffff
8cc7:    79 84 e4               call Syscall_Abort
8cca:    64                         abort_code = (0x64)

L_8ccb:
8ccb:    d5 41                  ld B, [X++]
8ccd:    15 04                  bnz L_8cd3
8ccf:    30 20                  inc B, #1
8cd1:    73 08                  jmp L_8cdb

L_8cd3:
8cd3:    85 61                  ld AL, [Y++]
8cd5:    a5 21                  st AL, [B++]
8cd7:    21 00                  dec AH, #1
8cd9:    18 f8                  bgt L_8cd3

L_8cdb:
8cdb:    95 a1                  ld A, [S++]
8cdd:    5c                     mov Y, A
8cde:    95 a1                  ld A, [S++]
8ce0:    0f                     rsys

Syscall_04:
    ; arg in A, should be postive
8ce1:    b3 0c                  st A, [0x8cef|+0xc]
8ce3:    93 6f                  ld A, [Syscall_02_Singleton|0x8d54|+0x6f]
8ce5:    15 03                  bnz L_8cea
8ce7:    79 8d 84               call R_8d84

L_8cea:
8cea:    93 03                  ld A, [0x8cef|+0x3]
8cec:    17 14                  bp L_8d02

L_8cee:
8cee:    90 00 00               ld A, 0x0000
8cf1:    d0 ff ff               ld B, 0xffff
8cf4:    79 84 e4               call Syscall_Abort
8cf7:    07                         abort_code = (0x7)

Syscall_57:
8cf8:    d1 01 1a               ld B, [0x011a]
8cfb:    f5 a2                  st B, [--S]
8cfd:    d0 01 00               ld B, 0x0100
8d00:    73 16                  jmp L_8d18

L_8d02:
8d02:    d1 01 14               ld B, [0x0114]
8d05:    59                     sub B, A
8d06:    18 e6                  bgt L_8cee
8d08:    d1 01 18               ld B, [0x0118]
8d0b:    f5 a2                  st B, [--S]
8d0d:    3d                     sll A, #1
8d0e:    d1 01 16               ld B, [0x0116]
8d11:    50 20                  add A, B
8d13:    98                     ld A, [A]
8d14:    14 d8                  bz L_8cee
8d16:    32 20                  clr B, #0

L_8d18:
8d18:    c1 01 05               ld BL, [0x0105]
8d1b:    79 8d e4               call R_8de4
8d1e:    71 8d a1               jmp R_8da1

Syscall_02:
8d21:    93 31                  ld A, [Syscall_02_Singleton|0x8d54|+0x31]
8d23:    15 02                  bnz L_8d27
8d25:    7b 5d                  call R_8d84

L_8d27:
8d27:    79 8d e4               call R_8de4
8d2a:    79 88 05               call R_8805
8d2d:    89                     ld AL, [B]
8d2e:    a3 37                  st AL, [0x8d67|+0x37]
8d30:    80 02                  ld AL, 0x02
8d32:    a9                     st AL, [B]
8d33:    85 41                  ld AL, [X++]
8d35:    a3 35                  st AL, [0x8d6c|+0x35]
8d37:    17 17                  bp L_8d50
8d39:    91 01 03               ld A, [CurrentProcess|0x0103]
8d3c:    d5 41                  ld B, [X++]
8d3e:    f3 0a                  st B, [0x8d4a|+0xa]
8d40:    d5 08 1c               ld B, [A + 0x1c]
8d43:    85 08 1b               ld AL, [A + 0x1b]
8d46:    a3 24                  st AL, [0x8d6c|+0x24]
8d48:    66 64                  jsys Syscall_64
8d4a:    00 00                      arg1 = (0x0)
8d4c:    00 00                      arg2 = (0x0)
8d4e:    73 06                  jmp L_8d56

L_8d50:
8d50:    d5 41                  ld B, [X++]
8d52:    66 0e                  jsys Syscall_OpenFile?

Syscall_02_Singleton:
8d54:    00 00                      arg1 = L_0000

L_8d56:
8d56:    15 09                  bnz L_8d61
8d58:    79 88 05               call R_8805
8d5b:    83 0a                  ld AL, [0x8d67|+0xa]
8d5d:    a9                     st AL, [B]
8d5e:    71 8d ed               jmp R_8ded

L_8d61:
8d61:    b5 a2                  st A, [--S]
8d63:    79 88 05               call R_8805
8d66:    80 00                  ld AL, 0x00
8d68:    a9                     st AL, [B]
8d69:    3a                     clr A, #0
8d6a:    5d                     mov B, A
8d6b:    c0 00                  ld BL, 0x00
8d6d:    73 35                  jmp L_8da4

Syscall_62:
8d6f:    7b 73                  call R_8de4
8d71:    b5 a2                  st A, [--S]
8d73:    22 20                  clr BH, #0
8d75:    f5 a2                  st B, [--S]
8d77:    79 83 a7               call R_83a7
8d7a:    79 88 05               call R_8805
8d7d:    2a                     clr AL, #0
8d7e:    a9                     st AL, [B]
8d7f:    d5 a1                  ld B, [S++]
8d81:    3a                     clr A, #0
8d82:    73 20                  jmp L_8da4

R_8d84:
8d84:    91 01 1d               ld A, [0x011d]
8d87:    b3 c3                  st A, [0x8d4c|-0x3d]
8d89:    b3 c9                  st A, [Syscall_02_Singleton|0x8d54|-0x37]
8d8b:    b3 4c                  st A, [0x8dd9|+0x4c]
8d8d:    b1 8e 26               st A, [R_8e26|0x8e26]
8d90:    b1 8f 01               st A, [R_8f01|0x8f01]
8d93:    b1 8f 12               st A, [R_8f12|0x8f12]
8d96:    b1 8f 2f               st A, [R_8f2f|0x8f2f]
8d99:    09                     ret

Syscall_03:
8d9a:    22 20                  clr BH, #0
8d9c:    7b 46                  call R_8de4

L_8d9e:
8d9e:    b5 a2                  st A, [--S]
8da0:    3a                     clr A, #0

R_8da1:
8da1:    79 83 a7               call R_83a7

L_8da4:
8da4:    b3 7e                  st A, [R_8e24|0x8e24|+0x7e]
8da6:    95 a1                  ld A, [S++]
8da8:    b3 75                  st A, [R_8e1f|0x8e1f|+0x75]
8daa:    b1 8e 7b               st A, [R_8e7b|0x8e7b]
8dad:    e3 74                  st BL, [R_8e23|0x8e23|+0x74]
8daf:    f0 00 00               st B, 0x0000
8db2:    7e 63                  push {Y, Z}
8db4:    91 01 03               ld A, [CurrentProcess|0x0103]
8db7:    5c                     mov Y, A
8db8:    95 68 0c               ld A, [Y + 0x0c]
8dbb:    c3 f3                  ld BL, [R_8db0|0x8db0|-0xd]
8dbd:    14 02                  bz L_8dc1
8dbf:    95 41                  ld A, [X++]

L_8dc1:
8dc1:    b1 8e 52               st A, [R_8e52|0x8e52]
8dc4:    c5 48 02               ld BL, [X + 0x02]
8dc7:    15 2b                  bnz L_8df4
8dc9:    55 ba 83 10            mov S, R_8310|0x8310
8dcd:    73 25                  jmp L_8df4

Syscall_5b:
8dcf:    7b 13                  call R_8de4
8dd1:    85 41                  ld AL, [X++]
8dd3:    a5 a2                  st AL, [--S]
8dd5:    d5 41                  ld B, [X++]
8dd7:    66 0e                  jsys Syscall_OpenFile?
8dd9:    00 00                      arg1 = L_0000
8ddb:    14 10                  bz R_8ded
8ddd:    d0 01 00               ld B, 0x0100
8de0:    c5 a1                  ld BL, [S++]
8de2:    73 ba                  jmp L_8d9e

R_8de4:
8de4:    7e 03                  push {A, B}
8de6:    79 85 b9               call R_85b9
8de9:    3b                         arg1 = (0x3b)
8dea:    7f 03                  pop {A, B}
8dec:    09                     ret

R_8ded:
8ded:    3a                     clr A, #0
8dee:    39                     dec A, #1
8def:    5d                     mov B, A
8df0:    79 84 e4               call Syscall_Abort
8df3:    03                         abort_code = (0x3)

L_8df4:
8df4:    d5 68 0a               ld B, [Y + 0x0a]
8df7:    83 b7                  ld AL, [R_8db0|0x8db0|-0x49]
8df9:    14 01                  bz L_8dfc
8dfb:    da                     ld B, [X]

L_8dfc:
8dfc:    95 41                  ld A, [X++]
8dfe:    14 08                  bz L_8e08
8e00:    59                     sub B, A
8e01:    10 04                  bc L_8e07

R_8e03:
8e03:    79 84 e4               call Syscall_Abort
8e06:    04                         abort_code = (0x4)

L_8e07:
8e07:    5d                     mov B, A

L_8e08:
8e08:    85 41                  ld AL, [X++]
8e0a:    6d a2                  st X, [--S]
8e0c:    a5 a2                  st AL, [--S]
8e0e:    f3 5b                  st B, [R_8e6b|0x8e6b|+0x5b]
8e10:    f3 46                  st B, [R_8e58|0x8e58|+0x46]
8e12:    3a                     clr A, #0
8e13:    a3 7b                  st AL, [R_8e90|0x8e90|+0x7b]

R_8e15:
8e15:    d3 0d                  ld B, [R_8e24|0x8e24|+0xd]
8e17:    94 06                  ld A, @[R_8e1f|0x8e1f|+0x6]
8e19:    59                     sub B, A
8e1a:    11 d1                  bnc R_8ded
8e1c:    79 b5 f2               call R_b5f2

R_8e1f:
8e1f:    00 00                      arg1 = L_0000
8e21:    01 90                      arg2 = L_0190

R_8e23:
8e23:    00                         arg3 = (0x0)

R_8e24:
8e24:    00 00                      arg4 = L_0000

R_8e26:
8e26:    00 00                      arg5 = L_0000
8e28:    01                         arg6 = (0x1)
8e29:    30 10 8e 24            inc [R_8e24|0x8e24], #1
8e2d:    93 f7                  ld A, [R_8e26|0x8e26|-0x9]
8e2f:    5e                     mov Z, A

L_8e30:
8e30:    3a                     clr A, #0
8e31:    8c                     ld AL, [Z]
8e32:    15 2a                  bnz L_8e5e
8e34:    85 88 01               ld AL, [Z + 0x01]
8e37:    14 25                  bz L_8e5e
8e39:    39                     dec A, #1
8e3a:    d5 88 02               ld B, [Z + 0x02]
8e3d:    58                     add B, A
8e3e:    f1 8e d6               st B, [R_8ed6|0x8ed6]
8e41:    46 22 00 8e 6a 8e d5   addbig(2, 2) [R_8e6a|0x8e6a], [R_8ed5|0x8ed5]
8e48:    c1 8e d5               ld BL, [R_8ed5|0x8ed5]
8e4b:    15 71                  bnz L_8ebe
8e4d:    d1 8e d6               ld B, [R_8ed6|0x8ed6]

R_8e50:
8e50:    51 3e 00 00            sub P, B, 0x0000
8e54:    11 51                  bnc L_8ea7
8e56:    51 3e 00 00            sub P, B, 0x0000
8e5a:    17 02                  bp L_8e5e
8e5c:    f3 fa                  st B, [R_8e58|0x8e58|-0x6]

L_8e5e:
8e5e:    47 02 8e 6b 08         unkblk0 [R_8e6b|0x8e6b], [Z]
8e63:    15 cb                  bnz L_8e30
8e65:    13 06                  bnn L_8e6d
8e67:    66 09                  jsys Syscall_Abort
8e69:    03                         abort_code = (0x3)

R_8e6a:
8e6a:    00                     HALT

R_8e6b:
8e6b:    00                     HALT
8e6c:    00                     HALT

L_8e6d:
8e6d:    10 a6                  bc R_8e15

L_8e6f:
8e6f:    b5 a2                  st A, [--S]
8e71:    91 aa 46               ld A, [R_aa46|0xaa46]
8e74:    d3 05                  ld B, [R_8e7b|0x8e7b|+0x5]
8e76:    59                     sub B, A
8e77:    18 04                  bgt L_8e7d
8e79:    66 17                  jsys Syscall_17

R_8e7b:
8e7b:    00 00                      arg1 = (0x0)

L_8e7d:
8e7d:    93 d9                  ld A, [R_8e58|0x8e58|-0x27]
8e7f:    d5 68 0e               ld B, [Y + 0x0e]
8e82:    59                     sub B, A
8e83:    11 03                  bnc L_8e88
8e85:    b5 68 0e               st A, [Y + 0x0e]

L_8e88:
8e88:    d5 a1                  ld B, [S++]
8e8a:    80 ff                  ld AL, 0xff
8e8c:    a1 01 3b               st AL, [0x013b]
8e8f:    80 00                  ld AL, 0x00
8e91:    14 03                  bz L_8e96
8e93:    71 8f 6d               jmp R_8f6d

L_8e96:
8e96:    85 a1                  ld AL, [S++]
8e98:    14 07                  bz L_8ea1
8e9a:    65 a1                  ld X, [S++]
8e9c:    7f 63                  pop {Y, Z}
8e9e:    93 b8                  ld A, [R_8e58|0x8e58|-0x48]
8ea0:    0f                     rsys

L_8ea1:
8ea1:    32 40                  clr X, #0
8ea3:    93 b3                  ld A, [R_8e58|0x8e58|-0x4d]
8ea5:    66 1a                  jsys Syscall_1a

L_8ea7:
8ea7:    81 8d b0               ld AL, [R_8db0|0x8db0]
8eaa:    14 03                  bz L_8eaf
8eac:    3a                     clr A, #0
8ead:    73 c0                  jmp L_8e6f

L_8eaf:
8eaf:    93 a1                  ld A, [R_8e52|0x8e52|-0x5f]
8eb1:    b3 23                  st A, [R_8ed6|0x8ed6|+0x23]
8eb3:    46 12 0c 08 00 8e      addbig(1, 2) 0x08, [0x008e]
8eb9:    d5                     unknown
8eba:    83 19                  ld AL, [R_8ed5|0x8ed5|+0x19]
8ebc:    14 07                  bz L_8ec5

L_8ebe:
8ebe:    32 10 8e d5            clr [R_8ed5|0x8ed5], #0
8ec2:    71 8e 03               jmp R_8e03

L_8ec5:
8ec5:    93 0f                  ld A, [R_8ed6|0x8ed6|+0xf]
8ec7:    b3 89                  st A, [R_8e52|0x8e52|-0x77]
8ec9:    7e 21                  push {B}
8ecb:    91 01 03               ld A, [CurrentProcess|0x0103]
8ece:    66 59                  jsys Syscall_59
8ed0:    7f 21                  pop {B}
8ed2:    71 8e 50               jmp R_8e50

R_8ed5:
8ed5:    00                     HALT

R_8ed6:
8ed6:    00                     HALT
8ed7:    00                     HALT

Syscall_6d:
8ed8:    79 8d e4               call R_8de4
8edb:    7e 45                  push {X, Y, Z}
8edd:    3a                     clr A, #0
8ede:    a1 8d b0               st AL, [R_8db0|0x8db0]
8ee1:    b3 2d                  st A, [0x8f10|+0x2d]
8ee3:    39                     dec A, #1
8ee4:    a3 aa                  st AL, [R_8e90|0x8e90|-0x56]
8ee6:    91 01 03               ld A, [CurrentProcess|0x0103]
8ee9:    5c                     mov Y, A
8eea:    85 08 31               ld AL, [A + 0x31]
8eed:    a5 a2                  st AL, [--S]
8eef:    d5 41                  ld B, [X++]
8ef1:    14 32                  bz L_8f25
8ef3:    f3 08                  st B, [0x8efd|+0x8]
8ef5:    79 88 05               call R_8805
8ef8:    80 02                  ld AL, 0x02
8efa:    a9                     st AL, [B]
8efb:    8d                     ld AL, [S]
8efc:    d0 00 00               ld B, 0x0000
8eff:    66 0e                  jsys Syscall_OpenFile?

R_8f01:
8f01:    00 00                      arg1 = L_0000
8f03:    14 54                  bz L_8f59
8f05:    b3 18                  st A, [0x8f1f|+0x18]
8f07:    b3 07                  st A, [0x8f10|+0x7]
8f09:    b3 4c                  st A, [0x8f57|+0x4c]
8f0b:    d5 41                  ld B, [X++]
8f0d:    8d                     ld AL, [S]
8f0e:    66 4f                  jsys Syscall_4f
8f10:    00 00                      arg1 = (0x0)

R_8f12:
8f12:    00 00                      arg2 = L_0000
8f14:    14 3f                  bz L_8f55
8f16:    b5 a2                  st A, [--S]
8f18:    79 88 05               call R_8805
8f1b:    2a                     clr AL, #0
8f1c:    a9                     st AL, [B]
8f1d:    66 17                  jsys Syscall_17
8f1f:    00 00                      arg1 = (0x0)
8f21:    95 a1                  ld A, [S++]
8f23:    73 0e                  jmp L_8f33

L_8f25:
8f25:    d5 41                  ld B, [X++]
8f27:    f3 04                  st B, [0x8f2d|+0x4]
8f29:    32 20                  clr B, #0
8f2b:    66 64                  jsys Syscall_64
8f2d:    00 00                      arg1 = (0x0)

R_8f2f:
8f2f:    00 00                      arg2 = (0x0)
8f31:    14 2b                  bz L_8f5e

L_8f33:
8f33:    b1 8e 1f               st A, [R_8e1f|0x8e1f]
8f36:    b1 8e 7b               st A, [R_8e7b|0x8e7b]
8f39:    c5 a1                  ld BL, [S++]
8f3b:    e1 8e 23               st BL, [R_8e23|0x8e23]
8f3e:    95 68 0c               ld A, [Y + 0x0c]
8f41:    b1 8e 52               st A, [R_8e52|0x8e52]
8f44:    d5 41                  ld B, [X++]
8f46:    f1 8e 6b               st B, [R_8e6b|0x8e6b]
8f49:    f1 8e 58               st B, [R_8e58|0x8e58]
8f4c:    32 10 8e 24            clr [R_8e24|0x8e24], #0
8f50:    6d a2                  st X, [--S]
8f52:    71 8e 15               jmp R_8e15

L_8f55:
8f55:    66 17                  jsys Syscall_17
8f57:    00 00                      arg1 = (0x0)

L_8f59:
8f59:    79 88 05               call R_8805
8f5c:    2a                     clr AL, #0
8f5d:    a9                     st AL, [B]

L_8f5e:
8f5e:    30 a0                  inc S, #1
8f60:    3a                     clr A, #0
8f61:    a1 8e 90               st AL, [R_8e90|0x8e90]
8f64:    39                     dec A, #1
8f65:    a1 01 3b               st AL, [0x013b]
8f68:    7f 45                  pop {X, Y, Z}
8f6a:    30 4c                  inc X, #13
8f6c:    0f                     rsys

R_8f6d:
8f6d:    2a                     clr AL, #0
8f6e:    a1 8e 90               st AL, [R_8e90|0x8e90]
8f71:    65 a1                  ld X, [S++]
8f73:    91 8e 58               ld A, [R_8e58|0x8e58]
8f76:    b5 41                  st A, [X++]
8f78:    f5 41                  st B, [X++]
8f7a:    85 48 02               ld AL, [X + 0x02]
8f7d:    15 05                  bnz L_8f84
8f7f:    91 8e 58               ld A, [R_8e58|0x8e58]
8f82:    66 5a                  jsys Syscall_5a

L_8f84:
8f84:    95 68 0c               ld A, [Y + 0x0c]
8f87:    b5 41                  st A, [X++]
8f89:    7f 45                  pop {X, Y, Z}
8f8b:    30 4c                  inc X, #13
8f8d:    3a                     clr A, #0
8f8e:    0f                     rsys

Syscall_OpenFile?:
8f8f:    f5 a2                  st B, [--S]
8f91:    a5 a2                  st AL, [--S]
8f93:    7c 7e                  call @[0x9013|+0x7e]
8f95:    3c                     srl A, #1
8f96:    79 83 a7               call R_83a7
8f99:    3a                     clr A, #0
8f9a:    a4 7d                  st AL, @[0x9019|+0x7d]
8f9c:    5d                     mov B, A
8f9d:    71 90 65               jmp R_9065

Syscall_54:
8fa0:    f5 a2                  st B, [--S]
8fa2:    a5 a2                  st AL, [--S]
8fa4:    7c 6d                  call @[0x9013|+0x6d]
8fa6:    3c                     srl A, #1
8fa7:    3a                     clr A, #0
8fa8:    a4 6f                  st AL, @[0x9019|+0x6f]
8faa:    b1 92 57               st A, [R_9257|0x9257]
8fad:    39                     dec A, #1
8fae:    b1 91 78               st A, [R_9178|0x9178]
8fb1:    c0 0f                  ld BL, 0x0f
8fb3:    e1 92 df               st BL, [R_92df|0x92df]
8fb6:    38                     inc A, #1
8fb7:    b1 93 a5               st A, [R_93a5|0x93a5]
8fba:    b1 91 03               st A, [R_9103|0x9103]
8fbd:    b1 92 00               st A, [R_9200|0x9200]
8fc0:    32 20                  clr B, #0
8fc2:    85 a1                  ld AL, [S++]
8fc4:    17 02                  bp L_8fc8
8fc6:    4d                     mov BL, AL
8fc7:    2b                     not AL, #0

L_8fc8:
8fc8:    a1 92 4c               st AL, [R_924c|0x924c]
8fcb:    e1 92 7a               st BL, [R_927a|0x927a]
8fce:    d5 a1                  ld B, [S++]
8fd0:    f1 91 bb               st B, [R_91bb|0x91bb]
8fd3:    d6 67 92 d6            st Y, [R_92d6|0x92d6]
8fd7:    d6 89 92 da            st Z, [R_92da|0x92da]
8fdb:    79 cd a8               call R_cda8
8fde:    71 90 bd               jmp R_90bd

Syscall_51:
8fe1:    f5 a2                  st B, [--S]
8fe3:    a5 a2                  st AL, [--S]
8fe5:    7c 2c                  call @[0x9013|+0x2c]
8fe7:    3c                     srl A, #1
8fe8:    95 41                  ld A, [X++]
8fea:    73 08                  jmp L_8ff4

Syscall_4f:
8fec:    f5 a2                  st B, [--S]
8fee:    a5 a2                  st AL, [--S]
8ff0:    7c 21                  call @[0x9013|+0x21]
8ff2:    3c                     srl A, #1
8ff3:    3a                     clr A, #0

L_8ff4:
8ff4:    b4 70                  st A, @[0x9066|+0x70]
8ff6:    7c 9f                  call @[0x8f97|-0x61]
8ff8:    32 20                  clr B, #0
8ffa:    e4 1d                  st BL, @[0x9019|+0x1d]
8ffc:    95 41                  ld A, [X++]
8ffe:    73 68                  jmp L_9068

Syscall_64:
9000:    f5 a2                  st B, [--S]
9002:    a5 a2                  st AL, [--S]
9004:    7c 0d                  call @[0x9013|+0xd]
9006:    3c                     srl A, #1
9007:    d5 41                  ld B, [X++]
9009:    3a                     clr A, #0
900a:    a4 0d                  st AL, @[0x9019|+0xd]
900c:    73 22                  jmp L_9030

Syscall_65:
900e:    f5 a2                  st B, [--S]
9010:    a5 a2                  st AL, [--S]
9012:    79 85 b9               call R_85b9
9015:    3c                         arg1 = (0x3c)
9016:    85 a1                  ld AL, [S++]
9018:    a1 92 89               st AL, [R_9289|0x9289]
901b:    dd                     ld B, [S]
901c:    95 28 06               ld A, [B + 0x06]
901f:    ba                     st A, [X]
9020:    79 8a a6               call LookupDeviceInstance
9023:    85 08 02               ld AL, [A + 0x02]
9026:    a5 a2                  st AL, [--S]
9028:    95 28 07               ld A, [B + 0x07]
902b:    b5 a8 01               st A, [S + 0x01]
902e:    30 2c                  inc B, #13

L_9030:
9030:    51 50 80 00            sub A, X, 0x8000
9034:    10 18                  bc L_904e
9036:    84 e1                  ld AL, @[0x9019|-0x1f]
9038:    14 11                  bz L_904b
903a:    9a                     ld A, [X]
903b:    79 b2 d1               call AssertIsSystemPtr
903e:    73 0e                  jmp L_904e

Syscall_50:
9040:    f5 a2                  st B, [--S]
9042:    a5 a2                  st AL, [--S]
9044:    7c cd                  call @[0x9013|-0x33]
9046:    3c                     srl A, #1
9047:    3a                     clr A, #0
9048:    5d                     mov B, A
9049:    a4 ce                  st AL, @[0x9019|-0x32]

L_904b:
904b:    79 83 a7               call R_83a7

L_904e:
904e:    95 a8 01               ld A, [S + 0x01]
9051:    f5 a8 01               st B, [S + 0x01]
9054:    5d                     mov B, A
9055:    14 0e                  bz R_9065
9057:    38                     inc A, #1
9058:    d0 00 19               ld B, 0x0019
905b:    78 20                  mul A, B
905d:    35 03                  sll A, #4
905f:    b1 91 84               st A, [R_9184|0x9184]
9062:    30 20                  inc B, #1
9064:    3a                     clr A, #0

R_9065:
9065:    b1 92 57               st A, [R_9257|0x9257]

L_9068:
9068:    31 20                  dec B, #1
906a:    f1 91 78               st B, [R_9178|0x9178]
906d:    c0 0f                  ld BL, 0x0f
906f:    e1 92 df               st BL, [R_92df|0x92df]
9072:    32 20                  clr B, #0
9074:    73 19                  jmp L_908f
9076:    f5 'u'
9077:    a2 '"'
9078:    a5 '%'
9079:    a2 '"'
907a:    7c
907b:    97
907c:    3c
907d:    80
907e:    09
907f:    a1 '!'
9080:    92
9081:    df '_'
9082:    3a
9083:    a4 '$'
9084:    94
9085:    b4 '4'
9086:    df '_'
9087:    39
9088:    b1 '1'
9089:    91
908a:    78
908b:    95
908c:    41
908d:    d5 'U'
908e:    41

L_908f:
908f:    f1 93 a5               st B, [R_93a5|0x93a5]
9092:    b3 6f                  st A, [R_9103|0x9103|+0x6f]
9094:    b1 92 00               st A, [R_9200|0x9200]
9097:    22 30                  clr BL, #0
9099:    85 a1                  ld AL, [S++]
909b:    17 02                  bp L_909f
909d:    4d                     mov BL, AL
909e:    2b                     not AL, #0

L_909f:
909f:    a1 92 4c               st AL, [R_924c|0x924c]
90a2:    e1 92 7a               st BL, [R_927a|0x927a]
90a5:    d5 a1                  ld B, [S++]
90a7:    f1 91 bb               st B, [R_91bb|0x91bb]
90aa:    d6 67 92 d6            st Y, [R_92d6|0x92d6]
90ae:    d6 89 92 da            st Z, [R_92da|0x92da]
90b2:    79 cd a8               call R_cda8
90b5:    3a                     clr A, #0
90b6:    b1 92 bd               st A, [R_92bd|0x92bd]
90b9:    95 41                  ld A, [X++]
90bb:    15 0b                  bnz L_90c8

R_90bd:
90bd:    66 16                  jsys Syscall_16
90bf:    01 90                      arg1 = (0x190)
90c1:    00 00                      out = (0x0)
90c3:    93 fc                  ld A, [0x90c1|-0x4]
90c5:    b1 92 bd               st A, [R_92bd|0x92bd]

L_90c8:
90c8:    b1 92 4f               st A, [R_924f|0x924f]
90cb:    3a                     clr A, #0
90cc:    b1 92 9d               st A, [R_929d|0x929d]
90cf:    b1 80 ae               st A, [R_80ae|0x80ae]
90d2:    a1 80 b0               st AL, [R_80b0|0x80b0]
90d5:    a1 91 67               st AL, [R_9167|0x9167]
90d8:    28                     inc AL, #1
90d9:    a1 92 51               st AL, [R_9251|0x9251]
90dc:    90 80 93               ld A, R_8093|0x8093
90df:    b1 92 48               st A, [R_9248|0x9248]
90e2:    90 00 0f               ld A, 0x000f
90e5:    b1 92 4d               st A, [R_924d|0x924d]
90e8:    79 92 45               call R_9245
90eb:    95 68 17               ld A, [Y + 0x17]
90ee:    b3 5d                  st A, [R_914d|0x914d|+0x5d]
90f0:    69 92 d2               st X, [R_92d2|0x92d2]
90f3:    3a                     clr A, #0
90f4:    85 68 16               ld AL, [Y + 0x16]
90f7:    29                     dec AL, #1
90f8:    d1 92 4f               ld B, [R_924f|0x924f]
90fb:    55 77 00 14            mov Y, [Y + 0x0014]
90ff:    79 80 06               call R_8006
9102:    90 00 00               ld A, 0x0000
9105:    14 05                  bz R_910c
9107:    b1 92 48               st A, [R_9248|0x9248]
910a:    73 53                  jmp R_915f

R_910c:
910c:    80 0e                  ld AL, 0x0e
910e:    a1 92 4e               st AL, [R_924e|0x924e]
9111:    79 92 45               call R_9245
9114:    91 92 4f               ld A, [R_924f|0x924f]
9117:    5c                     mov Y, A
9118:    85 68 08               ld AL, [Y + 0x08]
911b:    28                     inc AL, #1
911c:    14 04                  bz L_9122
911e:    79 84 e4               call Syscall_Abort
9121:    2f                         abort_code = (0x2f)

L_9122:
9122:    95 68 06               ld A, [Y + 0x06]
9125:    3b                     not A, #0
9126:    c0 80                  ld BL, 0x80
9128:    07                     rl
9129:    36 00                  rrc A, #1
912b:    11 02                  bnc L_912f
912d:    43 30                  or AH, BL

L_912f:
912f:    d0 3c b1               ld B, 0x3cb1
9132:    44 32                  xor BH, BL
9134:    54 02                  xor B, A
9136:    93 15                  ld A, [R_914d|0x914d|+0x15]
9138:    59                     sub B, A
9139:    14 07                  bz L_9142
913b:    3a                     clr A, #0
913c:    39                     dec A, #1
913d:    5d                     mov B, A
913e:    79 84 e4               call Syscall_Abort
9141:    30                         abort_code = (0x30)

L_9142:
9142:    95 68 04               ld A, [Y + 0x04]
9145:    44 10                  xor AH, AL
9147:    d0 3c b1               ld B, 0x3cb1
914a:    54 02                  xor B, A
914c:    90 00 00               ld A, 0x0000
914f:    58                     add B, A
9150:    90 10 00               ld A, 0x1000

L_9153:
9153:    35 20                  sll B, #1
9155:    37 00                  rlc A, #1
9157:    11 fa                  bnc L_9153
9159:    a1 80 ae               st AL, [R_80ae|0x80ae]
915c:    f1 80 af               st B, [R_80af|0x80af]

R_915f:
915f:    3a                     clr A, #0
9160:    b1 92 4d               st A, [R_924d|0x924d]
9163:    79 92 45               call R_9245
9166:    80 00                  ld AL, 0x00
9168:    14 03                  bz L_916d
916a:    71 93 2b               jmp R_932b

L_916d:
916d:    61 92 4f               ld X, [R_924f|0x924f]
9170:    47 44 02 40 0d 92 53   memcpy 0x03, [X + 0x0d], [R_9253|0x9253]
9177:    90 00 00               ld A, 0x0000
917a:    16 1f                  blt L_919b
917c:    b1 92 4d               st A, [R_924d|0x924d]
917f:    3a                     clr A, #0
9180:    39                     dec A, #1
9181:    b3 f5                  st A, [R_9178|0x9178|-0xb]
9183:    90 00 00               ld A, 0x0000
9186:    d1 92 4f               ld B, [R_924f|0x924f]
9189:    58                     add B, A
918a:    55 24                  mov X, B
918c:    79 92 45               call R_9245
918f:    9a                     ld A, [X]
9190:    14 20                  bz L_91b2
9192:    55 67 91 bb            mov Y, [R_91bb|0x91bb]
9196:    15 58                  bnz L_91f0
9198:    71 92 56               jmp R_9256

L_919b:
919b:    71 92 30               jmp R_9230

R_919e:
919e:    91 92 4d               ld A, [R_924d|0x924d]
91a1:    38                     inc A, #1
91a2:    b1 92 4d               st A, [R_924d|0x924d]
91a5:    61 92 4f               ld X, [R_924f|0x924f]
91a8:    79 92 45               call R_9245

R_91ab:
91ab:    9a                     ld A, [X]
91ac:    d0 84 8d               ld B, 0x848d
91af:    59                     sub B, A
91b0:    15 08                  bnz L_91ba

L_91b2:
91b2:    3a                     clr A, #0
91b3:    b1 93 a5               st A, [R_93a5|0x93a5]
91b6:    5d                     mov B, A
91b7:    71 92 9f               jmp R_929f

L_91ba:
91ba:    90 00 00               ld A, 0x0000
91bd:    5c                     mov Y, A
91be:    55 48                  mov Z, X
91c0:    90 0a 00               ld A, 0x0a00

L_91c3:
91c3:    21 00                  dec AH, #1
91c5:    17 0b                  bp L_91d2
91c7:    85 61                  ld AL, [Y++]
91c9:    14 12                  bz L_91dd
91cb:    c0 ae                  ld BL, 0xae
91cd:    49                     sub BL, AL
91ce:    14 20                  bz L_91f0
91d0:    73 0b                  jmp L_91dd

L_91d2:
91d2:    85 61                  ld AL, [Y++]
91d4:    15 09                  bnz L_91df
91d6:    80 a0                  ld AL, 0xa0
91d8:    c5 81                  ld BL, [Z++]
91da:    49                     sub BL, AL
91db:    15 be                  bnz L_919b

L_91dd:
91dd:    73 77                  jmp R_9256

L_91df:
91df:    c5 81                  ld BL, [Z++]
91e1:    49                     sub BL, AL
91e2:    14 df                  bz L_91c3
91e4:    c0 ae                  ld BL, 0xae
91e6:    49                     sub BL, AL
91e7:    15 b2                  bnz L_919b
91e9:    80 a0                  ld AL, 0xa0
91eb:    c5 82                  ld BL, [--Z]
91ed:    49                     sub BL, AL
91ee:    15 40                  bnz R_9230

L_91f0:
91f0:    85 48 0d               ld AL, [X + 0x0d]
91f3:    c0 0f                  ld BL, 0x0f
91f5:    4a                     and BL, AL
91f6:    80 05                  ld AL, 0x05
91f8:    49                     sub BL, AL
91f9:    14 04                  bz L_91ff

L_91fb:
91fb:    79 84 e4               call Syscall_Abort
91fe:    12                         abort_code = (0x12)

L_91ff:
91ff:    90 00 00               ld A, 0x0000
9202:    15 f7                  bnz L_91fb
9204:    93 47                  ld A, [R_924d|0x924d|+0x47]
9206:    77 10 00 19            div A, A, 0x0019
920a:    93 43                  ld A, [R_924f|0x924f|+0x43]
920c:    51 40                  sub A, X
920e:    34 03                  srl A, #4
9210:    39                     dec A, #1
9211:    58                     add B, A
9212:    f1 92 9d               st B, [R_929d|0x929d]
9215:    55 60                  mov A, Y
9217:    b3 a2                  st A, [R_91bb|0x91bb|-0x5e]
9219:    91 93 a5               ld A, [R_93a5|0x93a5]
921c:    b5 a2                  st A, [--S]
921e:    79 93 6b               call R_936b
9221:    91 93 a5               ld A, [R_93a5|0x93a5]
9224:    b3 22                  st A, [R_9248|0x9248|+0x22]
9226:    b3 d8                  st A, [R_9200|0x9200|-0x28]
9228:    95 a1                  ld A, [S++]
922a:    b1 93 a5               st A, [R_93a5|0x93a5]
922d:    71 91 5f               jmp R_915f

R_9230:
9230:    90 00 10               ld A, 0x0010
9233:    50 04                  add X, A
9235:    93 18                  ld A, [R_924f|0x924f|+0x18]
9237:    d0 01 90               ld B, 0x0190
923a:    58                     add B, A
923b:    51 42                  sub B, X
923d:    16 03                  blt L_9242
923f:    71 91 9e               jmp R_919e

L_9242:
9242:    71 91 ab               jmp R_91ab

R_9245:
9245:    79 b5 f2               call R_b5f2

R_9248:
9248:    00 00                      arg1 = L_0000
924a:    01 90                      arg2 = L_0190

R_924c:
924c:    00                         arg3 = (0x0)

R_924d:
924d:    00 00                      arg4 = L_0000

R_924f:
924f:    00 00                      arg5 = L_0000

R_9251:
9251:    01                         arg6 = (0x1)
9252:    09                     ret

R_9253:
9253:    00                     HALT
9254:    00                     HALT
9255:    00                     HALT

R_9256:
9256:    90 00 00               ld A, 0x0000
9259:    14 1e                  bz L_9279
925b:    38                     inc A, #1
925c:    15 0a                  bnz L_9268
925e:    d3 72                  ld B, [R_92d2|0x92d2|+0x72]
9260:    95 48 0e               ld A, [X + 0x0e]
9263:    b5 28 fa               st A, [B + -0x6]
9266:    73 0a                  jmp L_9272

L_9268:
9268:    39                     dec A, #1
9269:    b5 48 0e               st A, [X + 0x0e]
926c:    80 02                  ld AL, 0x02
926e:    a3 e1                  st AL, [R_9251|0x9251|-0x1f]
9270:    7b d3                  call R_9245

L_9272:
9272:    3a                     clr A, #0
9273:    39                     dec A, #1
9274:    b1 93 a5               st A, [R_93a5|0x93a5]
9277:    73 23                  jmp L_929c

L_9279:
9279:    80 00                  ld AL, 0x00
927b:    14 0b                  bz L_9288
927d:    93 ce                  ld A, [R_924d|0x924d|-0x32]
927f:    b1 93 a5               st A, [R_93a5|0x93a5]
9282:    55 42                  mov B, X
9284:    f5 a2                  st B, [--S]
9286:    73 2f                  jmp L_92b7

L_9288:
9288:    80 00                  ld AL, 0x00
928a:    14 0d                  bz L_9299
928c:    79 93 47               call R_9347
928f:    9b                     ld A, [Y]
9290:    b1 93 a5               st A, [R_93a5|0x93a5]
9293:    3a                     clr A, #0
9294:    39                     dec A, #1
9295:    b5 a2                  st A, [--S]
9297:    73 0d                  jmp L_92a6

L_9299:
9299:    79 93 6b               call R_936b

L_929c:
929c:    d0 00 00               ld B, 0x0000

R_929f:
929f:    f5 a2                  st B, [--S]
92a1:    91 91 03               ld A, [R_9103|0x9103]
92a4:    15 11                  bnz L_92b7

L_92a6:
92a6:    91 92 00               ld A, [R_9200|0x9200]
92a9:    14 0c                  bz L_92b7
92ab:    d1 93 a5               ld B, [R_93a5|0x93a5]
92ae:    59                     sub B, A
92af:    14 06                  bz L_92b7
92b1:    b3 02                  st A, [0x92b5|+0x2]
92b3:    66 17                  jsys Syscall_17
92b5:    00 00                      arg1 = (0x0)

L_92b7:
92b7:    93 04                  ld A, [R_92bd|0x92bd|+0x4]
92b9:    14 04                  bz L_92bf
92bb:    66 17                  jsys Syscall_17

R_92bd:
92bd:    00 00                      arg1 = (0x0)

L_92bf:
92bf:    3a                     clr A, #0
92c0:    39                     dec A, #1
92c1:    a1 01 3c               st AL, [0x013c]
92c4:    d3 91                  ld B, [R_9257|0x9257|-0x6f]
92c6:    14 07                  bz L_92cf
92c8:    30 20                  inc B, #1
92ca:    14 03                  bz L_92cf
92cc:    a1 01 1c               st AL, [0x011c]

L_92cf:
92cf:    d5 a1                  ld B, [S++]
92d1:    60 00 00               ld X, 0x0000
92d4:    55 76 00 00            mov Y, 0x0000
92d8:    55 98 00 00            mov Z, 0x0000
92dc:    91 93 a5               ld A, [R_93a5|0x93a5]

R_92df:
92df:    0f                     rsys

Syscall_67:
92e0:    7e 45                  push {X, Y, Z}
92e2:    55 20                  mov A, B
92e4:    79 b2 d1               call AssertIsSystemPtr
92e7:    b5 a2                  st A, [--S]
92e9:    79 85 b9               call R_85b9
92ec:    3c                         arg1 = (0x3c)
92ed:    66 16                  jsys Syscall_16
92ef:    01 90                      arg1 = (0x190)
92f1:    00 00                      out = (0x0)
92f3:    93 fc                  ld A, [0x92f1|-0x4]
92f5:    b3 44                  st A, [0x933b|+0x44]
92f7:    b1 92 4f               st A, [R_924f|0x924f]
92fa:    79 b2 cb               call R_b2cb
92fd:    b3 31                  st A, [0x9330|+0x31]
92ff:    d5 a1                  ld B, [S++]
9301:    79 8a a6               call LookupDeviceInstance
9304:    b5 a2                  st A, [--S]
9306:    95 08 17               ld A, [A + 0x17]
9309:    b1 91 4d               st A, [R_914d|0x914d]
930c:    95 a1                  ld A, [S++]
930e:    85 08 02               ld AL, [A + 0x02]
9311:    a1 92 4c               st AL, [R_924c|0x924c]
9314:    90 80 93               ld A, R_8093|0x8093
9317:    b1 92 48               st A, [R_9248|0x9248]
931a:    3a                     clr A, #0
931b:    a1 80 ae               st AL, [R_80ae|0x80ae]
931e:    b1 80 af               st A, [R_80af|0x80af]
9321:    28                     inc AL, #1
9322:    a1 91 67               st AL, [R_9167|0x9167]
9325:    a1 92 51               st AL, [R_9251|0x9251]
9328:    71 91 0c               jmp R_910c

R_932b:
932b:    3a                     clr A, #0
932c:    a1 91 67               st AL, [R_9167|0x9167]
932f:    90 00 00               ld A, 0x0000
9332:    d1 92 4f               ld B, [R_924f|0x924f]
9335:    47 4a 09 20            memcpy 0x0a, [B], [A]
9339:    66 17                  jsys Syscall_17
933b:    00 00                      arg1 = (0x0)
933d:    3a                     clr A, #0
933e:    39                     dec A, #1
933f:    a1 01 3c               st AL, [0x013c]
9342:    7f 45                  pop {X, Y, Z}
9344:    30 41                  inc X, #2
9346:    0f                     rsys

R_9347:
9347:    6b 20                  st X, [0x9369|+0x20]
9349:    65 a1                  ld X, [S++]
934b:    95 48 0b               ld A, [X + 0x0b]
934e:    b1 92 4d               st A, [R_924d|0x924d]
9351:    47 40 02 92 53 80 ae   memcpy 0x03, [R_9253|0x9253], [R_80ae|0x80ae]
9358:    3a                     clr A, #0
9359:    85 48 0a               ld AL, [X + 0x0a]
935c:    5d                     mov B, A
935d:    3d                     sll A, #1
935e:    58                     add B, A
935f:    91 92 4f               ld A, [R_924f|0x924f]
9362:    58                     add B, A
9363:    55 26                  mov Y, B
9365:    79 92 45               call R_9245
9368:    71 00 00               jmp L_0000

R_936b:
936b:    69 94 4a               st X, [R_944a|0x944a]
936e:    65 a1                  ld X, [S++]
9370:    d5 48 0e               ld B, [X + 0x0e]
9373:    f3 6c                  st B, [0x93e1|+0x6c]
9375:    47 48 09 40 94 4c      memcpy 0x0a, [X], [R_944c|0x944c]
937b:    85 48 0d               ld AL, [X + 0x0d]
937e:    a3 46                  st AL, [0x93c6|+0x46]
9380:    7b c5                  call R_9347
9382:    93 21                  ld A, [R_93a5|0x93a5|+0x21]
9384:    15 21                  bnz L_93a7
9386:    c5 68 04               ld BL, [Y + 0x04]
9389:    9b                     ld A, [Y]
938a:    50 10 00 01            add A, A, 0x0001

L_938e:
938e:    21 30                  dec BL, #1
9390:    16 05                  blt L_9397
9392:    36 00                  rrc A, #1
9394:    07                     rl
9395:    73 f7                  jmp L_938e

L_9397:
9397:    38                     inc A, #1
9398:    5d                     mov B, A
9399:    3d                     sll A, #1
939a:    58                     add B, A
939b:    90 00 1b               ld A, 0x001b
939e:    58                     add B, A
939f:    f3 02                  st B, [0x93a3|+0x2]
93a1:    66 16                  jsys Syscall_16
93a3:    00 00                      arg1 = (0x0)

R_93a5:
93a5:    00 00                      out = (0x0)

L_93a7:
93a7:    63 fc                  ld X, [R_93a5|0x93a5|-0x4]
93a9:    93 f8                  ld A, [0x93a3|-0x8]
93ab:    31 02                  dec A, #3
93ad:    50 40                  add A, X
93af:    b3 6c                  st A, [0x941d|+0x6c]
93b1:    9b                     ld A, [Y]
93b2:    b5 41                  st A, [X++]
93b4:    95 68 02               ld A, [Y + 0x02]
93b7:    3d                     sll A, #1
93b8:    07                     rl
93b9:    36 00                  rrc A, #1
93bb:    b5 41                  st A, [X++]
93bd:    85 68 04               ld AL, [Y + 0x04]
93c0:    a5 41                  st AL, [X++]
93c2:    2a                     clr AL, #0
93c3:    a5 41                  st AL, [X++]
93c5:    80 00                  ld AL, 0x00
93c7:    a5 41                  st AL, [X++]
93c9:    91 92 9d               ld A, [R_929d|0x929d]
93cc:    b5 41                  st A, [X++]
93ce:    3a                     clr A, #0
93cf:    b5 41                  st A, [X++]
93d1:    b5 41                  st A, [X++]
93d3:    47 42 09 94 4c 04      memcpy 0x0a, [R_944c|0x944c], [X]
93d9:    30 49                  inc X, #10
93db:    85 68 05               ld AL, [Y + 0x05]
93de:    a5 41                  st AL, [X++]
93e0:    d0 00 00               ld B, 0x0000
93e3:    f5 41                  st B, [X++]
93e5:    3a                     clr A, #0
93e6:    a5 41                  st AL, [X++]
93e8:    90 00 03               ld A, 0x0003
93eb:    50 06                  add Y, A
93ed:    95 68 04               ld A, [Y + 0x04]
93f0:    b0 00 00               st A, 0x0000

L_93f3:
93f3:    90 00 03               ld A, 0x0003
93f6:    50 06                  add Y, A

L_93f8:
93f8:    9b                     ld A, [Y]
93f9:    17 21                  bp L_941c
93fb:    3a                     clr A, #0
93fc:    85 68 02               ld AL, [Y + 0x02]
93ff:    28                     inc AL, #1
9400:    14 3e                  bz L_9440
9402:    29                     dec AL, #1
9403:    5d                     mov B, A
9404:    3d                     sll A, #1
9405:    58                     add B, A
9406:    91 92 4f               ld A, [R_924f|0x924f]
9409:    58                     add B, A
940a:    9b                     ld A, [Y]
940b:    55 26                  mov Y, B
940d:    3b                     not A, #0
940e:    d1 92 4d               ld B, [R_924d|0x924d]
9411:    59                     sub B, A
9412:    14 e4                  bz L_93f8
9414:    b1 92 4d               st A, [R_924d|0x924d]
9417:    79 92 45               call R_9245
941a:    73 dc                  jmp L_93f8

L_941c:
941c:    d0 00 00               ld B, 0x0000
941f:    51 42                  sub B, X
9421:    14 1d                  bz L_9440
9423:    d1 92 00               ld B, [R_9200|0x9200]
9426:    15 09                  bnz L_9431
9428:    b5 41                  st A, [X++]
942a:    c5 68 02               ld BL, [Y + 0x02]
942d:    e5 41                  st BL, [X++]
942f:    73 c2                  jmp L_93f3

L_9431:
9431:    95 68 01               ld A, [Y + 0x01]
9434:    d1 92 00               ld B, [R_9200|0x9200]
9437:    79 cd 67               call R_cd67
943a:    a5 41                  st AL, [X++]
943c:    f5 41                  st B, [X++]
943e:    73 b3                  jmp L_93f3

L_9440:
9440:    3a                     clr A, #0
9441:    39                     dec A, #1
9442:    b5 41                  st A, [X++]
9444:    a5 41                  st AL, [X++]
9446:    68 00 00               st X, 0x0000
9449:    71 00 00               jmp L_0000

R_944c:
944c:    <null bytes>


Syscall_4d:
9456:    7b 48                  call L_94a0
9458:    14 16                  bz L_9470
945a:    d4 26                  ld B, @[0x9482|+0x26]
945c:    c5 28 01               ld BL, [B + 0x01]
945f:    85 08 fe               ld AL, [A + -0x2]
9462:    49                     sub BL, AL
9463:    15 08                  bnz L_946d
9465:    d4 1b                  ld B, @[0x9482|+0x1b]
9467:    89                     ld AL, [B]
9468:    c0 08                  ld BL, 0x08
946a:    4a                     and BL, AL
946b:    14 2a                  bz L_9497

L_946d:
946d:    80 01                  ld AL, 0x01
946f:    0f                     rsys

L_9470:
9470:    91 01 20               ld A, [0x0120]
9473:    31 02                  dec A, #3
9475:    5d                     mov B, A

L_9476:
9476:    90 00 03               ld A, 0x0003
9479:    58                     add B, A
947a:    95 21                  ld A, [B++]
947c:    17 f8                  bp L_9476
947e:    3b                     not A, #0
947f:    15 ec                  bnz L_946d
9481:    91 01 03               ld A, [CurrentProcess|0x0103]
9484:    95 08 01               ld A, [A + 0x01]
9487:    83 18                  ld AL, [0x94a1|+0x18]
9489:    b5 22                  st A, [--B]
948b:    83 45                  ld AL, [0x94d2|+0x45]
948d:    a5 28 02               st AL, [B + 0x02]
9490:    93 41                  ld A, [0x94d3|+0x41]
9492:    b5 28 03               st A, [B + 0x03]
9495:    2a                     clr AL, #0
9496:    0f                     rsys

L_9497:
9497:    95 a8 0f               ld A, [S + 0x0f]
949a:    d5 a8 12               ld B, [S + 0x12]
949d:    66 09                  jsys Syscall_Abort
949f:    0e                         abort_code = (0xe)

L_94a0:
94a0:    a0 00                  st AL, 0x00
94a2:    b3 2e                  st A, [0x94d2|+0x2e]
94a4:    f3 2d                  st B, [0x94d3|+0x2d]
94a6:    6d a2                  st X, [--S]
94a8:    61 01 20               ld X, [0x0120]
94ab:    73 02                  jmp L_94af

L_94ad:
94ad:    30 42                  inc X, #3

L_94af:
94af:    95 41                  ld A, [X++]
94b1:    17 07                  bp L_94ba
94b3:    3b                     not A, #0
94b4:    14 f7                  bz L_94ad
94b6:    65 a1                  ld X, [S++]
94b8:    3a                     clr A, #0
94b9:    09                     ret

L_94ba:
94ba:    c3 e5                  ld BL, [0x94a1|-0x1b]
94bc:    49                     sub BL, AL
94bd:    15 ee                  bnz L_94ad
94bf:    83 11                  ld AL, [0x94d2|+0x11]
94c1:    ca                     ld BL, [X]
94c2:    49                     sub BL, AL
94c3:    15 e8                  bnz L_94ad
94c5:    93 0c                  ld A, [0x94d3|+0xc]
94c7:    d5 48 01               ld B, [X + 0x01]
94ca:    59                     sub B, A
94cb:    15 e0                  bnz L_94ad
94cd:    55 40                  mov A, X
94cf:    65 a1                  ld X, [S++]
94d1:    09                     ret
94d2:    00
94d3:    00
94d4:    00

Syscall_4e:
94d5:    7b c9                  call L_94a0
94d7:    14 be                  bz L_9497
94d9:    b5 a2                  st A, [--S]
94db:    91 01 03               ld A, [CurrentProcess|0x0103]
94de:    d5 08 01               ld B, [A + 0x01]
94e1:    95 a1                  ld A, [S++]
94e3:    c5 08 fe               ld BL, [A + -0x2]
94e6:    41 23                  sub BL, BH
94e8:    15 ad                  bnz L_9497
94ea:    d0 ff ff               ld B, 0xffff
94ed:    f5 02                  st B, [--A]
94ef:    2a                     clr AL, #0
94f0:    0f                     rsys

Syscall_49:
94f1:    79 95 92               call R_9592
94f4:    46 77 59 20 00 29      unkbig5(7, 7) [B], [A + 0x29]
94fa:    12 70                  bn R_956c
94fc:    0f                     rsys

Syscall_41:
94fd:    79 95 92               call R_9592
9500:    46 57 59 20 00 29      unkbig5(5, 7) [B], [A + 0x29]
9506:    12 64                  bn R_956c
9508:    0f                     rsys

Syscall_24:
9509:    79 95 a0               call R_95a0
950c:    46 37 59 20 00 29      unkbig5(3, 7) [B], [A + 0x29]
9512:    12 58                  bn R_956c
9514:    0f                     rsys

Syscall_4a:
9515:    7b 7b                  call R_9592
9517:    5c                     mov Y, A
9518:    90 95 c3               ld A, R_95c3|0x95c3
951b:    46 77 79 20 60 29      unkbig7(7, 7) [B], [Y + 0x29]
9521:    12 49                  bn R_956c
9523:    55 67 95 c9            mov Y, [R_95c9|0x95c9]
9527:    0f                     rsys

Syscall_42:
9528:    7b 68                  call R_9592
952a:    5c                     mov Y, A
952b:    93 ec                  ld A, [0x9519|-0x14]
952d:    46 57 79 20 60 29      unkbig7(5, 7) [B], [Y + 0x29]
9533:    12 37                  bn R_956c
9535:    55 67 95 c7            mov Y, [R_95c7|0x95c7]
9539:    0f                     rsys

Syscall_25:
953a:    7b 64                  call R_95a0
953c:    5c                     mov Y, A
953d:    93 da                  ld A, [0x9519|-0x26]
953f:    46 37 79 20 60 29      unkbig7(3, 7) [B], [Y + 0x29]
9545:    12 25                  bn R_956c
9547:    55 67 95 c5            mov Y, [R_95c5|0x95c5]
954b:    0f                     rsys

Syscall_47:
954c:    7b 44                  call R_9592
954e:    46 77 09 20 00 29      addbig(7, 7) [B], [A + 0x29]
9554:    12 16                  bn R_956c
9556:    0f                     rsys

Syscall_3d:
9557:    7b 39                  call R_9592
9559:    46 57 09 20 00 29      addbig(5, 7) [B], [A + 0x29]
955f:    12 0b                  bn R_956c
9561:    0f                     rsys

Syscall_20:
9562:    7b 3c                  call R_95a0
9564:    46 37 09 20 00 29      addbig(3, 7) [B], [A + 0x29]
956a:    13 04                  bnn L_9570

R_956c:
956c:    79 99 21               call R_9921
956f:    02                     sf

L_9570:
9570:    0f                     rsys

Syscall_48:
9571:    7b 1f                  call R_9592
9573:    46 77 19 20 00 29      subbig(7, 7) [B], [A + 0x29]
9579:    12 f1                  bn R_956c
957b:    0f                     rsys

Syscall_3f:
957c:    7b 14                  call R_9592
957e:    46 57 19 20 00 29      subbig(5, 7) [B], [A + 0x29]
9584:    12 e6                  bn R_956c
9586:    0f                     rsys

Syscall_22:
9587:    7b 17                  call R_95a0
9589:    46 37 19 20 00 29      subbig(3, 7) [B], [A + 0x29]
958f:    12 db                  bn R_956c
9591:    0f                     rsys

R_9592:
9592:    6b 0a                  st X, [0x959e|+0xa]
9594:    65 a1                  ld X, [S++]
9596:    79 b2 cb               call R_b2cb
9599:    5d                     mov B, A
959a:    91 01 03               ld A, [CurrentProcess|0x0103]
959d:    71 00 00               jmp L_0000

R_95a0:
95a0:    6b 1f                  st X, [0x95c1|+0x1f]
95a2:    65 a1                  ld X, [S++]
95a4:    9a                     ld A, [X]
95a5:    5d                     mov B, A
95a6:    45 00                  mov AH, AH
95a8:    14 04                  bz L_95ae
95aa:    20 00                  inc AH, #1
95ac:    15 0d                  bnz L_95bb

L_95ae:
95ae:    46 13 38 40 95 c3      unkbig3(1, 3) [X], [R_95c3|0x95c3]
95b4:    d0 95 c3               ld B, R_95c3|0x95c3
95b7:    30 41                  inc X, #2
95b9:    73 02                  jmp L_95bd

L_95bb:
95bb:    7c da                  call @[0x9597|-0x26]

L_95bd:
95bd:    91 01 03               ld A, [CurrentProcess|0x0103]
95c0:    71 00 00               jmp L_0000

R_95c3:
95c3:    00                     HALT
95c4:    00                     HALT

R_95c5:
95c5:    00                     HALT
95c6:    00                     HALT

R_95c7:
95c7:    00                     HALT
95c8:    00                     HALT

R_95c9:
95c9:    00                     HALT
95ca:    00                     HALT

Syscall_45:
95cb:    7b c5                  call R_9592
95cd:    46 77 39 20 00 29      unkbig3(7, 7) [B], [A + 0x29]
95d3:    0f                     rsys

Syscall_3b:
95d4:    79 99 21               call R_9921
95d7:    00                     HALT
95d8:    7b b8                  call R_9592
95da:    46 57 39 20 00 29      unkbig3(5, 7) [B], [A + 0x29]
95e0:    0f                     rsys

Syscall_1e:
95e1:    79 99 21               call R_9921
95e4:    00                     HALT
95e5:    7b b9                  call R_95a0
95e7:    46 37 39 20 00 29      unkbig3(3, 7) [B], [A + 0x29]
95ed:    0f                     rsys

Syscall_46:
95ee:    7b a2                  call R_9592
95f0:    46 77 36 00 29 02      unkbig3(7, 7) [A + 0x29], [B]
95f6:    0f                     rsys

Syscall_3c:
95f7:    7b 99                  call R_9592
95f9:    46 75 36 00 29 02      unkbig3(7, 5) [A + 0x29], [B]
95ff:    13 03                  bnn L_9604

L_9601:
9601:    71 95 6c               jmp R_956c

L_9604:
9604:    0f                     rsys

Syscall_1f:
9605:    7b 8b                  call R_9592
9607:    46 73 36 00 29 02      unkbig3(7, 3) [A + 0x29], [B]
960d:    12 f2                  bn L_9601
960f:    0f                     rsys

Syscall_43:
9610:    7e 81                  push {Z}
9612:    7c 6a                  call @[0x967e|+0x6a]
9614:    5d                     mov B, A
9615:    9a                     ld A, [X]
9616:    5c                     mov Y, A
9617:    45 00                  mov AH, AH
9619:    14 04                  bz L_961f
961b:    20 00                  inc AH, #1
961d:    15 0e                  bnz L_962d

L_961f:
961f:    46 15 38 40 95 c3      unkbig3(1, 5) [X], [R_95c3|0x95c3]
9625:    90 95 c3               ld A, R_95c3|0x95c3
9628:    5c                     mov Y, A
9629:    30 41                  inc X, #2
962b:    73 02                  jmp L_962f

L_962d:
962d:    7c 4f                  call @[0x967e|+0x4f]

L_962f:
962f:    46 55 2a 26            unkbig2(5, 5) [B], [Y]
9633:    73 23                  jmp L_9658

Syscall_26:
9635:    7e 81                  push {Z}
9637:    7c 45                  call @[0x967e|+0x45]
9639:    5d                     mov B, A
963a:    9a                     ld A, [X]
963b:    5c                     mov Y, A
963c:    45 00                  mov AH, AH
963e:    14 04                  bz L_9644
9640:    20 00                  inc AH, #1
9642:    15 0e                  bnz L_9652

L_9644:
9644:    46 13 38 40 95 c3      unkbig3(1, 3) [X], [R_95c3|0x95c3]
964a:    90 95 c3               ld A, R_95c3|0x95c3
964d:    5c                     mov Y, A
964e:    30 41                  inc X, #2
9650:    73 02                  jmp L_9654

L_9652:
9652:    7c 2a                  call @[0x967e|+0x2a]

L_9654:
9654:    46 33 2a 26            unkbig2(3, 3) [B], [Y]

L_9658:
9658:    14 06                  bz L_9660
965a:    17 08                  bp L_9664

L_965c:
965c:    c0 04                  ld BL, 0x04
965e:    73 06                  jmp L_9666

L_9660:
9660:    c0 01                  ld BL, 0x01
9662:    73 02                  jmp L_9666

L_9664:
9664:    c0 02                  ld BL, 0x02

L_9666:
9666:    45 32                  mov BH, BL
9668:    95 41                  ld A, [X++]
966a:    c5 41                  ld BL, [X++]
966c:    42 23                  and BL, BH
966e:    14 01                  bz L_9671
9670:    5b                     mov X, A

L_9671:
9671:    7f 81                  pop {Z}
9673:    0f                     rsys

Syscall_27:
9674:    79 99 21               call R_9921
9677:    00                     HALT
9678:    7e 81                  push {Z}
967a:    7c 02                  call @[0x967e|+0x2]
967c:    5d                     mov B, A
967d:    79 b2 cb               call R_b2cb
9680:    47 1a 00 20            unkblk1 0x01, [B], [A]
9684:    13 0a                  bnn L_9690
9686:    6f 96 96               stcc [0x9696]
9689:    79 99 21               call R_9921
968c:    02                     sf
968d:    6e                     unknown
968e:    96                     unknown
968f:    96                     unknown

L_9690:
9690:    14 ce                  bz L_9660
9692:    16 c8                  blt L_965c
9694:    73 ce                  jmp L_9664

R_9696:
9696:    00                     HALT

Syscall_44:
9697:    80 04                  ld AL, 0x04
9699:    a3 14                  st AL, [0x96af|+0x14]
969b:    73 04                  jmp L_96a1

Syscall_28:
969d:    80 02                  ld AL, 0x02
969f:    a3 0e                  st AL, [0x96af|+0xe]

L_96a1:
96a1:    7e 81                  push {Z}
96a3:    55 46                  mov Y, X
96a5:    95 41                  ld A, [X++]
96a7:    5d                     mov B, A
96a8:    3d                     sll A, #1
96a9:    50 04                  add X, A
96ab:    95 41                  ld A, [X++]
96ad:    95 08 02               ld A, [A + 0x02]
96b0:    19 0a                  ble L_96bc
96b2:    59                     sub B, A
96b3:    18 07                  bgt L_96bc
96b5:    3d                     sll A, #1
96b6:    50 06                  add Y, A
96b8:    9b                     ld A, [Y]
96b9:    14 01                  bz L_96bc
96bb:    5b                     mov X, A

L_96bc:
96bc:    7f 81                  pop {Z}
96be:    0f                     rsys

Syscall_29:
96bf:    7e 81                  push {Z}
96c1:    7c bb                  call @[0x967e|-0x45]
96c3:    5e                     mov Z, A

L_96c4:
96c4:    95 41                  ld A, [X++]
96c6:    15 03                  bnz L_96cb
96c8:    7f 81                  pop {Z}
96ca:    0f                     rsys

L_96cb:
96cb:    79 b2 d1               call AssertIsSystemPtr
96ce:    47 2a ff 00 08         memchr 0x100, 0x00, [A], [Z]
96d3:    73 ef                  jmp L_96c4

Syscall_32:
96d5:    95 41                  ld A, [X++]
96d7:    31 03                  dec A, #4
96d9:    32 20                  clr B, #0
96db:    73 07                  jmp L_96e4

Syscall_34:
96dd:    79 b2 cb               call R_b2cb
96e0:    5d                     mov B, A
96e1:    79 99 2f               call R_992f

L_96e4:
96e4:    7e 63                  push {Y, Z}
96e6:    79 98 f7               call R_98f7
96e9:    01                     nop
96ea:    15 24                  bnz L_9710
96ec:    95 41                  ld A, [X++]
96ee:    79 99 53               call R_9953

R_96f1:
96f1:    95 41                  ld A, [X++]
96f3:    b1 97 b4               st A, [R_97b4|0x97b4]
96f6:    5e                     mov Z, A
96f7:    14 1b                  bz L_9714
96f9:    79 b2 d1               call AssertIsSystemPtr

L_96fc:
96fc:    79 9a f2               call R_9af2
96ff:    01                     nop
9700:    97                     unknown
9701:    17 02                  bp L_9705
9703:    97                     unknown
9704:    23

L_9705:
9705:    03                     rf
9706:    97                     unknown
9707:    41 08                  sub ZH, AH
9709:    97                     unknown
970a:    41 00                  sub AH, AH

L_970c:
970c:    79 99 21               call R_9921
970f:    02                     sf

L_9710:
9710:    95 41                  ld A, [X++]
9712:    15 fc                  bnz L_9710

L_9714:
9714:    71 98 f4               jmp R_98f4

R_9717:
9717:    39                     dec A, #1
9718:    16 e2                  blt L_96fc
971a:    67 2a 66 55            memchr A, 0x66, [X], [X]
971e:    89                     ld AL, [B]
971f:    97                     unknown
9720:    b4 73                  st A, @[0x9795|+0x73]
9722:    d9                     ld B, [B]

R_9723:
9723:    39                     dec A, #1
9724:    16 d6                  blt L_96fc
9726:    55 82                  mov B, Z
9728:    67 2a 68 12            memchr A, 0x68, [A], [B]
972c:    0c                     unknown
972d:    51 82                  sub B, Z
972f:    59                     sub B, A
9730:    55 20                  mov A, B
9732:    67 9e a0 08            memset A, 0xa0, [Z]
9736:    38                     inc A, #1
9737:    50 08                  add Z, A
9739:    2a                     clr AL, #0
973a:    ac                     st AL, [Z]
973b:    73 b4                  jmp R_96f1

R_973d:
973d:    65 a1                  ld X, [S++]
973f:    73 cb                  jmp L_970c

R_9741:
9741:    6d a2                  st X, [--S]
9743:    5b                     mov X, A
9744:    e1 97 bf               st BL, [R_97bf|0x97bf]
9747:    55 98 97 e0            mov Z, R_97e0|0x97e0
974b:    47 9e 0e a0 08         memset 0x0f, 0xa0, [Z]
9750:    2a                     clr AL, #0
9751:    a5 88 0f               st AL, [Z + 0x0f]

L_9754:
9754:    3f                     dec X
9755:    16 4a                  blt L_97a1
9757:    85 61                  ld AL, [Y++]
9759:    14 44                  bz L_979f
975b:    c0 a0                  ld BL, 0xa0
975d:    49                     sub BL, AL
975e:    14 f4                  bz L_9754
9760:    79 97 f6               call R_97f6
9763:    15 ef                  bnz L_9754

L_9765:
9765:    c0 ae                  ld BL, 0xae
9767:    49                     sub BL, AL
9768:    15 0e                  bnz L_9778
976a:    3a                     clr A, #0
976b:    46 01 30 9a 47 97 a2   unkbig3(0, 1) [R_9a47|0x9a47], [R_97a2|0x97a2]
9772:    30 10 97 a2            inc [R_97a2|0x97a2], #1
9776:    73 20                  jmp L_9798

L_9778:
9778:    79 97 f6               call R_97f6
977b:    14 06                  bz L_9783
977d:    85 61                  ld AL, [Y++]
977f:    14 1e                  bz L_979f

L_9781:
9781:    73 ba                  jmp R_973d

L_9783:
9783:    c0 b0                  ld BL, 0xb0
9785:    49                     sub BL, AL
9786:    11 b5                  bnc R_973d
9788:    c0 ba                  ld BL, 0xba
978a:    49                     sub BL, AL
978b:    10 b0                  bc R_973d
978d:    31 10 97 a2            dec [R_97a2|0x97a2], #1
9791:    14 0e                  bz L_97a1
9793:    cc                     ld BL, [Z]
9794:    14 a7                  bz R_973d
9796:    a5 81                  st AL, [Z++]

L_9798:
9798:    3f                     dec X
9799:    16 06                  blt L_97a1
979b:    85 61                  ld AL, [Y++]
979d:    15 c6                  bnz L_9765

L_979f:
979f:    31 60                  dec Y, #1

L_97a1:
97a1:    90 00 00               ld A, 0x0000
97a4:    19 04                  ble L_97aa
97a6:    80 b0                  ld AL, 0xb0
97a8:    73 d9                  jmp L_9783

L_97aa:
97aa:    90 97 e0               ld A, R_97e0|0x97e0
97ad:    51 80                  sub A, Z
97af:    c0 00                  ld BL, 0x00
97b1:    14 15                  bz L_97c8
97b3:    d0 'P'

R_97b4:
97b4:    00                     HALT
97b5:    00                     HALT
97b6:    46 83 82 97 e0 02      unkbig8(8, 3) [R_97e0|0x97e0], [B]
97bc:    12 c3                  bn L_9781
97be:    80 00                  ld AL, 0x00
97c0:    19 18                  ble L_97da
97c2:    46 33 4a 22            unkbig4(3, 3) [B], [B]
97c6:    73 12                  jmp L_97da

L_97c8:
97c8:    d3 ea                  ld B, [R_97b4|0x97b4|-0x16]
97ca:    46 85 82 97 e0 02      unkbig8(8, 5) [R_97e0|0x97e0], [B]
97d0:    12 af                  bn L_9781
97d2:    83 eb                  ld AL, [R_97bf|0x97bf|-0x15]
97d4:    19 04                  ble L_97da
97d6:    46 55 4a 22            unkbig4(5, 5) [B], [B]

L_97da:
97da:    65 a1                  ld X, [S++]
97dc:    71 96 f1               jmp R_96f1
97df:    a0 ' '

R_97e0:
97e0:    <null bytes>


R_97f0:
97f0:    00                     HALT
97f1:    00                     HALT
97f2:    00                     HALT
97f3:    00                     HALT
97f4:    00                     HALT
97f5:    00                     HALT

R_97f6:
97f6:    c0 ad                  ld BL, 0xad
97f8:    49                     sub BL, AL
97f9:    14 08                  bz L_9803
97fb:    c0 ab                  ld BL, 0xab
97fd:    49                     sub BL, AL
97fe:    14 03                  bz L_9803
9800:    32 20                  clr B, #0
9802:    09                     ret

L_9803:
9803:    c0 ac                  ld BL, 0xac
9805:    49                     sub BL, AL
9806:    83 b7                  ld AL, [R_97bf|0x97bf|-0x49]
9808:    15 03                  bnz L_980d
980a:    e3 b3                  st BL, [R_97bf|0x97bf|-0x4d]
980c:    09                     ret

L_980d:
980d:    65 a1                  ld X, [S++]
980f:    71 97 3d               jmp R_973d

Syscall_2a:
9812:    7e 63                  push {Y, Z}
9814:    79 99 2f               call R_992f
9817:    b5 a2                  st A, [--S]
9819:    30 01                  inc A, #2
981b:    5c                     mov Y, A
981c:    90 00 04               ld A, 0x0004
981f:    b5 61                  st A, [Y++]
9821:    90 9b b1               ld A, 0x9bb1
9824:    b5 61                  st A, [Y++]
9826:    79 b2 cb               call R_b2cb
9829:    5d                     mov B, A
982a:    95 41                  ld A, [X++]
982c:    45 00                  mov AH, AH
982e:    14 03                  bz L_9833
9830:    95 08 02               ld A, [A + 0x02]

L_9833:
9833:    a5 61                  st AL, [Y++]
9835:    95 41                  ld A, [X++]
9837:    45 00                  mov AH, AH
9839:    14 03                  bz L_983e
983b:    95 08 02               ld A, [A + 0x02]

L_983e:
983e:    ab                     st AL, [Y]
983f:    95 a1                  ld A, [S++]
9841:    79 98 f7               call R_98f7
9844:    02                     sf
9845:    71 98 f4               jmp R_98f4

Syscall_30:
9848:    80 01                  ld AL, 0x01
984a:    73 01                  jmp L_984d

Syscall_2f:
984c:    2a                     clr AL, #0

L_984d:
984d:    a3 1e                  st AL, [0x986d|+0x1e]
984f:    7e 63                  push {Y, Z}
9851:    79 99 2f               call R_992f
9854:    5c                     mov Y, A
9855:    79 b2 cb               call R_b2cb
9858:    b5 a2                  st A, [--S]
985a:    95 41                  ld A, [X++]
985c:    45 00                  mov AH, AH
985e:    14 03                  bz L_9863
9860:    95 08 02               ld A, [A + 0x02]

L_9863:
9863:    db                     ld B, [Y]
9864:    59                     sub B, A
9865:    19 01                  ble L_9868
9867:    9b                     ld A, [Y]

L_9868:
9868:    30 61                  inc Y, #2
986a:    b5 61                  st A, [Y++]
986c:    c0 00                  ld BL, 0x00
986e:    15 22                  bnz L_9892
9870:    c0 a0                  ld BL, 0xa0

L_9872:
9872:    39                     dec A, #1
9873:    16 04                  blt L_9879
9875:    e5 61                  st BL, [Y++]
9877:    73 f9                  jmp L_9872

L_9879:
9879:    7b 1c                  call L_9897
987b:    79 99 2f               call R_992f
987e:    30 01                  inc A, #2
9880:    5c                     mov Y, A
9881:    95 61                  ld A, [Y++]
9883:    c0 88                  ld BL, 0x88

L_9885:
9885:    39                     dec A, #1
9886:    16 04                  blt L_988c
9888:    e5 61                  st BL, [Y++]
988a:    73 f9                  jmp L_9885

L_988c:
988c:    7b 09                  call L_9897
988e:    95 a1                  ld A, [S++]
9890:    73 62                  jmp R_98f4

L_9892:
9892:    d5 41                  ld B, [X++]
9894:    c9                     ld BL, [B]
9895:    73 db                  jmp L_9872

L_9897:
9897:    79 99 2f               call R_992f
989a:    d5 a8 02               ld B, [S + 0x02]
989d:    79 98 f7               call R_98f7
98a0:    02                     sf
98a1:    09                     ret

Syscall_39:
98a2:    85 41                  ld AL, [X++]
98a4:    14 15                  bz L_98bb
98a6:    a5 a2                  st AL, [--S]
98a8:    79 b2 cb               call R_b2cb
98ab:    5d                     mov B, A
98ac:    85 a1                  ld AL, [S++]
98ae:    a5 28 02               st AL, [B + 0x02]
98b1:    80 09                  ld AL, 0x09
98b3:    a5 28 03               st AL, [B + 0x03]
98b6:    79 9b 8e               call R_9b8e
98b9:    73 e7                  jmp Syscall_39

L_98bb:
98bb:    0f                     rsys

Syscall_3a:
98bc:    85 41                  ld AL, [X++]
98be:    a5 a2                  st AL, [--S]
98c0:    9a                     ld A, [X]
98c1:    79 b2 d1               call AssertIsSystemPtr
98c4:    5d                     mov B, A
98c5:    85 a1                  ld AL, [S++]
98c7:    a5 28 03               st AL, [B + 0x03]
98ca:    79 9b 8e               call R_9b8e
98cd:    d5 41                  ld B, [X++]
98cf:    89                     ld AL, [B]
98d0:    7b 51                  call R_9923
98d2:    0f                     rsys

Syscall_37:
98d3:    7e 63                  push {Y, Z}
98d5:    79 b2 cb               call R_b2cb
98d8:    5d                     mov B, A
98d9:    79 b2 cb               call R_b2cb
98dc:    7b 19                  call R_98f7
98de:    01                     nop
98df:    73 13                  jmp R_98f4

Syscall_38:
98e1:    7e 63                  push {Y, Z}
98e3:    79 b2 cb               call R_b2cb
98e6:    b5 a2                  st A, [--S]
98e8:    79 b2 cb               call R_b2cb
98eb:    d8                     ld B, [A]
98ec:    f5 08 02               st B, [A + 0x02]
98ef:    d5 a1                  ld B, [S++]
98f1:    7b 04                  call R_98f7
98f3:    02                     sf

R_98f4:
98f4:    7f 63                  pop {Y, Z}
98f6:    0f                     rsys

R_98f7:
98f7:    5c                     mov Y, A
98f8:    95 61                  ld A, [Y++]
98fa:    55 28                  mov Z, B
98fc:    15 06                  bnz L_9904
98fe:    95 61                  ld A, [Y++]
9900:    3e                     inc X
9901:    2a                     clr AL, #0
9902:    73 1a                  jmp L_991e

L_9904:
9904:    b5 28 0e               st A, [B + 0x0e]
9907:    55 60                  mov A, Y
9909:    b5 28 10               st A, [B + 0x10]
990c:    30 01                  inc A, #2
990e:    5c                     mov Y, A
990f:    85 41                  ld AL, [X++]
9911:    a5 28 03               st AL, [B + 0x03]
9914:    79 9b 8e               call R_9b8e
9917:    3a                     clr A, #0
9918:    8c                     ld AL, [Z]
9919:    d0 9b 84               ld B, R_9b84|0x9b84
991c:    58                     add B, A
991d:    89                     ld AL, [B]

L_991e:
991e:    7b 03                  call R_9923
9920:    09                     ret

R_9921:
9921:    85 41                  ld AL, [X++]

R_9923:
9923:    d1 01 03               ld B, [CurrentProcess|0x0103]
9926:    d5 28 19               ld B, [B + 0x19]
9929:    14 03                  bz L_992e
992b:    a5 28 06               st AL, [B + 0x06]

L_992e:
992e:    09                     ret

R_992f:
992f:    91 01 03               ld A, [CurrentProcess|0x0103]
9932:    95 08 19               ld A, [A + 0x19]
9935:    b5 a2                  st A, [--S]
9937:    51 10 7f ff            sub A, A, 0x7fff
993b:    10 0e                  bc L_994b
993d:    95 a1                  ld A, [S++]
993f:    98                     ld A, [A]
9940:    b5 a2                  st A, [--S]
9942:    51 10 7f ff            sub A, A, 0x7fff
9946:    10 03                  bc L_994b
9948:    95 a1                  ld A, [S++]
994a:    09                     ret

L_994b:
994b:    95 a1                  ld A, [S++]
994d:    95 a1                  ld A, [S++]
994f:    79 84 e4               call Syscall_Abort
9952:    17                         abort_code = (0x17)

R_9953:
9953:    b1 9a dd               st A, [R_9add|0x9add]
9956:    b1 9b 08               st A, [R_9b08|0x9b08]
9959:    3a                     clr A, #0
995a:    b1 9b 6a               st A, [R_9b6a|0x9b6a]
995d:    09                     ret

Syscall_33:
995e:    7e 63                  push {Y, Z}
9960:    3a                     clr A, #0
9961:    a5 a2                  st AL, [--S]
9963:    b5 a2                  st A, [--S]
9965:    79 b2 cb               call R_b2cb
9968:    5c                     mov Y, A
9969:    73 37                  jmp L_99a2

Syscall_36:
996b:    80 03                  ld AL, 0x03
996d:    73 1b                  jmp L_998a

Syscall_31:
996f:    9a                     ld A, [X]
9970:    79 b2 d1               call AssertIsSystemPtr
9973:    5d                     mov B, A
9974:    79 8a a6               call LookupDeviceInstance
9977:    c5 08 01               ld BL, [A + 0x01]
997a:    80 03                  ld AL, 0x03
997c:    49                     sub BL, AL
997d:    16 05                  blt Syscall_35
997f:    2a                     clr AL, #0
9980:    a3 5a                  st AL, [0x99dc|+0x5a]
9982:    73 04                  jmp L_9988

Syscall_35:
9984:    80 01                  ld AL, 0x01
9986:    a3 54                  st AL, [0x99dc|+0x54]

L_9988:
9988:    80 02                  ld AL, 0x02

L_998a:
998a:    7e 63                  push {Y, Z}
998c:    a5 a2                  st AL, [--S]
998e:    79 b2 cb               call R_b2cb
9991:    5d                     mov B, A
9992:    f5 a2                  st B, [--S]
9994:    7b 99                  call R_992f
9996:    5c                     mov Y, A
9997:    95 61                  ld A, [Y++]
9999:    b5 61                  st A, [Y++]
999b:    55 68                  mov Z, Y
999d:    39                     dec A, #1
999e:    67 9e a0 08            memset A, 0xa0, [Z]

L_99a2:
99a2:    95 41                  ld A, [X++]
99a4:    7b ad                  call R_9953

R_99a6:
99a6:    95 41                  ld A, [X++]
99a8:    b1 97 b4               st A, [R_97b4|0x97b4]
99ab:    5e                     mov Z, A
99ac:    14 05                  bz L_99b3
99ae:    79 b2 d1               call AssertIsSystemPtr
99b1:    73 4a                  jmp L_99fd

L_99b3:
99b3:    a3 35                  st AL, [0x99ea|+0x35]

L_99b5:
99b5:    85 a8 02               ld AL, [S + 0x02]
99b8:    14 2a                  bz L_99e4
99ba:    79 99 2f               call R_992f
99bd:    5c                     mov Y, A
99be:    95 61                  ld A, [Y++]
99c0:    55 68                  mov Z, Y
99c2:    95 61                  ld A, [Y++]
99c4:    50 06                  add Y, A
99c6:    d0 a0 a0               ld B, 0xa0a0

L_99c9:
99c9:    39                     dec A, #1
99ca:    19 08                  ble L_99d4
99cc:    c5 62                  ld BL, [--Y]
99ce:    41 23                  sub BL, BH
99d0:    14 f7                  bz L_99c9
99d2:    30 60                  inc Y, #1

L_99d4:
99d4:    c0 00                  ld BL, 0x00
99d6:    eb                     st BL, [Y]
99d7:    38                     inc A, #1
99d8:    dd                     ld B, [S]
99d9:    14 08                  bz L_99e3
99db:    c0 00                  ld BL, 0x00
99dd:    14 04                  bz L_99e3
99df:    c0 8d                  ld BL, 0x8d
99e1:    eb                     st BL, [Y]
99e2:    38                     inc A, #1

L_99e3:
99e3:    bc                     st A, [Z]

L_99e4:
99e4:    d5 a1                  ld B, [S++]
99e6:    8d                     ld AL, [S]
99e7:    a3 09                  st AL, [0x99f2|+0x9]
99e9:    80 00                  ld AL, 0x00
99eb:    ad                     st AL, [S]
99ec:    79 99 2f               call R_992f
99ef:    79 98 f7               call R_98f7
99f2:    00                     HALT
99f3:    85 a1                  ld AL, [S++]
99f5:    14 03                  bz L_99fa
99f7:    79 99 23               call R_9923

L_99fa:
99fa:    71 98 f4               jmp R_98f4

L_99fd:
99fd:    79 9a f2               call R_9af2
9a00:    01                     nop
9a01:    9a                     ld A, [X]
9a02:    1d 02                  bs4 L_9a06
9a04:    9a                     ld A, [X]
9a05:    21

L_9a06:
9a06:    03                     rf
9a07:    9a                     ld A, [X]
9a08:    46 04 9a 44            baseconv(0, 4) [X], [X]
9a0c:    05                     di
9a0d:    9a                     ld A, [X]
9a0e:    40 08                  add ZH, AH
9a10:    9a                     ld A, [X]
9a11:    48                     add BL, AL
9a12:    00                     HALT
9a13:    80 02                  ld AL, 0x02
9a15:    a3 d3                  st AL, [0x99ea|-0x2d]

L_9a17:
9a17:    95 41                  ld A, [X++]
9a19:    15 fc                  bnz L_9a17
9a1b:    73 98                  jmp L_99b5

R_9a1d:
9a1d:    50 06                  add Y, A
9a1f:    73 dc                  jmp L_99fd

R_9a21:
9a21:    39                     dec A, #1
9a22:    55 62                  mov B, Y
9a24:    67 2a 86 6f            memchr A, 0x86, [Y], [P]
9a28:    97                     unknown
9a29:    e0 55                  st BL, 0x55
9a2b:    86                     unknown
9a2c:    6e                     unknown
9a2d:    97                     unknown
9a2e:    e0 12                  st BL, 0x12
9a30:    0c                     unknown
9a31:    51 62                  sub B, Y
9a33:    59                     sub B, A
9a34:    55 20                  mov A, B
9a36:    67 9e a0 06            memset A, 0xa0, [Y]
9a3a:    38                     inc A, #1
9a3b:    50 06                  add Y, A
9a3d:    71 99 a6               jmp R_99a6

R_9a40:
9a40:    c0 01                  ld BL, 0x01
9a42:    e0 00                  st BL, 0x00

R_9a44:
9a44:    c0 02                  ld BL, 0x02

R_9a46:
9a46:    e0 '`'

R_9a47:
9a47:    00                     HALT

R_9a48:
9a48:    5d                     mov B, A
9a49:    50 62                  add B, Y
9a4b:    f5 a2                  st B, [--S]
9a4d:    b5 a2                  st A, [--S]
9a4f:    39                     dec A, #1
9a50:    c0 00                  ld BL, 0x00
9a52:    14 08                  bz L_9a5c
9a54:    46 35 38 80 97 f0      unkbig3(3, 5) [Z], [R_97f0|0x97f0]
9a5a:    73 06                  jmp L_9a62

L_9a5c:
9a5c:    46 55 38 80 97 f0      unkbig3(5, 5) [Z], [R_97f0|0x97f0]

L_9a62:
9a62:    c3 df                  ld BL, [R_9a43|0x9a43|-0x21]
9a64:    14 1a                  bz L_9a80
9a66:    31 b0 00 00            dec [S + 0x0000], #1
9a6a:    c0 a0                  ld BL, 0xa0
9a6c:    46 00 3a 88            unkbig3(0, 0) [Z], [Z]
9a70:    17 09                  bp L_9a7b
9a72:    c0 ad                  ld BL, 0xad
9a74:    46 55 40 97 f0 97 f0   unkbig4(5, 5) [R_97f0|0x97f0], [R_97f0|0x97f0]

L_9a7b:
9a7b:    50 60                  add A, Y
9a7d:    e8                     st BL, [A]
9a7e:    73 12                  jmp L_9a92

L_9a80:
9a80:    cc                     ld BL, [Z]
9a81:    17 0f                  bp L_9a92
9a83:    c0 ad                  ld BL, 0xad
9a85:    e5 61                  st BL, [Y++]
9a87:    46 55 40 97 f0 97 f0   unkbig4(5, 5) [R_97f0|0x97f0], [R_97f0|0x97f0]
9a8e:    31 b0 00 00            dec [S + 0x0000], #1

L_9a92:
9a92:    47 9c 0f c0 97 e0      memset 0x10, 0xc0, [R_97e0|0x97e0]
9a98:    90 00 0e               ld A, 0x000e
9a9b:    c3 aa                  ld BL, [R_9a47|0x9a47|-0x56]
9a9d:    19 0f                  ble L_9aae
9a9f:    38                     inc A, #1
9aa0:    49                     sub BL, AL
9aa1:    45 31                  mov AL, BL
9aa3:    50 18 97 e0            add Z, A, R_97e0|0x97e0
9aa7:    c0 ae                  ld BL, 0xae
9aa9:    ec                     st BL, [Z]
9aaa:    31 01                  dec A, #2
9aac:    16 07                  blt L_9ab5

L_9aae:
9aae:    50 18 97 e0            add Z, A, R_97e0|0x97e0
9ab2:    c0 a3                  ld BL, 0xa3
9ab4:    ec                     st BL, [Z]

L_9ab5:
9ab5:    90 00 10               ld A, 0x0010
9ab8:    32 20                  clr B, #0
9aba:    46 85 90 97 e0 97 f0   baseconv(8, 5) [R_97e0|0x97e0], [R_97f0|0x97f0]
9ac1:    9d                     ld A, [S]
9ac2:    6d a0                  st X, [S]
9ac4:    5b                     mov X, A
9ac5:    50 06                  add Y, A
9ac7:    55 68                  mov Z, Y
9ac9:    90 97 f0               ld A, R_97f0|0x97f0

L_9acc:
9acc:    c5 02                  ld BL, [--A]
9ace:    14 05                  bz L_9ad5
9ad0:    e5 82                  st BL, [--Z]
9ad2:    3f                     dec X
9ad3:    18 f7                  bgt L_9acc

L_9ad5:
9ad5:    65 a1                  ld X, [S++]
9ad7:    7f 61                  pop {Y}
9ad9:    71 99 a6               jmp R_99a6

L_9adc:
9adc:    d0 00 00               ld B, 0x0000
9adf:    f3 27                  st B, [R_9b08|0x9b08|+0x27]
9ae1:    31 80                  dec Z, #1
9ae3:    51 82                  sub B, Z
9ae5:    15 0d                  bnz L_9af4

L_9ae7:
9ae7:    85 41                  ld AL, [X++]
9ae9:    15 03                  bnz L_9aee
9aeb:    71 9b 7e               jmp R_9b7e

L_9aee:
9aee:    30 41                  inc X, #2
9af0:    73 f5                  jmp L_9ae7

R_9af2:
9af2:    7e 81                  push {Z}

L_9af4:
9af4:    3a                     clr A, #0
9af5:    39                     dec A, #1
9af6:    a1 9a 47               st AL, [R_9a47|0x9a47]
9af9:    b1 97 a2               st A, [R_97a2|0x97a2]
9afc:    28                     inc AL, #1
9afd:    a1 9a 43               st AL, [R_9a43|0x9a43]
9b00:    28                     inc AL, #1
9b01:    a1 97 b0               st AL, [R_97b0|0x97b0]
9b04:    a1 9a 51               st AL, [R_9a51|0x9a51]
9b07:    90 00 00               ld A, 0x0000
9b0a:    5e                     mov Z, A
9b0b:    85 81                  ld AL, [Z++]
9b0d:    14 cd                  bz L_9adc
9b0f:    c0 08                  ld BL, 0x08
9b11:    4a                     and BL, AL
9b12:    14 23                  bz L_9b37
9b14:    c0 01                  ld BL, 0x01
9b16:    4a                     and BL, AL
9b17:    e1 97 b0               st BL, [R_97b0|0x97b0]
9b1a:    e1 9a 51               st BL, [R_9a51|0x9a51]
9b1d:    c0 02                  ld BL, 0x02
9b1f:    4a                     and BL, AL
9b20:    e1 9a 43               st BL, [R_9a43|0x9a43]
9b23:    24 13                  srl AL, #4
9b25:    4d                     mov BL, AL
9b26:    28                     inc AL, #1
9b27:    14 04                  bz L_9b2d
9b29:    c0 0f                  ld BL, 0x0f
9b2b:    29                     dec AL, #1
9b2c:    4a                     and BL, AL

L_9b2d:
9b2d:    e1 9a 47               st BL, [R_9a47|0x9a47]
9b30:    80 08                  ld AL, 0x08
9b32:    73 03                  jmp L_9b37

L_9b34:
9b34:    2a                     clr AL, #0

L_9b35:
9b35:    30 41                  inc X, #2

L_9b37:
9b37:    c5 41                  ld BL, [X++]
9b39:    14 43                  bz R_9b7e
9b3b:    49                     sub BL, AL
9b3c:    15 f7                  bnz L_9b35
9b3e:    95 81                  ld A, [Z++]
9b40:    45 03                  mov BL, AH
9b42:    25 30                  sll BL, #1
9b44:    14 1b                  bz L_9b61
9b46:    b5 a2                  st A, [--S]
9b48:    51 10 7f ff            sub A, A, 0x7fff
9b4c:    10 0a                  bc L_9b58
9b4e:    95 a1                  ld A, [S++]
9b50:    d8                     ld B, [A]
9b51:    16 e1                  blt L_9b34
9b53:    95 08 02               ld A, [A + 0x02]
9b56:    73 09                  jmp L_9b61

L_9b58:
9b58:    d0 ff ff               ld B, 0xffff
9b5b:    55 80                  mov A, Z
9b5d:    79 84 e4               call Syscall_Abort
9b60:    17                         abort_code = (0x17)

L_9b61:
9b61:    b0 00 00               st A, 0x0000
9b64:    14 ce                  bz L_9b34
9b66:    d3 02                  ld B, [R_9b6a|0x9b6a|+0x2]
9b68:    58                     add B, A
9b69:    f0 00 00               st B, 0x0000
9b6c:    91 01 03               ld A, [CurrentProcess|0x0103]
9b6f:    95 0c 19               ld A, @[A + 0x19]
9b72:    98                     ld A, [A]
9b73:    59                     sub B, A
9b74:    16 be                  blt L_9b34
9b76:    65 40                  ld X, [X]
9b78:    32 20                  clr B, #0
9b7a:    55 80                  mov A, Z
9b7c:    b3 8a                  st A, [R_9b08|0x9b08|-0x76]

R_9b7e:
9b7e:    95 a1                  ld A, [S++]
9b80:    5e                     mov Z, A
9b81:    93 df                  ld A, [0x9b62|-0x21]
9b83:    09                     ret

R_9b84:
9b84:    00                     HALT
9b85:    01                     nop
9b86:    03                     rf
9b87:    02                     sf
9b88:    02                     sf
9b89:    02                     sf
9b8a:    02                     sf

Syscall_18:
9b8b:    7b 01                  call R_9b8e
9b8d:    0f                     rsys

R_9b8e:
9b8e:    7e 45                  push {X, Y, Z}
9b90:    55 28                  mov Z, B
9b92:    55 80                  mov A, Z
9b94:    79 a2 db               call R_a2db
9b97:    90 01 00               ld A, 0x0100
9b9a:    b1 9c 65               st A, [R_9c65|0x9c65]
9b9d:    95 88 0a               ld A, [Z + 0x0a]
9ba0:    45 02                  mov BH, AH
9ba2:    14 0a                  bz L_9bae
9ba4:    79 a2 db               call R_a2db
9ba7:    5b                     mov X, A
9ba8:    22 11                  clr AL, #1
9baa:    a3 7c                  st AL, [0x9c28|+0x7c]
9bac:    73 1e                  jmp L_9bcc

L_9bae:
9bae:    b1 9c 65               st A, [R_9c65|0x9c65]
9bb1:    c0 06                  ld BL, 0x06
9bb3:    59                     sub B, A
9bb4:    19 08                  ble L_9bbe

L_9bb6:
9bb6:    9c                     ld A, [Z]
9bb7:    d1 9c 65               ld B, [R_9c65|0x9c65]
9bba:    79 84 e4               call Syscall_Abort
9bbd:    0f                         abort_code = (0xf)

L_9bbe:
9bbe:    30 10 9c 64            inc [R_9c64|0x9c64], #1
9bc2:    3d                     sll A, #1
9bc3:    d0 a3 4b               ld B, R_a34b|0xa34b
9bc6:    58                     add B, A
9bc7:    99                     ld A, [B]
9bc8:    5b                     mov X, A
9bc9:    2a                     clr AL, #0
9bca:    a3 5c                  st AL, [0x9c28|+0x5c]

L_9bcc:
9bcc:    3a                     clr A, #0
9bcd:    85 88 03               ld AL, [Z + 0x03]
9bd0:    a1 9c 66               st AL, [R_9c66|0x9c66]
9bd3:    19 e1                  ble L_9bb6
9bd5:    c5 41                  ld BL, [X++]
9bd7:    49                     sub BL, AL
9bd8:    19 0f                  ble L_9be9
9bda:    c0 09                  ld BL, 0x09
9bdc:    49                     sub BL, AL
9bdd:    15 03                  bnz L_9be2
9bdf:    71 9c 6c               jmp R_9c6c

L_9be2:
9be2:    c0 0a                  ld BL, 0x0a
9be4:    49                     sub BL, AL
9be5:    14 52                  bz R_9c39
9be7:    73

L_9be8:
9be8:    cd                     ld BL, [S]

L_9be9:
9be9:    5d                     mov B, A
9bea:    29                     dec AL, #1
9beb:    3d                     sll A, #1
9bec:    50 04                  add X, A
9bee:    9a                     ld A, [X]
9bef:    15 0a                  bnz L_9bfb
9bf1:    31 28                  dec B, #9
9bf3:    14 77                  bz R_9c6c
9bf5:    31 20                  dec B, #1
9bf7:    14 40                  bz R_9c39
9bf9:    73 bb                  jmp L_9bb6

L_9bfb:
9bfb:    30 10 9c 64            inc [R_9c64|0x9c64], #1
9bff:    31 20                  dec B, #1
9c01:    14 04                  bz L_9c07
9c03:    31 20                  dec B, #1
9c05:    15 0c                  bnz L_9c13

L_9c07:
9c07:    d5 88 03               ld B, [Z + 0x03]
9c0a:    c5 88 02               ld BL, [Z + 0x02]
9c0d:    42 23                  and BL, BH
9c0f:    14 a5                  bz L_9bb6
9c11:    73 04                  jmp L_9c17

L_9c13:
9c13:    31 26                  dec B, #7
9c15:    14 10                  bz L_9c27

L_9c17:
9c17:    d5 88 02               ld B, [Z + 0x02]
9c1a:    c0 20                  ld BL, 0x20
9c1c:    42 23                  and BL, BH
9c1e:    15 07                  bnz L_9c27
9c20:    9c                     ld A, [Z]
9c21:    d5 a8 06               ld B, [S + 0x06]
9c24:    7c 95                  call @[0x9bbb|-0x6b]
9c26:    10

L_9c27:
9c27:    c0 00                  ld BL, 0x00
9c29:    15 04                  bnz L_9c2f
9c2b:    55 82                  mov B, Z
9c2d:    75 00                  jmp [A]

L_9c2f:
9c2f:    5d                     mov B, A
9c30:    7b 05                  call L_9c37

R_9c32:
9c32:    30 a1                  inc S, #2
9c34:    7f 45                  pop {X, Y, Z}
9c36:    09                     ret

L_9c37:
9c37:    66 1a                  jsys Syscall_1a

R_9c39:
9c39:    55 82                  mov B, Z
9c3b:    79 8a a6               call LookupDeviceInstance
9c3e:    95 08 01               ld A, [A + 0x01]
9c41:    80 09                  ld AL, 0x09
9c43:    41 01                  sub AL, AH
9c45:    15 05                  bnz L_9c4c
9c47:    55 82                  mov B, Z
9c49:    79 8a 48               call Syscall_00_inner

L_9c4c:
9c4c:    85 88 02               ld AL, [Z + 0x02]
9c4f:    c0 df                  ld BL, 0xdf
9c51:    4a                     and BL, AL
9c52:    e5 88 02               st BL, [Z + 0x02]

R_9c55:
9c55:    2a                     clr AL, #0
9c56:    71 9e 4f               jmp R_9e4f

L_9c59:
9c59:    c5 41                  ld BL, [X++]
9c5b:    4a                     and BL, AL
9c5c:    14 06                  bz R_9c64
9c5e:    42 23                  and BL, BH
9c60:    15 02                  bnz R_9c64
9c62:    73 5a                  jmp L_9cbe

R_9c64:
9c64:    09                     ret

R_9c65:
9c65:    00                     HALT

R_9c66:
9c66:    00                     HALT
9c67:    00                     HALT

R_9c68:
9c68:    80 01                  ld AL, 0x01
9c6a:    73 01                  jmp L_9c6d

R_9c6c:
9c6c:    2a                     clr AL, #0

L_9c6d:
9c6d:    a3 6a                  st AL, [0x9cd9|+0x6a]
9c6f:    55 82                  mov B, Z
9c71:    7c c9                  call @[0x9c3c|-0x37]
9c73:    5b                     mov X, A
9c74:    55 26                  mov Y, B
9c76:    32 10 9c 65            clr [R_9c65|0x9c65], #0
9c7a:    85 88 02               ld AL, [Z + 0x02]
9c7d:    c0 20                  ld BL, 0x20
9c7f:    43 13                  or BL, AL
9c81:    e5 88 02               st BL, [Z + 0x02]
9c84:    da                     ld B, [X]
9c85:    55 66                  mov Y, Y
9c87:    14 03                  bz L_9c8c
9c89:    d5 68 05               ld B, [Y + 0x05]

L_9c8c:
9c8c:    f3 d8                  st B, [R_9c66|0x9c66|-0x28]
9c8e:    7b c9                  call L_9c59
9c90:    01                     nop
9c91:    7b c6                  call L_9c59
9c93:    02                     sf
9c94:    30 10 9c 64            inc [R_9c64|0x9c64], #1
9c98:    3a                     clr A, #0
9c99:    85 88 0c               ld AL, [Z + 0x0c]
9c9c:    a3 c8                  st AL, [R_9c66|0x9c66|-0x38]
9c9e:    16 1e                  blt L_9cbe
9ca0:    c0 02                  ld BL, 0x02
9ca2:    49                     sub BL, AL
9ca3:    18 19                  bgt L_9cbe
9ca5:    30 10 9c 64            inc [R_9c64|0x9c64], #1
9ca9:    3d                     sll A, #1
9caa:    d0 a3 34               ld B, R_a334|0xa334
9cad:    58                     add B, A
9cae:    d9                     ld B, [B]
9caf:    95 48 01               ld A, [X + 0x01]
9cb2:    b3 b2                  st A, [R_9c66|0x9c66|-0x4e]

L_9cb4:
9cb4:    85 21                  ld AL, [B++]
9cb6:    16 06                  blt L_9cbe
9cb8:    41 01                  sub AL, AH
9cba:    14 09                  bz L_9cc5
9cbc:    73 f6                  jmp L_9cb4

L_9cbe:
9cbe:    9c                     ld A, [Z]
9cbf:    d3 a4                  ld B, [R_9c65|0x9c65|-0x5c]
9cc1:    79 84 e4               call Syscall_Abort
9cc4:    11                         abort_code = (0x11)

L_9cc5:
9cc5:    80 09                  ld AL, 0x09
9cc7:    41 01                  sub AL, AH
9cc9:    15 08                  bnz L_9cd3
9ccb:    55 82                  mov B, Z
9ccd:    79 8a 48               call Syscall_00_inner
9cd0:    71 9d 8c               jmp R_9d8c

L_9cd3:
9cd3:    90 03 00               ld A, 0x0300
9cd6:    b3 8d                  st A, [R_9c65|0x9c65|-0x73]
9cd8:    80 00                  ld AL, 0x00
9cda:    14 4c                  bz L_9d28
9cdc:    7b 6f                  call R_9d4d
9cde:    85 88 0d               ld AL, [Z + 0x0d]
9ce1:    c0 06                  ld BL, 0x06
9ce3:    49                     sub BL, AL
9ce4:    15 2c                  bnz L_9d12
9ce6:    95 88 06               ld A, [Z + 0x06]
9ce9:    79 a3 0d               call R_a30d
9cec:    47 45 05 00 02 80 1e   memcpy 0x06, [A + 0x02], [Z + 0x1e]
9cf3:    c5 08 02               ld BL, [A + 0x02]
9cf6:    15 11                  bnz L_9d09
9cf8:    46 22 34 00 02 9d 4a   unkbig3(2, 2) [A + 0x02], [R_9d4a|0x9d4a]
9cff:    46 22 04 00 0b 9d 4a   addbig(2, 2) [A + 0x0b], [R_9d4a|0x9d4a]
9d06:    c1 9d 4a               ld BL, [R_9d4a|0x9d4a]

L_9d09:
9d09:    e5 88 31               st BL, [Z + 0x31]
9d0c:    95 08 05               ld A, [A + 0x05]
9d0f:    b5 88 1c               st A, [Z + 0x1c]

L_9d12:
9d12:    95 88 1c               ld A, [Z + 0x1c]
9d15:    39                     dec A, #1
9d16:    78 12 01 90            mul B, A, 0x0190
9d1a:    30 21                  inc B, #2
9d1c:    77 32 01 90            div B, B, 0x0190
9d20:    95 88 04               ld A, [Z + 0x04]
9d23:    59                     sub B, A
9d24:    15 98                  bnz L_9cbe
9d26:    73 64                  jmp R_9d8c

L_9d28:
9d28:    85 88 01               ld AL, [Z + 0x01]
9d2b:    17 19                  bp L_9d46
9d2d:    55 82                  mov B, Z
9d2f:    79 8a a6               call LookupDeviceInstance
9d32:    55 26                  mov Y, B
9d34:    14 56                  bz R_9d8c
9d36:    95 68 09               ld A, [Y + 0x09]
9d39:    b5 88 12               st A, [Z + 0x12]
9d3c:    b5 88 16               st A, [Z + 0x16]
9d3f:    95 68 0b               ld A, [Y + 0x0b]
9d42:    7b 21                  call L_9d65
9d44:    73 46                  jmp R_9d8c

L_9d46:
9d46:    7b 05                  call R_9d4d
9d48:    73 42                  jmp R_9d8c

R_9d4a:
9d4a:    00                     HALT
9d4b:    00                     HALT
9d4c:    00                     HALT

R_9d4d:
9d4d:    55 82                  mov B, Z
9d4f:    7c df                  call @[0x9d30|-0x21]
9d51:    55 26                  mov Y, B
9d53:    14 36                  bz L_9d8b
9d55:    3a                     clr A, #0
9d56:    b5 68 09               st A, [Y + 0x09]
9d59:    b5 88 12               st A, [Z + 0x12]
9d5c:    b5 88 16               st A, [Z + 0x16]
9d5f:    95 68 02               ld A, [Y + 0x02]
9d62:    b5 68 0b               st A, [Y + 0x0b]

L_9d65:
9d65:    b5 88 14               st A, [Z + 0x14]
9d68:    b5 88 18               st A, [Z + 0x18]
9d6b:    85 68 06               ld AL, [Y + 0x06]
9d6e:    c0 0f                  ld BL, 0x0f
9d70:    4a                     and BL, AL
9d71:    85 88 0d               ld AL, [Z + 0x0d]
9d74:    16 0b                  blt L_9d81
9d76:    49                     sub BL, AL
9d77:    14 08                  bz L_9d81
9d79:    49                     sub BL, AL
9d7a:    45 12                  mov BH, AL
9d7c:    9c                     ld A, [Z]
9d7d:    79 84 e4               call Syscall_Abort
9d80:    12                         abort_code = (0x12)

L_9d81:
9d81:    95 88 06               ld A, [Z + 0x06]
9d84:    14 05                  bz L_9d8b
9d86:    79 a3 0d               call R_a30d
9d89:    7b 04                  call R_9d8f

L_9d8b:
9d8b:    09                     ret

R_9d8c:
9d8c:    7f 45                  pop {X, Y, Z}
9d8e:    09                     ret

R_9d8f:
9d8f:    55 82                  mov B, Z
9d91:    95 88 16               ld A, [Z + 0x16]
9d94:    79 89 bc               call R_89bc
9d97:    14 04                  bz L_9d9d
9d99:    80 01                  ld AL, 0x01
9d9b:    73 14                  jmp L_9db1

L_9d9d:
9d9d:    95 88 16               ld A, [Z + 0x16]
9da0:    b5 88 12               st A, [Z + 0x12]
9da3:    b5 88 08               st A, [Z + 0x08]
9da6:    7b 15                  call R_9dbd
9da8:    01                     nop
9da9:    d5 88 12               ld B, [Z + 0x12]
9dac:    30 20                  inc B, #1
9dae:    f5 88 16               st B, [Z + 0x16]

L_9db1:
9db1:    ac                     st AL, [Z]
9db2:    09                     ret

L_9db3:
9db3:    d6 89 9d ba            st Z, [R_9dba|0x9dba]
9db7:    79 85 fa               call FlushFn

R_9dba:
9dba:    00 00                      fileop = L_0000
9dbc:    09                     ret

R_9dbd:
9dbd:    85 41                  ld AL, [X++]
9dbf:    a5 88 03               st AL, [Z + 0x03]

R_9dc2:
9dc2:    55 82                  mov B, Z
9dc4:    79 8a 48               call Syscall_00_inner
9dc7:    7b ea                  call L_9db3
9dc9:    09                     ret

R_9dca:
9dca:    80 01                  ld AL, 0x01
9dcc:    73 02                  jmp L_9dd0

R_9dce:
9dce:    80 02                  ld AL, 0x02

L_9dd0:
9dd0:    a5 88 03               st AL, [Z + 0x03]
9dd3:    95 88 0e               ld A, [Z + 0x0e]
9dd6:    b5 88 04               st A, [Z + 0x04]
9dd9:    95 88 10               ld A, [Z + 0x10]
9ddc:    79 a2 fc               call R_a2fc
9ddf:    b5 88 06               st A, [Z + 0x06]
9de2:    55 82                  mov B, Z
9de4:    7f 45                  pop {X, Y, Z}
9de6:    f5 a2                  st B, [--S]
9de8:    79 8b 33               call DoFileOpInner
9deb:    d5 a1                  ld B, [S++]
9ded:    7e 81                  push {Z}
9def:    55 28                  mov Z, B
9df1:    7b c0                  call L_9db3
9df3:    3a                     clr A, #0
9df4:    b5 88 06               st A, [Z + 0x06]
9df7:    7f 81                  pop {Z}
9df9:    09                     ret

R_9dfa:
9dfa:    79 a2 41               call R_a241
9dfd:    5b                     mov X, A
9dfe:    47 8e 00 84 06         memcmp 0x01, 0x84, [Y]
9e03:    14 12                  bz L_9e17
9e05:    47 8e 00 8d 06         memcmp 0x01, 0x8d, [Y]
9e0a:    15 0f                  bnz L_9e1b
9e0c:    79 9d 8f               call R_9d8f
9e0f:    15 3e                  bnz R_9e4f
9e11:    3a                     clr A, #0
9e12:    b5 88 18               st A, [Z + 0x18]
9e15:    73 e3                  jmp R_9dfa

L_9e17:
9e17:    80 01                  ld AL, 0x01
9e19:    73 34                  jmp R_9e4f

L_9e1b:
9e1b:    7e 81                  push {Z}
9e1d:    47 2a ff 8d 66         memchr 0x100, 0x8d, [Y], [Y]
9e22:    7f 81                  pop {Z}
9e24:    55 40                  mov A, X
9e26:    51 64                  sub X, Y
9e28:    5c                     mov Y, A
9e29:    95 88 18               ld A, [Z + 0x18]
9e2c:    50 40                  add A, X
9e2e:    38                     inc A, #1
9e2f:    b5 88 18               st A, [Z + 0x18]

R_9e32:
9e32:    95 88 0e               ld A, [Z + 0x0e]
9e35:    5d                     mov B, A
9e36:    51 42                  sub B, X
9e38:    19 01                  ble L_9e3b
9e3a:    5b                     mov X, A

L_9e3b:
9e3b:    55 62                  mov B, Y
9e3d:    95 88 10               ld A, [Z + 0x10]
9e40:    79 a2 fc               call R_a2fc
9e43:    5c                     mov Y, A
9e44:    6d 61                  st X, [Y++]
9e46:    55 40                  mov A, X
9e48:    39                     dec A, #1
9e49:    f7                     ?F7?
9e4a:    38                     inc A, #1
9e4b:    50 06                  add Y, A
9e4d:    2a                     clr AL, #0
9e4e:    ab                     st AL, [Y]

R_9e4f:
9e4f:    ac                     st AL, [Z]
9e50:    71 9d 8c               jmp R_9d8c

R_9e53:
9e53:    95 88 10               ld A, [Z + 0x10]
9e56:    79 a2 fc               call R_a2fc
9e59:    5b                     mov X, A
9e5a:    3a                     clr A, #0
9e5b:    da                     ld B, [X]
9e5c:    14 f1                  bz R_9e4f
9e5e:    31 20                  dec B, #1
9e60:    45 22                  mov BH, BH
9e62:    14 04                  bz L_9e68
9e64:    32 02                  clr A, #2
9e66:    73 e7                  jmp R_9e4f

L_9e68:
9e68:    79 a2 53               call R_a253
9e6b:    da                     ld B, [X]
9e6c:    58                     add B, A
9e6d:    f5 88 18               st B, [Z + 0x18]
9e70:    51 32 01 8f            sub B, B, 0x018f
9e74:    17 0a                  bp L_9e80
9e76:    80 8d                  ld AL, 0x8d
9e78:    ab                     st AL, [Y]
9e79:    79 a2 7a               call R_a27a
9e7c:    14 d5                  bz R_9e53
9e7e:    73 cf                  jmp R_9e4f

L_9e80:
9e80:    95 41                  ld A, [X++]
9e82:    39                     dec A, #1
9e83:    67 4a 46               memcpy A, [X], [Y]
9e86:    38                     inc A, #1
9e87:    50 06                  add Y, A
9e89:    80 8d                  ld AL, 0x8d
9e8b:    ab                     st AL, [Y]
9e8c:    2a                     clr AL, #0
9e8d:    73 c0                  jmp R_9e4f

R_9e8f:
9e8f:    95 88 10               ld A, [Z + 0x10]
9e92:    79 a2 fc               call R_a2fc
9e95:    5b                     mov X, A
9e96:    95 88 06               ld A, [Z + 0x06]
9e99:    79 a3 0d               call R_a30d
9e9c:    30 01                  inc A, #2
9e9e:    5c                     mov Y, A
9e9f:    d5 88 14               ld B, [Z + 0x14]
9ea2:    50 26                  add Y, B
9ea4:    d0 8d 00               ld B, 0x8d00
9ea7:    95 41                  ld A, [X++]

L_9ea9:
9ea9:    cb                     ld BL, [Y]
9eaa:    41 23                  sub BL, BH
9eac:    14 17                  bz L_9ec5
9eae:    39                     dec A, #1
9eaf:    16 0b                  blt L_9ebc
9eb1:    ca                     ld BL, [X]
9eb2:    41 23                  sub BL, BH
9eb4:    14 06                  bz L_9ebc
9eb6:    c5 41                  ld BL, [X++]
9eb8:    e5 61                  st BL, [Y++]
9eba:    73 ed                  jmp L_9ea9

L_9ebc:
9ebc:    80 a0                  ld AL, 0xa0
9ebe:    a5 61                  st AL, [Y++]
9ec0:    cb                     ld BL, [Y]
9ec1:    41 23                  sub BL, BH
9ec3:    15 f7                  bnz L_9ebc

L_9ec5:
9ec5:    95 88 12               ld A, [Z + 0x12]
9ec8:    b5 88 08               st A, [Z + 0x08]
9ecb:    79 9d bd               call R_9dbd
9ece:    02                     sf
9ecf:    71 9e 4f               jmp R_9e4f

R_9ed2:
9ed2:    2a                     clr AL, #0
9ed3:    a5 a2                  st AL, [--S]
9ed5:    79 9f b0               call R_9fb0
9ed8:    73 26                  jmp L_9f00

R_9eda:
9eda:    80 01                  ld AL, 0x01
9edc:    a5 a2                  st AL, [--S]
9ede:    55 82                  mov B, Z
9ee0:    79 8a a6               call LookupDeviceInstance
9ee3:    95 88 06               ld A, [Z + 0x06]
9ee6:    79 a3 0d               call R_a30d
9ee9:    79 a0 09               call R_a009
9eec:    15 14                  bnz R_9f02
9eee:    95 88 16               ld A, [Z + 0x16]
9ef1:    b5 88 08               st A, [Z + 0x08]
9ef4:    79 9f db               call R_9fdb
9ef7:    73 07                  jmp L_9f00

R_9ef9:
9ef9:    80 01                  ld AL, 0x01
9efb:    a5 a2                  st AL, [--S]
9efd:    79 9f c5               call R_9fc5

L_9f00:
9f00:    14 11                  bz L_9f13

R_9f02:
9f02:    c5 a1                  ld BL, [S++]
9f04:    15 0a                  bnz L_9f10
9f06:    c0 ff                  ld BL, 0xff
9f08:    e1 01 3b               st BL, [0x013b]
9f0b:    32 20                  clr B, #0
9f0d:    f5 88 06               st B, [Z + 0x06]

L_9f10:
9f10:    71 9e 4f               jmp R_9e4f

L_9f13:
9f13:    95 88 0e               ld A, [Z + 0x0e]
9f16:    b5 61                  st A, [Y++]
9f18:    39                     dec A, #1
9f19:    f7                     ?F7?
9f1a:    38                     inc A, #1
9f1b:    50 06                  add Y, A
9f1d:    2a                     clr AL, #0
9f1e:    ab                     st AL, [Y]
9f1f:    73 e1                  jmp R_9f02

R_9f21:
9f21:    2a                     clr AL, #0
9f22:    a5 a2                  st AL, [--S]
9f24:    79 9f b0               call R_9fb0
9f27:    73 2c                  jmp L_9f55

R_9f29:
9f29:    80 01                  ld AL, 0x01
9f2b:    a5 a2                  st AL, [--S]
9f2d:    55 82                  mov B, Z
9f2f:    7c b0                  call @[0x9ee1|-0x50]
9f31:    85 28 05               ld AL, [B + 0x05]
9f34:    c0 04                  ld BL, 0x04
9f36:    4a                     and BL, AL
9f37:    14 1a                  bz L_9f53
9f39:    95 88 06               ld A, [Z + 0x06]
9f3c:    79 a3 0d               call R_a30d
9f3f:    79 a0 09               call R_a009
9f42:    15 13                  bnz L_9f57
9f44:    95 88 16               ld A, [Z + 0x16]
9f47:    b5 88 08               st A, [Z + 0x08]
9f4a:    79 9f db               call R_9fdb
9f4d:    73 06                  jmp L_9f55

R_9f4f:
9f4f:    80 01                  ld AL, 0x01
9f51:    a5 a2                  st AL, [--S]

L_9f53:
9f53:    7b 70                  call R_9fc5

L_9f55:
9f55:    14 17                  bz L_9f6e

L_9f57:
9f57:    8d                     ld AL, [S]
9f58:    15 05                  bnz L_9f5f
9f5a:    80 ff                  ld AL, 0xff
9f5c:    a1 01 3b               st AL, [0x013b]

L_9f5f:
9f5f:    7b 26                  call R_9f87
9f61:    15 9f                  bnz R_9f02
9f63:    8d                     ld AL, [S]
9f64:    14 04                  bz L_9f6a
9f66:    7b 5d                  call R_9fc5
9f68:    73 eb                  jmp L_9f55

L_9f6a:
9f6a:    7b 44                  call R_9fb0
9f6c:    73 e7                  jmp L_9f55

L_9f6e:
9f6e:    55 60                  mov A, Y
9f70:    55 26                  mov Y, B
9f72:    5d                     mov B, A
9f73:    95 21                  ld A, [B++]
9f75:    95 88 0e               ld A, [Z + 0x0e]
9f78:    18 04                  bgt L_9f7e
9f7a:    80 05                  ld AL, 0x05
9f7c:    73 84                  jmp R_9f02

L_9f7e:
9f7e:    39                     dec A, #1
9f7f:    f7                     ?F7?
9f80:    79 9d bd               call R_9dbd
9f83:    02                     sf
9f84:    71 9f 02               jmp R_9f02

R_9f87:
9f87:    55 82                  mov B, Z
9f89:    79 8a a6               call LookupDeviceInstance
9f8c:    f5 a2                  st B, [--S]
9f8e:    3a                     clr A, #0
9f8f:    85 28 04               ld AL, [B + 0x04]
9f92:    d0 00 01               ld B, 0x0001

L_9f95:
9f95:    39                     dec A, #1
9f96:    16 04                  blt L_9f9c
9f98:    35 20                  sll B, #1
9f9a:    73 f9                  jmp L_9f95

L_9f9c:
9f9c:    95 a5                  ld A, @[S++]
9f9e:    50 20                  add A, B
9fa0:    d5 88 16               ld B, [Z + 0x16]
9fa3:    59                     sub B, A
9fa4:    11 07                  bnc L_9fad
9fa6:    55 82                  mov B, Z
9fa8:    66 19                  jsys Syscall_19
9faa:    5d                     mov B, A
9fab:    14 02                  bz L_9faf

L_9fad:
9fad:    80 02                  ld AL, 0x02

L_9faf:
9faf:    09                     ret

R_9fb0:
9fb0:    91 01 1d               ld A, [0x011d]
9fb3:    b5 88 06               st A, [Z + 0x06]
9fb6:    90 01 90               ld A, 0x0190
9fb9:    b5 88 04               st A, [Z + 0x04]
9fbc:    79 8d e4               call R_8de4
9fbf:    7b 48                  call R_a009
9fc1:    15 3d                  bnz L_a000
9fc3:    73 16                  jmp R_9fdb

R_9fc5:
9fc5:    95 88 06               ld A, [Z + 0x06]
9fc8:    79 a3 0d               call R_a30d
9fcb:    7b 3c                  call R_a009
9fcd:    15 31                  bnz L_a000
9fcf:    95 88 12               ld A, [Z + 0x12]
9fd2:    d5 88 16               ld B, [Z + 0x16]
9fd5:    f5 88 08               st B, [Z + 0x08]
9fd8:    59                     sub B, A
9fd9:    14 05                  bz L_9fe0

R_9fdb:
9fdb:    79 9d 8f               call R_9d8f
9fde:    15 20                  bnz L_a000

L_9fe0:
9fe0:    95 88 10               ld A, [Z + 0x10]
9fe3:    79 a2 fc               call R_a2fc
9fe6:    5c                     mov Y, A
9fe7:    95 88 1c               ld A, [Z + 0x1c]
9fea:    d5 88 0e               ld B, [Z + 0x0e]
9fed:    59                     sub B, A
9fee:    10 03                  bc L_9ff3
9ff0:    b5 88 0e               st A, [Z + 0x0e]

L_9ff3:
9ff3:    d5 88 06               ld B, [Z + 0x06]
9ff6:    95 88 18               ld A, [Z + 0x18]
9ff9:    b5 88 14               st A, [Z + 0x14]
9ffc:    30 01                  inc A, #2
9ffe:    58                     add B, A
9fff:    3a                     clr A, #0

L_a000:
a000:    09                     ret

R_a001:
a001:    00                     HALT
a002:    00                     HALT

R_a003:
a003:    00                     HALT
a004:    00                     HALT
a005:    00                     HALT
a006:    00                     HALT

R_a007:
a007:    00                     HALT
a008:    00                     HALT

R_a009:
a009:    95 88 0a               ld A, [Z + 0x0a]
a00c:    31 05                  dec A, #6
a00e:    15 20                  bnz L_a030
a010:    95 88 1a               ld A, [Z + 0x1a]
a013:    46 35 38 00 a0 01      unkbig3(3, 5) [A], [R_a001|0xa001]
a019:    16 67                  blt L_a082
a01b:    46 15 54 80 1c a0 01   unkbig5(1, 5) [Z + 0x1c], [R_a001|0xa001]
a022:    12 5e                  bn L_a082
a024:    90 a0 07               ld A, R_a007|0xa007
a027:    46 15 7c 01 90 a0      unkbig7(1, 5) 0x01, [0x90a0]
a02d:    01                     nop
a02e:    73 2b                  jmp L_a05b

L_a030:
a030:    d0 01 90               ld B, 0x0190
a033:    78 93 00 1c            mul B, [Z + 0x001c], B
a037:    12 49                  bn L_a082
a039:    f3 cc                  st B, [R_a007|0xa007|-0x34]
a03b:    14 45                  bz L_a082
a03d:    95 88 1a               ld A, [Z + 0x1a]
a040:    46 35 38 00 a0 01      unkbig3(3, 5) [A], [R_a001|0xa001]
a046:    16 3a                  blt L_a082
a048:    90 a0 07               ld A, R_a007|0xa007
a04b:    46 15 70 a0 07 a0 01   unkbig7(1, 5) [R_a007|0xa007], [R_a001|0xa001]
a052:    46 11 54 80 1c a0 07   unkbig5(1, 1) [Z + 0x1c], [R_a007|0xa007]
a059:    12 27                  bn L_a082

L_a05b:
a05b:    d3 aa                  ld B, [R_a007|0xa007|-0x56]
a05d:    f5 88 18               st B, [Z + 0x18]
a060:    91 a0 01               ld A, [R_a001|0xa001]
a063:    15 1d                  bnz L_a082
a065:    91 a0 03               ld A, [R_a003|0xa003]
a068:    15 18                  bnz L_a082
a06a:    d3 99                  ld B, [0xa005|-0x67]

L_a06c:
a06c:    7b 1a                  call L_a088
a06e:    b5 a2                  st A, [--S]
a070:    79 89 bc               call R_89bc
a073:    14 06                  bz L_a07b

L_a075:
a075:    80 01                  ld AL, 0x01
a077:    dd                     ld B, [S]
a078:    f5 88 12               st B, [Z + 0x12]

L_a07b:
a07b:    d5 a1                  ld B, [S++]
a07d:    f5 88 08               st B, [Z + 0x08]
a080:    4d                     mov BL, AL
a081:    09                     ret

L_a082:
a082:    3a                     clr A, #0
a083:    39                     dec A, #1
a084:    b5 a2                  st A, [--S]
a086:    73 ed                  jmp L_a075

L_a088:
a088:    f5 88 16               st B, [Z + 0x16]
a08b:    d5 88 04               ld B, [Z + 0x04]
a08e:    14 06                  bz L_a096
a090:    31 20                  dec B, #1
a092:    78 32 01 90            mul B, B, 0x0190

L_a096:
a096:    95 88 16               ld A, [Z + 0x16]
a099:    50 20                  add A, B
a09b:    55 82                  mov B, Z
a09d:    09                     ret

L_a09e:
a09e:    d5 88 1a               ld B, [Z + 0x1a]
a0a1:    95 21                  ld A, [B++]
a0a3:    d9                     ld B, [B]
a0a4:    09                     ret

R_a0a5:
a0a5:    7b f7                  call L_a09e
a0a7:    73 c3                  jmp L_a06c

R_a0a9:
a0a9:    46 11 2d 01 90 80 04   unkbig2(1, 1) 0x01, [Z + 0x8004]
a0b0:    11 06                  bnc L_a0b8
a0b2:    85 88 03               ld AL, [Z + 0x03]
a0b5:    29                     dec AL, #1
a0b6:    14 40                  bz L_a0f8

L_a0b8:
a0b8:    7b e4                  call L_a09e
a0ba:    7b cc                  call L_a088
a0bc:    b5 a2                  st A, [--S]
a0be:    79 8a a6               call LookupDeviceInstance
a0c1:    99                     ld A, [B]
a0c2:    d5 a1                  ld B, [S++]
a0c4:    59                     sub B, A
a0c5:    10 35                  bc L_a0fc
a0c7:    59                     sub B, A
a0c8:    f5 a2                  st B, [--S]
a0ca:    79 85 b9               call R_85b9
a0cd:    3b                         arg1 = (0x3b)
a0ce:    d5 88 06               ld B, [Z + 0x06]
a0d1:    9d                     ld A, [S]
a0d2:    fd                     st B, [S]
a0d3:    d1 01 1d               ld B, [0x011d]
a0d6:    f5 88 06               st B, [Z + 0x06]
a0d9:    55 82                  mov B, Z
a0db:    79 89 bc               call R_89bc
a0de:    c0 ff                  ld BL, 0xff
a0e0:    e1 01 3b               st BL, [0x013b]
a0e3:    d5 a1                  ld B, [S++]
a0e5:    f5 88 06               st B, [Z + 0x06]
a0e8:    5d                     mov B, A
a0e9:    14 11                  bz L_a0fc
a0eb:    85 88 03               ld AL, [Z + 0x03]
a0ee:    29                     dec AL, #1
a0ef:    14 1c                  bz L_a10d
a0f1:    79 9f 87               call R_9f87
a0f4:    14 b3                  bz R_a0a9
a0f6:    73 15                  jmp L_a10d

L_a0f8:
a0f8:    7b ab                  call R_a0a5
a0fa:    15 11                  bnz L_a10d

L_a0fc:
a0fc:    95 88 16               ld A, [Z + 0x16]
a0ff:    b5 88 12               st A, [Z + 0x12]
a102:    b5 88 08               st A, [Z + 0x08]
a105:    79 9d c2               call R_9dc2
a108:    15 03                  bnz L_a10d
a10a:    71 9e 4f               jmp R_9e4f

L_a10d:
a10d:    80 01                  ld AL, 0x01
a10f:    c5 88 03               ld BL, [Z + 0x03]
a112:    21 30                  dec BL, #1
a114:    14 02                  bz L_a118
a116:    80 02                  ld AL, 0x02

L_a118:
a118:    71 9e 4f               jmp R_9e4f

R_a11b:
a11b:    79 a0 09               call R_a009
a11e:    c0 4d                  ld BL, 0x4d
a120:    73 05                  jmp L_a127

R_a122:
a122:    79 a0 09               call R_a009
a125:    c0 4e                  ld BL, 0x4e

L_a127:
a127:    e1 a1 d0               st BL, [R_a1d0|0xa1d0]
a12a:    4d                     mov BL, AL
a12b:    15 3e                  bnz L_a16b
a12d:    95 88 16               ld A, [Z + 0x16]
a130:    b5 a2                  st A, [--S]

L_a132:
a132:    79 a1 bb               call R_a1bb
a135:    4d                     mov BL, AL
a136:    14 1c                  bz L_a154
a138:    ac                     st AL, [Z]
a139:    95 88 16               ld A, [Z + 0x16]
a13c:    dd                     ld B, [S]
a13d:    59                     sub B, A
a13e:    15 05                  bnz L_a145
a140:    30 a1                  inc S, #2
a142:    71 9d 8c               jmp R_9d8c

L_a145:
a145:    95 a1                  ld A, [S++]
a147:    b5 88 16               st A, [Z + 0x16]
a14a:    c0 4e                  ld BL, 0x4e
a14c:    e1 a1 d0               st BL, [R_a1d0|0xa1d0]
a14f:    7b 6a                  call R_a1bb
a151:    71 9d 8c               jmp R_9d8c

L_a154:
a154:    95 88 16               ld A, [Z + 0x16]
a157:    d5 88 08               ld B, [Z + 0x08]
a15a:    59                     sub B, A
a15b:    14 08                  bz L_a165
a15d:    95 88 08               ld A, [Z + 0x08]
a160:    b5 88 16               st A, [Z + 0x16]
a163:    73 cd                  jmp L_a132

L_a165:
a165:    30 a1                  inc S, #2
a167:    2a                     clr AL, #0

L_a168:
a168:    71 9e 4f               jmp R_9e4f

L_a16b:
a16b:    21 30                  dec BL, #1
a16d:    15 01                  bnz L_a170
a16f:    28                     inc AL, #1

L_a170:
a170:    d0 4d 00               ld B, 0x4d00
a173:    c3 5b                  ld BL, [R_a1d0|0xa1d0|+0x5b]
a175:    41 23                  sub BL, BH
a177:    14 ef                  bz L_a168
a179:    95 a8 09               ld A, [S + 0x09]
a17c:    d5 48 0c               ld B, [X + 0x0c]
a17f:    66 09                  jsys Syscall_Abort
a181:    0e                         abort_code = (0xe)

R_a182:
a182:    79 a0 09               call R_a009
a185:    73 08                  jmp L_a18f

R_a187:
a187:    79 a0 09               call R_a009
a18a:    73 10                  jmp L_a19c

R_a18c:
a18c:    79 a0 a5               call R_a0a5

L_a18f:
a18f:    c0 4d                  ld BL, 0x4d
a191:    31 a1                  dec S, #2
a193:    7b 1b                  call L_a1b0
a195:    30 a1                  inc S, #2
a197:    73 cf                  jmp L_a168

R_a199:
a199:    79 a0 a5               call R_a0a5

L_a19c:
a19c:    c0 4e                  ld BL, 0x4e
a19e:    31 a1                  dec S, #2
a1a0:    7b 0e                  call L_a1b0
a1a2:    30 a1                  inc S, #2
a1a4:    4d                     mov BL, AL
a1a5:    14 c1                  bz L_a168
a1a7:    95 a8 0d               ld A, [S + 0x0d]
a1aa:    d5 a8 10               ld B, [S + 0x10]
a1ad:    66 09                  jsys Syscall_Abort
a1af:    0e                         abort_code = (0xe)

L_a1b0:
a1b0:    e3 1e                  st BL, [R_a1d0|0xa1d0|+0x1e]
a1b2:    4d                     mov BL, AL
a1b3:    14 06                  bz R_a1bb
a1b5:    21 30                  dec BL, #1
a1b7:    15 01                  bnz L_a1ba
a1b9:    28                     inc AL, #1

L_a1ba:
a1ba:    09                     ret

R_a1bb:
a1bb:    55 82                  mov B, Z
a1bd:    79 8a a6               call LookupDeviceInstance
a1c0:    85 08 02               ld AL, [A + 0x02]
a1c3:    a5 a2                  st AL, [--S]
a1c5:    95 88 16               ld A, [Z + 0x16]
a1c8:    79 cd 67               call R_cd67
a1cb:    45 10                  mov AH, AL
a1cd:    85 a1                  ld AL, [S++]
a1cf:    66

R_a1d0:
a1d0:    ff                     st B, [P]
a1d1:    09                     ret

L_a1d2:
a1d2:    3a                     clr A, #0
a1d3:    b5 88 18               st A, [Z + 0x18]

R_a1d6:
a1d6:    7b 69                  call R_a241
a1d8:    c0 84                  ld BL, 0x84
a1da:    95 61                  ld A, [Y++]
a1dc:    17 0e                  bp L_a1ec
a1de:    41 03                  sub BL, AH
a1e0:    14 05                  bz L_a1e7
a1e2:    79 9d 8f               call R_9d8f
a1e5:    14 eb                  bz L_a1d2

L_a1e7:
a1e7:    80 01                  ld AL, 0x01

L_a1e9:
a1e9:    71 9e 4f               jmp R_9e4f

L_a1ec:
a1ec:    5b                     mov X, A
a1ed:    31 01                  dec A, #2
a1ef:    18 04                  bgt L_a1f5
a1f1:    8b                     ld AL, [Y]
a1f2:    49                     sub BL, AL
a1f3:    14 f2                  bz L_a1e7

L_a1f5:
a1f5:    95 88 18               ld A, [Z + 0x18]
a1f8:    30 01                  inc A, #2
a1fa:    50 40                  add A, X
a1fc:    b5 88 18               st A, [Z + 0x18]
a1ff:    71 9e 32               jmp R_9e32

R_a202:
a202:    95 88 10               ld A, [Z + 0x10]
a205:    79 a2 fc               call R_a2fc
a208:    5b                     mov X, A
a209:    9a                     ld A, [X]
a20a:    19 06                  ble L_a212
a20c:    d0 01 8d               ld B, 0x018d
a20f:    59                     sub B, A
a210:    19 04                  ble L_a216

L_a212:
a212:    80 05                  ld AL, 0x05

L_a214:
a214:    73 d3                  jmp L_a1e9

L_a216:
a216:    7b 3b                  call R_a253
a218:    da                     ld B, [X]
a219:    30 01                  inc A, #2
a21b:    58                     add B, A
a21c:    f5 88 18               st B, [Z + 0x18]
a21f:    90 01 8f               ld A, 0x018f
a222:    59                     sub B, A
a223:    17 09                  bp L_a22e
a225:    80 ff                  ld AL, 0xff
a227:    ab                     st AL, [Y]
a228:    7b 50                  call R_a27a
a22a:    14 d6                  bz R_a202
a22c:    73 e6                  jmp L_a214

L_a22e:
a22e:    55 42                  mov B, X
a230:    95 21                  ld A, [B++]
a232:    b5 61                  st A, [Y++]
a234:    19 05                  ble L_a23b
a236:    39                     dec A, #1
a237:    f7                     ?F7?
a238:    38                     inc A, #1
a239:    50 06                  add Y, A

L_a23b:
a23b:    2a                     clr AL, #0
a23c:    29                     dec AL, #1
a23d:    ab                     st AL, [Y]
a23e:    2a                     clr AL, #0
a23f:    73 d3                  jmp L_a214

R_a241:
a241:    95 88 06               ld A, [Z + 0x06]
a244:    79 a3 0d               call R_a30d
a247:    30 01                  inc A, #2
a249:    d5 88 18               ld B, [Z + 0x18]
a24c:    f5 88 14               st B, [Z + 0x14]
a24f:    50 20                  add A, B
a251:    5c                     mov Y, A
a252:    09                     ret

R_a253:
a253:    95 88 06               ld A, [Z + 0x06]
a256:    79 a3 0d               call R_a30d
a259:    30 01                  inc A, #2
a25b:    5c                     mov Y, A
a25c:    95 88 18               ld A, [Z + 0x18]
a25f:    b5 88 14               st A, [Z + 0x14]
a262:    50 06                  add Y, A
a264:    09                     ret

L_a265:
a265:    95 88 06               ld A, [Z + 0x06]
a268:    79 a3 0d               call R_a30d
a26b:    3a                     clr A, #0
a26c:    b5 88 18               st A, [Z + 0x18]
a26f:    95 88 12               ld A, [Z + 0x12]
a272:    b5 88 08               st A, [Z + 0x08]
a275:    79 9d bd               call R_9dbd
a278:    02                     sf
a279:    09                     ret

R_a27a:
a27a:    7b e9                  call L_a265
a27c:    15 18                  bnz L_a296
a27e:    95 88 16               ld A, [Z + 0x16]
a281:    b5 88 12               st A, [Z + 0x12]
a284:    38                     inc A, #1
a285:    b5 88 16               st A, [Z + 0x16]
a288:    55 82                  mov B, Z
a28a:    79 89 bc               call R_89bc
a28d:    14 07                  bz L_a296
a28f:    55 82                  mov B, Z
a291:    66 19                  jsys Syscall_19
a293:    5d                     mov B, A
a294:    15 01                  bnz L_a297

L_a296:
a296:    09                     ret

L_a297:
a297:    80 02                  ld AL, 0x02
a299:    09                     ret

R_a29a:
a29a:    7b c9                  call L_a265
a29c:    71 9e 4f               jmp R_9e4f

R_a29f:
a29f:    79 8a a6               call LookupDeviceInstance
a2a2:    55 22                  mov B, B
a2a4:    14 06                  bz L_a2ac

R_a2a6:
a2a6:    79 9d 4d               call R_9d4d

L_a2a9:
a2a9:    71 9d 8c               jmp R_9d8c

L_a2ac:
a2ac:    95 88 06               ld A, [Z + 0x06]
a2af:    7b 5c                  call R_a30d
a2b1:    79 9d bd               call R_9dbd
a2b4:    04                     ei
a2b5:    73 f2                  jmp L_a2a9

R_a2b7:
a2b7:    d5 88 08               ld B, [Z + 0x08]
a2ba:    95 88 12               ld A, [Z + 0x12]
a2bd:    b5 21                  st A, [B++]
a2bf:    95 88 14               ld A, [Z + 0x14]
a2c2:    b9                     st A, [B]
a2c3:    73 e4                  jmp L_a2a9

R_a2c5:
a2c5:    d5 88 08               ld B, [Z + 0x08]
a2c8:    95 21                  ld A, [B++]
a2ca:    b5 88 16               st A, [Z + 0x16]
a2cd:    99                     ld A, [B]
a2ce:    b5 88 18               st A, [Z + 0x18]
a2d1:    95 88 06               ld A, [Z + 0x06]
a2d4:    7b 37                  call R_a30d
a2d6:    79 9d 8f               call R_9d8f
a2d9:    73 ce                  jmp L_a2a9

R_a2db:
a2db:    f5 a2                  st B, [--S]
a2dd:    b3 18                  st A, [0xa2f7|+0x18]
a2df:    51 10 7f ff            sub A, A, 0x7fff
a2e3:    11 11                  bnc L_a2f6
a2e5:    79 88 05               call R_8805
a2e8:    89                     ld AL, [B]
a2e9:    21 11                  dec AL, #2
a2eb:    14 09                  bz L_a2f6
a2ed:    d3 08                  ld B, [0xa2f7|+0x8]
a2ef:    95 a8 02               ld A, [S + 0x02]
a2f2:    79 84 e4               call Syscall_Abort
a2f5:    17                         abort_code = (0x17)

L_a2f6:
a2f6:    90 00 00               ld A, 0x0000
a2f9:    d5 a1                  ld B, [S++]
a2fb:    09                     ret

R_a2fc:
a2fc:    7e 03                  push {A, B}
a2fe:    95 88 10               ld A, [Z + 0x10]
a301:    7b 1b                  call L_a31e
a303:    d5 88 0e               ld B, [Z + 0x0e]
a306:    50 20                  add A, B
a308:    7b 14                  call L_a31e
a30a:    7f 03                  pop {A, B}
a30c:    09                     ret

R_a30d:
a30d:    7e 03                  push {A, B}
a30f:    95 88 06               ld A, [Z + 0x06]
a312:    7b 0a                  call L_a31e
a314:    d5 88 04               ld B, [Z + 0x04]
a317:    50 20                  add A, B
a319:    7b 03                  call L_a31e
a31b:    7f 03                  pop {A, B}
a31d:    09                     ret

L_a31e:
a31e:    51 12 7f ff            sub B, A, 0x7fff
a322:    11 0f                  bnc L_a333
a324:    79 88 05               call R_8805
a327:    c9                     ld BL, [B]
a328:    21 31                  dec BL, #2
a32a:    14 07                  bz L_a333
a32c:    5d                     mov B, A
a32d:    55 80                  mov A, Z
a32f:    79 84 e4               call Syscall_Abort
a332:    17                         abort_code = (0x17)

L_a333:
a333:    09                     ret

R_a334:
a334:    a3 3a                  st AL, [R_a370|0xa370|+0x3a]
a336:    a3 3e                  st AL, [0xa376|+0x3e]
a338:    a3 49                  st AL, [0xa383|+0x49]

R_a33a:
a33a:    00                     HALT
a33b:    01                     nop
a33c:    02                     sf
a33d:    ff                     st B, [P]

R_a33e:
a33e:    09                     ret
a33f:    00
a340:    01
a341:    02
a342:    03
a343:    04
a344:    06
a345:    07
a346:    05
a347:    08
a348:    ff

R_a349:
a349:    04                     ei
a34a:    ff                     st B, [P]

R_a34b:
a34b:    a3 59                  st AL, [0xa3a6|+0x59]
a34d:    a3 70                  st AL, [0xa3bf|+0x70]
a34f:    a3 87                  st AL, [0xa2d8|-0x79]
a351:    a3 98                  st AL, [0xa2eb|-0x68]
a353:    a3 a9                  st AL, [0xa2fe|-0x57]
a355:    a3 c0                  st AL, [0xa317|-0x40]
a357:    a3 d1                  st AL, [0xa32a|-0x2f]

R_a359:
a359:    0b                     rim
a35a:    9d
a35b:    ca 'J'
a35c:    9d
a35d:    ce 'N'
a35e:    00
a35f:    00
a360:    a2 '"'
a361:    9f
a362:    00
a363:    00
a364:    00
a365:    00
a366:    00
a367:    00
a368:    00
a369:    00
a36a:    9c
a36b:    6c
a36c:    9c
a36d:    39
a36e:    9c
a36f:    55

R_a370:
a370:    0b                     rim
a371:    9d
a372:    fa 'z'
a373:    9e
a374:    53
a375:    9e
a376:    8f
a377:    a2 '"'
a378:    a6 '&'
a379:    a2 '"'
a37a:    b7 '7'
a37b:    a2 '"'
a37c:    c5 'E'
a37d:    00
a37e:    00
a37f:    00
a380:    00
a381:    9c
a382:    6c
a383:    9c
a384:    39
a385:    a2 '"'
a386:    9a

R_a387:
a387:    08                     cl
a388:    9e                     ld A, [C]
a389:    d2 9f 21               ld B, @[R_9f21|0x9f21]
a38c:    00                     HALT
a38d:    00                     HALT
a38e:    00                     HALT
a38f:    00                     HALT
a390:    00                     HALT
a391:    00                     HALT
a392:    00                     HALT
a393:    00                     HALT
a394:    a1 82 a1               st AL, [0x82a1]
a397:    87                     unknown

R_a398:
a398:    08                     cl
a399:    9e                     ld A, [C]
a39a:    f9                     st B, [B]
a39b:    9f                     ld A, [P]
a39c:    4f                     mov SL, AL
a39d:    00                     HALT
a39e:    00                     HALT
a39f:    00                     HALT
a3a0:    00                     HALT
a3a1:    00                     HALT
a3a2:    00                     HALT
a3a3:    00                     HALT
a3a4:    00                     HALT
a3a5:    a1 82 a1               st AL, [0x82a1]
a3a8:    87                     unknown

R_a3a9:
a3a9:    0b                     rim
a3aa:    a1 '!'
a3ab:    d6 'V'
a3ac:    a2 '"'
a3ad:    02
a3ae:    00
a3af:    00
a3b0:    a2 '"'
a3b1:    a6 '&'
a3b2:    a2 '"'
a3b3:    b7 '7'
a3b4:    a2 '"'
a3b5:    c5 'E'
a3b6:    00
a3b7:    00
a3b8:    00
a3b9:    00
a3ba:    9c
a3bb:    6c
a3bc:    9c
a3bd:    39
a3be:    a2 '"'
a3bf:    9a

R_a3c0:
a3c0:    08                     cl
a3c1:    a0 a9                  st AL, 0xa9
a3c3:    a0 a9                  st AL, 0xa9
a3c5:    00                     HALT
a3c6:    00                     HALT
a3c7:    00                     HALT
a3c8:    00                     HALT
a3c9:    00                     HALT
a3ca:    00                     HALT
a3cb:    00                     HALT
a3cc:    00                     HALT
a3cd:    a1 8c a1               st AL, [0x8ca1]
a3d0:    99                     ld A, [B]

R_a3d1:
a3d1:    0f                     rsys
a3d2:    9e
a3d3:    da 'Z'
a3d4:    9f
a3d5:    29
a3d6:    00
a3d7:    00
a3d8:    00
a3d9:    00
a3da:    00
a3db:    00
a3dc:    00
a3dd:    00
a3de:    a1 '!'
a3df:    1b
a3e0:    a1 '!'
a3e1:    22
a3e2:    9c
a3e3:    68
a3e4:    9c
a3e5:    39
a3e6:    00
a3e7:    00
a3e8:    a3 '#'
a3e9:    f0 'p'
a3ea:    a8 '('
a3eb:    72
a3ec:    a9 ')'
a3ed:    03
a3ee:    a9 ')'
a3ef:    d4 'T'

R_a3f0:
a3f0:    55 a2                  mov B, S
a3f2:    f5 88 32               st B, [Z + 0x32]
a3f5:    55 82                  mov B, Z
a3f7:    f5 88 34               st B, [Z + 0x34]
a3fa:    55 60                  mov A, Y
a3fc:    79 a2 db               call R_a2db
a3ff:    b5 a2                  st A, [--S]
a401:    79 a6 59               call R_a659
a404:    47 9d 02 00 60 27      memset 0x03, 0x00, [Y + 0x27]
a40a:    22 11                  clr AL, #1
a40c:    a5 68 30               st AL, [Y + 0x30]
a40f:    79 a8 0b               call R_a80b
a412:    9d                     ld A, [S]
a413:    79 a6 eb               call R_a6eb
a416:    47 41 02 a8 6c 60 2d   memcpy 0x03, [R_a86c|0xa86c], [Y + 0x2d]
a41d:    47 45 02 60 24 60 2a   memcpy 0x03, [Y + 0x24], [Y + 0x2a]
a424:    79 a7 b6               call R_a7b6
a427:    46 02 2d 00 60 38      unkbig2(0, 2) 0x00, [Y + 0x38]
a42d:    14 60                  bz L_a48f
a42f:    90 00 3e               ld A, 0x003e
a432:    50 60                  add A, Y
a434:    7c de                  call @[0xa414|-0x22]
a436:    47 85 02 60 24 60 2a   memcmp 0x03, [Y + 0x24], [Y + 0x2a]
a43d:    15 20                  bnz L_a45f
a43f:    47 9d 02 00 60 2a      memset 0x03, 0x00, [Y + 0x2a]
a445:    7c 21                  call @[0xa468|+0x21]
a447:    47 49 02 00 60 2a      memcpy 0x03, [A], [Y + 0x2a]
a44d:    47 45 02 60 2a 60 27   memcpy 0x03, [Y + 0x2a], [Y + 0x27]
a454:    79 a5 84               call R_a584
a457:    47 49 02 00 60 24      memcpy 0x03, [A], [Y + 0x24]
a45d:    73 30                  jmp L_a48f

L_a45f:
a45f:    7c f4                  call @[0xa455|-0xc]
a461:    47 49 02 00 60 27      memcpy 0x03, [A], [Y + 0x27]
a467:    79 a5 67               call R_a567
a46a:    47 45 02 60 27 60 3b   memcpy 0x03, [Y + 0x27], [Y + 0x3b]
a471:    79 a7 ec               call R_a7ec
a474:    79 a6 41               call R_a641
a477:    2a                     clr AL, #0
a478:    79 a7 ba               call R_a7ba
a47b:    79 a6 41               call R_a641
a47e:    27 79                  rlc YL, #10
a480:    a7                     unknown
a481:    ec                     st BL, [Z]
a482:    47 45 02 60 2a 60 24   memcpy 0x03, [Y + 0x2a], [Y + 0x24]
a489:    47 9d 02 00 60 27      memset 0x03, 0x00, [Y + 0x27]

L_a48f:
a48f:    9d                     ld A, [S]
a490:    d0 a5 c5               ld B, R_a5c5|0xa5c5
a493:    79 a7 54               call R_a754
a496:    3a                     clr A, #0
a497:    85 68 23               ld AL, [Y + 0x23]
a49a:    39                     dec A, #1
a49b:    67 49 80 60 3e         memcpy A, [Z], [Y + 0x3e]
a4a0:    47 45 02 60 2d 60 38   memcpy 0x03, [Y + 0x2d], [Y + 0x38]
a4a7:    47 9d 02 00 60 3b      memset 0x03, 0x00, [Y + 0x3b]
a4ad:    79 a7 e8               call R_a7e8
a4b0:    46 02 2d 00 60 27      unkbig2(0, 2) 0x00, [Y + 0x27]
a4b6:    14 11                  bz L_a4c9
a4b8:    79 a6 41               call R_a641
a4bb:    27 79                  rlc YL, #10
a4bd:    a7                     unknown
a4be:    ba                     st A, [X]
a4bf:    47 45 02 60 24 60 3b   memcpy 0x03, [Y + 0x24], [Y + 0x3b]
a4c6:    79 a7 ec               call R_a7ec

L_a4c9:
a4c9:    79 a6 41               call R_a641
a4cc:    2d                     sll AL, #1
a4cd:    79 a6 ce               call R_a6ce
a4d0:    32 04                  clr A, #4
a4d2:    b5 68 36               st A, [Y + 0x36]
a4d5:    b5 68 0e               st A, [Y + 0x0e]
a4d8:    79 a5 fc               call R_a5fc
a4db:    01                     nop
a4dc:    79 a6 72               call R_a672
a4df:    8b                     ld AL, [Y]
a4e0:    29                     dec AL, #1
a4e1:    a5 a2                  st AL, [--S]
a4e3:    18 7e                  bgt L_a563
a4e5:    14 0e                  bz L_a4f5
a4e7:    85 68 3b               ld AL, [Y + 0x3b]
a4ea:    15 77                  bnz L_a563
a4ec:    47 45 02 60 38 60 2a   memcpy 0x03, [Y + 0x38], [Y + 0x2a]
a4f3:    15 0d                  bnz L_a502

L_a4f5:
a4f5:    47 45 02 60 2d 60 2a   memcpy 0x03, [Y + 0x2d], [Y + 0x2a]
a4fc:    46 02 0d 01 60 2a      addbig(0, 2) 0x01, [Y + 0x2a]

L_a502:
a502:    79 a6 38               call R_a638
a505:    79 a8 23               call R_a823
a508:    47 45 02 60 2a 60 3e   memcpy 0x03, [Y + 0x2a], [Y + 0x3e]
a50f:    79 a6 38               call R_a638
a512:    79 a5 eb               call R_a5eb
a515:    02                     sf
a516:    85 a1                  ld AL, [S++]
a518:    15 42                  bnz L_a55c
a51a:    79 a6 41               call R_a641
a51d:    2d                     sll AL, #1
a51e:    79 a6 ce               call R_a6ce
a521:    3a                     clr A, #0
a522:    b5 68 38               st A, [Y + 0x38]
a525:    30 01                  inc A, #2
a527:    b5 68 36               st A, [Y + 0x36]
a52a:    b5 68 0e               st A, [Y + 0x0e]
a52d:    79 a5 fc               call R_a5fc
a530:    02                     sf
a531:    79 a6 72               call R_a672
a534:    8b                     ld AL, [Y]
a535:    14 25                  bz L_a55c
a537:    79 a6 8d               call R_a68d
a53a:    79 a6 ce               call R_a6ce
a53d:    55 62                  mov B, Y
a53f:    9d                     ld A, [S]
a540:    5c                     mov Y, A
a541:    95 28 32               ld A, [B + 0x32]
a544:    b5 a2                  st A, [--S]
a546:    f5 a2                  st B, [--S]
a548:    32 0e                  clr A, #14
a54a:    a5 28 03               st AL, [B + 0x03]
a54d:    79 9b 8e               call R_9b8e
a550:    95 a1                  ld A, [S++]
a552:    5c                     mov Y, A
a553:    95 a1                  ld A, [S++]
a555:    b5 68 32               st A, [Y + 0x32]
a558:    80 01                  ld AL, 0x01
a55a:    73 01                  jmp L_a55d

L_a55c:
a55c:    2a                     clr AL, #0

L_a55d:
a55d:    a3 03                  st AL, [0xa562|+0x3]
a55f:    79 a6 a9               call R_a6a9
a562:    00                     HALT

L_a563:
a563:    79 a6 a9               call R_a6a9
a566:    04                     ei

R_a567:
a567:    79 a6 41               call R_a641
a56a:    24 79                  srl YL, #10
a56c:    a7                     unknown
a56d:    ba                     st A, [X]
a56e:    46 22 25 60 3b 60 2a   unkbig2(2, 2) [Y + 0x3b], [Y + 0x2a]
a575:    14 08                  bz L_a57f
a577:    79 a6 41               call R_a641
a57a:    3b                     not A, #0
a57b:    15 ee                  bnz L_a56b
a57d:    73 e4                  jmp L_a563

L_a57f:
a57f:    95 68 1a               ld A, [Y + 0x1a]
a582:    38                     inc A, #1
a583:    09                     ret

R_a584:
a584:    79 a6 41               call R_a641
a587:    2a                     clr AL, #0
a588:    2a                     clr AL, #0
a589:    28                     inc AL, #1
a58a:    a5 a2                  st AL, [--S]
a58c:    73 16                  jmp L_a5a4

L_a58e:
a58e:    46 03 0a a0            addbig(0, 3) [S], [A]
a592:    46 03 2e 01 00         unkbig2(0, 3) 0x01, [A]
a597:    19 28                  ble L_a5c1
a599:    79 a7 ba               call R_a7ba
a59c:    46 02 2d 00 60 38      unkbig2(0, 2) 0x00, [Y + 0x38]
a5a2:    14 16                  bz L_a5ba

L_a5a4:
a5a4:    95 68 1a               ld A, [Y + 0x1a]
a5a7:    46 32 29 00 60 1e      unkbig2(3, 2) [A], [Y + 0x1e]
a5ad:    18 df                  bgt L_a58e
a5af:    c0 ff                  ld BL, 0xff
a5b1:    ed                     st BL, [S]
a5b2:    46 23 36 60 2a 00      unkbig3(2, 3) [Y + 0x2a], [A]
a5b8:    73 d4                  jmp L_a58e

L_a5ba:
a5ba:    30 a0                  inc S, #1
a5bc:    95 68 1a               ld A, [Y + 0x1a]
a5bf:    38                     inc A, #1
a5c0:    09                     ret

L_a5c1:
a5c1:    79 a6 a9               call R_a6a9
a5c4:    01                     nop

R_a5c5:
a5c5:    <null bytes>

a5e8:    7b 57                  call R_a641
a5ea:    24

R_a5eb:
a5eb:    55 62                  mov B, Y
a5ed:    85 41                  ld AL, [X++]
a5ef:    a5 28 03               st AL, [B + 0x03]
a5f2:    79 9b 8e               call R_9b8e
a5f5:    8b                     ld AL, [Y]
a5f6:    14 3f                  bz L_a637

L_a5f8:
a5f8:    79 a6 a9               call R_a6a9
a5fb:    02                     sf

R_a5fc:
a5fc:    55 62                  mov B, Y
a5fe:    85 41                  ld AL, [X++]
a600:    a5 28 03               st AL, [B + 0x03]
a603:    79 9b 8e               call R_9b8e
a606:    8b                     ld AL, [Y]
a607:    14 2e                  bz L_a637
a609:    29                     dec AL, #1
a60a:    14 03                  bz L_a60f
a60c:    29                     dec AL, #1
a60d:    15 e9                  bnz L_a5f8

L_a60f:
a60f:    8b                     ld AL, [Y]
a610:    09                     ret

R_a611:
a611:    85 68 31               ld AL, [Y + 0x31]
a614:    14 0a                  bz L_a620
a616:    3a                     clr A, #0
a617:    85 68 23               ld AL, [Y + 0x23]
a61a:    d0 00 06               ld B, 0x0006
a61d:    58                     add B, A
a61e:    73 08                  jmp L_a628

L_a620:
a620:    3a                     clr A, #0
a621:    85 68 23               ld AL, [Y + 0x23]
a624:    d0 00 04               ld B, 0x0004
a627:    58                     add B, A

L_a628:
a628:    90 00 36               ld A, 0x0036
a62b:    50 60                  add A, Y
a62d:    b5 68 10               st A, [Y + 0x10]
a630:    f8                     st B, [A]
a631:    f5 68 1c               st B, [Y + 0x1c]
a634:    f5 68 0e               st B, [Y + 0x0e]

L_a637:
a637:    09                     ret

R_a638:
a638:    d0 00 0c               ld B, 0x000c
a63b:    7b eb                  call L_a628
a63d:    7b 02                  call R_a641
a63f:    00                     HALT
a640:    09                     ret

R_a641:
a641:    3a                     clr A, #0
a642:    85 41                  ld AL, [X++]
a644:    15 05                  bnz L_a64b
a646:    90 a6 55               ld A, R_a655|0xa655
a649:    73 02                  jmp L_a64d

L_a64b:
a64b:    50 60                  add A, Y

L_a64d:
a64d:    d5 68 1a               ld B, [Y + 0x1a]
a650:    46 23 3a 02            unkbig3(2, 3) [A], [B]
a654:    09                     ret

R_a655:
a655:    00                     HALT
a656:    00                     HALT
a657:    00                     HALT
a658:    00                     HALT

R_a659:
a659:    55 86                  mov Y, Z
a65b:    90 20 00               ld A, 0x2000
a65e:    85 68 02               ld AL, [Y + 0x02]
a661:    42 10                  and AH, AL
a663:    15 08                  bnz L_a66d
a665:    3a                     clr A, #0
a666:    39                     dec A, #1
a667:    5d                     mov B, A
a668:    9b                     ld A, [Y]
a669:    79 84 e4               call Syscall_Abort
a66c:    10                         abort_code = (0x10)

L_a66d:
a66d:    55 80                  mov A, Z
a66f:    b5 68 34               st A, [Y + 0x34]

R_a672:
a672:    95 68 0a               ld A, [Y + 0x0a]
a675:    31 05                  dec A, #6
a677:    15 11                  bnz L_a68a
a679:    90 01 90               ld A, 0x0190
a67c:    b5 68 04               st A, [Y + 0x04]
a67f:    32 03                  clr A, #3
a681:    b5 68 0a               st A, [Y + 0x0a]
a684:    3a                     clr A, #0
a685:    39                     dec A, #1
a686:    b5 68 12               st A, [Y + 0x12]
a689:    09                     ret

L_a68a:
a68a:    7b 1d                  call R_a6a9
a68c:    02                     sf

R_a68d:
a68d:    85 68 30               ld AL, [Y + 0x30]
a690:    14 16                  bz L_a6a8

R_a692:
a692:    2a                     clr AL, #0
a693:    a5 68 30               st AL, [Y + 0x30]
a696:    95 68 0a               ld A, [Y + 0x0a]
a699:    31 05                  dec A, #6
a69b:    15 02                  bnz L_a69f
a69d:    7b d3                  call R_a672

L_a69f:
a69f:    7b a0                  call R_a641
a6a1:    00                     HALT
a6a2:    7b 94                  call R_a638
a6a4:    79 a5 eb               call R_a5eb
a6a7:    08                     cl

L_a6a8:
a6a8:    09                     ret

R_a6a9:
a6a9:    7b e2                  call R_a68d

R_a6ab:
a6ab:    d5 68 1a               ld B, [Y + 0x1a]
a6ae:    8a                     ld AL, [X]
a6af:    15 16                  bnz R_a6c7
a6b1:    46 23 36 60 2d 02      unkbig3(2, 3) [Y + 0x2d], [B]

L_a6b7:
a6b7:    7b 15                  call R_a6ce
a6b9:    85 41                  ld AL, [X++]
a6bb:    ab                     st AL, [Y]
a6bc:    95 68 32               ld A, [Y + 0x32]
a6bf:    5f                     mov S, A
a6c0:    95 68 34               ld A, [Y + 0x34]
a6c3:    5e                     mov Z, A
a6c4:    71 9d 8c               jmp R_9d8c

R_a6c7:
a6c7:    47 9e 03 ff 02         memset 0x04, 0xff, [B]
a6cc:    73 e9                  jmp L_a6b7

R_a6ce:
a6ce:    32 06                  clr A, #6
a6d0:    b5 68 0a               st A, [Y + 0x0a]
a6d3:    95 68 21               ld A, [Y + 0x21]
a6d6:    b5 68 1c               st A, [Y + 0x1c]
a6d9:    b5 68 0e               st A, [Y + 0x0e]
a6dc:    39                     dec A, #1
a6dd:    78 12 01 90            mul B, A, 0x0190
a6e1:    30 21                  inc B, #2
a6e3:    77 32 01 90            div B, B, 0x0190
a6e7:    f5 68 04               st B, [Y + 0x04]
a6ea:    09                     ret

R_a6eb:
a6eb:    7e 41                  push {X}
a6ed:    32 20                  clr B, #0
a6ef:    c5 68 23               ld BL, [Y + 0x23]
a6f2:    55 24                  mov X, B
a6f4:    d0 a8 39               ld B, R_a839|0xa839
a6f7:    7b 5b                  call R_a754
a6f9:    b5 a2                  st A, [--S]
a6fb:    47 9c 03 00 a8 62      memset 0x04, 0x00, [R_a862|0xa862]
a701:    46 03 08 80 a8 62      addbig(0, 3) [Z], [R_a862|0xa862]
a707:    30 80                  inc Z, #1
a709:    46 23 5c 00 aa 59      unkbig5(2, 3) 0x00, [0xaa59]
a70f:    a8                     st AL, [A]
a710:    62 3f 18               ld X, @[0x3f18]
a713:    ed                     st BL, [S]
a714:    3a                     clr A, #0
a715:    a1 a8 62               st AL, [R_a862|0xa862]
a718:    c5 68 31               ld BL, [Y + 0x31]
a71b:    15 03                  bnz L_a720
a71d:    b1 a8 62               st A, [R_a862|0xa862]

L_a720:
a720:    46 25 34 60 1e a8 5c   unkbig3(2, 5) [Y + 0x1e], [R_a85c|0xa85c]
a727:    46 05 1c 01 a8 5c      subbig(0, 5) 0x01, [R_a85c|0xa85c]
a72d:    46 35 50 a8 62 a8 5c   unkbig5(3, 5) [R_a862|0xa862], [R_a85c|0xa85c]
a734:    85 68 31               ld AL, [Y + 0x31]
a737:    15 09                  bnz L_a742
a739:    47 41 02 a8 5d 60 24   memcpy 0x03, [R_a85d|0xa85d], [Y + 0x24]
a740:    73 07                  jmp L_a749

L_a742:
a742:    47 41 02 a8 5c 60 24   memcpy 0x03, [R_a85c|0xa85c], [Y + 0x24]

L_a749:
a749:    46 02 0d 02 60 24      addbig(0, 2) 0x02, [Y + 0x24]
a74f:    d5 a1                  ld B, [S++]
a751:    7f 41                  pop {X}
a753:    09                     ret

R_a754:
a754:    7e 61                  push {Y}
a756:    b5 a2                  st A, [--S]
a758:    55 28                  mov Z, B
a75a:    85 68 23               ld AL, [Y + 0x23]
a75d:    21 16                  dec AL, #7
a75f:    16 42                  blt L_a7a3
a761:    20 16                  inc AL, #7
a763:    45 12                  mov BH, AL
a765:    9d                     ld A, [S]
a766:    5c                     mov Y, A
a767:    55 80                  mov A, Z
a769:    bd                     st A, [S]
a76a:    2a                     clr AL, #0
a76b:    a3 1a                  st AL, [0xa787|+0x1a]

L_a76d:
a76d:    85 61                  ld AL, [Y++]
a76f:    16 0e                  blt L_a77f
a771:    15 04                  bnz L_a777
a773:    31 60                  dec Y, #1
a775:    73 38                  jmp L_a7af

L_a777:
a777:    30 a1                  inc S, #2
a779:    7f 61                  pop {Y}
a77b:    79 a6 a9               call R_a6a9
a77e:    02                     sf

L_a77f:
a77f:    c0 a0                  ld BL, 0xa0
a781:    49                     sub BL, AL
a782:    16 f3                  blt L_a777
a784:    15 06                  bnz L_a78c
a786:    c0 00                  ld BL, 0x00
a788:    14 25                  bz L_a7af
a78a:    73 0b                  jmp L_a797

L_a78c:
a78c:    a3 f9                  st AL, [0xa787|-0x7]
a78e:    c0 e0                  ld BL, 0xe0
a790:    49                     sub BL, AL
a791:    16 04                  blt L_a797
a793:    c0 e0                  ld BL, 0xe0
a795:    40 31                  add AL, BL

L_a797:
a797:    a5 81                  st AL, [Z++]
a799:    21 20                  dec BH, #1
a79b:    18 12                  bgt L_a7af
a79d:    95 a1                  ld A, [S++]
a79f:    5e                     mov Z, A
a7a0:    7f 61                  pop {Y}
a7a2:    09                     ret

L_a7a3:
a7a3:    d5 a1                  ld B, [S++]
a7a5:    85 68 23               ld AL, [Y + 0x23]
a7a8:    29                     dec AL, #1
a7a9:    67 4a 28               memcpy A, [B], [Z]
a7ac:    7f 61                  pop {Y}
a7ae:    09                     ret

L_a7af:
a7af:    8b                     ld AL, [Y]
a7b0:    15 bb                  bnz L_a76d
a7b2:    80 a0                  ld AL, 0xa0
a7b4:    73 e1                  jmp L_a797

R_a7b6:
a7b6:    79 a6 41               call R_a641
a7b9:    24 79                  srl YL, #10
a7bb:    a6                     unknown
a7bc:    11 79                  bnc L_a837
a7be:    a5                     unknown
a7bf:    eb                     st BL, [Y]
a7c0:    01                     nop
a7c1:    85 68 31               ld AL, [Y + 0x31]
a7c4:    15 21                  bnz L_a7e7
a7c6:    47 44 22 60 3c a8 39   memcpy 0x23, [Y + 0x3c], [R_a839|0xa839]
a7cd:    47 41 22 a8 39 60 3e   memcpy 0x23, [R_a839|0xa839], [Y + 0x3e]
a7d4:    95 68 3a               ld A, [Y + 0x3a]
a7d7:    b5 68 3c               st A, [Y + 0x3c]
a7da:    95 68 38               ld A, [Y + 0x38]
a7dd:    b5 68 39               st A, [Y + 0x39]
a7e0:    2a                     clr AL, #0
a7e1:    a5 68 38               st AL, [Y + 0x38]
a7e4:    a5 68 3b               st AL, [Y + 0x3b]

L_a7e7:
a7e7:    09                     ret

R_a7e8:
a7e8:    79 a6 41               call R_a641
a7eb:    24 85                  srl ZH, #6
a7ed:    68 31 15               st X, 0x3115
a7f0:    15 7c                  bnz L_a86e
a7f2:    43 95                  or XL, ZL
a7f4:    68 39 b5               st X, 0x39b5
a7f7:    68 38 95               st X, 0x3895
a7fa:    68 3c b5               st X, 0x3cb5
a7fd:    68 3a 47               st X, 0x3a47
a800:    45 22                  mov BH, BH
a802:    60 3e 60               ld X, 0x3e60
a805:    3c                     srl A, #1
a806:    79 a5 eb               call R_a5eb
a809:    02                     sf
a80a:    09                     ret

R_a80b:
a80b:    79 a6 38               call R_a638
a80e:    85 68 30               ld AL, [Y + 0x30]
a811:    14 10                  bz R_a823

L_a813:
a813:    79 86 12               call Yield
a816:    55 62                  mov B, Y
a818:    80 07                  ld AL, 0x07
a81a:    a5 28 03               st AL, [B + 0x03]
a81d:    79 9b 8e               call R_9b8e
a820:    8b                     ld AL, [Y]
a821:    15 f0                  bnz L_a813

R_a823:
a823:    79 a5 eb               call R_a5eb
a826:    01                     nop
a827:    47 44 0b 60 38 a8 66   memcpy 0x0c, [Y + 0x38], [R_a866|0xa866]
a82e:    46 22 00 a8 6f a8 66   addbig(2, 2) [R_a86f|0xa86f], [R_a866|0xa866]
a835:    79 a6 11               call R_a611
a838:    09                     ret

R_a839:
a839:    <null bytes>


L_a842:
a842:    <null bytes>


R_a85c:
a85c:    <null bytes>


R_a85d:
a85d:    <null bytes>


R_a862:
a862:    <null bytes>


R_a866:
a866:    <null bytes>


R_a86c:
a86c:    00                     HALT
a86d:    00                     HALT

L_a86e:
a86e:    00                     HALT

R_a86f:
a86f:    00                     HALT
a870:    00                     HALT
a871:    00                     HALT

R_a872:
a872:    55 a2                  mov B, S
a874:    f5 88 32               st B, [Z + 0x32]
a877:    55 82                  mov B, Z
a879:    f5 88 34               st B, [Z + 0x34]
a87c:    55 60                  mov A, Y
a87e:    79 a2 db               call R_a2db
a881:    b5 a2                  st A, [--S]
a883:    79 a6 59               call R_a659
a886:    7b 0a                  call R_a892
a888:    15 04                  bnz R_a88e
a88a:    79 a6 ab               call R_a6ab
a88d:    00                     HALT

R_a88e:
a88e:    79 a6 a9               call R_a6a9
a891:    01                     nop

R_a892:
a892:    6d a2                  st X, [--S]
a894:    95 a8 04               ld A, [S + 0x04]
a897:    79 a6 eb               call R_a6eb

L_a89a:
a89a:    79 a7 b6               call R_a7b6
a89d:    47 45 02 60 38 60 2d   memcpy 0x03, [Y + 0x38], [Y + 0x2d]
a8a4:    14 35                  bz L_a8db
a8a6:    3a                     clr A, #0
a8a7:    85 68 23               ld AL, [Y + 0x23]
a8aa:    5b                     mov X, A
a8ab:    95 a8 04               ld A, [S + 0x04]
a8ae:    d0 a8 e0               ld B, R_a8e0|0xa8e0
a8b1:    79 a7 54               call R_a754
a8b4:    90 00 3e               ld A, 0x003e
a8b7:    50 60                  add A, Y
a8b9:    5d                     mov B, A
a8ba:    79 a7 54               call R_a754
a8bd:    55 40                  mov A, X
a8bf:    39                     dec A, #1
a8c0:    67 88 80 a8 e0         memcmp A, [Z], [R_a8e0|0xa8e0]
a8c5:    15 04                  bnz L_a8cb
a8c7:    65 a1                  ld X, [S++]
a8c9:    3a                     clr A, #0
a8ca:    09                     ret

L_a8cb:
a8cb:    47 45 02 60 24 60 27   memcpy 0x03, [Y + 0x24], [Y + 0x27]
a8d2:    47 45 02 60 3b 60 24   memcpy 0x03, [Y + 0x3b], [Y + 0x24]
a8d9:    15 bf                  bnz L_a89a

L_a8db:
a8db:    65 a1                  ld X, [S++]
a8dd:    32 01                  clr A, #1
a8df:    09                     ret

R_a8e0:
a8e0:    <null bytes>


R_a903:
a903:    55 a2                  mov B, S
a905:    f5 88 32               st B, [Z + 0x32]
a908:    55 82                  mov B, Z
a90a:    f5 88 34               st B, [Z + 0x34]
a90d:    55 60                  mov A, Y
a90f:    79 a2 db               call R_a2db
a912:    b5 a2                  st A, [--S]
a914:    c0 01                  ld BL, 0x01
a916:    e5 88 30               st BL, [Z + 0x30]
a919:    79 a6 59               call R_a659
a91c:    79 a8 0b               call R_a80b
a91f:    9d                     ld A, [S]
a920:    31 a2                  dec S, #3
a922:    47 42 02 a8 6c 0a      memcpy 0x03, [R_a86c|0xa86c], [S]
a928:    47 9d 02 00 60 27      memset 0x03, 0x00, [Y + 0x27]
a92e:    b5 a2                  st A, [--S]
a930:    79 a8 92               call R_a892
a933:    14 03                  bz L_a938
a935:    71 a8 8e               jmp R_a88e

L_a938:
a938:    30 a1                  inc S, #2
a93a:    79 a6 11               call R_a611
a93d:    47 45 02 60 3b 60 2a   memcpy 0x03, [Y + 0x3b], [Y + 0x2a]
a944:    15 1b                  bnz L_a961
a946:    47 45 02 60 27 60 27   memcpy 0x03, [Y + 0x27], [Y + 0x27]
a94d:    14 23                  bz L_a972
a94f:    79 a6 41               call R_a641
a952:    27 79                  rlc YL, #10
a954:    a7                     unknown
a955:    ba                     st A, [X]
a956:    47 9d 02 00 60 3b      memset 0x03, 0x00, [Y + 0x3b]
a95c:    79 a7 ec               call R_a7ec
a95f:    73 11                  jmp L_a972

L_a961:
a961:    79 a6 41               call R_a641
a964:    2a                     clr AL, #0
a965:    79 a7 ba               call R_a7ba
a968:    79 a7 e8               call R_a7e8
a96b:    47 45 02 60 2a 60 24   memcpy 0x03, [Y + 0x2a], [Y + 0x24]

L_a972:
a972:    47 9d 28 00 60 38      memset 0x29, 0x00, [Y + 0x38]
a978:    79 a7 e8               call R_a7e8
a97b:    47 49 02 a0 60 38      memcpy 0x03, [S], [Y + 0x38]
a981:    30 a2                  inc S, #3
a983:    2a                     clr AL, #0
a984:    a5 68 3b               st AL, [Y + 0x3b]
a987:    79 a6 41               call R_a641
a98a:    2d                     sll AL, #1
a98b:    79 a6 ce               call R_a6ce
a98e:    32 04                  clr A, #4
a990:    b5 68 0e               st A, [Y + 0x0e]
a993:    b5 68 36               st A, [Y + 0x36]

L_a996:
a996:    79 86 12               call Yield
a999:    55 62                  mov B, Y
a99b:    32 07                  clr A, #7
a99d:    a5 28 03               st AL, [B + 0x03]
a9a0:    79 9b 8e               call R_9b8e
a9a3:    8b                     ld AL, [Y]
a9a4:    14 05                  bz L_a9ab
a9a6:    29                     dec AL, #1
a9a7:    14 ed                  bz L_a996
a9a9:    73 08                  jmp L_a9b3

L_a9ab:
a9ab:    79 a5 eb               call R_a5eb
a9ae:    02                     sf
a9af:    79 a5 eb               call R_a5eb
a9b2:    08                     cl

L_a9b3:
a9b3:    79 a6 72               call R_a672
a9b6:    79 a6 38               call R_a638
a9b9:    79 a8 23               call R_a823
a9bc:    47 45 02 60 2d 60 3e   memcpy 0x03, [Y + 0x2d], [Y + 0x3e]
a9c3:    79 a6 38               call R_a638
a9c6:    79 a5 eb               call R_a5eb
a9c9:    02                     sf
a9ca:    79 a6 92               call R_a692
a9cd:    d5 68 1a               ld B, [Y + 0x1a]
a9d0:    79 a6 c7               call R_a6c7
a9d3:    00                     HALT

R_a9d4:
a9d4:    55 a2                  mov B, S
a9d6:    f5 88 32               st B, [Z + 0x32]
a9d9:    55 82                  mov B, Z
a9db:    f5 88 34               st B, [Z + 0x34]
a9de:    55 60                  mov A, Y
a9e0:    79 a2 db               call R_a2db
a9e3:    b5 a2                  st A, [--S]
a9e5:    79 a6 59               call R_a659
a9e8:    9d                     ld A, [S]

L_a9e9:
a9e9:    46 22 25 60 24 60 1e   unkbig2(2, 2) [Y + 0x24], [Y + 0x1e]
a9f0:    17 04                  bp L_a9f6
a9f2:    79 a6 a9               call R_a6a9
a9f5:    01                     nop

L_a9f6:
a9f6:    46 02 0d 01 60 24      addbig(0, 2) 0x01, [Y + 0x24]
a9fc:    79 a7 b6               call R_a7b6
a9ff:    47 45 02 60 38 60 2d   memcpy 0x03, [Y + 0x38], [Y + 0x2d]
aa06:    14 e1                  bz L_a9e9
aa08:    dd                     ld B, [S]
aa09:    3a                     clr A, #0
aa0a:    85 68 23               ld AL, [Y + 0x23]
aa0d:    39                     dec A, #1
aa0e:    67 46 60 3e 02         memcpy A, [Y + 0x3e], [B]
aa13:    79 a6 a9               call R_a6a9
aa16:    00                     HALT

Syscall_05:
aa17:    7e 03                  push {A, B}
aa19:    3a                     clr A, #0
aa1a:    85 41                  ld AL, [X++]
aa1c:    73 07                  jmp R_aa25

Syscall_21:
aa1e:    7e 03                  push {A, B}
aa20:    45 03                  mov BL, AH
aa22:    3a                     clr A, #0
aa23:    45 31                  mov AL, BL

R_aa25:
aa25:    31 a1                  dec S, #2
aa27:    47 46 08 a0 02 0a      memcpy 0x09, [S + 0x02], [S]	 ; move stack down
aa2d:    d5 a8 05               ld B, [S + 0x05]
aa30:    f5 a8 09               st B, [S + 0x09]	 ; rearange our stack
aa33:    6d a8 05               st X, [S + 0x05]	 ; store X
aa36:    d1 01 03               ld B, [CurrentProcess|0x0103]
aa39:    47 45 00 a0 08 20 29   memcpy 0x01, [S + 0x08], [B + 0x29]
aa40:    c0 00                  ld BL, 0x00
aa42:    e5 a8 08               st BL, [S + 0x08]

R_aa45:
aa45:    c1 b6 b4               ld BL, [R_b6b4|0xb6b4]
aa48:    49                     sub BL, AL
aa49:    11 04                  bnc L_aa4f
aa4b:    79 84 e4               call Syscall_Abort
aa4e:    1e                         abort_code = (0x1e)

L_aa4f:
aa4f:    3d                     sll A, #1
aa50:    38                     inc A, #1
aa51:    d3 f3                  ld B, [R_aa46|0xaa46|-0xd]
aa53:    58                     add B, A
aa54:    99                     ld A, [B]
aa55:    b5 a2                  st A, [--S]
aa57:    79 85 b9               call R_85b9
aa5a:    3d                         arg1 = (0x3d)
aa5b:    9d                     ld A, [S]
aa5c:    d0 00 00               ld B, 0x0000
aa5f:    59                     sub B, A
aa60:    15 03                  bnz L_aa65
aa62:    71 aa f0               jmp R_aaf0

L_aa65:
aa65:    79 85 b9               call R_85b9
aa68:    3b                         arg1 = (0x3b)
aa69:    79 ab 11               call R_ab11
aa6c:    d1 01 03               ld B, [CurrentProcess|0x0103]
aa6f:    c5 28 01               ld BL, [B + 0x01]
aa72:    e1 ab 12               st BL, [R_ab12|0xab12]
aa75:    d0 ad c6               ld B, R_adc6|0xadc6

L_aa78:
aa78:    f1 ab d8               st B, [R_abd8|0xabd8]
aa7b:    d9                     ld B, [B]
aa7c:    14 11                  bz L_aa8f
aa7e:    85 28 04               ld AL, [B + 0x04]
aa81:    16 f5                  blt L_aa78
aa83:    28                     inc AL, #1
aa84:    13 f2                  bnn L_aa78
aa86:    3a                     clr A, #0
aa87:    39                     dec A, #1
aa88:    b3 d3                  st A, [R_aa5d|0xaa5d|-0x2d]
aa8a:    79 ac cf               call R_accf
aa8d:    7b 72                  call L_ab01

L_aa8f:
aa8f:    90 ad c6               ld A, R_adc6|0xadc6

L_aa92:
aa92:    b1 ab d8               st A, [R_abd8|0xabd8]
aa95:    98                     ld A, [A]
aa96:    14 2d                  bz L_aac5
aa98:    c5 08 04               ld BL, [A + 0x04]
aa9b:    20 30                  inc BL, #1
aa9d:    15 f3                  bnz L_aa92
aa9f:    c0 7f                  ld BL, 0x7f
aaa1:    e5 08 04               st BL, [A + 0x04]
aaa4:    d5 08 02               ld B, [A + 0x02]
aaa7:    39                     dec A, #1
aaa8:    58                     add B, A
aaa9:    f3 09                  st B, [0xaab4|+0x9]
aaab:    d0 00 06               ld B, 0x0006
aaae:    58                     add B, A
aaaf:    f3 05                  st B, [0xaab6|+0x5]
aab1:    9d                     ld A, [S]
aab2:    66 57                  jsys Syscall_57
aab4:    00 00                      arg1 = (0x0)
aab6:    00 00                      arg2 = (0x0)
aab8:    01                         arg3 = (0x1)
aab9:    f3 43                  st B, [0xaafe|+0x43]
aabb:    15 24                  bnz L_aae1
aabd:    92 ab d8               ld A, @[R_abd8|0xabd8]
aac0:    c0 ff                  ld BL, 0xff
aac2:    e5 08 04               st BL, [A + 0x04]

L_aac5:
aac5:    79 ac 83               call R_ac83
aac8:    14 c5                  bz L_aa8f
aaca:    2a                     clr AL, #0
aacb:    29                     dec AL, #1
aacc:    a3 44                  st AL, [R_ab12|0xab12|+0x44]
aace:    79 86 12               call Yield
aad1:    79 85 b9               call R_85b9
aad4:    3b                         arg1 = (0x3b)
aad5:    7b 3a                  call R_ab11
aad7:    d1 01 03               ld B, [CurrentProcess|0x0103]
aada:    c5 28 01               ld BL, [B + 0x01]
aadd:    e3 33                  st BL, [R_ab12|0xab12|+0x33]
aadf:    73 ae                  jmp L_aa8f

L_aae1:
aae1:    d2 ab d8               ld B, @[R_abd8|0xabd8]
aae4:    38                     inc A, #1
aae5:    59                     sub B, A
aae6:    79 ad 26               call R_ad26
aae9:    95 a1                  ld A, [S++]
aaeb:    b1 aa 5d               st A, [R_aa5d|0xaa5d]
aaee:    73 07                  jmp L_aaf7

R_aaf0:
aaf0:    95 a1                  ld A, [S++]
aaf2:    b1 aa 5d               st A, [R_aa5d|0xaa5d]
aaf5:    7b 0a                  call L_ab01

L_aaf7:
aaf7:    2a                     clr AL, #0
aaf8:    29                     dec AL, #1
aaf9:    a3 17                  st AL, [R_ab12|0xab12|+0x17]
aafb:    7f 03                  pop {A, B}
aafd:    60 00 00               ld X, 0x0000
ab00:    0f                     rsys

L_ab01:
ab01:    79 88 05               call R_8805
ab04:    89                     ld AL, [B]
ab05:    47 4e 00 02 02         memcpy 0x01, 0x02, [B]
ab0a:    d1 01 03               ld B, [CurrentProcess|0x0103]
ab0d:    a5 28 2a               st AL, [B + 0x2a]
ab10:    09                     ret

R_ab11:
ab11:    80 ff                  ld AL, 0xff
ab13:    17 01                  bp L_ab16
ab15:    09                     ret

L_ab16:
ab16:    79 86 12               call Yield
ab19:    73 f6                  jmp R_ab11

Syscall_01:
ab1b:    7e 03                  push {A, B}
ab1d:    85 a8 08               ld AL, [S + 0x08]
ab20:    c0 07                  ld BL, 0x07
ab22:    4a                     and BL, AL
ab23:    21 33                  dec BL, #4
ab25:    15 09                  bnz L_ab30
ab27:    3a                     clr A, #0
ab28:    5d                     mov B, A
ab29:    38                     inc A, #1
ab2a:    31 20                  dec B, #1
ab2c:    79 84 e4               call Syscall_Abort
ab2f:    09                         abort_code = (0x9)

L_ab30:
ab30:    79 88 05               call R_8805
ab33:    91 01 03               ld A, [CurrentProcess|0x0103]
ab36:    95 08 29               ld A, [A + 0x29]
ab39:    a9                     st AL, [B]
ab3a:    45 01                  mov AL, AH
ab3c:    a3 31                  st AL, [0xab6f|+0x31]
ab3e:    91 01 03               ld A, [CurrentProcess|0x0103]
ab41:    95 08 01               ld A, [A + 0x01]
ab44:    81 01 3d               ld AL, [0x013d]
ab47:    41 01                  sub AL, AH
ab49:    15 04                  bnz L_ab4f
ab4b:    80 ff                  ld AL, 0xff
ab4d:    a4 f6                  st AL, @[0xab45|-0xa]

L_ab4f:
ab4f:    65 40                  ld X, [X]
ab51:    45 44                  mov XH, XH
ab53:    14 2a                  bz L_ab7f
ab55:    3e                     inc X
ab56:    14 07                  bz L_ab5f
ab58:    80 00                  ld AL, 0x00
ab5a:    a3 13                  st AL, [0xab6f|+0x13]
ab5c:    80 02                  ld AL, 0x02
ab5e:    a9                     st AL, [B]

L_ab5f:
ab5f:    61 01 03               ld X, [CurrentProcess|0x0103]
ab62:    65 48 08               ld X, [X + 0x08]
ab65:    47 5d 00 7f 40 13      unkblk5 0x01, 0x7f, [X + 0x13]
ab6b:    d5 a8 07               ld B, [S + 0x07]
ab6e:    c0 00                  ld BL, 0x00
ab70:    95 a8 09               ld A, [S + 0x09]
ab73:    b5 a8 07               st A, [S + 0x07]
ab76:    f5 a8 09               st B, [S + 0x09]
ab79:    7f 03                  pop {A, B}
ab7b:    65 a9 01               ld X, [S++ + 0x01]
ab7e:    0f                     rsys

L_ab7f:
ab7f:    79 86 12               call Yield
ab82:    55 40                  mov A, X
ab84:    71 aa 45               jmp R_aa45

Syscall_11:
ab87:    f3 02                  st B, [0xab8b|+0x2]
ab89:    66 16                  jsys Syscall_16
ab8b:    00 00                      arg1 = (0x0)
ab8d:    00 00                      out = (0x0)
ab8f:    93 fc                  ld A, [0xab8d|-0x4]
ab91:    0f                     rsys

Syscall_16:
ab92:    79 ab 11               call R_ab11
ab95:    3a                     clr A, #0
ab96:    b3 2c                  st A, [0xabc4|+0x2c]
ab98:    6d a2                  st X, [--S]

L_ab9a:
ab9a:    95 a4                  ld A, @[S]
ab9c:    30 04                  inc A, #5
ab9e:    60 ad c6               ld X, R_adc6|0xadc6
aba1:    6d a2                  st X, [--S]
aba3:    65 40                  ld X, [X]
aba5:    15 04                  bnz L_abab
aba7:    65 a1                  ld X, [S++]
aba9:    73 1d                  jmp L_abc8

L_abab:
abab:    c5 48 04               ld BL, [X + 0x04]
abae:    17 0b                  bp L_abbb
abb0:    d5 48 02               ld B, [X + 0x02]
abb3:    59                     sub B, A
abb4:    14 02                  bz L_abb8
abb6:    10 09                  bc L_abc1

L_abb8:
abb8:    dd                     ld B, [S]
abb9:    f3 09                  st B, [0xabc4|+0x9]

L_abbb:
abbb:    6d a0                  st X, [S]
abbd:    65 40                  ld X, [X]
abbf:    15 ea                  bnz L_abab

L_abc1:
abc1:    65 a1                  ld X, [S++]

R_abc3:
abc3:    d0 ab c3               ld B, R_abc3|0xabc3
abc6:    15 0c                  bnz L_abd4

L_abc8:
abc8:    79 ac 83               call R_ac83
abcb:    14 cd                  bz L_ab9a
abcd:    65 a1                  ld X, [S++]
abcf:    79 86 12               call Yield
abd2:    73 be                  jmp Syscall_16

L_abd4:
abd4:    5d                     mov B, A
abd5:    93 ed                  ld A, [0xabc4|-0x13]
abd7:    b0 ad c6               st A, R_adc6|0xadc6
abda:    98                     ld A, [A]
abdb:    5b                     mov X, A
abdc:    79 ad 26               call R_ad26
abdf:    55 40                  mov A, X
abe1:    65 a1                  ld X, [S++]
abe3:    d1 01 03               ld B, [CurrentProcess|0x0103]
abe6:    c5 28 01               ld BL, [B + 0x01]
abe9:    e5 08 04               st BL, [A + 0x04]
abec:    30 04                  inc A, #5
abee:    30 41                  inc X, #2
abf0:    b5 41                  st A, [X++]	 ; Return value via PC?
abf2:    0f                     rsys

Syscall_13:
abf3:    7e 01                  push {A}
abf5:    79 ab 11               call R_ab11
abf8:    7f 01                  pop {A}
abfa:    73 05                  jmp L_ac01

Syscall_17:
abfc:    79 ab 11               call R_ab11
abff:    95 41                  ld A, [X++]

L_ac01:
ac01:    31 04                  dec A, #5
ac03:    7e 45                  push {X, Y, Z}
ac05:    60 ad c6               ld X, R_adc6|0xadc6

L_ac08:
ac08:    6b ce                  st X, [R_abd8|0xabd8|-0x32]
ac0a:    65 40                  ld X, [X]
ac0c:    14 71                  bz L_ac7f
ac0e:    5d                     mov B, A
ac0f:    51 42                  sub B, X
ac11:    15 f5                  bnz L_ac08
ac13:    79 ac cf               call R_accf

L_ac16:
ac16:    47 20 0f fd 01 61 01 61 memchr 0x10, 0xfd, [PageTableOne|0x0161], [PageTableOne|0x0161]
ac1e:    31 80                  dec Z, #1
ac20:    51 90 01 61            sub A, Z, 0x0161
ac24:    33 02                  not A, #2
ac26:    35 0a                  sll A, #11
ac28:    b5 a2                  st A, [--S]
ac2a:    60 ad c6               ld X, R_adc6|0xadc6

L_ac2d:
ac2d:    6b a9                  st X, [R_abd8|0xabd8|-0x57]
ac2f:    65 40                  ld X, [X]
ac31:    14 3c                  bz L_ac6f
ac33:    9d                     ld A, [S]
ac34:    d5 48 02               ld B, [X + 0x02]
ac37:    50 42                  add B, X
ac39:    59                     sub B, A
ac3a:    15 f1                  bnz L_ac2d
ac3c:    85 48 04               ld AL, [X + 0x04]
ac3f:    28                     inc AL, #1
ac40:    15 2d                  bnz L_ac6f
ac42:    95 48 02               ld A, [X + 0x02]
ac45:    50 10 f8 00            add A, A, 0xf800
ac49:    15 0a                  bnz L_ac55
ac4b:    95 a1                  ld A, [S++]
ac4d:    7b 25                  call L_ac74
ac4f:    9a                     ld A, [X]
ac50:    b2 ab d8               st A, @[R_abd8|0xabd8]
ac53:    73 c1                  jmp L_ac16

L_ac55:
ac55:    31 04                  dec A, #5
ac57:    16 16                  blt L_ac6f
ac59:    30 04                  inc A, #5
ac5b:    bd                     st A, [S]
ac5c:    7b 16                  call L_ac74
ac5e:    95 a1                  ld A, [S++]
ac60:    b5 48 02               st A, [X + 0x02]
ac63:    9a                     ld A, [X]
ac64:    b2 ab d8               st A, @[R_abd8|0xabd8]
ac67:    69 ad 13               st X, [R_ad13|0xad13]
ac6a:    79 ad 65               call R_ad65
ac6d:    73 a7                  jmp L_ac16

L_ac6f:
ac6f:    95 a1                  ld A, [S++]
ac71:    7f 45                  pop {X, Y, Z}
ac73:    0f                     rsys

L_ac74:
ac74:    8c                     ld AL, [Z]
ac75:    79 b0 a2               call R_b0a2
ac78:    80 fd                  ld AL, 0xfd
ac7a:    ac                     st AL, [Z]
ac7b:    a5 88 20               st AL, [Z + 0x20]
ac7e:    09                     ret

L_ac7f:
ac7f:    79 84 e4               call Syscall_Abort
ac82:    20                         abort_code = (0x20)

R_ac83:
ac83:    7e 45                  push {X, Y, Z}
ac85:    55 76 01 61            mov Y, 0x0161
ac89:    32 40                  clr X, #0
ac8b:    3f                     dec X

L_ac8c:
ac8c:    3e                     inc X
ac8d:    51 52 00 10            sub B, X, 0x0010
ac91:    18 09                  bgt L_ac9c

L_ac93:
ac93:    79 b0 c5               call R_b0c5
ac96:    7f 45                  pop {X, Y, Z}
ac98:    90 00 01               ld A, 0x0001
ac9b:    09                     ret

L_ac9c:
ac9c:    c5 61                  ld BL, [Y++]
ac9e:    17 ec                  bp L_ac8c
aca0:    c5 68 1f               ld BL, [Y + 0x1f]
aca3:    17 e7                  bp L_ac8c
aca5:    31 60                  dec Y, #1
aca7:    3a                     clr A, #0
aca8:    79 af d7               call R_afd7
acab:    16 e6                  blt L_ac93
acad:    ab                     st AL, [Y]
acae:    a5 68 20               st AL, [Y + 0x20]
acb1:    55 89 01 03            mov Z, [CurrentProcess|0x0103]
acb5:    79 86 f5               call R_86f5
acb8:    35 4a                  sll X, #11
acba:    90 08 00               ld A, 0x0800
acbd:    b5 48 02               st A, [X + 0x02]
acc0:    29                     dec AL, #1
acc1:    a5 48 04               st AL, [X + 0x04]
acc4:    6b 4d                  st X, [R_ad13|0xad13|+0x4d]
acc6:    79 ad 65               call R_ad65
acc9:    7b 04                  call R_accf
accb:    7f 45                  pop {X, Y, Z}
accd:    3a                     clr A, #0
acce:    09                     ret

R_accf:
accf:    92 ab d8               ld A, @[R_abd8|0xabd8]
acd2:    b3 3f                  st A, [R_ad13|0xad13|+0x3f]
acd4:    d5 08 02               ld B, [A + 0x02]
acd7:    f3 71                  st B, [0xad4a|+0x71]
acd9:    98                     ld A, [A]
acda:    b2 ab d8               st A, @[R_abd8|0xabd8]
acdd:    6d a2                  st X, [--S]
acdf:    6d a2                  st X, [--S]

L_ace1:
ace1:    60 ad c6               ld X, R_adc6|0xadc6

L_ace4:
ace4:    6d a0                  st X, [S]
ace6:    65 40                  ld X, [X]
ace8:    14 2d                  bz L_ad17
acea:    85 48 04               ld AL, [X + 0x04]
aced:    17 f5                  bp L_ace4
acef:    93 22                  ld A, [R_ad13|0xad13|+0x22]
acf1:    51 40                  sub A, X
acf3:    16 17                  blt L_ad0c
acf5:    d3 53                  ld B, [0xad4a|+0x53]
acf7:    59                     sub B, A
acf8:    15 ea                  bnz L_ace4

L_acfa:
acfa:    95 48 02               ld A, [X + 0x02]
acfd:    d3 4b                  ld B, [0xad4a|+0x4b]
acff:    58                     add B, A
ad00:    f3 48                  st B, [0xad4a|+0x48]
ad02:    93 0f                  ld A, [R_ad13|0xad13|+0xf]
ad04:    f5 08 02               st B, [A + 0x02]
ad07:    9a                     ld A, [X]
ad08:    b5 a4                  st A, @[S]
ad0a:    73 d5                  jmp L_ace1

L_ad0c:
ad0c:    d5 48 02               ld B, [X + 0x02]
ad0f:    58                     add B, A
ad10:    15 d2                  bnz L_ace4
ad12:    68 00 00               st X, 0x0000
ad15:    73 e3                  jmp L_acfa

L_ad17:
ad17:    65 a1                  ld X, [S++]
ad19:    65 a1                  ld X, [S++]
ad1b:    7b 48                  call R_ad65
ad1d:    92 ab d8               ld A, @[R_abd8|0xabd8]
ad20:    c0 ff                  ld BL, 0xff
ad22:    e5 08 04               st BL, [A + 0x04]
ad25:    09                     ret

R_ad26:
ad26:    90 00 05               ld A, 0x0005
ad29:    51 20                  sub A, B
ad2b:    10 01                  bc L_ad2e
ad2d:    09                     ret

L_ad2e:
ad2e:    f3 1a                  st B, [0xad4a|+0x1a]
ad30:    6d a2                  st X, [--S]
ad32:    62 ab d8               ld X, @[R_abd8|0xabd8]
ad35:    95 48 02               ld A, [X + 0x02]
ad38:    59                     sub B, A
ad39:    16 27                  blt L_ad62
ad3b:    f3 19                  st B, [0xad56|+0x19]
ad3d:    90 00 05               ld A, 0x0005
ad40:    59                     sub B, A
ad41:    17 1f                  bp L_ad62
ad43:    6b ce                  st X, [R_ad13|0xad13|-0x32]
ad45:    9a                     ld A, [X]
ad46:    b2 ab d8               st A, @[R_abd8|0xabd8]
ad49:    90 00 00               ld A, 0x0000
ad4c:    b5 48 02               st A, [X + 0x02]
ad4f:    50 04                  add X, A
ad51:    7b 12                  call R_ad65
ad53:    6b be                  st X, [R_ad13|0xad13|-0x42]
ad55:    90 00 00               ld A, 0x0000
ad58:    b5 48 02               st A, [X + 0x02]
ad5b:    80 ff                  ld AL, 0xff
ad5d:    a5 48 04               st AL, [X + 0x04]
ad60:    7b 03                  call R_ad65

L_ad62:
ad62:    65 a1                  ld X, [S++]
ad64:    09                     ret

R_ad65:
ad65:    6d a2                  st X, [--S]
ad67:    60 ad c6               ld X, R_adc6|0xadc6
ad6a:    93 a7                  ld A, [R_ad13|0xad13|-0x59]
ad6c:    95 08 02               ld A, [A + 0x02]

L_ad6f:
ad6f:    da                     ld B, [X]
ad70:    14 0a                  bz L_ad7c
ad72:    d5 28 02               ld B, [B + 0x02]
ad75:    59                     sub B, A
ad76:    10 04                  bc L_ad7c
ad78:    65 40                  ld X, [X]
ad7a:    73 f3                  jmp L_ad6f

L_ad7c:
ad7c:    9a                     ld A, [X]
ad7d:    b4 94                  st A, @[R_ad13|0xad13|-0x6c]
ad7f:    93 92                  ld A, [R_ad13|0xad13|-0x6e]
ad81:    ba                     st A, [X]
ad82:    69 ab d8               st X, [R_abd8|0xabd8]
ad85:    65 a1                  ld X, [S++]
ad87:    09                     ret

R_ad88:
ad88:    6d a2                  st X, [--S]
ad8a:    a5 a2                  st AL, [--S]
ad8c:    c1 ab 12               ld BL, [R_ab12|0xab12]
ad8f:    49                     sub BL, AL
ad90:    e3 24                  st BL, [0xadb6|+0x24]
ad92:    15 05                  bnz L_ad99
ad94:    2a                     clr AL, #0
ad95:    29                     dec AL, #1
ad96:    a1 ab 12               st AL, [R_ab12|0xab12]

L_ad99:
ad99:    79 ab 11               call R_ab11

L_ad9c:
ad9c:    60 ad c6               ld X, R_adc6|0xadc6

L_ad9f:
ad9f:    69 ab d8               st X, [R_abd8|0xabd8]
ada2:    65 40                  ld X, [X]
ada4:    15 05                  bnz L_adab
ada6:    85 a1                  ld AL, [S++]
ada8:    65 a1                  ld X, [S++]
adaa:    09                     ret

L_adab:
adab:    85 48 04               ld AL, [X + 0x04]
adae:    cd                     ld BL, [S]
adaf:    49                     sub BL, AL
adb0:    14 0f                  bz L_adc1
adb2:    28                     inc AL, #1
adb3:    13 ea                  bnn L_ad9f
adb5:    c0 00                  ld BL, 0x00
adb7:    15 e6                  bnz L_ad9f
adb9:    d0 00 05               ld B, 0x0005
adbc:    79 ad 26               call R_ad26
adbf:    73 de                  jmp L_ad9f

L_adc1:
adc1:    79 ac cf               call R_accf
adc4:    73 d6                  jmp L_ad9c

R_adc6:
adc6:    00                     HALT
adc7:    00                     HALT

AbortHandler:
adc8:    55 ba af 96            mov S, Syscall_59|0xaf96	 ; Setup StackPointer
adcc:    55 82                  mov B, Z
adce:    32 80                  clr Z, #0
add0:    7b 03                  call AbortHandlerInner
add2:    0a                     reti
add3:    73 f3                  jmp AbortHandler

AbortHandlerInner:
add5:    2e 2c 00 af 83         wpf1 0x00, [R_af83|0xaf83]
adda:    7e 41                  push {X}
addc:    f1 af 43               st B, [R_af43|0xaf43]
addf:    a1 af 3e               st AL, [Abort_CD|0xaf3e]
ade2:    21 14                  dec AL, #5
ade4:    15 12                  bnz L_adf8
ade6:    91 01 03               ld A, [CurrentProcess|0x0103]
ade9:    14 0d                  bz L_adf8
adeb:    d5 08 19               ld B, [A + 0x19]
adee:    14 08                  bz L_adf8
adf0:    22 12                  clr AL, #2
adf2:    a5 28 06               st AL, [B + 0x06]
adf5:    71 ae e4               jmp R_aee4

L_adf8:
adf8:    2a                     clr AL, #0
adf9:    a1 af 42               st AL, [Abort_EAD|0xaf42]
adfc:    07                     rl
adfd:    55 c0                  mov A, C
adff:    36 00                  rrc A, #1
ae01:    34 0a                  srl A, #11
ae03:    a1 af 3d               st AL, [Abort_LVL|0xaf3d]
ae06:    25 13                  sll AL, #4
ae08:    20 1b                  inc AL, #12
ae0a:    a3 05                  st AL, [0xae11|+0x5]
ae0c:    20 11                  inc AL, #2
ae0e:    a3 09                  st AL, [0xae19|+0x9]
ae10:    e6 0c                  mov A, IL0(C)
ae12:    c0 07                  ld BL, 0x07
ae14:    4a                     and BL, AL
ae15:    e1 af 3f               st BL, [Abort_MAP|0xaf3f]
ae18:    e6 0e                  mov A, IL0(P)
ae1a:    b1 af 40               st A, [Abort_IAD|0xaf40]
ae1d:    81 af 3e               ld AL, [Abort_CD|0xaf3e]
ae20:    21 13                  dec AL, #4
ae22:    15 27                  bnz L_ae4b
ae24:    91 af 43               ld A, [R_af43|0xaf43]
ae27:    d0 07 ff               ld B, 0x07ff
ae2a:    5a                     and B, A
ae2b:    e1 af 44               st BL, [R_af44|0xaf44]
ae2e:    45 23                  mov BL, BH
ae30:    22 20                  clr BH, #0
ae32:    07                     rl
ae33:    36 00                  rrc A, #1
ae35:    34 09                  srl A, #10
ae37:    35 02                  sll A, #3
ae39:    a1 af 45               st AL, [R_af45|0xaf45]
ae3c:    2e 30 af 45 ae 44      rpf1 [R_af45|0xaf45], [R_ae44|0xae44]
ae42:    3a                     clr A, #0
ae43:    80 00                  ld AL, 0x00
ae45:    35 02                  sll A, #3
ae47:    58                     add B, A
ae48:    f1 af 42               st B, [Abort_EAD|0xaf42]

L_ae4b:
ae4b:    47 9c 01 c0 af 4b      memset 0x02, 0xc0, [AbortString_CD|0xaf4b]
ae51:    47 9c 01 c0 af 53      memset 0x02, 0xc0, [AbortString_LVL|0xaf53]
ae57:    47 9c 01 c0 af 5b      memset 0x02, 0xc0, [AbortString_MAP|0xaf5b]
ae5d:    47 9c 03 c0 af 63      memset 0x04, 0xc0, [AbortString_IAD|0xaf63]
ae63:    47 9c 05 c0 af 6d      memset 0x06, 0xc0, [AbortString_EAD|0xaf6d]
ae69:    80 06                  ld AL, 0x06
ae6b:    46 e2 90 af 6d af 42   baseconv(e, 2) [AbortString_EAD|0xaf6d], [Abort_EAD|0xaf42]
ae72:    80 04                  ld AL, 0x04
ae74:    46 e1 90 af 63 af 40   baseconv(e, 1) [AbortString_IAD|0xaf63], [Abort_IAD|0xaf40]
ae7b:    80 02                  ld AL, 0x02
ae7d:    46 e0 90 af 5b af 3f   baseconv(e, 0) [AbortString_MAP|0xaf5b], [Abort_MAP|0xaf3f]
ae84:    80 02                  ld AL, 0x02
ae86:    46 80 90 af 53 af 3d   baseconv(8, 0) [AbortString_LVL|0xaf53], [Abort_LVL|0xaf3d]
ae8d:    80 02                  ld AL, 0x02
ae8f:    46 80 90 af 4b af 3e   baseconv(8, 0) [AbortString_CD|0xaf4b], [Abort_CD|0xaf3e]
ae96:    81 af 3d               ld AL, [Abort_LVL|0xaf3d]
ae99:    15 05                  bnz L_aea0
ae9b:    61 01 03               ld X, [CurrentProcess|0x0103]
ae9e:    15 1a                  bnz L_aeba

L_aea0:
aea0:    3a                     clr A, #0
aea1:    81 01 3b               ld AL, [0x013b]
aea4:    3d                     sll A, #1
aea5:    d1 01 07               ld B, [0x0107]
aea8:    58                     add B, A
aea9:    65 20                  ld X, [B]
aeab:    91 af 40               ld A, [Abort_IAD|0xaf40]
aeae:    d1 01 1d               ld B, [0x011d]
aeb1:    59                     sub B, A
aeb2:    11 33                  bnc L_aee7
aeb4:    90 01 97               ld A, 0x0197
aeb7:    59                     sub B, A
aeb8:    19 2d                  ble L_aee7

L_aeba:
aeba:    d1 01 03               ld B, [CurrentProcess|0x0103]
aebd:    51 42                  sub B, X
aebf:    14 17                  bz L_aed8
aec1:    95 48 10               ld A, [X + 0x10]
aec4:    d5 48 0c               ld B, [X + 0x0c]
aec7:    59                     sub B, A
aec8:    17 06                  bp L_aed0
aeca:    d0 ae ed               ld B, R_aeed|0xaeed
aecd:    f8                     st B, [A]
aece:    73 12                  jmp L_aee2

L_aed0:
aed0:    83 6c                  ld AL, [Abort_CD|0xaf3e|+0x6c]
aed2:    21 13                  dec AL, #4
aed4:    14 11                  bz L_aee7
aed6:    73 0a                  jmp L_aee2

L_aed8:
aed8:    90 ae ed               ld A, R_aeed|0xaeed

L_aedb:
aedb:    32 c0                  clr C, #0
aedd:    d7 0e                  mov IL0(P), A	 ; Rewrite IL0's program counter to R_aeed
aedf:    3a                     clr A, #0
aee0:    d7 0c                  mov IL0(C), A	 ; clearing IL0's context register presumably also changes it's Page Table Base

L_aee2:
aee2:    6b 33                  st X, [0xaf17|+0x33]	 ; Patch ld A, #0x0000 at 0xaf16

R_aee4:
aee4:    7f 41                  pop {X}
aee6:    09                     ret

L_aee7:
aee7:    c6                     unknown
aee8:    90 af 03               ld A, R_af03|0xaf03
aeeb:    73 ee                  jmp L_aedb

R_aeed:
aeed:    91 01 03               ld A, [CurrentProcess|0x0103]
aef0:    95 08 0c               ld A, [A + 0x0c]
aef3:    14 01                  bz L_aef6
aef5:    5f                     mov S, A

L_aef6:
aef6:    80 01                  ld AL, 0x01
aef8:    a1 01 25               st AL, [0x0125]
aefb:    7b 19                  call L_af16
aefd:    3a                     clr A, #0
aefe:    39                     dec A, #1
aeff:    5d                     mov B, A
af00:    66 09                  jsys Syscall_Abort
af02:    21                         abort_code = (0x21)

R_af03:
af03:    55 ba af 96            mov S, Syscall_59|0xaf96
af07:    80 01                  ld AL, 0x01
af09:    a1 01 25               st AL, [0x0125]
af0c:    7b 08                  call L_af16
af0e:    79 b4 f8               call PrintStringToErrorDevice
af11:    af 74                      string = R_af74	 ; Opsys Aborted
af13:    05                     di

L_af14:
af14:    73 fe                  jmp L_af14

L_af16:
af16:    d0 00 00               ld B, 0x0000	 ; B should be SystemInfoPtr, 01ea
af19:    80 80                  ld AL, 0x80
af1b:    a3 16                  st AL, [AbortWriteStruct|0xaf33|+0x16]
af1d:    7e 81                  push {Z}
af1f:    7e 61                  push {Y}
af21:    7e 41                  push {X}
af23:    55 98 af 33            mov Z, AbortWriteStruct|0xaf33
af27:    95 28 08               ld A, [B + 0x08]	 ; Load error device (defaults to Device_CRT0)
af2a:    5b                     mov X, A
af2b:    95 48 05               ld A, [X + 0x05]	 ; Get DeviceObj
af2e:    95 08 0a               ld A, [A + 0x0a]	 ; Get Write function (default, CrtDevice_Write)
af31:    75 00                  jmp [A]	 ; tranfer execution to write funtion
                                       	 ; Problematic, becuase this abort function hasn't set Y at all
                                       	 ; and CrtDevice_Write does a lot with Y

AbortWriteStruct:
af33:    00                     (0x0)
af34:    82                     (0x82)
af35:    00                     (0x0)
af36:    02                     (0x2)
af37:    00                     (0x0)
af38:    00                     (0x0)
af39:    af 46                  AbortString	 ; Abort string
af3b:    <null bytes>


Abort_LVL:
af3d:    <null bytes>


Abort_CD:
af3e:    00                     (0x0)

Abort_MAP:
af3f:    00                     (0x0)

Abort_IAD:
af40:    00                     HALT
af41:    00                     HALT

Abort_EAD:
af42:    00                     HALT

R_af43:
af43:    00                     HALT

R_af44:
af44:    00                     HALT

R_af45:
af45:    00                     HALT

AbortString:
af46:    44, "CD:XX, LVL:XX, MAP:XX, IAD:XXXX, EAD:XXXXXX\r"

R_af74:
af74:    13, "OPSYS ABORTED"

R_af83:
af83:    0f                     rsys
af84:    <null bytes>


Syscall_59:
af96:    80 01                  ld AL, 0x01

L_af98:
af98:    d1 01 03               ld B, [CurrentProcess|0x0103]
af9b:    7b 01                  call R_af9e
af9d:    0f                     rsys

R_af9e:
af9e:    7e 63                  push {Y, Z}
afa0:    55 26                  mov Y, B
afa2:    f3 17                  st B, [0xafbb|+0x17]
afa4:    7b 31                  call R_afd7
afa6:    16 28                  blt L_afd0
afa8:    47 25 0f fd 60 46 60 46 memchr 0x10, 0xfd, [Y + 0x46], [Y + 0x46]
afb0:    13 07                  bnn L_afb9
afb2:    79 b0 a2               call R_b0a2

R_afb5:
afb5:    79 84 e4               call Syscall_Abort
afb8:    2c                         abort_code = (0x2c)

L_afb9:
afb9:    ac                     st AL, [Z]
afba:    90 00 00               ld A, 0x0000
afbd:    d0 df ff               ld B, 0xdfff
afc0:    c8                     ld BL, [A]
afc1:    42 23                  and BL, BH
afc3:    e8                     st BL, [A]
afc4:    46 11 0d 08 00 00      addbig(1, 1) 0x08, [A + 0x00]
afca:    0c                     unknown
afcb:    5e                     mov Z, A
afcc:    79 86 f5               call R_86f5
afcf:    3a                     clr A, #0

L_afd0:
afd0:    7f 63                  pop {Y, Z}
afd2:    5d                     mov B, A
afd3:    09                     ret

Syscall_5e:
afd4:    2a                     clr AL, #0
afd5:    73 c1                  jmp L_af98

R_afd7:
afd7:    a3 16                  st AL, [0xafef|+0x16]
afd9:    7e 63                  push {Y, Z}

L_afdb:
afdb:    90 01 44               ld A, 0x0144
afde:    47 12 00 b1 80 00      unkblk1 0x01, [R_b180|0xb180], [A]
afe4:    31 80                  dec Z, #1
afe6:    51 80                  sub A, Z
afe8:    51 12 00 10            sub B, A, 0x0010
afec:    18 0d                  bgt L_affb
afee:    80 00                  ld AL, 0x00
aff0:    14 05                  bz L_aff7
aff2:    79 b0 c5               call R_b0c5
aff5:    73 e4                  jmp L_afdb

L_aff7:
aff7:    3a                     clr A, #0
aff8:    3b                     not A, #0
aff9:    73 13                  jmp L_b00e

L_affb:
affb:    cc                     ld BL, [Z]
affc:    25 12                  sll AL, #3
affe:    29                     dec AL, #1

L_afff:
afff:    28                     inc AL, #1
b000:    20 00                  inc AH, #1
b002:    25 30                  sll BL, #1
b004:    10 f9                  bc L_afff

L_b006:
b006:    06                     sl
b007:    26 30                  rrc BL, #1
b009:    21 00                  dec AH, #1
b00b:    18 f9                  bgt L_b006
b00d:    ec                     st BL, [Z]

L_b00e:
b00e:    7f 63                  pop {Y, Z}
b010:    5d                     mov B, A
b011:    09                     ret

Syscall_63:
b012:    7e 45                  push {X, Y, Z}
b014:    d6 89 b0 50            st Z, [R_b050|0xb050]
b018:    b3 1e                  st A, [0xb038|+0x1e]
b01a:    79 88 05               call R_8805
b01d:    89                     ld AL, [B]
b01e:    21 11                  dec AL, #2
b020:    14 0d                  bz L_b02f
b022:    79 84 e4               call Syscall_Abort
b025:    09                         abort_code = (0x9)

Syscall_5a:
b026:    7e 45                  push {X, Y, Z}
b028:    b3 0e                  st A, [0xb038|+0xe]
b02a:    91 01 03               ld A, [CurrentProcess|0x0103]
b02d:    b3 21                  st A, [R_b050|0xb050|+0x21]

L_b02f:
b02f:    55 a0                  mov A, S
b031:    55 ba 82 ac            mov S, R_82ac|0x82ac
b035:    b5 a2                  st A, [--S]
b037:    90 00 00               ld A, 0x0000
b03a:    78 10 08 00            mul A, A, 0x0800
b03e:    55 00                  mov A, A
b040:    14 02                  bz L_b044
b042:    30 20                  inc B, #1

L_b044:
b044:    90 00 10               ld A, 0x0010
b047:    51 20                  sub A, B
b049:    a3 3b                  st AL, [0xb086|+0x3b]
b04b:    16 14                  blt L_b061
b04d:    55 26                  mov Y, B
b04f:    90 00 00               ld A, 0x0000
b052:    d5 08 0c               ld B, [A + 0x0c]
b055:    78 32 08 00            mul B, B, 0x0800
b059:    30 20                  inc B, #1
b05b:    51 26                  sub Y, B
b05d:    14 26                  bz L_b085
b05f:    17 03                  bp L_b064

L_b061:
b061:    71 af b5               jmp R_afb5

L_b064:
b064:    55 64                  mov X, Y
b066:    47 25 0f fd 00 46 00 46 memchr 0x10, 0xfd, [A + 0x46], [A + 0x46]
b06e:    55 46                  mov Y, X

L_b070:
b070:    46 11 1d 08 00 00      subbig(1, 1) 0x08, [A + 0x00]
b076:    0c                     unknown
b077:    3f                     dec X
b078:    18 f6                  bgt L_b070

L_b07a:
b07a:    85 82                  ld AL, [--Z]
b07c:    7b 24                  call R_b0a2
b07e:    80 fd                  ld AL, 0xfd
b080:    ac                     st AL, [Z]
b081:    31 60                  dec Y, #1
b083:    18 f5                  bgt L_b07a

L_b085:
b085:    80 00                  ld AL, 0x00
b087:    15 13                  bnz L_b09c
b089:    79 88 05               call R_8805
b08c:    89                     ld AL, [B]
b08d:    21 11                  dec AL, #2
b08f:    15 d0                  bnz L_b061
b091:    93 bd                  ld A, [R_b050|0xb050|-0x43]
b093:    32 20                  clr B, #0
b095:    e8                     st BL, [A]
b096:    f1 01 25               st B, [0x0125]
b099:    79 86 12               call Yield

L_b09c:
b09c:    95 a1                  ld A, [S++]
b09e:    5f                     mov S, A
b09f:    7f 45                  pop {X, Y, Z}
b0a1:    0f                     rsys

R_b0a2:
b0a2:    22 00                  clr AH, #0
b0a4:    6d a2                  st X, [--S]
b0a6:    78 10 00 08            mul A, A, 0x0008
b0aa:    a3 04                  st AL, [0xb0b0|+0x4]
b0ac:    90 01 00               ld A, 0x0100
b0af:    36 01                  rrc A, #2
b0b1:    45 10                  mov AH, AL
b0b3:    2b                     not AL, #0
b0b4:    50 34 01 44            add X, B, 0x0144
b0b8:    ca                     ld BL, [X]
b0b9:    42 30                  and AH, BL
b0bb:    15 03                  bnz L_b0c0
b0bd:    71 af b5               jmp R_afb5

L_b0c0:
b0c0:    4a                     and BL, AL
b0c1:    ea                     st BL, [X]
b0c2:    65 a1                  ld X, [S++]
b0c4:    09                     ret

R_b0c5:
b0c5:    7e 63                  push {Y, Z}
b0c7:    55 67 01 03            mov Y, [CurrentProcess|0x0103]
b0cb:    8b                     ld AL, [Y]
b0cc:    c0 10                  ld BL, 0x10
b0ce:    4a                     and BL, AL
b0cf:    15 06                  bnz L_b0d7
b0d1:    55 42                  mov B, X
b0d3:    79 84 e4               call Syscall_Abort
b0d6:    2e                         abort_code = (0x2e)

L_b0d7:
b0d7:    c0 ff                  ld BL, 0xff
b0d9:    e3 58                  st BL, [0xb133|+0x58]
b0db:    c0 20                  ld BL, 0x20
b0dd:    43 13                  or BL, AL
b0df:    eb                     st BL, [Y]
b0e0:    55 67 01 07            mov Y, [0x0107]
b0e4:    83 59                  ld AL, [0xb13f|+0x59]
b0e6:    14 03                  bz L_b0eb
b0e8:    2a                     clr AL, #0
b0e9:    a3 65                  st AL, [0xb150|+0x65]

L_b0eb:
b0eb:    95 61                  ld A, [Y++]
b0ed:    14 43                  bz L_b132
b0ef:    5e                     mov Z, A
b0f0:    8c                     ld AL, [Z]
b0f1:    c0 01                  ld BL, 0x01
b0f3:    4a                     and BL, AL
b0f4:    14 f5                  bz L_b0eb
b0f6:    95 88 08               ld A, [Z + 0x08]
b0f9:    c5 08 13               ld BL, [A + 0x13]
b0fc:    80 80                  ld AL, 0x80
b0fe:    4a                     and BL, AL
b0ff:    15 20                  bnz L_b121
b101:    d0 08 04               ld B, 0x0804
b104:    c5 88 12               ld BL, [Z + 0x12]
b107:    42 23                  and BL, BH
b109:    15 13                  bnz L_b11e
b10b:    32 90 00 34            clr [Z + 0x0034], #0
b10f:    32 90 00 32            clr [Z + 0x0032], #0
b113:    8c                     ld AL, [Z]
b114:    c0 80                  ld BL, 0x80
b116:    43 13                  or BL, AL
b118:    80 fb                  ld AL, 0xfb
b11a:    4a                     and BL, AL
b11b:    ec                     st BL, [Z]
b11c:    73 54                  jmp L_b172

L_b11e:
b11e:    2a                     clr AL, #0
b11f:    a3 12                  st AL, [0xb133|+0x12]

L_b121:
b121:    8c                     ld AL, [Z]
b122:    c0 20                  ld BL, 0x20
b124:    4a                     and BL, AL
b125:    14 4b                  bz L_b172
b127:    83 16                  ld AL, [0xb13f|+0x16]
b129:    14 c0                  bz L_b0eb
b12b:    83 23                  ld AL, [0xb150|+0x23]
b12d:    28                     inc AL, #1
b12e:    a3 20                  st AL, [0xb150|+0x20]
b130:    73 b9                  jmp L_b0eb

L_b132:
b132:    80 ff                  ld AL, 0xff
b134:    14 04                  bz L_b13a
b136:    79 84 e4               call Syscall_Abort
b139:    31                         abort_code = (0x31)

L_b13a:
b13a:    55 67 01 03            mov Y, [CurrentProcess|0x0103]
b13e:    80 ff                  ld AL, 0xff
b140:    15 0d                  bnz L_b14f
b142:    80 00                  ld AL, 0x00
b144:    15 14                  bnz L_b15a
b146:    79 b4 3f               call R_b43f
b149:    b1 7c 55               st A, [0x7c55]
b14c:    00                     HALT
b14d:    15 2a                  bnz L_b179

L_b14f:
b14f:    80 00                  ld AL, 0x00
b151:    a3 f0                  st AL, [0xb143|-0x10]
b153:    79 b4 38               call R_b438
b156:    b1 7c 00               st A, [0x7c00]
b159:    64 2a                  ld X, @[0xb185|+0x2a]
b15b:    a3 e2                  st AL, [0xb13f|-0x1e]
b15d:    95 68 08               ld A, [Y + 0x08]
b160:    d0 80 bb               ld B, R_80bb|0x80bb
b163:    79 8b 00               call R_8b00
b166:    79 85 fa               call FlushFn
b169:    80 bb                      fileop = R_80bb
b16b:    83 d6                  ld AL, [0xb143|-0x2a]
b16d:    29                     dec AL, #1
b16e:    a3 d3                  st AL, [0xb143|-0x2d]
b170:    73 07                  jmp L_b179

L_b172:
b172:    2a                     clr AL, #0
b173:    29                     dec AL, #1
b174:    a3 c9                  st AL, [0xb13f|-0x37]
b176:    79 86 12               call Yield

L_b179:
b179:    7f 63                  pop {Y, Z}
b17b:    09                     ret

R_b17c:
b17c:    00                     HALT
b17d:    00                     HALT
b17e:    00                     HALT
b17f:    00                     HALT

R_b180:
b180:    ff                     st B, [P]
b181:    ff                     st B, [P]
b182:    ff                     st B, [P]
b183:    ff                     st B, [P]
b184:    ff                     st B, [P]
b185:    ff                     st B, [P]
b186:    ff                     st B, [P]
b187:    ff                     st B, [P]
b188:    ff                     st B, [P]
b189:    ff                     st B, [P]
b18a:    ff                     st B, [P]
b18b:    ff                     st B, [P]
b18c:    ff                     st B, [P]
b18d:    ff                     st B, [P]
b18e:    ff                     st B, [P]
b18f:    ff                     st B, [P]
b190:    00                     HALT

Syscall_5c:
b191:    7e 43                  push {X, Y}
b193:    3a                     clr A, #0
b194:    85 41                  ld AL, [X++]
b196:    14 25                  bz L_b1bd
b198:    39                     dec A, #1
b199:    14 2d                  bz L_b1c8
b19b:    39                     dec A, #1
b19c:    14 02                  bz L_b1a0
b19e:    73 69                  jmp R_b209

L_b1a0:
b1a0:    90 b3 26               ld A, R_b326|0xb326
b1a3:    79 b2 6b               call R_b26b
b1a6:    d0 01 00               ld B, 0x0100

L_b1a9:
b1a9:    50 32 00 00            add B, B, 0x0000
b1ad:    79 b2 cb               call R_b2cb
b1b0:    5b                     mov X, A

R_b1b1:
b1b1:    90 00 00               ld A, 0x0000
b1b4:    39                     dec A, #1
b1b5:    67 4a 24               memcpy A, [B], [X]
b1b8:    7f 43                  pop {X, Y}
b1ba:    30 44                  inc X, #5
b1bc:    0f                     rsys

L_b1bd:
b1bd:    90 b3 30               ld A, R_b330|0xb330
b1c0:    79 b2 6b               call R_b26b
b1c3:    d1 01 03               ld B, [CurrentProcess|0x0103]
b1c6:    73 e1                  jmp L_b1a9

L_b1c8:
b1c8:    85 41                  ld AL, [X++]
b1ca:    b3 e6                  st A, [R_b1b2|0xb1b2|-0x1a]
b1cc:    85 41                  ld AL, [X++]
b1ce:    b3 db                  st A, [R_b1ab|0xb1ab|-0x25]
b1d0:    50 01 b1 b2            add A, A, [R_b1b2|0xb1b2]
b1d4:    39                     dec A, #1
b1d5:    5c                     mov Y, A
b1d6:    79 8a a6               call LookupDeviceInstance
b1d9:    b3 2a                  st A, [0xb205|+0x2a]
b1db:    32 20                  clr B, #0
b1dd:    c5 08 01               ld BL, [A + 0x01]
b1e0:    31 21                  dec B, #2
b1e2:    14 12                  bz L_b1f6
b1e4:    31 21                  dec B, #2
b1e6:    14 16                  bz L_b1fe
b1e8:    c8                     ld BL, [A]
b1e9:    80 80                  ld AL, 0x80
b1eb:    4a                     and BL, AL
b1ec:    15 08                  bnz L_b1f6
b1ee:    51 76 00 0f            sub Y, Y, 0x000f
b1f2:    16 15                  blt R_b209
b1f4:    73 0e                  jmp L_b204

L_b1f6:
b1f6:    51 76 00 1d            sub Y, Y, 0x001d
b1fa:    16 0d                  blt R_b209
b1fc:    73 06                  jmp L_b204

L_b1fe:
b1fe:    51 76 00 16            sub Y, Y, 0x0016
b202:    16 05                  blt R_b209

L_b204:
b204:    d0 00 00               ld B, 0x0000
b207:    73 a0                  jmp L_b1a9

R_b209:
b209:    7f 43                  pop {X, Y}
b20b:    d5 48 01               ld B, [X + 0x01]
b20e:    55 40                  mov A, X
b210:    79 84 e4               call Syscall_Abort
b213:    15                         abort_code = (0x15)

Syscall_5d:
b214:    7e 43                  push {X, Y}
b216:    3a                     clr A, #0
b217:    85 41                  ld AL, [X++]
b219:    14 05                  bz L_b220
b21b:    39                     dec A, #1
b21c:    14 15                  bz L_b233
b21e:    73 e9                  jmp R_b209

L_b220:
b220:    90 b3 38               ld A, R_b338|0xb338
b223:    7b 46                  call R_b26b
b225:    79 b2 cb               call R_b2cb
b228:    5d                     mov B, A
b229:    61 01 03               ld X, [CurrentProcess|0x0103]
b22c:    50 45 b1 ab            add X, X, [R_b1ab|0xb1ab]
b230:    71 b1 b1               jmp R_b1b1

L_b233:
b233:    79 8a a6               call LookupDeviceInstance
b236:    b3 23                  st A, [0xb25b|+0x23]
b238:    32 20                  clr B, #0
b23a:    c5 08 01               ld BL, [A + 0x01]
b23d:    31 21                  dec B, #2
b23f:    14 23                  bz L_b264
b241:    c8                     ld BL, [A]
b242:    80 80                  ld AL, 0x80
b244:    4a                     and BL, AL
b245:    15 1d                  bnz L_b264
b247:    3a                     clr A, #0
b248:    85 41                  ld AL, [X++]
b24a:    b1 b1 b2               st A, [R_b1b2|0xb1b2]
b24d:    39                     dec A, #1
b24e:    18 b9                  bgt R_b209
b250:    85 41                  ld AL, [X++]
b252:    15 b5                  bnz R_b209
b254:    b1 b1 ab               st A, [R_b1ab|0xb1ab]

L_b257:
b257:    7b 72                  call R_b2cb
b259:    5d                     mov B, A
b25a:    60 00 00               ld X, 0x0000
b25d:    50 45 b1 ab            add X, X, [R_b1ab|0xb1ab]
b261:    71 b1 b1               jmp R_b1b1

L_b264:
b264:    90 b3 40               ld A, R_b340|0xb340
b267:    7b 02                  call R_b26b
b269:    73 ec                  jmp L_b257

R_b26b:
b26b:    5c                     mov Y, A
b26c:    6b 58                  st X, [0xb2c6|+0x58]
b26e:    65 a1                  ld X, [S++]
b270:    3a                     clr A, #0
b271:    85 48 01               ld AL, [X + 0x01]
b274:    b1 b1 ab               st A, [R_b1ab|0xb1ab]
b277:    78 10 00 08            mul A, A, 0x0008
b27b:    b3 24                  st A, [0xb2a1|+0x24]
b27d:    f3 1f                  st B, [0xb29e|+0x1f]
b27f:    85 41                  ld AL, [X++]
b281:    14 45                  bz L_b2c8
b283:    b1 b1 b2               st A, [R_b1b2|0xb1b2]
b286:    3e                     inc X
b287:    6b 3a                  st X, [0xb2c3|+0x3a]
b289:    78 10 00 08            mul A, A, 0x0008
b28d:    50 62                  add B, Y
b28f:    50 23 b1 ab            add B, B, [R_b1ab|0xb1ab]
b293:    3a                     clr A, #0
b294:    8b                     ld AL, [Y]
b295:    50 60                  add A, Y
b297:    59                     sub B, A
b298:    16 2e                  blt L_b2c8
b29a:    30 60                  inc Y, #1
b29c:    50 76 00 00            add Y, Y, 0x0000
b2a0:    d0 00 00               ld B, 0x0000
b2a3:    95 61                  ld A, [Y++]

L_b2a5:
b2a5:    31 20                  dec B, #1
b2a7:    16 04                  blt L_b2ad
b2a9:    07                     rl
b2aa:    3d                     sll A, #1
b2ab:    73 f8                  jmp L_b2a5

L_b2ad:
b2ad:    d1 b1 b2               ld B, [R_b1b2|0xb1b2]

L_b2b0:
b2b0:    60 00 10               ld X, 0x0010

L_b2b3:
b2b3:    31 20                  dec B, #1
b2b5:    16 0b                  blt L_b2c2
b2b7:    07                     rl
b2b8:    3d                     sll A, #1
b2b9:    10 0d                  bc L_b2c8
b2bb:    3f                     dec X
b2bc:    18 f5                  bgt L_b2b3
b2be:    95 61                  ld A, [Y++]
b2c0:    73 ee                  jmp L_b2b0

L_b2c2:
b2c2:    60 00 00               ld X, 0x0000
b2c5:    71 00 00               jmp L_0000

L_b2c8:
b2c8:    71 b2 09               jmp R_b209

R_b2cb:
b2cb:    95 a4                  ld A, @[S]
b2cd:    30 b1 00 00            inc [S + 0x0000], #2

AssertIsSystemPtr:
    ; Checks if A is a pointer within the kernel memory range (0x8000 to 0xefff)
    ; Aborts if not
b2d1:    f3 1d                  st B, [0xb2f0|+0x1d]
b2d3:    51 12 7f ff            sub B, A, 0x7fff
b2d7:    11 0d                  bnc L_b2e6	 ; Check A is below 0x8000

L_b2d9:
b2d9:    dd                     ld B, [S]
b2da:    51 32 7f ff            sub B, B, 0x7fff
b2de:    17 06                  bp L_b2e6
b2e0:    5d                     mov B, A
b2e1:    9d                     ld A, [S]
b2e2:    79 84 e4               call Syscall_Abort
b2e5:    17                         abort_code = (0x17)

L_b2e6:
b2e6:    d1 01 03               ld B, [CurrentProcess|0x0103]
b2e9:    d5 28 0c               ld B, [B + 0x0c]	 ; SystemInfo_TopOfMemory
b2ec:    59                     sub B, A
b2ed:    10 ea                  bc L_b2d9	 ; A is above 0xefff
b2ef:    d0 00 00               ld B, 0x0000
b2f2:    09                     ret

Syscall_69:
b2f3:    7e 23                  push {B, X}
b2f5:    5d                     mov B, A
b2f6:    14 12                  bz L_b30a
b2f8:    61 01 54               ld X, [0x0154]

L_b2fb:
b2fb:    95 41                  ld A, [X++]
b2fd:    38                     inc A, #1
b2fe:    14 20                  bz L_b320
b300:    39                     dec A, #1
b301:    51 20                  sub A, B
b303:    14 04                  bz L_b309
b305:    30 41                  inc X, #2
b307:    73 f2                  jmp L_b2fb

L_b309:
b309:    9a                     ld A, [X]

L_b30a:
b30a:    dd                     ld B, [S]
b30b:    bd                     st A, [S]
b30c:    79 8a a6               call LookupDeviceInstance
b30f:    d0 80 00               ld B, 0x8000
b312:    c8                     ld BL, [A]
b313:    42 23                  and BL, BH
b315:    14 09                  bz L_b320
b317:    dd                     ld B, [S]
b318:    f5 08 1b               st B, [A + 0x1b]
b31b:    7f 23                  pop {B, X}
b31d:    3a                     clr A, #0
b31e:    5d                     mov B, A
b31f:    0f                     rsys

L_b320:
b320:    7f 23                  pop {B, X}
b322:    3a                     clr A, #0
b323:    39                     dec A, #1
b324:    5d                     mov B, A
b325:    0f                     rsys

R_b326:
b326:    42 f9                  and ZL, PL
b328:    ff                     st B, [P]
b329:    83 ff                  ld AL, [0xb32a|-0x1]
b32b:    ff                     st B, [P]
b32c:    ff                     st B, [P]
b32d:    ff                     st B, [P]
b32e:    8f                     ld AL, [P]
b32f:    ff                     st B, [P]

R_b330:
b330:    33 2c                  not B, #12
b332:    00                     HALT
b333:    d0 00 00               ld B, 0x0000
b336:    7f bf                  unknown_push

R_b338:
b338:    33 6f                  not Y, #15
b33a:    ff                     st B, [P]
b33b:    f3 9f                  st B, [0xb2dc|-0x61]
b33d:    ff                     st B, [P]
b33e:    ff                     st B, [P]
b33f:    bf                     st A, [P]

R_b340:
b340:    1d 7f                  bs4 L_b3c1
b342:    ff                     st B, [P]
b343:    fe                     st B, [C]
b344:    bf                     st A, [P]

Syscall_5f:
b345:    7e 43                  push {X, Y}
b347:    7b 13                  call L_b35c
b349:    47 4a 09 26            memcpy 0x0a, [B], [Y]

L_b34d:
b34d:    7f 43                  pop {X, Y}
b34f:    30 42                  inc X, #3
b351:    0f                     rsys

Syscall_60:
b352:    7e 43                  push {X, Y}
b354:    7b 06                  call L_b35c
b356:    47 4a 09 62            memcpy 0x0a, [Y], [B]
b35a:    73 f1                  jmp L_b34d

L_b35c:
b35c:    6b 27                  st X, [0xb385|+0x27]
b35e:    65 a1                  ld X, [S++]
b360:    32 20                  clr B, #0
b362:    c5 41                  ld BL, [X++]
b364:    20 30                  inc BL, #1
b366:    14 1f                  bz L_b387
b368:    21 30                  dec BL, #1
b36a:    16 2b                  blt L_b397
b36c:    79 b2 cb               call R_b2cb
b36f:    5c                     mov Y, A
b370:    61 01 03               ld X, [CurrentProcess|0x0103]
b373:    3a                     clr A, #0
b374:    85 48 16               ld AL, [X + 0x16]
b377:    51 20                  sub A, B
b379:    18 1c                  bgt L_b397
b37b:    65 48 17               ld X, [X + 0x17]
b37e:    77 32 00 0a            div B, B, 0x000a
b382:    50 42                  add B, X

L_b384:
b384:    71 00 00               jmp L_0000

L_b387:
b387:    79 b2 cb               call R_b2cb
b38a:    5c                     mov Y, A
b38b:    61 01 03               ld X, [CurrentProcess|0x0103]
b38e:    65 48 17               ld X, [X + 0x17]
b391:    31 49                  dec X, #10
b393:    55 42                  mov B, X
b395:    73 ed                  jmp L_b384

L_b397:
b397:    7f 43                  pop {X, Y}
b399:    32 20                  clr B, #0
b39b:    ca                     ld BL, [X]
b39c:    55 40                  mov A, X
b39e:    79 84 e4               call Syscall_Abort
b3a1:    2d                         abort_code = (0x2d)

Syscall_1b:
b3a2:    7b 20                  call R_b3c4
b3a4:    79 88 05               call R_8805
b3a7:    89                     ld AL, [B]
b3a8:    21 11                  dec AL, #2
b3aa:    14 05                  bz L_b3b1
b3ac:    79 b2 cb               call R_b2cb
b3af:    73 02                  jmp L_b3b3

L_b3b1:
b3b1:    95 41                  ld A, [X++]

L_b3b3:
b3b3:    47 42 03 b4 12 00      memcpy 0x04, [R_b412|0xb412], [A]
b3b9:    0f                     rsys

Syscall_15:
b3ba:    79 b3 c4               call R_b3c4
b3bd:    91 b4 12               ld A, [R_b412|0xb412]
b3c0:    d1 'Q'

L_b3c1:
b3c1:    b4 14                  st A, @[0xb3d7|+0x14]
b3c3:    0f                     rsys

R_b3c4:
b3c4:    c6                     unknown
b3c5:    e6 a4                  mov A, IL10(X)
b3c7:    b3 49                  st A, [R_b412|0xb412|+0x49]
b3c9:    e6 a6                  mov A, IL10(Y)
b3cb:    b3 47                  st A, [R_b414|0xb414|+0x47]
b3cd:    e6 a8                  mov A, IL10(Z)
b3cf:    b6                     unknown
b3d0:    a3 0d                  st AL, [0xb3df|+0xd]
b3d2:    91 00 5a               ld A, [0x005a]
b3d5:    85 08 60               ld AL, [A + 0x60]
b3d8:    22 00                  clr AH, #0
b3da:    b3 3a                  st A, [R_b416|0xb416|+0x3a]
b3dc:    46 01 1c 00 b4 16      subbig(0, 1) 0x00, [R_b416|0xb416]
b3e2:    46 01 6c 06 b4 16      unkbig6(0, 1) 0x06, [R_b416|0xb416]
b3e8:    46 13 00 b4 16 b4 12   addbig(1, 3) [R_b416|0xb416], [R_b412|0xb412]
b3ef:    09                     ret

Syscall_1c:
b3f0:    55 60                  mov A, Y
b3f2:    b5 a2                  st A, [--S]
b3f4:    95 41                  ld A, [X++]
b3f6:    5c                     mov Y, A
b3f7:    79 88 05               call R_8805
b3fa:    89                     ld AL, [B]
b3fb:    21 11                  dec AL, #2
b3fd:    14 05                  bz L_b404
b3ff:    55 60                  mov A, Y
b401:    79 b2 d1               call AssertIsSystemPtr

L_b404:
b404:    47 42 07 01 30 06      memcpy 0x08, [0x0130], [Y]
b40a:    2a                     clr AL, #0
b40b:    a5 68 08               st AL, [Y + 0x08]
b40e:    95 a1                  ld A, [S++]
b410:    5c                     mov Y, A
b411:    0f                     rsys

R_b412:
b412:    00                     HALT
b413:    00                     HALT

R_b414:
b414:    00                     HALT
b415:    00                     HALT

R_b416:
b416:    00                     HALT
b417:    00                     HALT

Syscall_1d:
b418:    85 41                  ld AL, [X++]
b41a:    a5 a2                  st AL, [--S]
b41c:    95 41                  ld A, [X++]
b41e:    79 b4 38               call R_b438
b421:    85 a1                  ld AL, [S++]
b423:    14 01                  bz L_b426
b425:    0f                     rsys

L_b426:
b426:    91 01 03               ld A, [CurrentProcess|0x0103]
b429:    d0 04 00               ld B, 0x0400
b42c:    c8                     ld BL, [A]
b42d:    43 23                  or BL, BH
b42f:    e8                     st BL, [A]
b430:    79 86 12               call Yield
b433:    0f                     rsys

Syscall_4b:
b434:    79 b4 3f               call R_b43f
b437:    0f                     rsys

R_b438:
b438:    d1 01 03               ld B, [CurrentProcess|0x0103]
b43b:    b5 28 32               st A, [B + 0x32]
b43e:    09                     ret

R_b43f:
b43f:    91 01 03               ld A, [CurrentProcess|0x0103]
b442:    95 08 32               ld A, [A + 0x32]
b445:    09                     ret

InitLevel10Device:
b446:    90 b4 61               ld A, Level10_InterruptHandler|0xb461
b449:    d7 ae                  mov IL10(P), A
b44b:    90 b4 56               ld A, R_b456|0xb456	 ; Setup stack at the end of this Init function
                                                   	 ; We don't need it anymore, so overwrite it
b44e:    d7 aa                  mov IL10(S), A
b450:    90 00 ff               ld A, 0x00ff
b453:    d7 a8                  mov IL10(Z), A
b455:    09                     ret

R_b456:
b456:    91 00 5a               ld A, [0x005a]
b459:    85 08 60               ld AL, [A + 0x60]
b45c:    40 19                  add ZL, AL
b45e:    16 16                  blt L_b476
b460:    0a                     reti

Level10_InterruptHandler:
    ; I suspect this is the timer interrupt
    ; So this is probally doing process switching
b461:    81 01 41               ld AL, [0x0141]
b464:    14 0d                  bz L_b473
b466:    80 f0                  ld AL, 0xf0
b468:    42 c1                  and AL, CH
b46a:    15 07                  bnz L_b473
b46c:    32 20                  clr B, #0
b46e:    80 08                  ld AL, 0x08
b470:    79 ad d5               call AbortHandlerInner	 ; Not entirely sure that this is an abort

L_b473:
b473:    29                     dec AL, #1	 ; Decrement Timeslice counter
b474:    a4 ec                  st AL, @[0xb462|-0x14]	 ; store at 0x0141

L_b476:
b476:    50 76 00 0a            add Y, Y, 0x000a
b47a:    11 01                  bnc L_b47d
b47c:    3e                     inc X

L_b47d:
b47d:    7b 04                  call L_b483
b47f:    7b 55                  call L_b4d6
b481:    73 d3                  jmp R_b456

L_b483:
    ; Update Clock
b483:    6d a2                  st X, [--S]
b485:    91 01 36               ld A, [0x0136]
b488:    60 b6 b0               ld X, 0xb6b0
b48b:    7b 31                  call L_b4be
b48d:    b1 01 36               st A, [0x0136]
b490:    93 41                  ld A, [0xb4d3|+0x41]
b492:    15 27                  bnz L_b4bb
b494:    91 01 33               ld A, [0x0133]
b497:    7b 25                  call L_b4be
b499:    b1 01 33               st A, [0x0133]
b49c:    93 35                  ld A, [0xb4d3|+0x35]
b49e:    15 1b                  bnz L_b4bb
b4a0:    91 01 30               ld A, [0x0130]
b4a3:    60 b2 b4               ld X, 0xb2b4
b4a6:    7b 16                  call L_b4be
b4a8:    b1 01 30               st A, [0x0130]
b4ab:    93 26                  ld A, [0xb4d3|+0x26]
b4ad:    15 0c                  bnz L_b4bb
b4af:    3a                     clr A, #0
b4b0:    b5 a8 02               st A, [S + 0x02]
b4b3:    5c                     mov Y, A
b4b4:    91 86 2e               ld A, [R_862e|0x862e]
b4b7:    38                     inc A, #1
b4b8:    b1 86 2e               st A, [R_862e|0x862e]

L_b4bb:
b4bb:    65 a1                  ld X, [S++]
b4bd:    09                     ret

L_b4be:
b4be:    38                     inc A, #1
b4bf:    c0 b9                  ld BL, 0xb9
b4c1:    49                     sub BL, AL
b4c2:    19 05                  ble L_b4c9
b4c4:    d0 00 f6               ld B, 0x00f6
b4c7:    50 20                  add A, B

L_b4c9:
b4c9:    dd                     ld B, [S]	 ; X before call
b4ca:    59                     sub B, A
b4cb:    16 05                  blt L_b4d2
b4cd:    90 b0 b0               ld A, 0xb0b0
b4d0:    32 20                  clr B, #0

L_b4d2:
b4d2:    f0 00 00               st B, 0x0000
b4d5:    09                     ret

L_b4d6:
b4d6:    6b 1d                  st X, [0xb4f5|+0x1d]
b4d8:    61 01 07               ld X, [0x0107]

L_b4db:
b4db:    95 41                  ld A, [X++]
b4dd:    14 15                  bz L_b4f4
b4df:    d5 08 32               ld B, [A + 0x32]
b4e2:    14 f7                  bz L_b4db
b4e4:    31 20                  dec B, #1
b4e6:    f5 08 32               st B, [A + 0x32]
b4e9:    15 f0                  bnz L_b4db
b4eb:    d0 fb ff               ld B, 0xfbff
b4ee:    c8                     ld BL, [A]
b4ef:    42 23                  and BL, BH
b4f1:    e8                     st BL, [A]
b4f2:    73 e7                  jmp L_b4db

L_b4f4:
b4f4:    60 00 00               ld X, 0x0000
b4f7:    09                     ret

PrintStringToErrorDevice:
    ; Is hardcoded to assume Error device is a mux port
b4f8:    91 01 03               ld A, [CurrentProcess|0x0103]
b4fb:    15 03                  bnz R_b500
b4fd:    92 01 07               ld A, @[0x0107]

R_b500:
b500:    d5 41                  ld B, [X++]	 ; B = string
b502:    7e 45                  push {X, Y, Z}
b504:    65 21                  ld X, [B++]
b506:    95 08 08               ld A, [A + 0x08]	 ; Error device
b509:    55 17 00 0f            mov Y, [A + 0x000f]	 ; MMIO address 0xf200

L_b50d:
b50d:    55 98 01 f4            mov Z, 0x01f4
b511:    3f                     dec X
b512:    16 28                  blt L_b53c

L_b514:
b514:    31 80                  dec Z, #1
b516:    14 24                  bz L_b53c
b518:    f6 16 00               ld AL, +0x0(Y)
b51b:    52 10 00 02            and A, A, 0x0002
b51f:    54 10 00 02            xor A, A, 0x0002
b523:    15 ef                  bnz L_b514	 ; Wait for UART to be ready
b525:    80 8d                  ld AL, 0x8d
b527:    45 10                  mov AH, AL
b529:    85 21                  ld AL, [B++]
b52b:    41 10                  sub AH, AL
b52d:    15 08                  bnz L_b537
b52f:    80 8a                  ld AL, 0x8a
b531:    f6 17 01               st AL, +0x1(Y)
b534:    0e                     dly
b535:    80 8d                  ld AL, 0x8d

L_b537:
b537:    f6 17 01               st AL, +0x1(Y)
b53a:    73 d1                  jmp L_b50d

L_b53c:
b53c:    7f 45                  pop {X, Y, Z}
b53e:    09                     ret

Syscall_divide:
b53f:    77 20                  div A, B
b541:    0f                     rsys
b542:    77
b543:    20
b544:    09

Syscall_multiply:
b545:    78 20                  mul A, B
b547:    0f                     rsys
b548:    78
b549:    20
b54a:    09

Syscall_2e:
b54b:    95 41                  ld A, [X++]
b54d:    d5 41                  ld B, [X++]
b54f:    7b 05                  call L_b556
b551:    0f                     rsys
b552:    95
b553:    41

R_b554:
b554:    d5 41                  ld B, [X++]

L_b556:
b556:    30 20                  inc B, #1
b558:    7e 43                  push {X, Y}
b55a:    55 24                  mov X, B
b55c:    47 9c 05 c0 b5 93      memset 0x06, 0xc0, [R_b593|0xb593]
b562:    c0 a3                  ld BL, 0xa3
b564:    e3 31                  st BL, [0xb597|+0x31]
b566:    c0 a0                  ld BL, 0xa0
b568:    b3 2f                  st A, [R_b599|0xb599|+0x2f]
b56a:    17 06                  bp L_b572
b56c:    33 11 b5 99            not [R_b599|0xb599], #1
b570:    c0 ad                  ld BL, 0xad

L_b572:
b572:    e5 a2                  st BL, [--S]
b574:    80 06                  ld AL, 0x06
b576:    46 81 90 b5 93 b5 99   baseconv(8, 1) [R_b593|0xb593], [R_b599|0xb599]
b57d:    22 30                  clr BL, #0
b57f:    e8                     st BL, [A]
b580:    55 76 b5 99            mov Y, R_b599|0xb599

L_b584:
b584:    85 62                  ld AL, [--Y]
b586:    14 04                  bz L_b58c
b588:    a5 42                  st AL, [--X]
b58a:    73 f8                  jmp L_b584

L_b58c:
b58c:    c5 a1                  ld BL, [S++]
b58e:    e5 42                  st BL, [--X]
b590:    7f 43                  pop {X, Y}
b592:    09                     ret

R_b593:
b593:    00                     HALT
b594:    00                     HALT
b595:    00                     HALT
b596:    00                     HALT
b597:    00                     HALT
b598:    00                     HALT

R_b599:
b599:    00                     HALT
b59a:    00                     HALT

Syscall_4c:
b59b:    55 40                  mov A, X
b59d:    51 10 7f ff            sub A, A, 0x7fff
b5a1:    17 03                  bp L_b5a6
b5a3:    79 83 a7               call R_83a7

L_b5a6:
b5a6:    d5 41                  ld B, [X++]
b5a8:    95 41                  ld A, [X++]
b5aa:    b3 0d                  st A, [0xb5b9|+0xd]
b5ac:    f3 0d                  st B, [0xb5bb|+0xd]
b5ae:    47 48 05 40 b5 bd      memcpy 0x06, [X], [R_b5bd|0xb5bd]
b5b4:    30 45                  inc X, #6
b5b6:    79 b5 f2               call R_b5f2
b5b9:    00 00                      arg1 = L_0000
b5bb:    00 00                      arg2 = L_0000

R_b5bd:
b5bd:    ff                         arg3 = (0xff)
b5be:    00 00                      arg4 = L_0000
b5c0:    00 00                      arg5 = L_0000
b5c2:    00                         arg6 = (0x0)
b5c3:    0f                     rsys

Syscall_14:
b5c4:    79 b6 41               call R_b641
b5c7:    0f                     rsys

Syscall_55:
b5c8:    7e 63                  push {Y, Z}
b5ca:    55 00                  mov A, A
b5cc:    15 03                  bnz L_b5d1
b5ce:    79 8a a6               call LookupDeviceInstance

L_b5d1:
b5d1:    d5 41                  ld B, [X++]
b5d3:    55 28                  mov Z, B
b5d5:    79 b6 3c               call R_b63c
b5d8:    7f 63                  pop {Y, Z}
b5da:    0f                     rsys

Syscall_23:
b5db:    79 cd a8               call R_cda8
b5de:    0f                     rsys

Syscall_53:
b5df:    79 83 a7               call R_83a7
b5e2:    79 85 b9               call R_85b9
b5e5:    1f                         arg1 = (0x1f)
b5e6:    9a                     ld A, [X]
b5e7:    95 08 05               ld A, [A + 0x05]
b5ea:    50 10 00 0e            add A, A, 0x000e
b5ee:    79 80 42               call R_8042
b5f1:    0f                     rsys

R_b5f2:
b5f2:    7e 61                  push {Y}
b5f4:    95 41                  ld A, [X++]
b5f6:    d5 41                  ld B, [X++]
b5f8:    f5 a2                  st B, [--S]
b5fa:    b5 a2                  st A, [--S]
b5fc:    85 41                  ld AL, [X++]
b5fe:    79 cd a8               call R_cda8
b601:    15 03                  bnz L_b606
b603:    66 09                  jsys Syscall_Abort
b605:    06                         abort_code = (0x6)

L_b606:
b606:    85 68 13               ld AL, [Y + 0x13]
b609:    a5 a2                  st AL, [--S]
b60b:    95 41                  ld A, [X++]
b60d:    b5 a2                  st A, [--S]
b60f:    95 41                  ld A, [X++]
b611:    b5 a2                  st A, [--S]
b613:    85 41                  ld AL, [X++]
b615:    c0 80                  ld BL, 0x80
b617:    4a                     and BL, AL
b618:    14 02                  bz L_b61c
b61a:    c0 01                  ld BL, 0x01

L_b61c:
b61c:    e5 a2                  st BL, [--S]
b61e:    c0 7f                  ld BL, 0x7f
b620:    42 31                  and AL, BL
b622:    a5 a2                  st AL, [--S]
b624:    21 11                  dec AL, #2
b626:    19 03                  ble L_b62b
b628:    66 09                  jsys Syscall_Abort
b62a:    08                         abort_code = (0x8)

L_b62b:
b62b:    80 04                  ld AL, 0x04

L_b62d:
b62d:    a5 a2                  st AL, [--S]
b62f:    66 06                  jsys Syscall_06
b631:    1f                         arg1 = (0x1f)
b632:    d6 67 01 3f            st Y, [0x013f]
b636:    3a                     clr A, #0
b637:    85 a1                  ld AL, [S++]
b639:    71 80 3b               jmp R_803b

R_b63c:
b63c:    5c                     mov Y, A
b63d:    80 07                  ld AL, 0x07
b63f:    73 ec                  jmp L_b62d

R_b641:
b641:    79 cd a8               call R_cda8
b644:    15 02                  bnz L_b648
b646:    5d                     mov B, A
b647:    09                     ret

L_b648:
b648:    80 05                  ld AL, 0x05
b64a:    73 e1                  jmp L_b62d

R_b64c:
b64c:    91 01 3f               ld A, [0x013f]
b64f:    5c                     mov Y, A
b650:    90 00 06               ld A, 0x0006
b653:    71 80 3b               jmp R_803b

R_b656:
b656:    73 1a                  jmp L_b672
b658:    02
b659:    88
b65a:    02
b65b:    95
b65c:    01
b65d:    81
b65e:    01
b65f:    98
b660:    01
b661:    99
b662:    05
b663:    9b
b664:    03
b665:    86
b666:    04
b667:    9a
b668:    02
b669:    ff
b66a:    02
b66b:    df '_'
b66c:    df '_'
b66d:    9f
b66e:    8d
b66f:    9d
b670:    00
b671:    00

L_b672:
b672:    6d a2                  st X, [--S]
b674:    65 88 06               ld X, [Z + 0x06]
b677:    30 41                  inc X, #2
b679:    9a                     ld A, [X]
b67a:    d0 9b b1               ld B, 0x9bb1

L_b67d:
b67d:    59                     sub B, A
b67e:    15 2a                  bnz L_b6aa

L_b680:
b680:    91 00 5a               ld A, [0x005a]
b683:    95 08 5e               ld A, [A + 0x5e]
b686:    c5 08 0b               ld BL, [A + 0x0b]
b689:    14 04                  bz L_b68f
b68b:    66 07                  jsys Syscall_Yield
b68d:    73 f1                  jmp L_b680

L_b68f:
b68f:    21 30                  dec BL, #1
b691:    e5 08 0b               st BL, [A + 0x0b]
b694:    85 48 03               ld AL, [X + 0x03]
b697:    c0 9f                  ld BL, 0x9f
b699:    48                     add BL, AL
b69a:    e3 15                  st BL, [0xb6b1|+0x15]
b69c:    85 48 02               ld AL, [X + 0x02]
b69f:    c0 9f                  ld BL, 0x9f
b6a1:    48                     add BL, AL
b6a2:    e3 0e                  st BL, [0xb6b2|+0xe]
b6a4:    90 b6 ad               ld A, R_b6ad|0xb6ad
b6a7:    b5 88 06               st A, [Z + 0x06]

L_b6aa:
b6aa:    65 a1                  ld X, [S++]
b6ac:    09                     ret

R_b6ad:
b6ad:    00                     HALT
b6ae:    05                     di
b6af:    9b                     ld A, [Y]
b6b0:    d9                     ld B, [B]
b6b1:    00                     HALT
b6b2:    00                     HALT
b6b3:    ff                     st B, [P]

R_b6b4:
b6b4:    00                     HALT
b6b5:    00                     HALT

HawkDeviceObj:
b6b6:    00 06                  (0x6)
b6b8:    cc ed                  R_cced
b6ba:    cc 49                  R_cc49
b6bc:    cc 79                  R_cc79
b6be:    b6 ca                  R_b6ca
b6c0:    b8 63                  R_b863
b6c2:    b8 7b                  R_b87b
b6c4:    b8 8b                  HawkDevice_Init
b6c6:    cb ca                  R_cbca
b6c8:    b5 4b                  Syscall_2e

R_b6ca:
b6ca:    7f 01                  pop {A}
b6cc:    b1 b8 5b               st A, [R_b85b|0xb85b]
b6cf:    85 a1                  ld AL, [S++]
b6d1:    a1 b7 a4               st AL, [R_b7a4|0xb7a4]
b6d4:    85 a1                  ld AL, [S++]
b6d6:    a1 b7 d7               st AL, [R_b7d7|0xb7d7]
b6d9:    d5 a1                  ld B, [S++]
b6db:    f1 b7 ab               st B, [R_b7ab|0xb7ab]
b6de:    d5 a1                  ld B, [S++]
b6e0:    f1 b7 a5               st B, [R_b7a5|0xb7a5]
b6e3:    85 a1                  ld AL, [S++]
b6e5:    a1 b7 a3               st AL, [R_b7a3|0xb7a3]
b6e8:    85 68 02               ld AL, [Y + 0x02]
b6eb:    a1 b7 b3               st AL, [R_b7b3|0xb7b3]
b6ee:    95 a1                  ld A, [S++]
b6f0:    b1 b7 a1               st A, [R_b7a1|0xb7a1]
b6f3:    95 68 0f               ld A, [Y + 0x0f]
b6f6:    d7 28                  mov IL2(Z), A
b6f8:    f6 31 0f               st BL, +0xf(A)
b6fb:    95 a1                  ld A, [S++]
b6fd:    b1 b7 a7               st A, [R_b7a7|0xb7a7]
b700:    91 01 03               ld A, [CurrentProcess|0x0103]
b703:    2e 0d fa 00 36         wpf 0xfa, [A + 0x36]
b708:    2e 0c 7a 01 81         wpf 0x7a, [PageTableTwo|0x0181]
b70d:    c0 02                  ld BL, 0x02
b70f:    2f 28                  ld_isr B
b711:    6d a2                  st X, [--S]

R_b713:
b713:    91 b7 a5               ld A, [R_b7a5|0xb7a5]
b716:    b1 b7 a9               st A, [R_b7a9|0xb7a9]
b719:    d1 b7 a1               ld B, [R_b7a1|0xb7a1]
b71c:    79 cd 67               call R_cd67
b71f:    55 20                  mov A, B
b721:    39                     dec A, #1
b722:    b3 17                  st A, [0xb73b|+0x17]
b724:    90 00 1f               ld A, 0x001f
b727:    5a                     and B, A
b728:    38                     inc A, #1
b729:    59                     sub B, A
b72a:    55 24                  mov X, B
b72c:    93 79                  ld A, [R_b7a7|0xb7a7|+0x79]
b72e:    b3 7d                  st A, [R_b7ad|0xb7ad|+0x7d]

L_b730:
b730:    93 77                  ld A, [R_b7a9|0xb7a9|+0x77]
b732:    d3 6d                  ld B, [R_b7a1|0xb7a1|+0x6d]
b734:    79 cd 67               call R_cd67
b737:    79 cd 02               call R_cd02
b73a:    90 00 00               ld A, 0x0000
b73d:    38                     inc A, #1
b73e:    b3 fb                  st A, [0xb73b|-0x5]
b740:    51 20                  sub A, B
b742:    15 70                  bnz L_b7b4
b744:    f3 6b                  st B, [R_b7b1|0xb7b1|+0x6b]
b746:    93 61                  ld A, [R_b7a9|0xb7a9|+0x61]
b748:    38                     inc A, #1
b749:    b3 5e                  st A, [R_b7a9|0xb7a9|+0x5e]
b74b:    93 60                  ld A, [R_b7ad|0xb7ad|+0x60]
b74d:    d0 01 90               ld B, 0x0190
b750:    59                     sub B, A
b751:    f3 5a                  st B, [R_b7ad|0xb7ad|+0x5a]
b753:    14 06                  bz L_b75b
b755:    11 04                  bnc L_b75b
b757:    3f                     dec X
b758:    18 d6                  bgt L_b730

L_b75a:
b75a:    06                     sl

L_b75b:
b75b:    93 4a                  ld A, [R_b7a7|0xb7a7|+0x4a]
b75d:    d3 4e                  ld B, [R_b7ad|0xb7ad|+0x4e]
b75f:    10 02                  bc L_b763
b761:    32 20                  clr B, #0

L_b763:
b763:    59                     sub B, A
b764:    f3 47                  st B, [R_b7ad|0xb7ad|+0x47]
b766:    93 41                  ld A, [R_b7a9|0xb7a9|+0x41]
b768:    d3 3b                  ld B, [R_b7a5|0xb7a5|+0x3b]
b76a:    59                     sub B, A
b76b:    f3 42                  st B, [R_b7af|0xb7af|+0x42]
b76d:    93 36                  ld A, [R_b7a5|0xb7a5|+0x36]
b76f:    d3 30                  ld B, [R_b7a1|0xb7a1|+0x30]
b771:    79 cd 67               call R_cd67
b774:    f3 33                  st B, [R_b7a9|0xb7a9|+0x33]
b776:    16 20                  blt L_b798
b778:    2a                     clr AL, #0
b779:    a1 b8 08               st AL, [R_b808|0xb808]
b77c:    95 68 11               ld A, [Y + 0x11]
b77f:    35 03                  sll A, #4
b781:    32 20                  clr B, #0
b783:    c5 68 16               ld BL, [Y + 0x16]
b786:    78 32 00 03            mul B, B, 0x0003
b78a:    58                     add B, A
b78b:    30 21                  inc B, #2
b78d:    55 20                  mov A, B
b78f:    d3 18                  ld B, [R_b7a9|0xb7a9|+0x18]
b791:    50 23 b7 af            add B, B, [R_b7af|0xb7af]
b795:    59                     sub B, A
b796:    10 3e                  bc R_b7d6

L_b798:
b798:    93 0f                  ld A, [R_b7a9|0xb7a9|+0xf]
b79a:    d0 ff ff               ld B, 0xffff
b79d:    c0 05                  ld BL, 0x05
b79f:    66 6b                  jsys Syscall_AbortAL

R_b7a1:
b7a1:    <null bytes>


R_b7a3:
b7a3:    <null bytes>


R_b7a4:
b7a4:    <null bytes>


R_b7a5:
b7a5:    <null bytes>


R_b7a7:
b7a7:    <null bytes>


R_b7a9:
b7a9:    <null bytes>


R_b7ab:
b7ab:    00                     HALT
b7ac:    00                     HALT

R_b7ad:
b7ad:    00                     HALT
b7ae:    00                     HALT

R_b7af:
b7af:    00                     HALT
b7b0:    00                     HALT

R_b7b1:
b7b1:    00                     HALT
b7b2:    00                     HALT

R_b7b3:
b7b3:    00                     HALT

L_b7b4:
b7b4:    f3 08                  st B, [0xb7be|+0x8]
b7b6:    93 f1                  ld A, [R_b7a9|0xb7a9|-0xf]
b7b8:    d3 eb                  ld B, [R_b7a5|0xb7a5|-0x15]
b7ba:    59                     sub B, A
b7bb:    15 9d                  bnz L_b75a
b7bd:    90 00 00               ld A, 0x0000
b7c0:    b3 e7                  st A, [R_b7a9|0xb7a9|-0x19]
b7c2:    b3 ed                  st A, [R_b7b1|0xb7b1|-0x13]
b7c4:    90 00 01               ld A, 0x0001
b7c7:    b3 e6                  st A, [R_b7af|0xb7af|-0x1a]
b7c9:    93 dc                  ld A, [R_b7a7|0xb7a7|-0x24]
b7cb:    d0 01 90               ld B, 0x0190
b7ce:    59                     sub B, A
b7cf:    11 05                  bnc R_b7d6
b7d1:    90 01 90               ld A, 0x0190
b7d4:    b3 d7                  st A, [R_b7ad|0xb7ad|-0x29]

R_b7d6:
b7d6:    80 00                  ld AL, 0x00
b7d8:    15 02                  bnz L_b7dc
b7da:    80 0d                  ld AL, 0x0d

L_b7dc:
b7dc:    a1 b9 49               st AL, [R_b949|0xb949]
b7df:    a3 23                  st AL, [R_b804|0xb804|+0x23]
b7e1:    90 b9 3c               ld A, R_b93c|0xb93c
b7e4:    d7 2e                  mov IL2(P), A
b7e6:    85 68 0f               ld AL, [Y + 0x0f]
b7e9:    c0 0c                  ld BL, 0x0c
b7eb:    42 31                  and AL, BL
b7ed:    25 11                  sll AL, #2
b7ef:    c0 04                  ld BL, 0x04
b7f1:    48                     add BL, AL
b7f2:    e3 01                  st BL, [0xb7f5|+0x1]
b7f4:    2f 04                  ld_dma_mode A
b7f6:    2f 06                  enable_dma
b7f8:    e6 28                  mov A, IL2(Z)
b7fa:    f6 11 0e               st AL, +0xe(A)
b7fd:    f6 11 0c               st AL, +0xc(A)
b800:    79 cc 80               call R_cc80

L_b803:
b803:    c0 00                  ld BL, 0x00
b805:    16 19                  blt L_b820
b807:    80 00                  ld AL, 0x00
b809:    14 07                  bz L_b812
b80b:    83 ca                  ld AL, [R_b7d7|0xb7d7|-0x36]
b80d:    15 36                  bnz L_b845
b80f:    71 bb 4f               jmp R_bb4f

L_b812:
b812:    79 cc 89               call R_cc89
b815:    14 ec                  bz L_b803
b817:    3a                     clr A, #0
b818:    83 99                  ld AL, [R_b7b3|0xb7b3|-0x67]
b81a:    d3 8d                  ld B, [R_b7a9|0xb7a9|-0x73]
b81c:    c0 1d                  ld BL, 0x1d
b81e:    66 6b                  jsys Syscall_AbortAL

L_b820:
b820:    79 cc 97               call R_cc97
b823:    93 8a                  ld A, [R_b7af|0xb7af|-0x76]
b825:    d1 b7 a5               ld B, [R_b7a5|0xb7a5]
b828:    58                     add B, A
b829:    f1 b7 a5               st B, [R_b7a5|0xb7a5]
b82c:    91 b7 ad               ld A, [R_b7ad|0xb7ad]
b82f:    d1 b7 ab               ld B, [R_b7ab|0xb7ab]
b832:    58                     add B, A
b833:    f1 b7 ab               st B, [R_b7ab|0xb7ab]
b836:    d1 b7 a7               ld B, [R_b7a7|0xb7a7]
b839:    51 20                  sub A, B
b83b:    b1 b7 a7               st A, [R_b7a7|0xb7a7]
b83e:    14 05                  bz L_b845
b840:    11 03                  bnc L_b845
b842:    71 b7 13               jmp R_b713

L_b845:
b845:    79 cc 97               call R_cc97
b848:    c0 ff                  ld BL, 0xff
b84a:    e1 01 1f               st BL, [0x011f]
b84d:    65 a1                  ld X, [S++]
b84f:    95 a1                  ld A, [S++]
b851:    5c                     mov Y, A
b852:    3a                     clr A, #0
b853:    c3 b3                  ld BL, [R_b808|0xb808|-0x4d]
b855:    14 03                  bz L_b85a
b857:    91 ba 6e               ld A, [R_ba6e|0xba6e]

L_b85a:
b85a:    d0 00 00               ld B, 0x0000
b85d:    7e 21                  push {B}
b85f:    d1 ba 68               ld B, [R_ba68|0xba68]
b862:    09                     ret

R_b863:
b863:    2a                     clr AL, #0
b864:    29                     dec AL, #1
b865:    a1 01 1f               st AL, [0x011f]
b868:    d5 68 0f               ld B, [Y + 0x0f]
b86b:    85 68 13               ld AL, [Y + 0x13]
b86e:    f6 13 00               st AL, +0x0(B)
b871:    f6 02 04               ld AH, +0x4(B)
b874:    d0 00 90               ld B, 0x0090
b877:    5a                     and B, A
b878:    35 20                  sll B, #1
b87a:    09                     ret

R_b87b:
b87b:    2a                     clr AL, #0
b87c:    29                     dec AL, #1
b87d:    a4 e7                  st AL, @[0xb866|-0x19]
b87f:    c1 b8 04               ld BL, [R_b804|0xb804]
b882:    16 06                  blt L_b88a
b884:    95 68 0f               ld A, [Y + 0x0f]
b887:    f6 31 0b               st BL, +0xb(A)

L_b88a:
b88a:    09                     ret

HawkDevice_Init:
b88b:    7e 45                  push {X, Y, Z}
b88d:    65 a8 08               ld X, [S + 0x08]
b890:    91 01 03               ld A, [CurrentProcess|0x0103]
b893:    2e 0d fa 00 36         wpf 0xfa, [A + 0x36]
b898:    2e 0c 7a 01 81         wpf 0x7a, [PageTableTwo|0x0181]
b89d:    c0 02                  ld BL, 0x02
b89f:    2f 28                  ld_isr B
b8a1:    95 41                  ld A, [X++]
b8a3:    5c                     mov Y, A
b8a4:    b1 01 3f               st A, [0x013f]
b8a7:    95 68 0f               ld A, [Y + 0x0f]
b8aa:    d7 28                  mov IL2(Z), A
b8ac:    f6 11 0f               st AL, +0xf(A)
b8af:    95 41                  ld A, [X++]
b8b1:    b1 b7 a9               st A, [R_b7a9|0xb7a9]
b8b4:    b1 b7 a5               st A, [R_b7a5|0xb7a5]
b8b7:    95 41                  ld A, [X++]
b8b9:    b1 b7 ad               st A, [R_b7ad|0xb7ad]
b8bc:    b1 b7 a7               st A, [R_b7a7|0xb7a7]
b8bf:    78 10 01 90            mul A, A, 0x0190
b8c3:    55 00                  mov A, A
b8c5:    14 02                  bz L_b8c9
b8c7:    30 20                  inc B, #1

L_b8c9:
b8c9:    f1 b7 af               st B, [R_b7af|0xb7af]
b8cc:    91 b7 a9               ld A, [R_b7a9|0xb7a9]
b8cf:    39                     dec A, #1
b8d0:    58                     add B, A
b8d1:    f1 b7 b1               st B, [R_b7b1|0xb7b1]
b8d4:    95 41                  ld A, [X++]
b8d6:    b1 b7 ab               st A, [R_b7ab|0xb7ab]
b8d9:    85 68 02               ld AL, [Y + 0x02]
b8dc:    a1 b7 b3               st AL, [R_b7b3|0xb7b3]
b8df:    85 68 13               ld AL, [Y + 0x13]
b8e2:    a1 b7 a3               st AL, [R_b7a3|0xb7a3]
b8e5:    85 41                  ld AL, [X++]
b8e7:    6b 30                  st X, [0xb919|+0x30]
b8e9:    20 12                  inc AL, #3
b8eb:    a1 b7 a4               st AL, [R_b7a4|0xb7a4]
b8ee:    21 12                  dec AL, #3
b8f0:    15 05                  bnz L_b8f7
b8f2:    32 01                  clr A, #1
b8f4:    a1 b7 d7               st AL, [R_b7d7|0xb7d7]

L_b8f7:
b8f7:    3a                     clr A, #0
b8f8:    a1 b8 08               st AL, [R_b808|0xb808]
b8fb:    55 60                  mov A, Y
b8fd:    b5 a2                  st A, [--S]
b8ff:    b5 a2                  st A, [--S]
b901:    90 b9 09               ld A, R_b909|0xb909
b904:    b5 a2                  st A, [--S]
b906:    71 b7 d6               jmp R_b7d6

R_b909:
b909:    b5 a2                  st A, [--S]
b90b:    52 10 a0 00            and A, A, 0xa000
b90f:    14 03                  bz L_b914
b911:    71 bb 4f               jmp R_bb4f

L_b914:
b914:    95 a1                  ld A, [S++]
b916:    30 a1                  inc S, #2
b918:    60 00 00               ld X, 0x0000
b91b:    ba                     st A, [X]
b91c:    7f 45                  pop {X, Y, Z}
b91e:    30 ba 00 02            inc [S + 0x0002], #11
b922:    09                     ret

L_b923:
b923:    79 bb 3f               call R_bb3f
b926:    bb                     st A, [Y]
b927:    e3 80                  st BL, [0xb8a9|-0x80]
b929:    ff                     st B, [P]
b92a:    a1 b8 04               st AL, [R_b804|0xb804]

R_b92d:
b92d:    2a                     clr AL, #0
b92e:    f6 19 03               st AL, +0x3(Z)
b931:    f6 19 0d               st AL, +0xd(Z)
b934:    2f 07                  st_ A
b936:    f6 19 0f               st AL, +0xf(Z)
b939:    0a                     reti
b93a:    73 f1                  jmp R_b92d

R_b93c:
b93c:    f6 19 0f               st AL, +0xf(Z)
b93f:    f6 19 0e               st AL, +0xe(Z)
b942:    32 40                  clr X, #0
b944:    90 bc 5c               ld A, FfcDeviceObj|0xbc5c
b947:    5f                     mov S, A
b948:    80

R_b949:
b949:    00                     HALT
b94a:    29                     dec AL, #1
b94b:    a3 fc                  st AL, [R_b949|0xb949|-0x4]
b94d:    16 d4                  blt L_b923
b94f:    81 b7 a3               ld AL, [R_b7a3|0xb7a3]
b952:    f6 19 00               st AL, +0x0(Z)
b955:    91 b7 a9               ld A, [R_b7a9|0xb7a9]
b958:    f6 09 01               st AH, +0x1(Z)
b95b:    79 ba 55               call R_ba55
b95e:    79 ba 42               call R_ba42
b961:    d0 04 00               ld B, 0x0400
b964:    5a                     and B, A
b965:    14 03                  bz L_b96a

L_b967:
b967:    71 ba 11               jmp R_ba11

L_b96a:
b96a:    d0 00 20               ld B, 0x0020
b96d:    5a                     and B, A
b96e:    15 03                  bnz L_b973
b970:    79 ba 1f               call R_ba1f

L_b973:
b973:    80 02                  ld AL, 0x02
b975:    f6 19 08               st AL, +0x8(Z)
b978:    79 ba 1f               call R_ba1f
b97b:    79 ba 42               call R_ba42
b97e:    d0 04 00               ld B, 0x0400
b981:    5a                     and B, A
b982:    15 e3                  bnz L_b967
b984:    d0 00 20               ld B, 0x0020
b987:    5a                     and B, A
b988:    14 dd                  bz L_b967
b98a:    81 b7 a4               ld AL, [R_b7a4|0xb7a4]
b98d:    14 78                  bz L_ba07
b98f:    29                     dec AL, #1
b990:    14 55                  bz L_b9e7
b992:    29                     dec AL, #1
b993:    14 05                  bz L_b99a
b995:    29                     dec AL, #1
b996:    14 5e                  bz L_b9f6
b998:    73 31                  jmp L_b9cb

L_b99a:
b99a:    81 b7 a3               ld AL, [R_b7a3|0xb7a3]
b99d:    79 ba 37               call R_ba37
b9a0:    e0 00                  st BL, 0x00
b9a2:    23 30                  not BL, #0
b9a4:    f6 39 03               st BL, +0x3(Z)
b9a7:    79 ba 42               call R_ba42
b9aa:    d0 00 40               ld B, 0x0040
b9ad:    5a                     and B, A
b9ae:    15 5a                  bnz L_ba0a
b9b0:    83 ef                  ld AL, [0xb9a1|-0x11]
b9b2:    f6 19 03               st AL, +0x3(Z)
b9b5:    79 ba 42               call R_ba42
b9b8:    d0 00 40               ld B, 0x0040
b9bb:    5a                     and B, A
b9bc:    14 4c                  bz L_ba0a
b9be:    d0 00 80               ld B, 0x0080
b9c1:    5a                     and B, A
b9c2:    14 03                  bz L_b9c7
b9c4:    71 ba d5               jmp R_bad5

L_b9c7:
b9c7:    80 01                  ld AL, 0x01
b9c9:    73 1c                  jmp L_b9e7

L_b9cb:
b9cb:    7b 75                  call R_ba42
b9cd:    d0 00 80               ld B, 0x0080
b9d0:    5a                     and B, A
b9d1:    14 03                  bz L_b9d6
b9d3:    71 ba d5               jmp R_bad5

L_b9d6:
b9d6:    7b 7d                  call R_ba55
b9d8:    81 b7 a3               ld AL, [R_b7a3|0xb7a3]
b9db:    7b 5a                  call R_ba37
b9dd:    f6 39 03               st BL, +0x3(Z)
b9e0:    80 06                  ld AL, 0x06
b9e2:    f6 19 08               st AL, +0x8(Z)
b9e5:    80 05                  ld AL, 0x05

L_b9e7:
b9e7:    f6 19 08               st AL, +0x8(Z)
b9ea:    79 ba 73               call R_ba73
b9ed:    81 b7 a4               ld AL, [R_b7a4|0xb7a4]
b9f0:    29                     dec AL, #1
b9f1:    14 14                  bz L_ba07
b9f3:    29                     dec AL, #1
b9f4:    15 11                  bnz L_ba07

L_b9f6:
b9f6:    7b 5d                  call R_ba55
b9f8:    7b 48                  call R_ba42
b9fa:    91 b7 a9               ld A, [R_b7a9|0xb7a9]
b9fd:    f6 09 01               st AH, +0x1(Z)
ba00:    80 04                  ld AL, 0x04
ba02:    f6 19 08               st AL, +0x8(Z)
ba05:    7b 6c                  call R_ba73

L_ba07:
ba07:    71 b9 28               jmp R_b928

L_ba0a:
ba0a:    7b 58                  call L_ba64
ba0c:    79 bb 3f               call R_bb3f
ba0f:    bb                     st A, [Y]
ba10:    e9                     st BL, [B]

R_ba11:
ba11:    7b 51                  call L_ba64
ba13:    7b 2d                  call R_ba42
ba15:    80 03                  ld AL, 0x03
ba17:    f6 19 08               st AL, +0x8(Z)
ba1a:    7b 03                  call R_ba1f
ba1c:    71 ba cd               jmp R_bacd

R_ba1f:
ba1f:    55 46                  mov Y, X
ba21:    65 a1                  ld X, [S++]

L_ba23:
ba23:    0a                     reti
ba24:    f6 19 0f               st AL, +0xf(Z)
ba27:    7b 19                  call R_ba42
ba29:    81 b7 a3               ld AL, [R_b7a3|0xb7a3]
ba2c:    2c                     srl AL, #1
ba2d:    7b 08                  call R_ba37
ba2f:    f6 08 04               ld AH, +0x4(Z)
ba32:    4a                     and BL, AL
ba33:    14 ee                  bz L_ba23
ba35:    75 60                  jmp [Y]

R_ba37:
ba37:    c0 01                  ld BL, 0x01
ba39:    73 03                  jmp L_ba3e

L_ba3b:
ba3b:    07                     rl
ba3c:    27 30                  rlc BL, #1

L_ba3e:
ba3e:    29                     dec AL, #1
ba3f:    17 fa                  bp L_ba3b
ba41:    09                     ret

R_ba42:
ba42:    f6 08 04               ld AH, +0x4(Z)
ba45:    d0 02 00               ld B, 0x0200
ba48:    5a                     and B, A
ba49:    15 26                  bnz L_ba71
ba4b:    d0 00 10               ld B, 0x0010
ba4e:    5a                     and B, A
ba4f:    15 03                  bnz L_ba54
ba51:    71 bb 27               jmp R_bb27

L_ba54:
ba54:    09                     ret

R_ba55:
ba55:    91 b7 ad               ld A, [R_b7ad|0xb7ad]
ba58:    3b                     not A, #0
ba59:    2f 02                  ld_dma_count A
ba5b:    d1 b7 ab               ld B, [R_b7ab|0xb7ab]
ba5e:    2f 20                  ld_dma_addr B
ba60:    59                     sub B, A
ba61:    f3 51                  st B, [0xbab4|+0x51]
ba63:    09                     ret

L_ba64:
ba64:    f6 28 01               ld BH, +0x1(Z)
ba67:    f0 00 00               st B, 0x0000
ba6a:    f6 28 04               ld BH, +0x4(Z)
ba6d:    f0 00 00               st B, 0x0000
ba70:    09                     ret

L_ba71:
ba71:    73 7e                  jmp L_baf1

R_ba73:
ba73:    55 46                  mov Y, X
ba75:    65 a1                  ld X, [S++]

L_ba77:
ba77:    3a                     clr A, #0
ba78:    d7 12                  mov IL1(B), A
ba7a:    0a                     reti
ba7b:    f6 19 0f               st AL, +0xf(Z)
ba7e:    e6 12                  mov A, IL1(B)
ba80:    5d                     mov B, A
ba81:    14 09                  bz L_ba8c
ba83:    7b df                  call L_ba64
ba85:    b3 e7                  st A, [R_ba6e|0xba6e|-0x19]
ba87:    79 bb 3f               call R_bb3f
ba8a:    bc                     st A, [Z]
ba8b:    2a                     clr AL, #0

L_ba8c:
ba8c:    7b b4                  call R_ba42
ba8e:    d0 01 00               ld B, 0x0100
ba91:    5a                     and B, A
ba92:    15 e3                  bnz L_ba77
ba94:    d0 f0 00               ld B, 0xf000
ba97:    5a                     and B, A
ba98:    14 09                  bz L_baa3
ba9a:    d0 20 00               ld B, 0x2000
ba9d:    5a                     and B, A
ba9e:    14 2b                  bz L_bacb
baa0:    71 ba 11               jmp R_ba11

L_baa3:
baa3:    f6 08 01               ld AH, +0x1(Z)
baa6:    d1 b7 b1               ld B, [R_b7b1|0xb7b1]
baa9:    59                     sub B, A
baaa:    14 07                  bz L_bab3
baac:    7b b6                  call L_ba64
baae:    79 bb 3f               call R_bb3f
bab1:    bc                     st A, [Z]
bab2:    21

L_bab3:
bab3:    90 00 00               ld A, 0x0000
bab6:    2f 21                  st_dma_addr B
bab8:    58                     add B, A
bab9:    2f 03                  st_dma_count A
babb:    59                     sub B, A
babc:    14 06                  bz L_bac4

L_babe:
babe:    7b a4                  call L_ba64
bac0:    7b 7d                  call R_bb3f
bac2:    bb                     st A, [Y]
bac3:    de                     ld B, [C]

L_bac4:
bac4:    38                     inc A, #1
bac5:    18 f7                  bgt L_babe
bac7:    16 02                  blt L_bacb
bac9:    75 60                  jmp [Y]

L_bacb:
bacb:    7b 97                  call L_ba64

R_bacd:
bacd:    f6 19 0b               st AL, +0xb(Z)
bad0:    7b 4d                  call R_bb1f
bad2:    71 b9 3c               jmp R_b93c

R_bad5:
bad5:    7b 55                  call L_bb2c
bad7:    b1 bb f2               st A, [R_bbf2|0xbbf2]

L_bada:
bada:    79 bb 8b               call R_bb8b
badd:    bb                     st A, [Y]
bade:    ed                     st BL, [S]
badf:    d0 00 80               ld B, 0x0080
bae2:    5a                     and B, A
bae3:    15 f5                  bnz L_bada
bae5:    7b 38                  call R_bb1f
bae7:    81 b9 49               ld AL, [R_b949|0xb949]
baea:    28                     inc AL, #1
baeb:    a1 b9 49               st AL, [R_b949|0xb949]
baee:    71 b9 3c               jmp R_b93c

L_baf1:
baf1:    80 03                  ld AL, 0x03
baf3:    f6 19 08               st AL, +0x8(Z)
baf6:    90 bb f6               ld A, R_bbf6|0xbbf6

L_baf9:
baf9:    b3 0a                  st A, [0xbb05|+0xa]
bafb:    7b 2f                  call L_bb2c
bafd:    d3 06                  ld B, [0xbb05|+0x6]
baff:    b5 28 06               st A, [B + 0x06]

L_bb02:
bb02:    79 bb 8b               call R_bb8b
bb05:    00                     HALT
bb06:    00                     HALT
bb07:    d0 02 00               ld B, 0x0200
bb0a:    5a                     and B, A
bb0b:    15 f5                  bnz L_bb02
bb0d:    d0 00 10               ld B, 0x0010
bb10:    5a                     and B, A
bb11:    14 ef                  bz L_bb02
bb13:    7b 0a                  call R_bb1f
bb15:    81 b9 49               ld AL, [R_b949|0xb949]
bb18:    28                     inc AL, #1
bb19:    a1 b9 49               st AL, [R_b949|0xb949]
bb1c:    71 b9 3c               jmp R_b93c

R_bb1f:
bb1f:    7b 5f                  call L_bb80
bb21:    32 25                  clr B, #5
bb23:    f5 08 32               st B, [A + 0x32]
bb26:    09                     ret

R_bb27:
bb27:    90 bc 00               ld A, R_bc00|0xbc00
bb2a:    73 cd                  jmp L_baf9

L_bb2c:
bb2c:    80 a0                  ld AL, 0xa0
bb2e:    a3 0d                  st AL, [0xbb3d|+0xd]
bb30:    3a                     clr A, #0
bb31:    81 b7 b3               ld AL, [R_b7b3|0xb7b3]
bb34:    79 b5 54               call R_b554
bb37:    bb                     st A, [Y]
bb38:    3e                     inc X
bb39:    93 02                  ld A, [0xbb3d|+0x2]
bb3b:    09                     ret
bb3c:    00
bb3d:    a0 ' '

R_bb3e:
bb3e:    a0 ' '

R_bb3f:
bb3f:    95 41                  ld A, [X++]
bb41:    b3 1a                  st A, [0xbb5d|+0x1a]
bb43:    80 01                  ld AL, 0x01
bb45:    a1 b8 08               st AL, [R_b808|0xb808]

L_bb48:
bb48:    65 a1                  ld X, [S++]
bb4a:    15 fc                  bnz L_bb48
bb4c:    71 b9 2d               jmp R_b92d

R_bb4f:
bb4f:    93 0c                  ld A, [0xbb5d|+0xc]	 ; Patch PrintStringToErrorDevice arg
bb51:    15 07                  bnz L_bb5a
bb53:    3a                     clr A, #0
bb54:    39                     dec A, #1
bb55:    5d                     mov B, A
bb56:    c0 1c                  ld BL, 0x1c
bb58:    66 6b                  jsys Syscall_AbortAL

L_bb5a:
bb5a:    79 b4 f8               call PrintStringToErrorDevice
bb5d:    00 00                      string = L_0000
bb5f:    91 ba 6e               ld A, [R_ba6e|0xba6e]
bb62:    79 cd 4d               call FormatHexWord
bb65:    bc 1b                      dest = R_bc1b
bb67:    7b c3                  call L_bb2c
bb69:    b1 bc 13               st A, [R_bc13|0xbc13]
bb6c:    91 ba 68               ld A, [R_ba68|0xba68]
bb6f:    79 cd 4d               call FormatHexWord
bb72:    bc 16                      dest = R_bc16
bb74:    79 b4 f8               call PrintStringToErrorDevice
bb77:    bc 0a                      string = R_bc0a	 ; " FAIL:  X XXXX XXXX\x07\r"
bb79:    3a                     clr A, #0
bb7a:    39                     dec A, #1
bb7b:    5d                     mov B, A
bb7c:    c0 0d                  ld BL, 0x0d
bb7e:    66 6b                  jsys Syscall_AbortAL

L_bb80:
bb80:    3a                     clr A, #0
bb81:    81 01 1f               ld AL, [0x011f]
bb84:    3d                     sll A, #1
bb85:    d1 01 07               ld B, [0x0107]
bb88:    58                     add B, A
bb89:    99                     ld A, [B]
bb8a:    09                     ret

R_bb8b:
bb8b:    95 41                  ld A, [X++]
bb8d:    b3 0f                  st A, [0xbb9e|+0xf]
bb8f:    81 01 25               ld AL, [0x0125]
bb92:    a5 a2                  st AL, [--S]
bb94:    32 01                  clr A, #1
bb96:    a1 01 25               st AL, [0x0125]
bb99:    7b e5                  call L_bb80
bb9b:    79 b5 00               call R_b500
bb9e:    00                     HALT
bb9f:    00                     HALT
bba0:    79 bb 1f               call R_bb1f
bba3:    85 a1                  ld AL, [S++]
bba5:    a1 01 25               st AL, [0x0125]

L_bba8:
bba8:    22 30                  clr BL, #0
bbaa:    e1 01 41               st BL, [0x0141]
bbad:    7b d1                  call L_bb80
bbaf:    95 08 32               ld A, [A + 0x32]
bbb2:    18 f4                  bgt L_bba8
bbb4:    7b ca                  call L_bb80
bbb6:    d5 08 08               ld B, [A + 0x08]
bbb9:    85 28 13               ld AL, [B + 0x13]
bbbc:    2d                     sll AL, #1
bbbd:    14 1b                  bz L_bbda
bbbf:    10 19                  bc L_bbda
bbc1:    2a                     clr AL, #0
bbc2:    a5 28 13               st AL, [B + 0x13]
bbc5:    81 01 3e               ld AL, [0x013e]
bbc8:    29                     dec AL, #1
bbc9:    a1 01 3e               st AL, [0x013e]
bbcc:    7b b2                  call L_bb80
bbce:    32 20                  clr B, #0
bbd0:    31 20                  dec B, #1
bbd2:    f5 08 32               st B, [A + 0x32]
bbd5:    79 bb 3f               call R_bb3f
bbd8:    00                     HALT
bbd9:    00                     HALT

L_bbda:
bbda:    f6 08 04               ld AH, +0x4(Z)
bbdd:    09                     ret

R_bbde:
bbde:    3, "DMA"

R_bbe3:
bbe3:    4, "DISK"

R_bbe9:
bbe9:    2, "WE"

R_bbed:
bbed:    7, "WP   \x07\r"

R_bbf6:
bbf6:    8, "FLT NN\x07\r"

R_bc00:
bc00:    8, "ATN NN\x07\r"

R_bc0a:
bc0a:    21, " FAIL:  X XXXX XXXX\x07\r"

R_bc21:
bc21:    7, "DMA LAG"

R_bc2a:
bc2a:    8, "DMA STAT"
bc34:    <null bytes>


FfcDeviceObj:
bc5c:    00 06                  (0x6)
bc5e:    cc ed                  R_cced
bc60:    cc 49                  R_cc49
bc62:    cc 79                  R_cc79
bc64:    bc 6e                  R_bc6e
bc66:    be 1f                  R_be1f
bc68:    be 9e                  R_be9e
bc6a:    be b8                  FfcDevice_Init
bc6c:    cb ca                  R_cbca

R_bc6e:
bc6e:    7f 01                  pop {A}
bc70:    b1 bd 91               st A, [R_bd91|0xbd91]
bc73:    79 be 08               call R_be08
bc76:    85 a8 06               ld AL, [S + 0x06]
bc79:    a1 bd 9d               st AL, [R_bd9d|0xbd9d]
bc7c:    55 80                  mov A, Z
bc7e:    b5 a2                  st A, [--S]
bc80:    7b 02                  call R_bc84
bc82:    73 32                  jmp R_bcb6

R_bc84:
bc84:    79 bf b1               call R_bfb1
bc87:    95 68 0f               ld A, [Y + 0x0f]
bc8a:    5e                     mov Z, A
bc8b:    80 60                  ld AL, 0x60
bc8d:    f6 19 00               st AL, +0x0(Z)
bc90:    79 bf 6e               call R_bf6e
bc93:    85 68 13               ld AL, [Y + 0x13]
bc96:    c0 80                  ld BL, 0x80
bc98:    48                     add BL, AL
bc99:    f6 39 00               st BL, +0x0(Z)
bc9c:    79 bf b1               call R_bfb1
bc9f:    80 55                  ld AL, 0x55
bca1:    f6 19 00               st AL, +0x0(Z)
bca4:    79 bf 96               call R_bf96
bca7:    01                     nop
bca8:    d0 00 c0               ld B, 0x00c0
bcab:    f6 18 00               ld AL, +0x0(Z)
bcae:    16 02                  blt L_bcb2
bcb0:    34 20                  srl B, #1

L_bcb2:
bcb2:    f5 68 11               st B, [Y + 0x11]
bcb5:    09                     ret

R_bcb6:
bcb6:    90 bd a0               ld A, R_bda0|0xbda0
bcb9:    5e                     mov Z, A
bcba:    95 a8 04               ld A, [S + 0x04]
bcbd:    b3 74                  st A, [0xbd33|+0x74]
bcbf:    3a                     clr A, #0
bcc0:    b3 5f                  st A, [0xbd21|+0x5f]
bcc2:    85 a8 02               ld AL, [S + 0x02]
bcc5:    14 11                  bz L_bcd8
bcc7:    c0 88                  ld BL, 0x88
bcc9:    29                     dec AL, #1
bcca:    14 02                  bz L_bcce
bccc:    c0 91                  ld BL, 0x91

L_bcce:
bcce:    e3 0e                  st BL, [0xbcde|+0xe]
bcd0:    95 a8 0b               ld A, [S + 0x0b]
bcd3:    15 03                  bnz L_bcd8
bcd5:    71 bd 73               jmp R_bd73

L_bcd8:
bcd8:    80 ff                  ld AL, 0xff
bcda:    a1 bd 9f               st AL, [R_bd9f|0xbd9f]

L_bcdd:
bcdd:    80 00                  ld AL, 0x00
bcdf:    a5 81                  st AL, [Z++]
bce1:    95 a8 06               ld A, [S + 0x06]
bce4:    d5 a8 09               ld B, [S + 0x09]
bce7:    79 cd 67               call R_cd67
bcea:    78 30 00 14            mul A, B, 0x0014
bcee:    a5 81                  st AL, [Z++]
bcf0:    81 bd 9f               ld AL, [R_bd9f|0xbd9f]
bcf3:    16 04                  blt L_bcf9
bcf5:    41 31                  sub AL, BL
bcf7:    15 39                  bnz L_bd32

L_bcf9:
bcf9:    e1 bd 9f               st BL, [R_bd9f|0xbd9f]
bcfc:    85 a8 02               ld AL, [S + 0x02]
bcff:    14 31                  bz L_bd32
bd01:    d5 a8 0b               ld B, [S + 0x0b]
bd04:    95 a8 06               ld A, [S + 0x06]
bd07:    38                     inc A, #1
bd08:    b5 a8 06               st A, [S + 0x06]
bd0b:    2a                     clr AL, #0
bd0c:    a5 81                  st AL, [Z++]
bd0e:    90 01 90               ld A, 0x0190
bd11:    59                     sub B, A
bd12:    11 03                  bnc L_bd17
bd14:    95 a8 0b               ld A, [S + 0x0b]

L_bd17:
bd17:    b5 81                  st A, [Z++]
bd19:    d5 a8 04               ld B, [S + 0x04]
bd1c:    58                     add B, A
bd1d:    f5 a8 04               st B, [S + 0x04]
bd20:    d0 00 00               ld B, 0x0000
bd23:    58                     add B, A
bd24:    f3 fb                  st B, [0xbd21|-0x5]
bd26:    d5 a8 0b               ld B, [S + 0x0b]
bd29:    51 20                  sub A, B
bd2b:    b5 a8 0b               st A, [S + 0x0b]
bd2e:    15 ad                  bnz L_bcdd
bd30:    95 81                  ld A, [Z++]

L_bd32:
bd32:    90 00 00               ld A, 0x0000
bd35:    b5 88 fe               st A, [Z + -0x2]
bd38:    93 e7                  ld A, [0xbd21|-0x19]
bd3a:    bc                     st A, [Z]
bd3b:    90 bd 9e               ld A, R_bd9e|0xbd9e
bd3e:    51 80                  sub A, Z
bd40:    a3 59                  st AL, [0xbd9b|+0x59]
bd42:    85 a8 03               ld AL, [S + 0x03]
bd45:    a1 be f9               st AL, [R_bef9|0xbef9]

L_bd48:
bd48:    79 be f8               call R_bef8
bd4b:    bd                     st A, [S]
bd4c:    99                     ld A, [B]
bd4d:    4d                     mov BL, AL
bd4e:    15 23                  bnz R_bd73
bd50:    85 a8 02               ld AL, [S + 0x02]
bd53:    14 1e                  bz R_bd73
bd55:    83 49                  ld AL, [R_bda0|0xbda0|+0x49]
bd57:    c0 91                  ld BL, 0x91
bd59:    49                     sub BL, AL
bd5a:    14 03                  bz L_bd5f
bd5c:    71 bc b6               jmp R_bcb6

L_bd5f:
bd5f:    90 bd a0               ld A, R_bda0|0xbda0
bd62:    31 81                  dec Z, #2

L_bd64:
bd64:    55 82                  mov B, Z
bd66:    59                     sub B, A
bd67:    10 df                  bc L_bd48
bd69:    c0 8e                  ld BL, 0x8e
bd6b:    e8                     st BL, [A]
bd6c:    d0 00 05               ld B, 0x0005
bd6f:    50 20                  add A, B
bd71:    73 f1                  jmp L_bd64

R_bd73:
bd73:    a3 22                  st AL, [0xbd97|+0x22]
bd75:    95 a8 09               ld A, [S + 0x09]
bd78:    95 a1                  ld A, [S++]
bd7a:    5e                     mov Z, A
bd7b:    d5 a8 04               ld B, [S + 0x04]
bd7e:    31 20                  dec B, #1
bd80:    90 00 0b               ld A, 0x000b
bd83:    50 0a                  add S, A
bd85:    95 a1                  ld A, [S++]
bd87:    5c                     mov Y, A
bd88:    80 ff                  ld AL, 0xff
bd8a:    a1 01 1f               st AL, [0x011f]
bd8d:    2a                     clr AL, #0
bd8e:    a3 7c                  st AL, [R_be0c|0xbe0c|+0x7c]
bd90:    90 00 00               ld A, 0x0000
bd93:    7e 01                  push {A}
bd95:    90 00 00               ld A, 0x0000
bd98:    09                     ret

R_bd99:
bd99:    00                     HALT
bd9a:    00                     HALT
bd9b:    00                     HALT
bd9c:    81

R_bd9d:
bd9d:    00                     HALT

R_bd9e:
bd9e:    83 00                  ld AL, [R_bda0|0xbda0|+0x0]

R_bda0:
bda0:    <null bytes>


R_be08:
be08:    79 cc 80               call R_cc80

L_be0b:
be0b:    80 00                  ld AL, 0x00
be0d:    14 08                  bz L_be17
be0f:    79 cc 89               call R_cc89
be12:    14 f7                  bz L_be0b
be14:    71 bf c5               jmp R_bfc5

L_be17:
be17:    79 cc 97               call R_cc97
be1a:    80 01                  ld AL, 0x01
be1c:    a3 ee                  st AL, [R_be0c|0xbe0c|-0x12]
be1e:    09                     ret

R_be1f:
be1f:    7b e7                  call R_be08
be21:    7e 41                  push {X}
be23:    65 68 0f               ld X, [Y + 0x0f]

L_be26:
be26:    79 bf b1               call R_bfb1
be29:    80 ff                  ld AL, 0xff
be2b:    f6 15 00               st AL, +0x0(X)
be2e:    79 bf b1               call R_bfb1
be31:    45 11                  mov AL, AL
be33:    15 0b                  bnz L_be40
be35:    7f 41                  pop {X}
be37:    a3 d3                  st AL, [R_be0c|0xbe0c|-0x2d]
be39:    29                     dec AL, #1
be3a:    a1 01 1f               st AL, [0x011f]
be3d:    32 20                  clr B, #0
be3f:    09                     ret

L_be40:
be40:    80 60                  ld AL, 0x60
be42:    f6 15 00               st AL, +0x0(X)
be45:    79 bf 6e               call R_bf6e
be48:    85 68 13               ld AL, [Y + 0x13]
be4b:    c0 80                  ld BL, 0x80
be4d:    48                     add BL, AL
be4e:    f6 35 00               st BL, +0x0(X)
be51:    79 bf 96               call R_bf96
be54:    01                     nop
be55:    f6 14 00               ld AL, +0x0(X)
be58:    14 05                  bz L_be5f
be5a:    f6 15 01               st AL, +0x1(X)
be5d:    73 c7                  jmp L_be26

L_be5f:
be5f:    80 52                  ld AL, 0x52
be61:    f6 15 00               st AL, +0x0(X)
be64:    79 bf 96               call R_bf96
be67:    01                     nop
be68:    f6 14 00               ld AL, +0x0(X)
be6b:    a5 a2                  st AL, [--S]
be6d:    79 bf 96               call R_bf96
be70:    01                     nop
be71:    8d                     ld AL, [S]
be72:    f6 34 00               ld BL, +0x0(X)
be75:    14 05                  bz L_be7c
be77:    55 20                  mov A, B
be79:    71 bf d4               jmp R_bfd4

L_be7c:
be7c:    80 60                  ld AL, 0x60
be7e:    f6 15 00               st AL, +0x0(X)
be81:    79 bf 6e               call R_bf6e
be84:    2a                     clr AL, #0
be85:    f6 15 00               st AL, +0x0(X)
be88:    85 a1                  ld AL, [S++]
be8a:    7f 41                  pop {X}
be8c:    d0 10 ff               ld B, 0x10ff
be8f:    e1 01 1f               st BL, [0x011f]
be92:    22 30                  clr BL, #0
be94:    e1 be 0c               st BL, [R_be0c|0xbe0c]
be97:    c5 68 13               ld BL, [Y + 0x13]
be9a:    42 12                  and BH, AL
be9c:    4a                     and BL, AL
be9d:    09                     ret

R_be9e:
be9e:    79 bf b1               call R_bfb1
bea1:    80 ff                  ld AL, 0xff
bea3:    a1 01 1f               st AL, [0x011f]
bea6:    d5 68 0f               ld B, [Y + 0x0f]
bea9:    f6 12 01               ld AL, +0x1(B)
beac:    24 13                  srl AL, #4
beae:    11 03                  bnc L_beb3
beb0:    f6 13 01               st AL, +0x1(B)

L_beb3:
beb3:    2a                     clr AL, #0
beb4:    a1 be 0c               st AL, [R_be0c|0xbe0c]
beb7:    09                     ret

FfcDevice_Init:
beb8:    7e 63                  push {Y, Z}
beba:    79 be 08               call R_be08
bebd:    79 bc 84               call R_bc84
bec0:    7f 63                  pop {Y, Z}
bec2:    d6 89 be d1            st Z, [R_bed1|0xbed1]
bec6:    c5 68 13               ld BL, [Y + 0x13]
bec9:    e5 88 04               st BL, [Z + 0x04]
becc:    2a                     clr AL, #0
becd:    a3 2a                  st AL, [R_bef9|0xbef9|+0x2a]
becf:    7b 27                  call R_bef8

R_bed1:
bed1:    00                     HALT
bed2:    00                     HALT
bed3:    b5 a2                  st A, [--S]
bed5:    80 ff                  ld AL, 0xff
bed7:    a1 01 1f               st AL, [0x011f]
beda:    80 17                  ld AL, 0x17
bedc:    d5 68 0f               ld B, [Y + 0x0f]
bedf:    f6 13 00               st AL, +0x0(B)
bee2:    79 bf 96               call R_bf96
bee5:    09                     ret
bee6:    d5 'U'
bee7:    68
bee8:    0f
bee9:    f6 'v'
beea:    12
beeb:    00
beec:    15
beed:    ec 'l'
beee:    2a
beef:    a1 '!'
bef0:    be '>'
bef1:    0c
bef2:    f6 'v'
bef3:    12
bef4:    00
bef5:    95
bef6:    a1 '!'
bef7:    09

R_bef8:
bef8:    80 00                  ld AL, 0x00
befa:    15 02                  bnz L_befe
befc:    22 1d                  clr AL, #13

L_befe:
befe:    a1 c0 52               st AL, [R_c052|0xc052]
bf01:    22 12                  clr AL, #2
bf03:    a1 bf da               st AL, [R_bfda|0xbfda]
bf06:    7e 45                  push {X, Y, Z}
bf08:    95 68 0f               ld A, [Y + 0x0f]
bf0b:    5e                     mov Z, A
bf0c:    2a                     clr AL, #0
bf0d:    a1 c0 3b               st AL, [R_c03b|0xc03b]
bf10:    91 01 03               ld A, [CurrentProcess|0x0103]
bf13:    2e 0d fa 00 36         wpf 0xfa, [A + 0x36]
bf18:    2e 0c 7a 01 81         wpf 0x7a, [PageTableTwo|0x0181]
bf1d:    c0 02                  ld BL, 0x02
bf1f:    2f 28                  ld_isr B

R_bf21:
bf21:    65 a4                  ld X, @[S]
bf23:    79 bf b1               call R_bfb1
bf26:    80 41                  ld AL, 0x41
bf28:    f6 19 00               st AL, +0x0(Z)
bf2b:    7b 41                  call R_bf6e
bf2d:    85 41                  ld AL, [X++]
bf2f:    f6 19 00               st AL, +0x0(Z)
bf32:    7b 3a                  call R_bf6e
bf34:    85 41                  ld AL, [X++]
bf36:    f6 19 00               st AL, +0x0(Z)
bf39:    3a                     clr A, #0
bf3a:    85 41                  ld AL, [X++]
bf3c:    14 2b                  bz R_bf69
bf3e:    55 42                  mov B, X
bf40:    50 04                  add X, A
bf42:    79 c1 04               call R_c104
bf45:    7b 6a                  call R_bfb1
bf47:    15 1e                  bnz L_bf67
bf49:    80 43                  ld AL, 0x43
bf4b:    f6 19 00               st AL, +0x0(Z)
bf4e:    7b 61                  call R_bfb1
bf50:    14 05                  bz L_bf57
bf52:    79 c1 2c               call R_c12c
bf55:    c1 'A'
bf56:    72

L_bf57:
bf57:    79 c1 12               call R_c112
bf5a:    d5 41                  ld B, [X++]
bf5c:    9a                     ld A, [X]
bf5d:    79 c1 04               call R_c104
bf60:    80 45                  ld AL, 0x45
bf62:    f6 19 00               st AL, +0x0(Z)
bf65:    7b 4a                  call R_bfb1

L_bf67:
bf67:    15 6b                  bnz R_bfd4

R_bf69:
bf69:    7f 45                  pop {X, Y, Z}
bf6b:    d5 41                  ld B, [X++]
bf6d:    09                     ret

R_bf6e:
bf6e:    79 cc 80               call R_cc80
bf71:    3a                     clr A, #0
bf72:    d7 12                  mov IL1(B), A

L_bf74:
bf74:    d5 68 0f               ld B, [Y + 0x0f]
bf77:    f6 32 01               ld BL, +0x1(B)
bf7a:    80 08                  ld AL, 0x08
bf7c:    49                     sub BL, AL
bf7d:    14 07                  bz L_bf86
bf7f:    79 cc 89               call R_cc89
bf82:    14 f0                  bz L_bf74
bf84:    73 3f                  jmp R_bfc5

L_bf86:
bf86:    79 cc 97               call R_cc97
bf89:    e6 12                  mov A, IL1(B)
bf8b:    5d                     mov B, A
bf8c:    14 07                  bz L_bf95
bf8e:    79 c1 2c               call R_c12c
bf91:    c2 10 80               ld BL, @[0x1080]
bf94:    ff                     st B, [P]

L_bf95:
bf95:    09                     ret

R_bf96:
bf96:    85 41                  ld AL, [X++]
bf98:    a3 0c                  st AL, [0xbfa6|+0xc]
bf9a:    7c d3                  call @[0xbf6f|-0x2d]
bf9c:    3a                     clr A, #0
bf9d:    d7 12                  mov IL1(B), A

L_bf9f:
bf9f:    d5 68 0f               ld B, [Y + 0x0f]
bfa2:    f6 32 01               ld BL, +0x1(B)
bfa5:    80 00                  ld AL, 0x00
bfa7:    4a                     and BL, AL
bfa8:    49                     sub BL, AL
bfa9:    14 db                  bz L_bf86
bfab:    7c d3                  call @[0xbf80|-0x2d]
bfad:    14 f0                  bz L_bf9f
bfaf:    73 14                  jmp R_bfc5

R_bfb1:
bfb1:    7c bc                  call @[0xbf6f|-0x44]
bfb3:    3a                     clr A, #0
bfb4:    d7 12                  mov IL1(B), A

L_bfb6:
bfb6:    d5 68 0f               ld B, [Y + 0x0f]
bfb9:    f6 32 01               ld BL, +0x1(B)
bfbc:    80 08                  ld AL, 0x08
bfbe:    4a                     and BL, AL
bfbf:    14 09                  bz L_bfca
bfc1:    7c bd                  call @[0xbf80|-0x43]
bfc3:    14 f1                  bz L_bfb6

R_bfc5:
bfc5:    79 c1 2c               call R_c12c
bfc8:    c1 8c 79               ld BL, [0x8c79]
bfcb:    cc                     ld BL, [Z]
bfcc:    97                     unknown
bfcd:    95 68 0f               ld A, [Y + 0x0f]
bfd0:    f6 10 00               ld AL, +0x0(A)
bfd3:    09                     ret

R_bfd4:
bfd4:    c0 21                  ld BL, 0x21
bfd6:    49                     sub BL, AL
bfd7:    15 12                  bnz L_bfeb
bfd9:    c0 02                  ld BL, 0x02
bfdb:    14 46                  bz L_c023
bfdd:    21 30                  dec BL, #1
bfdf:    e3 f9                  st BL, [R_bfda|0xbfda|-0x7]
bfe1:    c1 c0 52               ld BL, [R_c052|0xc052]
bfe4:    21 30                  dec BL, #1
bfe6:    e1 c0 52               st BL, [R_c052|0xc052]
bfe9:    73 31                  jmp L_c01c

L_bfeb:
bfeb:    c0 41                  ld BL, 0x41
bfed:    49                     sub BL, AL
bfee:    15 05                  bnz L_bff5
bff0:    90 ce d2               ld A, 0xced2
bff3:    73 08                  jmp L_bffd

L_bff5:
bff5:    c0 42                  ld BL, 0x42
bff7:    49                     sub BL, AL
bff8:    15 29                  bnz L_c023
bffa:    90 d7 d0               ld A, 0xd7d0

L_bffd:
bffd:    b1 c1 9c               st A, [R_c19c|0xc19c]
c000:    90 c0 c0               ld A, 0xc0c0
c003:    b1 c1 9f               st A, [R_c19f|0xc19f]
c006:    80 02                  ld AL, 0x02
c008:    46 80 91 c1 9f 60 02   baseconv(8, 0) [R_c19f|0xc19f], [Y + 0x02]
c00f:    79 c1 42               call R_c142
c012:    c1 99 60               ld BL, [0x9960]
c015:    13 88                  bnn L_bf9f

L_c017:
c017:    66 07                  jsys Syscall_Yield
c019:    3f                     dec X
c01a:    18 fb                  bgt L_c017

L_c01c:
c01c:    95 68 0f               ld A, [Y + 0x0f]
c01f:    5e                     mov Z, A
c020:    71 bf 21               jmp R_bf21

L_c023:
c023:    a5 a2                  st AL, [--S]
c025:    90 c0 c0               ld A, 0xc0c0
c028:    b1 c1 d6               st A, [R_c1d6|0xc1d6]
c02b:    b1 c1 d0               st A, [R_c1d0|0xc1d0]
c02e:    80 18                  ld AL, 0x18
c030:    f6 19 00               st AL, +0x0(Z)
c033:    79 bf 96               call R_bf96
c036:    09                     ret
c037:    f6 'v'
c038:    18
c039:    00
c03a:    a0 ' '

R_c03b:
c03b:    00                     HALT
c03c:    80 02                  ld AL, 0x02
c03e:    46 e0 90 c1 d6 c0 3b   baseconv(e, 0) [R_c1d6|0xc1d6], [R_c03b|0xc03b]
c045:    7b 6f                  call L_c0b6
c047:    80 02                  ld AL, 0x02
c049:    46 e0 92 c1 d0 0a      baseconv(e, 0) [R_c1d0|0xc1d0], [S]
c04f:    85 a1                  ld AL, [S++]
c051:    c0 '@'

R_c052:
c052:    00                     HALT
c053:    21 30                  dec BL, #1
c055:    e3 fb                  st BL, [R_c052|0xc052|-0x5]
c057:    18 c3                  bgt L_c01c
c059:    c0 30                  ld BL, 0x30
c05b:    49                     sub BL, AL
c05c:    16 05                  blt L_c063
c05e:    d0 c1 a1               ld B, R_c1a1|0xc1a1
c061:    73 0d                  jmp L_c070

L_c063:
c063:    c0 20                  ld BL, 0x20
c065:    49                     sub BL, AL
c066:    16 05                  blt L_c06d
c068:    d0 c2 04               ld B, R_c204|0xc204
c06b:    73 03                  jmp L_c070

L_c06d:
c06d:    d0 c1 b7               ld B, R_c1b7|0xc1b7

L_c070:
c070:    f3 0e                  st B, [0xc080|+0xe]
c072:    c1 be f9               ld BL, [R_bef9|0xbef9]
c075:    14 03                  bz L_c07a
c077:    71 bf 69               jmp R_bf69

L_c07a:
c07a:    7c 07                  call @[0xc083|+0x7]
c07c:    c1 54 7c               ld BL, [0x547c]
c07f:    03                     rf
c080:    00                     HALT
c081:    00                     HALT
c082:    79 b4 f8               call PrintStringToErrorDevice
c085:    c1 cb                      string = R_c1cb	 ; "EC:XX CP:XX CMDS: "
c087:    95 a4                  ld A, @[S]
c089:    5c                     mov Y, A
c08a:    3a                     clr A, #0
c08b:    85 68 02               ld AL, [Y + 0x02]
c08e:    30 02                  inc A, #3
c090:    5b                     mov X, A

L_c091:
c091:    90 c0 c0               ld A, 0xc0c0
c094:    b1 c1 e1               st A, [R_c1e1|0xc1e1]
c097:    80 02                  ld AL, 0x02
c099:    46 e0 92 c1 e1 06      baseconv(e, 0) [R_c1e1|0xc1e1], [Y]
c09f:    30 60                  inc Y, #1
c0a1:    7c e0                  call @[0xc083|-0x20]
c0a3:    c1 df 3f               ld BL, [0xdf3f]
c0a6:    18 e9                  bgt L_c091
c0a8:    7c d9                  call @[0xc083|-0x27]
c0aa:    c1 54 3a               ld BL, [0x543a]
c0ad:    a1 be 0c               st AL, [R_be0c|0xbe0c]
c0b0:    39                     dec A, #1
c0b1:    5d                     mov B, A
c0b2:    c0 0d                  ld BL, 0x0d
c0b4:    66 6b                  jsys Syscall_AbortAL

L_c0b6:
c0b6:    83 9a                  ld AL, [R_c052|0xc052|-0x66]
c0b8:    21 11                  dec AL, #2
c0ba:    18 06                  bgt L_c0c2

L_c0bc:
c0bc:    32 02                  clr A, #2
c0be:    f6 09 00               st AH, +0x0(Z)
c0c1:    09                     ret

L_c0c2:
c0c2:    95 a8 03               ld A, [S + 0x03]
c0c5:    98                     ld A, [A]
c0c6:    c5 08 04               ld BL, [A + 0x04]
c0c9:    e3 36                  st BL, [0xc101|+0x36]
c0cb:    85 08 06               ld AL, [A + 0x06]
c0ce:    14 0f                  bz L_c0df
c0d0:    c5 68 12               ld BL, [Y + 0x12]
c0d3:    21 30                  dec BL, #1
c0d5:    49                     sub BL, AL
c0d6:    14 09                  bz L_c0e1
c0d8:    c1 c0 52               ld BL, [R_c052|0xc052]
c0db:    24 30                  srl BL, #1
c0dd:    10 02                  bc L_c0e1

L_c0df:
c0df:    20 11                  inc AL, #2

L_c0e1:
c0e1:    29                     dec AL, #1
c0e2:    a3 1f                  st AL, [0xc103|+0x1f]
c0e4:    32 04                  clr A, #4
c0e6:    d0 c1 00               ld B, R_c100|0xc100
c0e9:    7b 19                  call R_c104
c0eb:    80 43                  ld AL, 0x43
c0ed:    f6 19 00               st AL, +0x0(Z)
c0f0:    79 bf b1               call R_bfb1
c0f3:    7b 1d                  call R_c112
c0f5:    80 45                  ld AL, 0x45
c0f7:    f6 19 00               st AL, +0x0(Z)
c0fa:    79 bf b1               call R_bfb1
c0fd:    15 bd                  bnz L_c0bc
c0ff:    09                     ret

R_c100:
c100:    81 00 83               ld AL, [0x0083]
c103:    00                     HALT

R_c104:
c104:    2f 34                  ld_dma_mode B
c106:    2f 06                  enable_dma
c108:    2f 20                  ld_dma_addr B
c10a:    3b                     not A, #0
c10b:    2f 02                  ld_dma_count A
c10d:    59                     sub B, A
c10e:    f0 00 00               st B, 0x0000
c111:    09                     ret

R_c112:
c112:    2f 07                  st_ A
c114:    2f 03                  st_dma_count A
c116:    38                     inc A, #1
c117:    14 04                  bz L_c11d
c119:    7b 11                  call R_c12c
c11b:    c1 'A'
c11c:    e4 'd'

L_c11d:
c11d:    2f 03                  st_dma_count A
c11f:    2f 21                  st_dma_addr B
c121:    59                     sub B, A
c122:    93 eb                  ld A, [0xc10f|-0x15]
c124:    59                     sub B, A
c125:    15 01                  bnz L_c128
c127:    09                     ret

L_c128:
c128:    7b 02                  call R_c12c
c12a:    c1 'A'
c12b:    f7 'w'

R_c12c:
c12c:    95 68 0f               ld A, [Y + 0x0f]
c12f:    f6 11 01               st AL, +0x1(A)
c132:    95 41                  ld A, [X++]
c134:    b3 02                  st A, [0xc138|+0x2]
c136:    7b 0a                  call R_c142
c138:    00                     HALT
c139:    00                     HALT
c13a:    2a                     clr AL, #0
c13b:    a1 be 0c               st AL, [R_be0c|0xbe0c]
c13e:    c0 0d                  ld BL, 0x0d
c140:    66 6b                  jsys Syscall_AbortAL

R_c142:
c142:    95 41                  ld A, [X++]
c144:    b3 07                  st A, [0xc14d|+0x7]
c146:    7c 03                  call @[0xc14b|+0x3]
c148:    c1 54 79               ld BL, [0x5479]
c14b:    b4 f8                  st A, @[0xc145|-0x8]
c14d:    00                     HALT
c14e:    00                     HALT
c14f:    7c fa                  call @[0xc14b|-0x6]
c151:    c1 54 09               ld BL, [0x5409]

R_c154:
c154:    00                     HALT
c155:    01                     nop
c156:    8d                     ld AL, [S]
c157:    25, "ILLEGAL FDC SECTOR NUMBER"

R_c172:
c172:    24, "FDC COMMAND LOAD FAILURE"

R_c18c:
c18c:    11, "FDC FAILURE"

R_c199:
c199:    6, "\x07ID NN"

R_c1a1:
c1a1:    20, "FDC COMMAND FAILURE\r"

R_c1b7:
c1b7:    18, "FDC COMMAND ERROR\r"

R_c1cb:
c1cb:    18, "EC:XX CP:XX CMDS: "

R_c1df:
c1df:    3, "XX "

R_c1e4:
c1e4:    17, "DMA NOT COMPLETED"

R_c1f7:
c1f7:    11, "DMA FAILURE"

R_c204:
c204:    10, "FDC ERROR\r"

R_c210:
c210:    13, "DMA STAT FAIL"

CrtDeviceObj:
c21f:    00 02                  (0x2)
c221:    cc a0                  R_cca0
c223:    c2 2f                  R_c22f
c225:    c2 76                  R_c276
c227:    00 00                  L_0000
c229:    c2 7e                  CrtDevice_Write
c22b:    00 00                  L_0000
c22d:    c5 a4                  CrtDevice_Init

R_c22f:
c22f:    55 46                  mov Y, X
c231:    2a                     clr AL, #0
c232:    a5 6c 05               st AL, @[Y + 0x05]
c235:    7b 35                  call L_c26c
c237:    55 80                  mov A, Z
c239:    b5 68 14               st A, [Y + 0x14]
c23c:    3a                     clr A, #0
c23d:    b5 8c 06               st A, @[Z + 0x06]
c240:    28                     inc AL, #1
c241:    a5 68 11               st AL, [Y + 0x11]
c244:    91 01 03               ld A, [CurrentProcess|0x0103]
c247:    b5 68 0d               st A, [Y + 0x0d]
c24a:    d0 08 00               ld B, 0x0800
c24d:    c8                     ld BL, [A]
c24e:    42 23                  and BL, BH
c250:    15 06                  bnz L_c258
c252:    47 6d 00 04 00 00      unkblk6 0x01, 0x04, [A + 0x00]

L_c258:
c258:    79 c3 19               call R_c319
c25b:    f6 31 08               st BL, +0x8(A)

R_c25e:
c25e:    65 a1                  ld X, [S++]
c260:    95 a1                  ld A, [S++]
c262:    5c                     mov Y, A
c263:    95 a1                  ld A, [S++]
c265:    5e                     mov Z, A
c266:    91 01 01               ld A, [0x0101]
c269:    75 08 03               jmp [A + 0x03]

L_c26c:
c26c:    85 68 11               ld AL, [Y + 0x11]
c26f:    15 01                  bnz L_c272
c271:    09                     ret

L_c272:
c272:    66 07                  jsys Syscall_Yield
c274:    73 f6                  jmp L_c26c

R_c276:
c276:    55 46                  mov Y, X
c278:    3a                     clr A, #0
c279:    a5 6c 05               st AL, @[Y + 0x05]
c27c:    7b ee                  call L_c26c

CrtDevice_Write:
    ; X is the CRT device
    ; Z is the WriteStruct (file operation object?)
    ; Y is ????
c27e:    3a                     clr A, #0
c27f:    29                     dec AL, #1
c280:    a5 68 11               st AL, [Y + 0x11]	 ; Lock?
c283:    95 68 1d               ld A, [Y + 0x1d]
c286:    14 02                  bz L_c28a
c288:    7d 00                  call [A]

L_c28a:
c28a:    55 80                  mov A, Z
c28c:    b5 68 14               st A, [Y + 0x14]
c28f:    3a                     clr A, #0
c290:    b5 88 08               st A, [Z + 0x08]	 ; Overwrites string????
c293:    79 c3 19               call R_c319
c296:    20 30                  inc BL, #1
c298:    f6 31 08               st BL, +0x8(A)
c29b:    79 cc 80               call R_cc80

L_c29e:
c29e:    d5 68 0f               ld B, [Y + 0x0f]
c2a1:    f6 32 00               ld BL, +0x0(B)
c2a4:    24 31                  srl BL, #2
c2a6:    10 07                  bc L_c2af
c2a8:    79 cc 89               call R_cc89
c2ab:    15 2e                  bnz L_c2db
c2ad:    73 ef                  jmp L_c29e

L_c2af:
c2af:    79 cc 80               call R_cc80
c2b2:    91 01 03               ld A, [CurrentProcess|0x0103]
c2b5:    b5 68 0d               st A, [Y + 0x0d]

L_c2b8:
c2b8:    80 80                  ld AL, 0x80
c2ba:    ac                     st AL, [Z]
c2bb:    7b 5c                  call R_c319
c2bd:    c5 68 02               ld BL, [Y + 0x02]
c2c0:    f6 31 0c               st BL, +0xc(A)

L_c2c3:
c2c3:    85 68 11               ld AL, [Y + 0x11]
c2c6:    14 28                  bz L_c2f0
c2c8:    29                     dec AL, #1
c2c9:    14 25                  bz L_c2f0
c2cb:    8c                     ld AL, [Z]
c2cc:    2d                     sll AL, #1
c2cd:    15 07                  bnz L_c2d6
c2cf:    66 07                  jsys Syscall_Yield
c2d1:    79 cc 80               call R_cc80
c2d4:    73 ed                  jmp L_c2c3

L_c2d6:
c2d6:    79 cc 89               call R_cc89
c2d9:    14 dd                  bz L_c2b8

L_c2db:
c2db:    79 b4 f8               call PrintStringToErrorDevice
c2de:    c2 e2                      string = R_c2e2	 ; "ATTN PRINT\n\r"
c2e0:    73 cd                  jmp L_c2af

R_c2e2:
c2e2:    12, "ATTN PRINT\n\r"

L_c2f0:
c2f0:    3a                     clr A, #0
c2f1:    a5 6c 03               st AL, @[Y + 0x03]
c2f4:    8c                     ld AL, [Z]
c2f5:    52 10 00 7f            and A, A, 0x007f
c2f9:    ac                     st AL, [Z]
c2fa:    79 cc 97               call R_cc97
c2fd:    91 00 5a               ld A, [0x005a]
c300:    95 08 5e               ld A, [A + 0x5e]
c303:    39                     dec A, #1
c304:    5e                     mov Z, A
c305:    60 00 08               ld X, 0x0008

L_c308:
c308:    30 80                  inc Z, #1
c30a:    3f                     dec X
c30b:    14 09                  bz L_c316
c30d:    95 81                  ld A, [Z++]
c30f:    d5 68 1d               ld B, [Y + 0x1d]
c312:    59                     sub B, A
c313:    15 f3                  bnz L_c308
c315:    ec                     st BL, [Z]

L_c316:
c316:    71 c2 5e               jmp R_c25e

R_c319:
c319:    95 68 0f               ld A, [Y + 0x0f]
c31c:    c0 06                  ld BL, 0x06
c31e:    4a                     and BL, AL
c31f:    44 31                  xor AL, BL
c321:    09                     ret

CrtDevice_InterruptHandler:
c322:    90 f2 0f               ld A, 0xf20f
c325:    f6 10 00               ld AL, +0x0(A)
c328:    5e                     mov Z, A
c329:    90 06 f0               ld A, 0x06f0
c32c:    42 90                  and AH, ZL
c32e:    42 91                  and AL, ZL
c330:    2c                     srl AL, #1
c331:    43 01                  or AL, AH
c333:    22 00                  clr AH, #0
c335:    d1 01 0b               ld B, [0x010b]
c338:    65 21                  ld X, [B++]
c33a:    51 04                  sub X, A
c33c:    16 05                  blt L_c343

L_c33e:
c33e:    f6 08 00               ld AH, +0x0(Z)
c341:    73 0e                  jmp L_c351

L_c343:
c343:    58                     add B, A
c344:    99                     ld A, [B]
c345:    14 f7                  bz L_c33e
c347:    5c                     mov Y, A
c348:    8b                     ld AL, [Y]
c349:    15 09                  bnz L_c354
c34b:    d5 68 0f               ld B, [Y + 0x0f]
c34e:    f6 12 01               ld AL, +0x1(B)

L_c351:
c351:    71 c4 02               jmp CrtDevice_InterruptHandler_End

L_c354:
c354:    95 68 0d               ld A, [Y + 0x0d]
c357:    14 13                  bz L_c36c
c359:    47 40 0f 01 81 c3 7f   memcpy 0x10, [PageTableTwo|0x0181], [R_c37f|0xc37f]
c360:    47 44 0f 00 46 c3 8f   memcpy 0x10, [A + 0x46], [R_c38f|0xc38f]
c367:    2e 0c f9 c3 7f         wpf 0xf9, [R_c37f|0xc37f]

L_c36c:
c36c:    95 68 1b               ld A, [Y + 0x1b]
c36f:    14 05                  bz L_c376
c371:    7d 00                  call [A]
c373:    71 c4 02               jmp CrtDevice_InterruptHandler_End

L_c376:
c376:    80 01                  ld AL, 0x01
c378:    42 91                  and AL, ZL
c37a:    14 23                  bz L_c39f
c37c:    71 c4 ae               jmp R_c4ae

R_c37f:
c37f:    <null bytes>


R_c38f:
c38f:    <null bytes>


L_c39f:
c39f:    f6 08 00               ld AH, +0x0(Z)
c3a2:    c0 80                  ld BL, 0x80
c3a4:    43 31                  or AL, BL
c3a6:    c0 1c                  ld BL, 0x1c
c3a8:    42 03                  and BL, AH
c3aa:    15 5a                  bnz L_c406
c3ac:    65 68 1d               ld X, [Y + 0x1d]
c3af:    14 0b                  bz L_c3bc
c3b1:    30 41                  inc X, #2

L_c3b3:
c3b3:    d5 41                  ld B, [X++]
c3b5:    14 05                  bz L_c3bc
c3b7:    49                     sub BL, AL
c3b8:    15 f9                  bnz L_c3b3
c3ba:    45 21                  mov AL, BH

L_c3bc:
c3bc:    a1 c4 68               st AL, [R_c468|0xc468]
c3bf:    c5 68 17               ld BL, [Y + 0x17]
c3c2:    49                     sub BL, AL
c3c3:    15 17                  bnz L_c3dc
c3c5:    85 68 13               ld AL, [Y + 0x13]
c3c8:    3d                     sll A, #1
c3c9:    4d                     mov BL, AL
c3ca:    15 36                  bnz CrtDevice_InterruptHandler_End
c3cc:    3c                     srl A, #1
c3cd:    c0 01                  ld BL, 0x01
c3cf:    43 13                  or BL, AL
c3d1:    e5 68 13               st BL, [Y + 0x13]
c3d4:    81 01 3e               ld AL, [0x013e]
c3d7:    28                     inc AL, #1
c3d8:    a4 fb                  st AL, @[0xc3d5|-0x5]
c3da:    73 26                  jmp CrtDevice_InterruptHandler_End

L_c3dc:
c3dc:    c0 82                  ld BL, 0x82
c3de:    49                     sub BL, AL
c3df:    15 2c                  bnz L_c40d
c3e1:    45 10                  mov AH, AL
c3e3:    82 00 1a               ld AL, @[0x001a]
c3e6:    c0 73                  ld BL, 0x73
c3e8:    49                     sub BL, AL
c3e9:    15 1b                  bnz L_c406
c3eb:    d0 00 fe               ld B, 0x00fe
c3ee:    80 0e                  ld AL, 0x0e
c3f0:    43 c1                  or AL, CH
c3f2:    4a                     and BL, AL
c3f3:    f5 a2                  st B, [--S]
c3f5:    91 00 1a               ld A, [0x001a]
c3f8:    30 01                  inc A, #2
c3fa:    d5 a4                  ld B, @[S]
c3fc:    f5 01                  st B, [A++]
c3fe:    b5 a4                  st A, @[S]
c400:    95 a1                  ld A, [S++]

CrtDevice_InterruptHandler_End:
c402:    0a                     reti
c403:    71 c3 22               jmp CrtDevice_InterruptHandler

L_c406:
c406:    80 87                  ld AL, 0x87

L_c408:
c408:    79 c4 95               call R_c495
c40b:    73 f5                  jmp CrtDevice_InterruptHandler_End

L_c40d:
c40d:    c5 68 11               ld BL, [Y + 0x11]
c410:    19 f4                  ble L_c406
c412:    95 68 14               ld A, [Y + 0x14]
c415:    85 08 02               ld AL, [A + 0x02]
c418:    c0 08                  ld BL, 0x08
c41a:    4a                     and BL, AL
c41b:    14 16                  bz L_c433
c41d:    83 49                  ld AL, [R_c468|0xc468|+0x49]
c41f:    21 11                  dec AL, #2
c421:    14 04                  bz L_c427
c423:    20 11                  inc AL, #2
c425:    73 4d                  jmp L_c474

L_c427:
c427:    d5 68 1d               ld B, [Y + 0x1d]
c42a:    85 28 03               ld AL, [B + 0x03]
c42d:    7b 66                  call R_c495
c42f:    83 37                  ld AL, [R_c468|0xc468|+0x37]
c431:    73 43                  jmp L_c476

L_c433:
c433:    83 33                  ld AL, [R_c468|0xc468|+0x33]
c435:    16 3d                  blt L_c474
c437:    29                     dec AL, #1
c438:    14 c8                  bz CrtDevice_InterruptHandler_End
c43a:    29                     dec AL, #1
c43b:    15 1d                  bnz L_c45a
c43d:    d5 68 1d               ld B, [Y + 0x1d]
c440:    85 28 03               ld AL, [B + 0x03]
c443:    a3 0f                  st AL, [0xc454|+0xf]
c445:    d5 68 14               ld B, [Y + 0x14]
c448:    d5 2c 06               ld B, @[B + 0x06]
c44b:    14 b5                  bz CrtDevice_InterruptHandler_End
c44d:    7b 46                  call R_c495
c44f:    80 a0                  ld AL, 0xa0
c451:    7b 42                  call R_c495
c453:    80 88                  ld AL, 0x88
c455:    7b 3e                  call R_c495
c457:    2a                     clr AL, #0
c458:    73 1c                  jmp L_c476

L_c45a:
c45a:    29                     dec AL, #1
c45b:    15 04                  bnz L_c461
c45d:    80 ab                  ld AL, 0xab
c45f:    73 0c                  jmp L_c46d

L_c461:
c461:    29                     dec AL, #1
c462:    14 07                  bz L_c46b
c464:    29                     dec AL, #1
c465:    15 9b                  bnz CrtDevice_InterruptHandler_End
c467:    80 00                  ld AL, 0x00
c469:    73 9d                  jmp L_c408

L_c46b:
c46b:    80 ad                  ld AL, 0xad

L_c46d:
c46d:    7b 26                  call R_c495
c46f:    79 c5 4f               call R_c54f
c472:    80 8d                  ld AL, 0x8d

L_c474:
c474:    7b 1f                  call R_c495

L_c476:
c476:    79 c5 4f               call R_c54f
c479:    15 87                  bnz CrtDevice_InterruptHandler_End
c47b:    c5 68 12               ld BL, [Y + 0x12]
c47e:    14 0d                  bz L_c48d
c480:    80 8a                  ld AL, 0x8a
c482:    49                     sub BL, AL
c483:    14 04                  bz L_c489
c485:    7b 0e                  call R_c495
c487:    73 04                  jmp L_c48d

L_c489:
c489:    80 8d                  ld AL, 0x8d
c48b:    7b 08                  call R_c495

L_c48d:
c48d:    8b                     ld AL, [Y]
c48e:    c0 f7                  ld BL, 0xf7
c490:    4a                     and BL, AL
c491:    eb                     st BL, [Y]
c492:    71 c5 16               jmp R_c516

R_c495:
c495:    db                     ld B, [Y]
c496:    c0 08                  ld BL, 0x08
c498:    42 23                  and BL, BH
c49a:    14 01                  bz L_c49d
c49c:    09                     ret

L_c49d:
c49d:    d5 68 0f               ld B, [Y + 0x0f]
c4a0:    f6 32 00               ld BL, +0x0(B)
c4a3:    24 31                  srl BL, #2
c4a5:    11 f6                  bnc L_c49d
c4a7:    d5 68 0f               ld B, [Y + 0x0f]
c4aa:    f6 13 01               st AL, +0x1(B)
c4ad:    09                     ret

R_c4ae:
c4ae:    c5 68 11               ld BL, [Y + 0x11]
c4b1:    17 2d                  bp L_c4e0
c4b3:    95 68 14               ld A, [Y + 0x14]
c4b6:    5e                     mov Z, A
c4b7:    d5 68 0f               ld B, [Y + 0x0f]
c4ba:    f6 12 00               ld AL, +0x0(B)
c4bd:    24 11                  srl AL, #2
c4bf:    11 1f                  bnc L_c4e0
c4c1:    24 13                  srl AL, #4
c4c3:    10 05                  bc L_c4ca

L_c4c5:
c4c5:    80 86                  ld AL, 0x86
c4c7:    ac                     st AL, [Z]
c4c8:    73 4c                  jmp R_c516

L_c4ca:
c4ca:    95 88 08               ld A, [Z + 0x08]
c4cd:    16 2d                  blt L_c4fc
c4cf:    7b 53                  call L_c524
c4d1:    14 43                  bz R_c516
c4d3:    7b c8                  call L_c49d
c4d5:    a5 68 12               st AL, [Y + 0x12]
c4d8:    c0 8c                  ld BL, 0x8c
c4da:    49                     sub BL, AL
c4db:    14 2e                  bz L_c50b
c4dd:    28                     inc AL, #1
c4de:    15 03                  bnz L_c4e3

L_c4e0:
c4e0:    71 c4 02               jmp CrtDevice_InterruptHandler_End

L_c4e3:
c4e3:    c0 8e                  ld BL, 0x8e
c4e5:    49                     sub BL, AL
c4e6:    15 f8                  bnz L_c4e0
c4e8:    d5 68 0f               ld B, [Y + 0x0f]
c4eb:    f6 32 00               ld BL, +0x0(B)
c4ee:    24 35                  srl BL, #6
c4f0:    10 0e                  bc L_c500
c4f2:    3a                     clr A, #0
c4f3:    39                     dec A, #1
c4f4:    b5 88 08               st A, [Z + 0x08]
c4f7:    a5 68 11               st AL, [Y + 0x11]
c4fa:    73 c9                  jmp L_c4c5

L_c4fc:
c4fc:    2a                     clr AL, #0
c4fd:    a5 68 11               st AL, [Y + 0x11]

L_c500:
c500:    85 68 01               ld AL, [Y + 0x01]
c503:    21 11                  dec AL, #2
c505:    15 04                  bnz L_c50b
c507:    80 8a                  ld AL, 0x8a
c509:    7b 92                  call L_c49d

L_c50b:
c50b:    80 8d                  ld AL, 0x8d
c50d:    a5 68 12               st AL, [Y + 0x12]
c510:    90 0f a0               ld A, 0x0fa0
c513:    b5 88 08               st A, [Z + 0x08]

R_c516:
c516:    95 68 0d               ld A, [Y + 0x0d]
c519:    14 c5                  bz L_c4e0
c51b:    d0 fb ff               ld B, 0xfbff
c51e:    c8                     ld BL, [A]
c51f:    42 23                  and BL, BH
c521:    e8                     st BL, [A]
c522:    73 bc                  jmp L_c4e0

L_c524:
c524:    95 68 14               ld A, [Y + 0x14]
c527:    5e                     mov Z, A
c528:    6d a2                  st X, [--S]
c52a:    95 88 08               ld A, [Z + 0x08]
c52d:    65 88 06               ld X, [Z + 0x06]
c530:    d5 41                  ld B, [X++]
c532:    50 04                  add X, A
c534:    38                     inc A, #1
c535:    59                     sub B, A
c536:    19 0b                  ble L_c543
c538:    65 a1                  ld X, [S++]

L_c53a:
c53a:    2a                     clr AL, #0
c53b:    a5 68 11               st AL, [Y + 0x11]
c53e:    a5 6c 03               st AL, @[Y + 0x03]
c541:    ac                     st AL, [Z]
c542:    09                     ret

L_c543:
c543:    b5 88 08               st A, [Z + 0x08]
c546:    8a                     ld AL, [X]
c547:    65 a1                  ld X, [S++]
c549:    c0 84                  ld BL, 0x84
c54b:    49                     sub BL, AL
c54c:    14 ec                  bz L_c53a
c54e:    09                     ret

R_c54f:
c54f:    d5 68 14               ld B, [Y + 0x14]
c552:    55 28                  mov Z, B
c554:    c5 88 02               ld BL, [Z + 0x02]
c557:    45 32                  mov BH, BL
c559:    c0 08                  ld BL, 0x08
c55b:    42 32                  and BH, BL
c55d:    14 07                  bz L_c566
c55f:    6d a2                  st X, [--S]
c561:    65 88 06               ld X, [Z + 0x06]
c564:    73 27                  jmp L_c58d

L_c566:
c566:    c0 8d                  ld BL, 0x8d
c568:    49                     sub BL, AL
c569:    14 05                  bz L_c570
c56b:    c0 8a                  ld BL, 0x8a
c56d:    49                     sub BL, AL
c56e:    15 0d                  bnz L_c57d

L_c570:
c570:    a5 68 12               st AL, [Y + 0x12]

L_c573:
c573:    d5 88 06               ld B, [Z + 0x06]
c576:    95 21                  ld A, [B++]
c578:    58                     add B, A
c579:    2a                     clr AL, #0
c57a:    a9                     st AL, [B]
c57b:    73 bd                  jmp L_c53a

L_c57d:
c57d:    6d a2                  st X, [--S]
c57f:    65 88 06               ld X, [Z + 0x06]
c582:    4d                     mov BL, AL
c583:    16 08                  blt L_c58d
c585:    9a                     ld A, [X]
c586:    19 02                  ble L_c58a
c588:    39                     dec A, #1
c589:    ba                     st A, [X]

L_c58a:
c58a:    65 a1                  ld X, [S++]
c58c:    09                     ret

L_c58d:
c58d:    4d                     mov BL, AL
c58e:    9a                     ld A, [X]
c58f:    38                     inc A, #1
c590:    b5 41                  st A, [X++]
c592:    50 04                  add X, A
c594:    e5 42                  st BL, [--X]
c596:    d5 88 04               ld B, [Z + 0x04]
c599:    59                     sub B, A
c59a:    16 ee                  blt L_c58a
c59c:    65 a1                  ld X, [S++]
c59e:    2a                     clr AL, #0
c59f:    a5 68 12               st AL, [Y + 0x12]
c5a2:    73 cf                  jmp L_c573

CrtDevice_Init:
c5a4:    90 c5 ee               ld A, CmdDeviceObj|0xc5ee
c5a7:    d7 6a                  mov IL6(S), A	 ; Set exception handler's S register
                                             	 ; Doesn't actually get used as a Stack
c5a9:    90 c3 22               ld A, CrtDevice_InterruptHandler|0xc322

L_c5ac:
c5ac:    d7 6e                  mov IL6(P), A	 ; Install exception handler
c5ae:    55 60                  mov A, Y
c5b0:    b5 a2                  st A, [--S]
c5b2:    6d a2                  st X, [--S]
c5b4:    91 01 0b               ld A, [0x010b]
c5b7:    65 01                  ld X, [A++]
c5b9:    34 40                  srl X, #1
c5bb:    5c                     mov Y, A

L_c5bc:
c5bc:    95 61                  ld A, [Y++]
c5be:    14 25                  bz L_c5e5
c5c0:    c8                     ld BL, [A]
c5c1:    14 22                  bz L_c5e5
c5c3:    c5 08 19               ld BL, [A + 0x19]
c5c6:    e5 0c 0f               st BL, @[A + 0x0f]
c5c9:    95 08 0f               ld A, [A + 0x0f]
c5cc:    f6 31 00               st BL, +0x0(A)
c5cf:    c0 94                  ld BL, 0x94
c5d1:    f6 31 01               st BL, +0x1(A)
c5d4:    c0 f0                  ld BL, 0xf0
c5d6:    42 31                  and AL, BL
c5d8:    c0 06                  ld BL, 0x06
c5da:    f6 31 0a               st BL, +0xa(A)
c5dd:    f6 31 0e               st BL, +0xe(A)
c5e0:    c0 e0                  ld BL, 0xe0
c5e2:    f6 31 0b               st BL, +0xb(A)

L_c5e5:
c5e5:    3f                     dec X
c5e6:    18 d4                  bgt L_c5bc
c5e8:    65 a1                  ld X, [S++]
c5ea:    95 a1                  ld A, [S++]
c5ec:    5c                     mov Y, A
c5ed:    09                     ret

CmdDeviceObj:
c5ee:    00 06                  (0x6)
c5f0:    cc ed                  R_cced
c5f2:    cc 49                  R_cc49
c5f4:    cc 79                  R_cc79
c5f6:    c6 00                  R_c600
c5f8:    c7 a7                  R_c7a7
c5fa:    c8 19                  R_c819
c5fc:    c8 2d                  CmdDevice_Init
c5fe:    cb ca                  R_cbca

R_c600:
c600:    7f 01                  pop {A}
c602:    b1 c6 fa               st A, [R_c6fa|0xc6fa]
c605:    85 a8 06               ld AL, [S + 0x06]
c608:    79 c7 8c               call R_c78c
c60b:    a1 c7 09               st AL, [R_c709|0xc709]
c60e:    e1 c7 0b               st BL, [R_c70b|0xc70b]
c611:    55 80                  mov A, Z
c613:    b5 a2                  st A, [--S]

R_c615:
c615:    90 c7 0f               ld A, R_c70f|0xc70f
c618:    5e                     mov Z, A
c619:    95 a8 04               ld A, [S + 0x04]
c61c:    b1 c6 af               st A, [R_c6af|0xc6af]
c61f:    3a                     clr A, #0
c620:    b3 72                  st A, [0xc694|+0x72]
c622:    85 a8 02               ld AL, [S + 0x02]
c625:    14 13                  bz L_c63a
c627:    c0 85                  ld BL, 0x85
c629:    29                     dec AL, #1
c62a:    14 02                  bz L_c62e
c62c:    c0 8a                  ld BL, 0x8a

L_c62e:
c62e:    e5 81                  st BL, [Z++]
c630:    e0 00                  st BL, 0x00
c632:    95 a8 0b               ld A, [S + 0x0b]
c635:    15 03                  bnz L_c63a
c637:    71 c6 e2               jmp R_c6e2

L_c63a:
c63a:    90 ff ff               ld A, 0xffff
c63d:    b1 c7 0d               st A, [R_c70d|0xc70d]

L_c640:
c640:    95 a8 06               ld A, [S + 0x06]
c643:    d5 a8 09               ld B, [S + 0x09]
c646:    79 cd 67               call R_cd67
c649:    79 cd 02               call R_cd02
c64c:    78 30 00 28            mul A, B, 0x0028
c650:    a5 81                  st AL, [Z++]
c652:    90 03 37               ld A, 0x0337
c655:    51 20                  sub A, B
c657:    16 04                  blt L_c65d
c659:    c0 05                  ld BL, 0x05
c65b:    66 6b                  jsys Syscall_AbortAL

L_c65d:
c65d:    91 c7 0d               ld A, [R_c70d|0xc70d]
c660:    38                     inc A, #1
c661:    14 05                  bz L_c668
c663:    39                     dec A, #1
c664:    51 20                  sub A, B
c666:    15 40                  bnz L_c6a8

L_c668:
c668:    f1 c7 0d               st B, [R_c70d|0xc70d]
c66b:    85 a8 02               ld AL, [S + 0x02]
c66e:    14 38                  bz L_c6a8
c670:    d5 a8 0b               ld B, [S + 0x0b]
c673:    30 b0 00 06            inc [S + 0x0006], #1
c677:    90 01 90               ld A, 0x0190
c67a:    59                     sub B, A
c67b:    11 03                  bnc L_c680
c67d:    95 a8 0b               ld A, [S + 0x0b]

L_c680:
c680:    c5 a8 02               ld BL, [S + 0x02]
c683:    21 31                  dec BL, #2
c685:    15 03                  bnz L_c68a
c687:    90 01 90               ld A, 0x0190

L_c68a:
c68a:    b5 81                  st A, [Z++]
c68c:    d5 a8 04               ld B, [S + 0x04]
c68f:    58                     add B, A
c690:    f5 a8 04               st B, [S + 0x04]
c693:    d0 00 00               ld B, 0x0000
c696:    58                     add B, A
c697:    f3 fb                  st B, [0xc694|-0x5]
c699:    d5 a8 0b               ld B, [S + 0x0b]
c69c:    51 20                  sub A, B
c69e:    17 01                  bp L_c6a1
c6a0:    3a                     clr A, #0

L_c6a1:
c6a1:    b5 a8 0b               st A, [S + 0x0b]
c6a4:    15 9a                  bnz L_c640
c6a6:    73 02                  jmp L_c6aa

L_c6a8:
c6a8:    31 80                  dec Z, #1

L_c6aa:
c6aa:    80 ff                  ld AL, 0xff
c6ac:    a5 81                  st AL, [Z++]
c6ae:    90 00 00               ld A, 0x0000
c6b1:    b5 81                  st A, [Z++]
c6b3:    93 df                  ld A, [0xc694|-0x21]
c6b5:    bc                     st A, [Z]
c6b6:    90 c7 0a               ld A, R_c70a|0xc70a
c6b9:    51 80                  sub A, Z
c6bb:    a3 4a                  st AL, [R_c707|0xc707|+0x4a]
c6bd:    85 a8 03               ld AL, [S + 0x03]
c6c0:    a1 c8 5c               st AL, [R_c85c|0xc85c]

L_c6c3:
c6c3:    79 c8 5b               call R_c85b
c6c6:    c7                     unknown
c6c7:    05                     di
c6c8:    4d                     mov BL, AL
c6c9:    15 17                  bnz R_c6e2
c6cb:    85 a8 02               ld AL, [S + 0x02]
c6ce:    14 12                  bz R_c6e2
c6d0:    83 3d                  ld AL, [R_c70f|0xc70f|+0x3d]
c6d2:    c0 8a                  ld BL, 0x8a
c6d4:    49                     sub BL, AL
c6d5:    14 03                  bz L_c6da
c6d7:    71 c6 15               jmp R_c615

L_c6da:
c6da:    80 88                  ld AL, 0x88
c6dc:    a3 31                  st AL, [R_c70f|0xc70f|+0x31]
c6de:    31 82                  dec Z, #3
c6e0:    73 e1                  jmp L_c6c3

R_c6e2:
c6e2:    a3 1f                  st AL, [0xc703|+0x1f]
c6e4:    95 a1                  ld A, [S++]
c6e6:    5e                     mov Z, A
c6e7:    d5 a8 04               ld B, [S + 0x04]
c6ea:    31 20                  dec B, #1
c6ec:    90 00 0b               ld A, 0x000b
c6ef:    50 0a                  add S, A
c6f1:    95 a1                  ld A, [S++]
c6f3:    5c                     mov Y, A
c6f4:    80 ff                  ld AL, 0xff
c6f6:    a1 01 1f               st AL, [0x011f]
c6f9:    90 00 00               ld A, 0x0000
c6fc:    7e 01                  push {A}
c6fe:    d1 ca 51               ld B, [R_ca51|0xca51]
c701:    90 00 00               ld A, 0x0000
c704:    09                     ret

R_c705:
c705:    00                     HALT
c706:    00                     HALT

R_c707:
c707:    00                     HALT
c708:    81

R_c709:
c709:    00                     HALT

R_c70a:
c70a:    84 00                  ld AL, @[0xc70c|+0x0]
c70c:    83 00                  ld AL, [0xc70e|+0x0]
c70e:    <null bytes>


R_c70f:
c70f:    <null bytes>


R_c711:
c711:    <null bytes>


R_c713:
c713:    <null bytes>


R_c78c:
c78c:    22 00                  clr AH, #0
c78e:    21 00                  dec AH, #1

L_c790:
c790:    20 00                  inc AH, #1
c792:    21 15                  dec AL, #6
c794:    17 fa                  bp L_c790
c796:    20 15                  inc AL, #6
c798:    45 12                  mov BH, AL
c79a:    c0 0f                  ld BL, 0x0f
c79c:    42 32                  and BH, BL
c79e:    15 02                  bnz L_c7a2
c7a0:    22 30                  clr BL, #0

L_c7a2:
c7a2:    40 23                  add BL, BH
c7a4:    45 01                  mov AL, AH
c7a6:    09                     ret

R_c7a7:
c7a7:    7e 45                  push {X, Y, Z}
c7a9:    d6 ab c8 13            st S, [R_c813|0xc813]
c7ad:    80 ff                  ld AL, 0xff
c7af:    a1 c8 5c               st AL, [R_c85c|0xc85c]
c7b2:    79 c9 2c               call R_c92c
c7b5:    08                     cl
c7b6:    95 68 0f               ld A, [Y + 0x0f]
c7b9:    5e                     mov Z, A
c7ba:    90 ff ff               ld A, 0xffff
c7bd:    f6 19 00               st AL, +0x0(Z)
c7c0:    79 c9 2c               call R_c92c
c7c3:    08                     cl
c7c4:    f6 18 00               ld AL, +0x0(Z)
c7c7:    c0 12                  ld BL, 0x12
c7c9:    49                     sub BL, AL
c7ca:    15 31                  bnz R_c7fd
c7cc:    85 68 13               ld AL, [Y + 0x13]
c7cf:    7b bb                  call R_c78c
c7d1:    e1 c7 0b               st BL, [R_c70b|0xc70b]
c7d4:    a1 c7 09               st AL, [R_c709|0xc709]
c7d7:    2a                     clr AL, #0
c7d8:    a1 c7 0d               st AL, [R_c70d|0xc70d]
c7db:    80 09                  ld AL, 0x09
c7dd:    a1 c7 07               st AL, [R_c707|0xc707]
c7e0:    90 8c ff               ld A, 0x8cff
c7e3:    b1 c7 0f               st A, [R_c70f|0xc70f]
c7e6:    90 c8 18               ld A, R_c818|0xc818
c7e9:    b1 c7 11               st A, [R_c711|0xc711]
c7ec:    3a                     clr A, #0
c7ed:    b1 c7 13               st A, [R_c713|0xc713]
c7f0:    7b 69                  call R_c85b
c7f2:    c7                     unknown
c7f3:    05                     di
c7f4:    45 11                  mov AL, AL
c7f6:    14 09                  bz L_c801
c7f8:    c0 42                  ld BL, 0x42
c7fa:    49                     sub BL, AL
c7fb:    14 09                  bz L_c806

R_c7fd:
c7fd:    32 20                  clr B, #0
c7ff:    73 08                  jmp L_c809

L_c801:
c801:    d0 00 ff               ld B, 0x00ff
c804:    73 03                  jmp L_c809

L_c806:
c806:    d0 ff ff               ld B, 0xffff

L_c809:
c809:    80 ff                  ld AL, 0xff
c80b:    a1 01 1f               st AL, [0x011f]
c80e:    f6 19 01               st AL, +0x1(Z)

L_c811:
c811:    55 ba 00 00            mov S, 0x0000
c815:    7f 45                  pop {X, Y, Z}
c817:    09                     ret

R_c818:
c818:    00                     HALT

R_c819:
c819:    79 c9 2c               call R_c92c
c81c:    08                     cl
c81d:    80 ff                  ld AL, 0xff
c81f:    a1 01 1f               st AL, [0x011f]
c822:    95 68 0f               ld A, [Y + 0x0f]
c825:    f6 11 01               st AL, +0x1(A)
c828:    79 c9 2c               call R_c92c
c82b:    08                     cl
c82c:    09                     ret

CmdDevice_Init:
c82d:    7e 45                  push {X, Y, Z}
c82f:    d6 ab c8 13            st S, [R_c813|0xc813]
c833:    d6 89 c8 4f            st Z, [R_c84f|0xc84f]
c837:    85 68 13               ld AL, [Y + 0x13]
c83a:    79 c7 8c               call R_c78c
c83d:    45 30                  mov AH, BL
c83f:    d3 0e                  ld B, [R_c84f|0xc84f|+0xe]
c841:    a5 28 04               st AL, [B + 0x04]
c844:    45 01                  mov AL, AH
c846:    a5 28 06               st AL, [B + 0x06]
c849:    80 01                  ld AL, 0x01
c84b:    a3 0f                  st AL, [R_c85c|0xc85c|+0xf]
c84d:    7b 0c                  call R_c85b

R_c84f:
c84f:    00                     HALT
c850:    00                     HALT
c851:    47 4c 00 ff 01 1f      memcpy 0x01, 0xff, [0x011f]
c857:    45 11                  mov AL, AL
c859:    73 b6                  jmp L_c811

R_c85b:
c85b:    80 00                  ld AL, 0x00
c85d:    15 02                  bnz L_c861
c85f:    80 0d                  ld AL, 0x0d

L_c861:
c861:    a1 c9 ba               st AL, [R_c9ba|0xc9ba]
c864:    7e 45                  push {X, Y, Z}
c866:    55 a0                  mov A, S
c868:    b1 c8 f2               st A, [R_c8f2|0xc8f2]
c86b:    95 68 0f               ld A, [Y + 0x0f]
c86e:    5e                     mov Z, A
c86f:    91 01 03               ld A, [CurrentProcess|0x0103]
c872:    2e 0d fa 00 36         wpf 0xfa, [A + 0x36]
c877:    2e 0c 7a 01 81         wpf 0x7a, [PageTableTwo|0x0181]
c87c:    c0 02                  ld BL, 0x02
c87e:    2f 28                  ld_isr B

R_c880:
c880:    65 a4                  ld X, @[S]
c882:    69 ca 22               st X, [R_ca22|0xca22]
c885:    79 c9 2c               call R_c92c
c888:    08                     cl
c889:    f6 18 00               ld AL, +0x0(Z)
c88c:    80 41                  ld AL, 0x41
c88e:    f6 19 00               st AL, +0x0(Z)
c891:    7b 75                  call L_c908
c893:    08                     cl
c894:    85 41                  ld AL, [X++]
c896:    f6 19 00               st AL, +0x0(Z)
c899:    79 c9 2c               call R_c92c
c89c:    02                     sf
c89d:    85 41                  ld AL, [X++]
c89f:    f6 19 00               st AL, +0x0(Z)
c8a2:    d5 48 06               ld B, [X + 0x06]
c8a5:    77 32 00 28            div B, B, 0x0028
c8a9:    3a                     clr A, #0
c8aa:    85
c8ab:    48

L_c8ac:
c8ac:    09                     ret
c8ad:    58
c8ae:    f1 'q'
c8af:    ca 'J'
c8b0:    51
c8b1:    7b
c8b2:    4b
c8b3:    14
c8b4:    03
c8b5:    71
c8b6:    c9 'I'
c8b7:    4f
c8b8:    3a
c8b9:    85
c8ba:    41
c8bb:    14
c8bc:    34
c8bd:    c5 'E'
c8be:    68
c8bf:    02
c8c0:    e1 'a'
c8c1:    ca 'J'
c8c2:    4f
c8c3:    55
c8c4:    42
c8c5:    50
c8c6:    04
c8c7:    79
c8c8:    ca 'J'
c8c9:    94
c8ca:    80
c8cb:    43
c8cc:    f6 'v'
c8cd:    19
c8ce:    00

L_c8cf:
c8cf:    7b 2d                  call R_c8fe
c8d1:    14 05                  bz L_c8d8
c8d3:    79 ca c3               call R_cac3
c8d6:    cb                     ld BL, [Y]
c8d7:    03                     rf

L_c8d8:
c8d8:    79 ca a5               call R_caa5
c8db:    d5 41                  ld B, [X++]
c8dd:    9a                     ld A, [X]
c8de:    79 ca 94               call R_ca94
c8e1:    80 45                  ld AL, 0x45
c8e3:    f6 19 00               st AL, +0x0(Z)
c8e6:    7b 16                  call R_c8fe
c8e8:    15 65                  bnz R_c94f
c8ea:    7e 01                  push {A}
c8ec:    79 ca a5               call R_caa5
c8ef:    7f 01                  pop {A}

R_c8f1:
c8f1:    60 00 00               ld X, 0x0000
c8f4:    55 4a                  mov S, X
c8f6:    7f 45                  pop {X, Y, Z}
c8f8:    d1 ca 51               ld B, [R_ca51|0xca51]
c8fb:    30 41                  inc X, #2
c8fd:    09                     ret

R_c8fe:
c8fe:    7b 2c                  call R_c92c
c900:    08                     cl
c901:    7b 05                  call L_c908
c903:    01                     nop
c904:    f6 18 00               ld AL, +0x0(Z)
c907:    09                     ret

L_c908:
c908:    85 41                  ld AL, [X++]
c90a:    a5 a2                  st AL, [--S]
c90c:    79 cc 80               call R_cc80

L_c90f:
c90f:    d5 68 0f               ld B, [Y + 0x0f]
c912:    f6 32 01               ld BL, +0x1(B)
c915:    8d                     ld AL, [S]
c916:    4a                     and BL, AL
c917:    49                     sub BL, AL
c918:    14 0c                  bz L_c926
c91a:    79 cc 89               call R_cc89
c91d:    14 f0                  bz L_c90f
c91f:    85 a1                  ld AL, [S++]
c921:    79 ca c3               call R_cac3
c924:    cb                     ld BL, [Y]
c925:    1e

L_c926:
c926:    85 a1                  ld AL, [S++]
c928:    79 cc 97               call R_cc97
c92b:    09                     ret

R_c92c:
c92c:    85 41                  ld AL, [X++]
c92e:    a5 a2                  st AL, [--S]
c930:    79 cc 80               call R_cc80

L_c933:
c933:    d5 68 0f               ld B, [Y + 0x0f]
c936:    f6 32 01               ld BL, +0x1(B)
c939:    8d                     ld AL, [S]
c93a:    4a                     and BL, AL
c93b:    14 0c                  bz L_c949
c93d:    79 cc 89               call R_cc89
c940:    14 f1                  bz L_c933
c942:    85 a1                  ld AL, [S++]
c944:    79 ca c3               call R_cac3
c947:    cb                     ld BL, [Y]
c948:    1e

L_c949:
c949:    85 a1                  ld AL, [S++]
c94b:    79 cc 97               call R_cc97
c94e:    09                     ret

R_c94f:
c94f:    f6 19 01               st AL, +0x1(Z)
c952:    c1 c8 5c               ld BL, [R_c85c|0xc85c]
c955:    17 02                  bp L_c959
c957:    73 98                  jmp R_c8f1

L_c959:
c959:    c0 41                  ld BL, 0x41
c95b:    49                     sub BL, AL
c95c:    15 05                  bnz L_c963
c95e:    90 ce d2               ld A, 0xced2
c961:    73 12                  jmp L_c975

L_c963:
c963:    c0 24                  ld BL, 0x24
c965:    49                     sub BL, AL
c966:    15 05                  bnz L_c96d
c968:    90 c6 cc               ld A, 0xc6cc
c96b:    73 08                  jmp L_c975

L_c96d:
c96d:    c0 42                  ld BL, 0x42
c96f:    49                     sub BL, AL
c970:    15 29                  bnz L_c99b
c972:    90 d7 d0               ld A, 0xd7d0

L_c975:
c975:    b1 cb 3a               st A, [R_cb3a|0xcb3a]
c978:    90 c0 c0               ld A, 0xc0c0
c97b:    b1 cb 3d               st A, [R_cb3d|0xcb3d]
c97e:    80 02                  ld AL, 0x02
c980:    46 80 91 cb 3d 60 02   baseconv(8, 0) [R_cb3d|0xcb3d], [Y + 0x02]
c987:    79 b4 f8               call PrintStringToErrorDevice
c98a:    cb 37                      string = R_cb37
c98c:    60 13 88               ld X, 0x1388

L_c98f:
c98f:    66 07                  jsys Syscall_Yield
c991:    3f                     dec X
c992:    18 fb                  bgt L_c98f

L_c994:
c994:    95 68 0f               ld A, [Y + 0x0f]
c997:    5e                     mov Z, A
c998:    71 c8 80               jmp R_c880

L_c99b:
c99b:    c0 2a                  ld BL, 0x2a
c99d:    49                     sub BL, AL
c99e:    14 04                  bz L_c9a4
c9a0:    21 30                  dec BL, #1
c9a2:    15 03                  bnz L_c9a7

L_c9a4:
c9a4:    79 ca 57               call R_ca57

L_c9a7:
c9a7:    a5 a2                  st AL, [--S]
c9a9:    90 c0 c0               ld A, 0xc0c0
c9ac:    b1 cb 7a               st A, [R_cb7a|0xcb7a]
c9af:    80 02                  ld AL, 0x02
c9b1:    46 e0 92 cb 7a 0a      baseconv(e, 0) [R_cb7a|0xcb7a], [S]
c9b7:    85 a1                  ld AL, [S++]
c9b9:    c0 00                  ld BL, 0x00
c9bb:    21 30                  dec BL, #1
c9bd:    e3 fb                  st BL, [R_c9ba|0xc9ba|-0x5]
c9bf:    19 30                  ble L_c9f1
c9c1:    95 a4                  ld A, @[S]
c9c3:    50 10 00 0a            add A, A, 0x000a

L_c9c7:
c9c7:    c8                     ld BL, [A]
c9c8:    20 30                  inc BL, #1
c9ca:    14 c8                  bz L_c994
c9cc:    21 30                  dec BL, #1
c9ce:    45 32                  mov BH, BL
c9d0:    c0 85                  ld BL, 0x85
c9d2:    41 23                  sub BL, BH
c9d4:    15 04                  bnz L_c9da
c9d6:    c0 86                  ld BL, 0x86
c9d8:    73 12                  jmp L_c9ec

L_c9da:
c9da:    c0 86                  ld BL, 0x86
c9dc:    41 23                  sub BL, BH

L_c9de:
c9de:    15 04                  bnz L_c9e4
c9e0:    c0 87                  ld BL, 0x87
c9e2:    73 08                  jmp L_c9ec

L_c9e4:
c9e4:    c0 87                  ld BL, 0x87
c9e6:    41 23                  sub BL, BH
c9e8:    15 03                  bnz L_c9ed
c9ea:    c0 85                  ld BL, 0x85

L_c9ec:
c9ec:    e8                     st BL, [A]

L_c9ed:
c9ed:    30 03                  inc A, #4
c9ef:    73 d6                  jmp L_c9c7

L_c9f1:
c9f1:    7b 64                  call R_ca57
c9f3:    c0 30                  ld BL, 0x30
c9f5:    49                     sub BL, AL
c9f6:    16 05                  blt L_c9fd
c9f8:    d0 cb 40               ld B, R_cb40|0xcb40
c9fb:    73 0d                  jmp L_ca0a

L_c9fd:
c9fd:    c0 20                  ld BL, 0x20
c9ff:    49                     sub BL, AL
ca00:    16 05                  blt L_ca07
ca02:    d0 cb aa               ld B, R_cbaa|0xcbaa
ca05:    73 03                  jmp L_ca0a

L_ca07:
ca07:    d0 cb 50               ld B, R_cb50|0xcb50

L_ca0a:
ca0a:    f3 0e                  st B, [R_ca1a|0xca1a|+0xe]
ca0c:    c1 c8 5c               ld BL, [R_c85c|0xc85c]
ca0f:    14 03                  bz R_ca14
ca11:    71 c8 f1               jmp R_c8f1

R_ca14:
ca14:    7c 07                  call @[0xca1d|+0x7]
ca16:    ca                     ld BL, [X]
ca17:    e3 7c                  st BL, [0xca95|+0x7c]
ca19:    03                     rf

R_ca1a:
ca1a:    00                     HALT
ca1b:    00                     HALT
ca1c:    79 b4 f8               call PrintStringToErrorDevice
ca1f:    cb 75                      string = R_cb75	 ; "EC:XX CMDS: "
ca21:    90 c7 05               ld A, R_c705|0xc705
ca24:    5c                     mov Y, A
ca25:    3a                     clr A, #0
ca26:    85 68 02               ld AL, [Y + 0x02]
ca29:    30 02                  inc A, #3
ca2b:    5b                     mov X, A

L_ca2c:
ca2c:    90 c0 c0               ld A, 0xc0c0
ca2f:    b1 cb 85               st A, [R_cb85|0xcb85]
ca32:    80 02                  ld AL, 0x02
ca34:    46 e0 92 cb 85 06      baseconv(e, 0) [R_cb85|0xcb85], [Y]
ca3a:    30 60                  inc Y, #1
ca3c:    7c df                  call @[0xca1d|-0x21]
ca3e:    cb                     ld BL, [Y]
ca3f:    83 3f                  ld AL, [0xca80|+0x3f]
ca41:    18 e9                  bgt L_ca2c
ca43:    7c d8                  call @[0xca1d|-0x28]
ca45:    ca                     ld BL, [X]
ca46:    e3 47                  st BL, [0xca8f|+0x47]
ca48:    4c                     mov YL, AL
ca49:    00                     HALT
ca4a:    ff                     st B, [P]
ca4b:    01                     nop
ca4c:    1f 90                  b?F L_c9de
ca4e:    00                     HALT

R_ca4f:
ca4f:    00                     HALT
ca50:    d0 00 00               ld B, 0x0000
ca53:    c0 0d                  ld BL, 0x0d
ca55:    66 6b                  jsys Syscall_AbortAL

R_ca57:
ca57:    a3 35                  st AL, [0xca8e|+0x35]
ca59:    85 68 13               ld AL, [Y + 0x13]
ca5c:    79 c7 8c               call R_c78c
ca5f:    a3 30                  st AL, [0xca91|+0x30]
ca61:    79 c9 2c               call R_c92c
ca64:    08                     cl
ca65:    d0 ca 90               ld B, R_ca90|0xca90
ca68:    90 00 04               ld A, 0x0004
ca6b:    7b 27                  call R_ca94
ca6d:    80 43                  ld AL, 0x43
ca6f:    f6 19 00               st AL, +0x0(Z)
ca72:    79 c8 fe               call R_c8fe
ca75:    15 12                  bnz L_ca89
ca77:    d0 c8 18               ld B, R_c818|0xc818
ca7a:    90 00 01               ld A, 0x0001
ca7d:    7b 15                  call R_ca94
ca7f:    80 45                  ld AL, 0x45
ca81:    f6 19 00               st AL, +0x0(Z)
ca84:    79 c8 fe               call R_c8fe
ca87:    14 04                  bz L_ca8d

L_ca89:
ca89:    7b 38                  call R_cac3
ca8b:    cb                     ld BL, [Y]
ca8c:    bc                     st A, [Z]

L_ca8d:
ca8d:    80 00                  ld AL, 0x00
ca8f:    09                     ret

R_ca90:
ca90:    81 00 82               ld AL, [0x0082]
ca93:    ff                     st B, [P]

R_ca94:
ca94:    2f 34                  ld_dma_mode B
ca96:    2f 20                  ld_dma_addr B
ca98:    3b                     not A, #0
ca99:    2f 02                  ld_dma_count A
ca9b:    2f 06                  enable_dma
ca9d:    59                     sub B, A
ca9e:    f0 00 00               st B, 0x0000
caa1:    3a                     clr A, #0
caa2:    d7 12                  mov IL1(B), A
caa4:    09                     ret

R_caa5:
caa5:    2f 07                  st_ A
caa7:    2f 03                  st_dma_count A
caa9:    38                     inc A, #1
caaa:    14 04                  bz L_cab0
caac:    7b 15                  call R_cac3
caae:    cb                     ld BL, [Y]
caaf:    88                     ld AL, [A]

L_cab0:
cab0:    e6 12                  mov A, IL1(B)
cab2:    15 0b                  bnz L_cabf
cab4:    2f 03                  st_dma_count A
cab6:    2f 21                  st_dma_addr B
cab8:    59                     sub B, A
cab9:    93 e4                  ld A, [0xca9f|-0x1c]
cabb:    59                     sub B, A
cabc:    15 01                  bnz L_cabf
cabe:    09                     ret

L_cabf:
cabf:    7b 02                  call R_cac3
cac1:    cb                     ld BL, [Y]
cac2:    9c                     ld A, [Z]

R_cac3:
cac3:    f6 19 01               st AL, +0x1(Z)
cac6:    81 c8 5c               ld AL, [R_c85c|0xc85c]
cac9:    17 03                  bp L_cace
cacb:    71 c7 fd               jmp R_c7fd

L_cace:
cace:    14 05                  bz L_cad5
cad0:    80 ff                  ld AL, 0xff
cad2:    71 c8 f1               jmp R_c8f1

L_cad5:
cad5:    95 41                  ld A, [X++]
cad7:    b1 ca 1a               st A, [R_ca1a|0xca1a]
cada:    90 d8 d8               ld A, 0xd8d8
cadd:    b1 cb 7a               st A, [R_cb7a|0xcb7a]
cae0:    71 ca 14               jmp R_ca14

R_cae3:
cae3:    00                     HALT
cae4:    01                     nop
cae5:    8d                     ld AL, [S]
cae6:    27, "WDC CONTROL SIGNAL FAILURE\r"

R_cb03:
cb03:    25, "WDC COMMAND LOAD FAILURE\r"

R_cb1e:
cb1e:    23, "WDC CONTROL SIGNAL LAG\r"

R_cb37:
cb37:    7, "\x07ID NN\r"

R_cb40:
cb40:    14, "WDC I/O ERROR\r"

R_cb50:
cb50:    35, "WDC ERROR - ILLEGAL COMMAND STRING\r"

R_cb75:
cb75:    12, "EC:XX CMDS: "

R_cb83:
cb83:    3, "XX "

R_cb88:
cb88:    18, "DMA NOT COMPLETED\r"

R_cb9c:
cb9c:    12, "DMA FAILURE\r"

R_cbaa:
cbaa:    16, "WDC I/O FAILURE\r"

R_cbbc:
cbbc:    12, "RTZ FAILURE\r"

R_cbca:
cbca:    7e 61                  push {Y}
cbcc:    95 41                  ld A, [X++]
cbce:    d5 41                  ld B, [X++]
cbd0:    f5 a2                  st B, [--S]
cbd2:    b5 a2                  st A, [--S]
cbd4:    85 41                  ld AL, [X++]
cbd6:    79 cd a8               call R_cda8
cbd9:    15 04                  bnz L_cbdf

L_cbdb:
cbdb:    c0 06                  ld BL, 0x06
cbdd:    66 6b                  jsys Syscall_AbortAL

L_cbdf:
cbdf:    85 68 13               ld AL, [Y + 0x13]
cbe2:    a5 a2                  st AL, [--S]
cbe4:    95 41                  ld A, [X++]
cbe6:    b5 a2                  st A, [--S]
cbe8:    95 41                  ld A, [X++]

L_cbea:
cbea:    b5 a2                  st A, [--S]
cbec:    85 41                  ld AL, [X++]
cbee:    c0 80                  ld BL, 0x80
cbf0:    4a                     and BL, AL
cbf1:    14 02                  bz L_cbf5
cbf3:    c0 01                  ld BL, 0x01

L_cbf5:
cbf5:    e5 a2                  st BL, [--S]
cbf7:    c0 7f                  ld BL, 0x7f
cbf9:    42 31                  and AL, BL
cbfb:    a5 a2                  st AL, [--S]
cbfd:    21 11                  dec AL, #2
cbff:    19 04                  ble L_cc05
cc01:    c0 08                  ld BL, 0x08
cc03:    66 6b                  jsys Syscall_AbortAL

L_cc05:
cc05:    80 04                  ld AL, 0x04
cc07:    a5 a2                  st AL, [--S]
cc09:    80 1f                  ld AL, 0x1f
cc0b:    66 12                  jsys Syscall_12
cc0d:    d6 67 01 3f            st Y, [0x013f]	 ; fixme: bad encoding?
cc11:    3a                     clr A, #0
cc12:    85 a1                  ld AL, [S++]
cc14:    3d                     sll A, #1
cc15:    50 71 00 05            add A, [Y + 0x0005], A
cc19:    7d 04                  call @[A]
cc1b:    09                     ret

L_cc1c:
cc1c:    7e 61                  push {Y}
cc1e:    95 88 04               ld A, [Z + 0x04]
cc21:    b5 a2                  st A, [--S]
cc23:    55 82                  mov B, Z
cc25:    66 0c                  jsys Syscall_0c
cc27:    95 88 06               ld A, [Z + 0x06]
cc2a:    30 01                  inc A, #2
cc2c:    b3 17                  st A, [0xcc45|+0x17]
cc2e:    f5 a2                  st B, [--S]
cc30:    85 68 02               ld AL, [Y + 0x02]
cc33:    79 cd a8               call R_cda8
cc36:    15 02                  bnz L_cc3a
cc38:    73 a1                  jmp L_cbdb

L_cc3a:
cc3a:    85 68 13               ld AL, [Y + 0x13]
cc3d:    a5 a2                  st AL, [--S]
cc3f:    95 88 08               ld A, [Z + 0x08]
cc42:    b5 a2                  st A, [--S]
cc44:    90 00 00               ld A, 0x0000
cc47:    73 a1                  jmp L_cbea

R_cc49:
cc49:    5c                     mov Y, A
cc4a:    d0 01 90               ld B, 0x0190
cc4d:    95 88 04               ld A, [Z + 0x04]
cc50:    59                     sub B, A
cc51:    17 18                  bp L_cc6b
cc53:    80 05                  ld AL, 0x05

L_cc55:
cc55:    ac                     st AL, [Z]
cc56:    2a                     clr AL, #0
cc57:    a5 6c 03               st AL, @[Y + 0x03]
cc5a:    a5 6c 05               st AL, @[Y + 0x05]
cc5d:    65 a1                  ld X, [S++]
cc5f:    95 a1                  ld A, [S++]
cc61:    5c                     mov Y, A
cc62:    95 a1                  ld A, [S++]
cc64:    5e                     mov Z, A
cc65:    91 01 01               ld A, [0x0101]
cc68:    75 08 03               jmp [A + 0x03]

L_cc6b:
cc6b:    d5 88 06               ld B, [Z + 0x06]
cc6e:    b5 21                  st A, [B++]
cc70:    58                     add B, A
cc71:    2a                     clr AL, #0
cc72:    a9                     st AL, [B]
cc73:    7b a7                  call L_cc1c
cc75:    01                     nop
cc76:    2a                     clr AL, #0
cc77:    73 dc                  jmp L_cc55

R_cc79:
cc79:    5c                     mov Y, A
cc7a:    7b a0                  call L_cc1c
cc7c:    02                     sf
cc7d:    2a                     clr AL, #0
cc7e:    73 d5                  jmp L_cc55

R_cc80:
    ; SystemInfo + 0x32 = 8
cc80:    32 08                  clr A, #8
cc82:    d1 01 03               ld B, [CurrentProcess|0x0103]
cc85:    b5 28 32               st A, [B + 0x32]
cc88:    09                     ret

R_cc89:
cc89:    66 07                  jsys Syscall_Yield
cc8b:    d1 01 03               ld B, [CurrentProcess|0x0103]
cc8e:    95 28 32               ld A, [B + 0x32]
cc91:    14 02                  bz L_cc95
cc93:    3a                     clr A, #0
cc94:    09                     ret

L_cc95:
cc95:    38                     inc A, #1
cc96:    09                     ret

R_cc97:
cc97:    d1 01 03               ld B, [CurrentProcess|0x0103]
cc9a:    3a                     clr A, #0
cc9b:    39                     dec A, #1
cc9c:    b5 28 32               st A, [B + 0x32]
cc9f:    09                     ret

R_cca0:
cca0:    79 cc f5               call R_ccf5
cca3:    91 01 0b               ld A, [0x010b]
cca6:    30 01                  inc A, #2

L_cca8:
cca8:    d5 01                  ld B, [A++]
ccaa:    14 11                  bz L_ccbd
ccac:    51 82                  sub B, Z
ccae:    15 f8                  bnz L_cca8
ccb0:    3a                     clr A, #0
ccb1:    b5 88 1b               st A, [Z + 0x1b]
ccb4:    95 88 0f               ld A, [Z + 0x0f]
ccb7:    c5 88 19               ld BL, [Z + 0x19]
ccba:    f6 31 00               st BL, +0x0(A)

L_ccbd:
ccbd:    85 88 11               ld AL, [Z + 0x11]
ccc0:    14 07                  bz L_ccc9
ccc2:    2a                     clr AL, #0
ccc3:    a5 88 11               st AL, [Z + 0x11]
ccc6:    a5 8c 14               st AL, @[Z + 0x14]

L_ccc9:
ccc9:    91 00 5a               ld A, [0x005a]
cccc:    d5 08 5e               ld B, [A + 0x5e]
cccf:    3a                     clr A, #0
ccd0:    a5 28 02               st AL, [B + 0x02]
ccd3:    a5 28 05               st AL, [B + 0x05]
ccd6:    a5 28 08               st AL, [B + 0x08]
ccd9:    a5 28 0b               st AL, [B + 0x0b]
ccdc:    a5 28 0e               st AL, [B + 0x0e]
ccdf:    a5 28 11               st AL, [B + 0x11]
cce2:    a5 28 14               st AL, [B + 0x14]
cce5:    91 01 01               ld A, [0x0101]
cce8:    75 08 03               jmp [A + 0x03]
cceb:    cc 'L'
ccec:    ed 'm'

R_cced:
cced:    7b 06                  call R_ccf5
ccef:    91 01 01               ld A, [0x0101]
ccf2:    75 08 03               jmp [A + 0x03]

R_ccf5:
ccf5:    85 8c 03               ld AL, @[Z + 0x03]
ccf8:    49                     sub BL, AL
ccf9:    15 06                  bnz L_cd01
ccfb:    e5 8c 03               st BL, @[Z + 0x03]
ccfe:    e5 8c 05               st BL, @[Z + 0x05]

L_cd01:
cd01:    09                     ret

R_cd02:
cd02:    6d a2                  st X, [--S]
cd04:    f5 a2                  st B, [--S]
cd06:    55 62                  mov B, Y
cd08:    f5 a2                  st B, [--S]
cd0a:    a5 a2                  st AL, [--S]
cd0c:    3a                     clr A, #0
cd0d:    39                     dec A, #1
cd0e:    5c                     mov Y, A
cd0f:    65 28 14               ld X, [B + 0x14]
cd12:    31 41                  dec X, #2

L_cd14:
cd14:    30 41                  inc X, #2
cd16:    30 60                  inc Y, #1
cd18:    8d                     ld AL, [S]
cd19:    c5 41                  ld BL, [X++]
cd1b:    16 24                  blt L_cd41
cd1d:    49                     sub BL, AL
cd1e:    15 f4                  bnz L_cd14
cd20:    95 a8 03               ld A, [S + 0x03]
cd23:    da                     ld B, [X]
cd24:    59                     sub B, A
cd25:    15 ed                  bnz L_cd14
cd27:    95 a8 01               ld A, [S + 0x01]
cd2a:    d5 08 11               ld B, [A + 0x11]
cd2d:    3a                     clr A, #0
cd2e:    60 00 04               ld X, 0x0004

L_cd31:
cd31:    35 20                  sll B, #1
cd33:    37 00                  rlc A, #1
cd35:    3f                     dec X
cd36:    18 f9                  bgt L_cd31
cd38:    50 62                  add B, Y
cd3a:    11 01                  bnc L_cd3d
cd3c:    38                     inc A, #1

L_cd3d:
cd3d:    ad                     st AL, [S]
cd3e:    f5 a8 03               st B, [S + 0x03]

L_cd41:
cd41:    3a                     clr A, #0
cd42:    85 a1                  ld AL, [S++]
cd44:    d5 a1                  ld B, [S++]
cd46:    55 26                  mov Y, B
cd48:    d5 a1                  ld B, [S++]
cd4a:    65 a1                  ld X, [S++]
cd4c:    09                     ret

FormatHexWord:
    ; Looks like this function converts a 16bit word to hex and writes
    ; it to the ascii buffer specified at [X]
cd4d:    7e 05                  push {A, B, X}
cd4f:    b3 14                  st A, [FormatHexWord_Temp|0xcd65|+0x14]
cd51:    65 41                  ld X, [X++]
cd53:    47 9e 03 c0 04         memset 0x04, 0xc0, [X]
cd58:    80 04                  ld AL, 0x04
cd5a:    46 e1 98 40 cd 65      baseconv(e, 1) [X], [FormatHexWord_Temp|0xcd65]
cd60:    7f 05                  pop {A, B, X}
cd62:    30 41                  inc X, #2
cd64:    09                     ret

FormatHexWord_Temp:
cd65:    00 00                  (0x0)

R_cd67:
cd67:    6d a2                  st X, [--S]
cd69:    32 40                  clr X, #0
cd6b:    7e 03                  push {A, B}
cd6d:    d9                     ld B, [B]
cd6e:    51 20                  sub A, B
cd70:    10 06                  bc L_cd78
cd72:    7f 01                  pop {A}
cd74:    c0 24                  ld BL, 0x24
cd76:    66 6b                  jsys Syscall_AbortAL

L_cd78:
cd78:    7f 01                  pop {A}
cd7a:    dd                     ld B, [S]
cd7b:    d5 28 04               ld B, [B + 0x04]
cd7e:    c0 10                  ld BL, 0x10
cd80:    07                     rl

L_cd81:
cd81:    21 20                  dec BH, #1
cd83:    16 07                  blt L_cd8c
cd85:    21 30                  dec BL, #1
cd87:    3c                     srl A, #1
cd88:    36 40                  rrc X, #1
cd8a:    73 f5                  jmp L_cd81

L_cd8c:
cd8c:    36 40                  rrc X, #1
cd8e:    07                     rl
cd8f:    21 30                  dec BL, #1
cd91:    18 f9                  bgt L_cd8c
cd93:    5d                     mov B, A
cd94:    3d                     sll A, #1
cd95:    58                     add B, A
cd96:    95 a1                  ld A, [S++]
cd98:    58                     add B, A
cd99:    3a                     clr A, #0
cd9a:    85 29 1b               ld AL, [B++ + 0x1b]
cd9d:    d5 28 1b               ld B, [B + 0x1b]
cda0:    50 42                  add B, X
cda2:    11 01                  bnc L_cda5
cda4:    38                     inc A, #1

L_cda5:
cda5:    65 a1                  ld X, [S++]
cda7:    09                     ret

R_cda8:
cda8:    c1 01 06               ld BL, [0x0106]
cdab:    49                     sub BL, AL
cdac:    18 0d                  bgt L_cdbb
cdae:    6d a2                  st X, [--S]
cdb0:    61 01 09               ld X, [DevicesPtr|0x0109]

L_cdb3:
cdb3:    d5 41                  ld B, [X++]
cdb5:    55 26                  mov Y, B
cdb7:    15 04                  bnz L_cdbd
cdb9:    65 a1                  ld X, [S++]

L_cdbb:
cdbb:    3a                     clr A, #0
cdbc:    09                     ret

L_cdbd:
cdbd:    cb                     ld BL, [Y]
cdbe:    14 f3                  bz L_cdb3
cdc0:    46 00 2d 04 60 01      unkbig2(0, 0) 0x04, [Y + 0x01]
cdc6:    15 eb                  bnz L_cdb3
cdc8:    c5 68 02               ld BL, [Y + 0x02]
cdcb:    49                     sub BL, AL
cdcc:    15 e5                  bnz L_cdb3
cdce:    65 a1                  ld X, [S++]
cdd0:    09                     ret

Start:
    ; This is the entry point where WIPL transfers control
    ; Z is the disk type: 0=HAWK, 1=FINCH/FLOPPY, 2=PHOENIX
cdd1:    1c 02                  bs3 L_cdd5	 ; Sense #3 jumps straight to a debugger
cdd3:    73 0f                  jmp R_cde4

L_cdd5:
    ; The code is careful to not trample too many registers before the debugger runs
    ; But it does trample B.
cdd5:    d0 cd e4               ld B, R_cde4|0xcde4	 ; Save return address for the debugger to exit to
cdd8:    f1 e3 9b               st B, [Tos_Return|0xe39b]
cddb:    d0 e3 99               ld B, Tos_Entry|0xe399
cdde:    f1 00 1a               st B, [0x001a]
cde1:    71 e3 99               jmp Tos_Entry	 ; Transfer exection

R_cde4:
cde4:    32 c0                  clr C, #0	 ; Clear context register
cde6:    47 9c ef 00 00 10      memset 0xf0, 0x00, [0x0010]	 ; Memset? all registers in other interrupt levels
cdec:    55 ba ce b9            mov S, R_ceb9|0xceb9	 ; Setup Stack? This isn't a very good stack pointer
cdf0:    b1 e1 1d               st A, [WIPL_A|0xe11d]	 ; Store the A variable that WIPL gives us
cdf3:    55 88                  mov Z, Z
cdf5:    14 0c                  bz L_ce03
cdf7:    31 80                  dec Z, #1
cdf9:    15 04                  bnz L_cdff
cdfb:    c0 15                  ld BL, 0x15
cdfd:    73 06                  jmp L_ce05

L_cdff:
cdff:    c0 0b                  ld BL, 0x0b
ce01:    73 02                  jmp L_ce05

L_ce03:
ce03:    c0 01                  ld BL, 0x01

L_ce05:
ce05:    1d 02                  bs4 L_ce09
ce07:    21 30                  dec BL, #1

L_ce09:
ce09:    e1 db 19               st BL, [DiskNum|0xdb19]	 ; BL should now be the DISK number.
                                                       	 ; 0/1 for Hawk, 10/11 for Finch, 20/21 for Phoenix
ce0c:    1b 06                  bs2 L_ce14
ce0e:    47 4c 00 00 e3 45      memcpy 0x01, 0x00, [DoAutoboot|0xe345]

L_ce14:
ce14:    d2 01 09               ld B, @[DevicesPtr|0x0109]
ce17:    a5 28 19               st AL, [B + 0x19]
ce1a:    90 ad c8               ld A, AbortHandler|0xadc8
ce1d:    d7 fe                  mov IL15(P), A	 ; Install abort handler in interrupt level 15
ce1f:    3a                     clr A, #0
ce20:    d7 ac                  mov IL10(C), A
ce22:    90 01 00               ld A, 0x0100
ce25:    b1 00 5a               st A, [0x005a]
ce28:    2e 2c 78 e1 1a         wpf1 0x78, [OPSYS_Page0|0xe11a]	 ; Map OPSYS's page 0 to 0x7800
ce2d:    d0 78 00               ld B, 0x7800
ce30:    55 26                  mov Y, B
ce32:    32 20                  clr B, #0
ce34:    90 07 ff               ld A, 0x07ff
ce37:    f7                     ?F7?	 ; could this be a memcpy of 0x0000 to 0x7800?
ce38:    47 4c 01 e3 99 00 1a   memcpy 0x02, Tos_Entry|0xe399, [0x001a]
ce3f:    2e 2c 78 e1 19         wpf1 0x78, [R_e119|0xe119]
ce44:    d0 01 00               ld B, 0x0100
ce47:    55 26                  mov Y, B
ce49:    90 ee ff               ld A, 0xeeff
ce4c:    f7                     ?F7?	 ; memcpy
ce4d:    2e 2c 00 e1 1a         wpf1 0x00, [OPSYS_Page0|0xe11a]
ce52:    90 78 05               ld A, 0x7805
ce55:    b1 ad c6               st A, [R_adc6|0xadc6]
ce58:    47 4c 04 00 00 00 05 7f 78 00 memcpy 0x05, 0x000000057f, [0x7800]
ce62:    47 4c 04 78 00 07 f0 ff 78 05 memcpy 0x05, 0x780007f0ff, [0x7805]
ce6c:    92 01 07               ld A, @[0x0107]
ce6f:    2e 0d f9 00 36         wpf 0xf9, [A + 0x36]
ce74:    2e 0d fb 00 36         wpf 0xfb, [A + 0x36]
ce79:    47 44 0f 00 36 01 81   memcpy 0x10, [A + 0x36], [PageTableTwo|0x0181]
ce80:    90 00 01               ld A, 0x0001
ce83:    d7 6c                  mov IL6(C), A
ce85:    60 ff ff               ld X, 0xffff

L_ce88:
ce88:    2e 2c f8 e1 1f         wpf1 0xf8, [R_e11f|0xe11f]
ce8d:    3a                     clr A, #0
ce8e:    aa                     st AL, [X]
ce8f:    8a                     ld AL, [X]
ce90:    41 01                  sub AL, AH
ce92:    15 20                  bnz L_ceb4
ce94:    55 40                  mov A, X
ce96:    aa                     st AL, [X]
ce97:    8a                     ld AL, [X]
ce98:    41 01                  sub AL, AH
ce9a:    15 18                  bnz L_ceb4
ce9c:    d0 f8 00               ld B, 0xf800
ce9f:    55 26                  mov Y, B
cea1:    90 07 ff               ld A, 0x07ff
cea4:    f7                     ?F7?
cea5:    22 00                  clr AH, #0
cea7:    81 e1 1f               ld AL, [R_e11f|0xe11f]
ceaa:    28                     inc AL, #1
ceab:    a1 e1 1f               st AL, [R_e11f|0xe11f]
ceae:    51 10 00 7d            sub A, A, 0x007d
ceb2:    17 d4                  bp L_ce88

L_ceb4:
ceb4:    2e 2c f8 e1 20         wpf1 0xf8, [R_e120|0xe120]

R_ceb9:
ceb9:    79 b4 46               call InitLevel10Device
cebc:    61 01 26               ld X, [EarlyInitDevicesPtr|0x0126]

L_cebf:
    ; This initilizes all devices in the null-terminated EarlyInitDevices array
    ; Which in this case is just CrtDevice_Init
cebf:    95 41                  ld A, [X++]
cec1:    14 09                  bz L_cecc
cec3:    95 08 0e               ld A, [A + 0x0e]
cec6:    14 f7                  bz L_cebf
cec8:    7d 00                  call [A]
ceca:    73 f3                  jmp L_cebf

L_cecc:
    ; LOS Prompt:
cecc:    04                     ei
cecd:    47 4c 01 e2 fe e2 b7   memcpy 0x02, R_e2fe|0xe2fe, [CRT0_Write_String|0xe2b7]	 ; "LOS 6.05 - B"
ced4:    d0 e2 b1               ld B, CRT0_WriteStruct|0xe2b1
ced7:    66 10                  jsys Syscall_DoFileOp
ced9:    66 08                  jsys Syscall_Flush
cedb:    e2 b1                      op_struct = CRT0_WriteStruct
cedd:    81 e3 45               ld AL, [DoAutoboot|0xe345]
cee0:    14 03                  bz DiskPrompt	 ; Check if we should autoboot
cee2:    71 cf b4               jmp R_cfb4

DiskPrompt:
    ; Asks for NAME, DISK and CODE
cee5:    47 4c 01 e2 cc e2 b7   memcpy 0x02, R_e2cc|0xe2cc, [CRT0_Write_String|0xe2b7]	 ; "NAME="
ceec:    d0 e2 b1               ld B, CRT0_WriteStruct|0xe2b1
ceef:    66 10                  jsys Syscall_DoFileOp
cef1:    66 08                  jsys Syscall_Flush
cef3:    e2 b1                      op_struct = CRT0_WriteStruct
cef5:    d0 e2 bb               ld B, CRT0_ReadStruct|0xe2bb
cef8:    66 10                  jsys Syscall_DoFileOp
cefa:    66 08                  jsys Syscall_Flush
cefc:    e2 bb                      op_struct = CRT0_ReadStruct
cefe:    47 40 16 e1 21 e3 5c   memcpy 0x17, [ReadBuffer|0xe121], [BootNameLen|0xe35c]
cf05:    55 76 e3 5e            mov Y, BootName|0xe35e
cf09:    d0 00 15               ld B, 0x0015

L_cf0c:
cf0c:    55 98 00 e1            mov Z, 0x00e1
cf10:    3a                     clr A, #0
cf11:    85 61                  ld AL, [Y++]
cf13:    51 08                  sub Z, A
cf15:    16 0f                  blt L_cf26
cf17:    55 98 00 fa            mov Z, 0x00fa
cf1b:    51 08                  sub Z, A
cf1d:    18 07                  bgt L_cf26
cf1f:    52 10 00 df            and A, A, 0x00df
cf23:    a5 68 ff               st AL, [Y + -0x1]

L_cf26:
cf26:    21 30                  dec BL, #1
cf28:    18 e2                  bgt L_cf0c
cf2a:    47 4c 01 e2 d5 e2 b7   memcpy 0x02, R_e2d5|0xe2d5, [CRT0_Write_String|0xe2b7]	 ; "DISK="
cf31:    d0 e2 b1               ld B, CRT0_WriteStruct|0xe2b1
cf34:    66 10                  jsys Syscall_DoFileOp
cf36:    66 08                  jsys Syscall_Flush
cf38:    e2 b1                      op_struct = CRT0_WriteStruct
cf3a:    d0 e2 bb               ld B, CRT0_ReadStruct|0xe2bb
cf3d:    66 10                  jsys Syscall_DoFileOp
cf3f:    66 08                  jsys Syscall_Flush
cf41:    e2 bb                      op_struct = CRT0_ReadStruct
cf43:    91 e1 21               ld A, [ReadBuffer|0xe121]
cf46:    46 80 80 e1 23 e3 44   unkbig8(8, 0) [R_e123|0xe123], [UserDiskNum|0xe344]
cf4d:    12 96                  bn DiskPrompt
cf4f:    46 00 2c 14 db 19      unkbig2(0, 0) 0x14, [DiskNum|0xdb19]
cf55:    16 0a                  blt L_cf61
cf57:    30 19 e3 43            inc [R_e343|0xe343], #10
cf5b:    30 19 e3 43            inc [R_e343|0xe343], #10
cf5f:    73 0c                  jmp L_cf6d

L_cf61:
cf61:    46 00 2c 0a db 19      unkbig2(0, 0) 0x0a, [DiskNum|0xdb19]
cf67:    16 04                  blt L_cf6d
cf69:    30 19 e3 43            inc [R_e343|0xe343], #10

L_cf6d:
cf6d:    47 40 00 e3 44 db 19   memcpy 0x01, [UserDiskNum|0xe344], [DiskNum|0xdb19]
cf74:    47 4c 01 e2 c5 e2 b7   memcpy 0x02, R_e2c5|0xe2c5, [CRT0_Write_String|0xe2b7]	 ; "CODE="
cf7b:    d0 e2 b1               ld B, CRT0_WriteStruct|0xe2b1
cf7e:    66 10                  jsys Syscall_DoFileOp
cf80:    66 08                  jsys Syscall_Flush
cf82:    e2 b1                      op_struct = CRT0_WriteStruct
cf84:    92 01 09               ld A, @[DevicesPtr|0x0109]
cf87:    c8                     ld BL, [A]
cf88:    55 26                  mov Y, B
cf8a:    c0 08                  ld BL, 0x08
cf8c:    43 73                  or BL, YL
cf8e:    e8                     st BL, [A]
cf8f:    d0 e2 bb               ld B, CRT0_ReadStruct|0xe2bb
cf92:    66 10                  jsys Syscall_DoFileOp
cf94:    66 08                  jsys Syscall_Flush
cf96:    e2 bb                      op_struct = CRT0_ReadStruct
cf98:    92 01 09               ld A, @[DevicesPtr|0x0109]
cf9b:    c8                     ld BL, [A]
cf9c:    55 26                  mov Y, B
cf9e:    c0 f7                  ld BL, 0xf7
cfa0:    42 73                  and BL, YL
cfa2:    e8                     st BL, [A]
cfa3:    91 e1 21               ld A, [ReadBuffer|0xe121]
cfa6:    14 0c                  bz R_cfb4
cfa8:    46 81 80 e1 23 e3 42   unkbig8(8, 1) [R_e123|0xe123], [R_e342|0xe342]
cfaf:    13 03                  bnn R_cfb4
cfb1:    71 ce e5               jmp DiskPrompt

R_cfb4:
cfb4:    55 89 01 09            mov Z, [DevicesPtr|0x0109]
cfb8:    30 81                  inc Z, #2

L_cfba:
cfba:    95 81                  ld A, [Z++]
cfbc:    15 03                  bnz L_cfc1
cfbe:    71 ce e5               jmp DiskPrompt

L_cfc1:
cfc1:    c5 08 02               ld BL, [A + 0x02]
cfc4:    45 32                  mov BH, BL
cfc6:    c1 db 19               ld BL, [DiskNum|0xdb19]
cfc9:    41 32                  sub BH, BL
cfcb:    15 ed                  bnz L_cfba
cfcd:    d1 e3 42               ld B, [R_e342|0xe342]
cfd0:    f5 08 17               st B, [A + 0x17]
cfd3:    91 e3 5c               ld A, [BootNameLen|0xe35c]
cfd6:    a3 02                  st AL, [0xcfda|+0x2]	 ; patch the length(?) byte of the unkblk2 instruction
cfd8:    47 20 00 ae e3 5e e3 51 memchr 0x01, 0xae, [BootName|0xe35e], [R_e351|0xe351]	 ; Copy to R_e351, scanning for dot
cfe0:    12 37                  bn L_d019
cfe2:    80 a0                  ld AL, 0xa0	 ; space
cfe4:    ac                     st AL, [Z]	 ; Might be repacing '.' with ' '?
cfe5:    30 60                  inc Y, #1	 ; Y now points after the '.'
cfe7:    47 48 09 60 e3 46      memcpy 0x0a, [Y], [R_e346|0xe346]	 ; This looks like it overwrites other variables?
cfed:    81 db 19               ld AL, [DiskNum|0xdb19]
cff0:    d0 e3 51               ld B, R_e351|0xe351	 ; filename
cff3:    66 0e                  jsys Syscall_OpenFile?	 ; Open file?
cff5:    e1 21                      arg1 = ReadBuffer
cff7:    15 03                  bnz L_cffc
cff9:    71 ce e5               jmp DiskPrompt

L_cffc:
cffc:    b3 15                  st A, [0xd013|+0x15]
cffe:    85 08 06               ld AL, [A + 0x06]
d001:    c0 0f                  ld BL, 0x0f
d003:    4a                     and BL, AL
d004:    21 34                  dec BL, #5
d006:    14 03                  bz L_d00b
d008:    71 ce e5               jmp DiskPrompt

L_d00b:
d00b:    81 db 19               ld AL, [DiskNum|0xdb19]
d00e:    d0 e3 46               ld B, R_e346|0xe346
d011:    66 4f                  jsys Syscall_4f
d013:    00 00                      arg1 = (0x0)
d015:    e1 21                      arg2 = ReadBuffer
d017:    73 0f                  jmp L_d028

L_d019:
d019:    d0 e3 51               ld B, R_e351|0xe351	 ; Filename
d01c:    81 db 19               ld AL, [DiskNum|0xdb19]
d01f:    66 0e                  jsys Syscall_OpenFile?
d021:    e1 21                      arg1 = ReadBuffer
d023:    15 03                  bnz L_d028
d025:    71 ce e5               jmp DiskPrompt

L_d028:
d028:    b1 d2 82               st A, [R_d282|0xd282]
d02b:    85 08 06               ld AL, [A + 0x06]
d02e:    c0 0f                  ld BL, 0x0f
d030:    4a                     and BL, AL
d031:    21 30                  dec BL, #1
d033:    15 03                  bnz L_d038
d035:    71 d0 c0               jmp R_d0c0

L_d038:
d038:    21 32                  dec BL, #3
d03a:    14 03                  bz L_d03f
d03c:    71 ce e5               jmp DiskPrompt

L_d03f:
d03f:    81 db 19               ld AL, [DiskNum|0xdb19]
d042:    a3 10                  st AL, [0xd054|+0x10]
d044:    91 d2 82               ld A, [R_d282|0xd282]
d047:    b3 09                  st A, [0xd052|+0x9]

L_d049:
d049:    2e 2c 00 e1 1a         wpf1 0x00, [OPSYS_Page0|0xe11a]
d04e:    66 4c                  jsys Syscall_4c
d050:    01 90                      arg1 = (0x190)
d052:    00 00                      arg2 = (0x0)
d054:    00                         disknum = (0x0)

R_d055:
d055:    00 00                      arg4 = (0x0)
d057:    e1 21                      arg5 = ReadBuffer
d059:    01                         arg6 = (0x1)
d05a:    2e 2c 00 e1 18         wpf1 0x00, [LOS_Page0|0xe118]
d05f:    55 98 e1 21            mov Z, ReadBuffer|0xe121
d063:    95 88 02               ld A, [Z + 0x02]
d066:    d0 00 4c               ld B, 0x004c
d069:    59                     sub B, A
d06a:    15 08                  bnz L_d074
d06c:    95 88 1f               ld A, [Z + 0x1f]
d06f:    b1 e1 1b               st A, [R_e11b|0xe11b]
d072:    73 1a                  jmp L_d08e

L_d074:
d074:    47 02 e1 1b 08         unkblk0 [R_e11b|0xe11b], [Z]	 ; might be a single byte copy? But why have a special blk instruction for that?
d079:    13 03                  bnn L_d07e
d07b:    71 cd d1               jmp Start

L_d07e:
d07e:    10 0e                  bc L_d08e
d080:    47 8e 00 84 08         memcmp 0x01, 0x84, [Z]
d085:    14 0d                  bz L_d094
d087:    47 8e 00 80 08         memcmp 0x01, 0x80, [Z]
d08c:    15 e6                  bnz L_d074

L_d08e:
d08e:    30 10 d0 55            inc [R_d055|0xd055], #1	 ; arg4
d092:    73 b5                  jmp L_d049

L_d094:
d094:    05                     di
d095:    c6                     unknown
d096:    2e 2c 00 e1 18         wpf1 0x00, [LOS_Page0|0xe118]
d09b:    2e 2c 78 e1 1a         wpf1 0x78, [OPSYS_Page0|0xe11a]
d0a0:    32 20                  clr B, #0
d0a2:    2f 28                  ld_isr B
d0a4:    2f 04                  ld_dma_mode A
d0a6:    f1 00 6c               st B, [0x006c]
d0a9:    f1 00 fc               st B, [0x00fc]
d0ac:    f1 00 ae               st B, [0x00ae]
d0af:    e1 f2 0a               st BL, [0xf20a]
d0b2:    e1 f2 0f               st BL, [0xf20f]
d0b5:    31 20                  dec B, #1
d0b7:    e1 f2 0d               st BL, [0xf20d]
d0ba:    5c                     mov Y, A
d0bb:    91 e1 1d               ld A, [WIPL_A|0xe11d]	 ; This is the value in A that WIPL gave us
d0be:    75 60                  jmp [Y]

R_d0c0:
    ; Read configuration dataset
d0c0:    47 4c 01 e3 11 e2 b7   memcpy 0x02, ClearScreen|0xe311, [CRT0_Write_String|0xe2b7]
d0c7:    d0 e2 b1               ld B, CRT0_WriteStruct|0xe2b1
d0ca:    66 10                  jsys Syscall_DoFileOp	 ; Clear the screen
d0cc:    66 08                  jsys Syscall_Flush	 ; Wait until screen clear has finished
d0ce:    e2 b1                      op_struct = CRT0_WriteStruct
d0d0:    2e 2c 00 e1 18         wpf1 0x00, [LOS_Page0|0xe118]	 ; Switch to LOS's page0
d0d5:    79 d2 74               call R_d274
d0d8:    47 8e 05 d3 d9 d3 d4 c5 cd 06 memcmp 0x06, 0xd3d9d3d4c5cd, [Y]	 ; "SYSTEM"
d0e2:    14 03                  bz L_d0e7
d0e4:    71 d1 70               jmp R_d170

L_d0e7:
d0e7:    30 67                  inc Y, #8
d0e9:    47 48 10 60 e0 76      memcpy 0x11, [Y], [R_e076|0xe076]
d0ef:    50 76 00 11            add Y, Y, 0x0011
d0f3:    79 d1 88               call R_d188

R_d0f6:
d0f6:    79 d2 93               call R_d293
d0f9:    47 8e 05 d4 c9 c2 a0 a0 a0 06 memcmp 0x06, 0xd4c9c2a0a0a0, [Y]	 ; "TIB   "
d103:    15 05                  bnz L_d10a
d105:    30 65                  inc Y, #6
d107:    71 d2 b5               jmp R_d2b5

L_d10a:
d10a:    47 8e 05 c4 c9 d3 cb a0 a0 06 memcmp 0x06, 0xc4c9d3cba0a0, [Y]	 ; "DISK  "
d114:    15 05                  bnz L_d11b
d116:    30 65                  inc Y, #6
d118:    71 d3 b3               jmp R_d3b3

L_d11b:
d11b:    47 8e 05 c3 d2 d4 a0 a0 a0 06 memcmp 0x06, 0xc3d2d4a0a0a0, [Y]	 ; "CRT   "
d125:    15 05                  bnz L_d12c
d127:    30 65                  inc Y, #6
d129:    71 d5 35               jmp R_d535

L_d12c:
d12c:    47 8e 05 d0 d2 d4 a0 a0 a0 06 memcmp 0x06, 0xd0d2d4a0a0a0, [Y]	 ; "PRR   "
d136:    15 05                  bnz L_d13d
d138:    30 65                  inc Y, #6
d13a:    71 d5 fc               jmp R_d5fc

L_d13d:
d13d:    47 8e 05 d3 d0 cf cf cc a0 06 memcmp 0x06, 0xd3d0cfcfcca0, [Y]	 ; "SPOOL "
d147:    15 05                  bnz L_d14e
d149:    30 65                  inc Y, #6
d14b:    71 d7 23               jmp R_d723

L_d14e:
d14e:    47 8e 05 cc c9 ce c5 a0 a0 06 memcmp 0x06, 0xccc9cec5a0a0, [Y]	 ; "LINE  "
d158:    15 05                  bnz L_d15f
d15a:    30 65                  inc Y, #6
d15c:    71 d7 7e               jmp R_d77e

L_d15f:
d15f:    47 8e 05 d3 d0 c5 c3 a0 a0 06 memcmp 0x06, 0xd3d0c5c3a0a0, [Y]	 ; "SPEC  "
d169:    15 05                  bnz R_d170
d16b:    30 65                  inc Y, #6
d16d:    71 d7 97               jmp R_d797

R_d170:
d170:    47 4c 01 e2 dc e2 b7   memcpy 0x02, R_e2dc|0xe2dc, [CRT0_Write_String|0xe2b7]	 ; "INVALID CONFIGURATION DATA SET\r\n"
d177:    d0 e2 b1               ld B, CRT0_WriteStruct|0xe2b1
d17a:    2e 2c 00 e1 1a         wpf1 0x00, [OPSYS_Page0|0xe11a]
d17f:    66 10                  jsys Syscall_DoFileOp
d181:    66 08                  jsys Syscall_Flush
d183:    e2 b1                      op_struct = CRT0_WriteStruct
d185:    71 ce e5               jmp DiskPrompt

R_d188:
d188:    81 e0 81               ld AL, [R_e081|0xe081]
d18b:    14 0c                  bz L_d199
d18d:    79 d2 93               call R_d293
d190:    79 d2 55               call R_d255
d193:    31 10 e0 80            dec [R_e080|0xe080], #1
d197:    73 ef                  jmp R_d188

L_d199:
d199:    47 9c 60 00 01 00      memset 0x61, 0x00, [SyscallVector|0x0100]
d19f:    47 4c 00 71 01 00      memcpy 0x01, 0x71, [SyscallVector|0x0100]
d1a5:    80 ff                  ld AL, 0xff
d1a7:    a1 01 1c               st AL, [0x011c]
d1aa:    a1 01 1f               st AL, [0x011f]
d1ad:    90 01 d1               ld A, 0x01d1
d1b0:    b1 01 07               st A, [0x0107]
d1b3:    47 4c 00 01 01 25      memcpy 0x01, 0x01, [0x0125]
d1b9:    47 4c 02 ff ff ff 01 3b memcpy 0x03, 0xffffff, [0x013b]
d1c1:    47 40 01 e0 77 01 42   memcpy 0x02, [R_e077|0xe077], [0x0142]
d1c8:    47 40 00 e0 76 01 05   memcpy 0x01, [R_e076|0xe076], [0x0105]
d1cf:    47 40 00 e0 82 01 60   memcpy 0x01, [R_e082|0xe082], [0x0160]
d1d6:    47 4c 00 2c 01 15      memcpy 0x01, 0x2c, [0x0115]
d1dc:    47 4c 01 01 91 01 56   memcpy 0x02, 0x0191, [0x0156]
d1e3:    47 4c 01 01 b1 01 5a   memcpy 0x02, 0x01b1, [0x015a]
d1ea:    47 9c 6f fd 01 61      memset 0x70, 0xfd, [PageTableOne|0x0161]
d1f0:    3a                     clr A, #0
d1f1:    81 e0 7a               ld AL, [R_e07a|0xe07a]
d1f4:    3d                     sll A, #1
d1f5:    30 01                  inc A, #2
d1f7:    50 01 01 07            add A, A, [0x0107]
d1fb:    b1 01 09               st A, [DevicesPtr|0x0109]
d1fe:    d1 e0 7a               ld B, [R_e07a|0xe07a]
d201:    50 23 e0 7b            add B, B, [R_e07b|0xe07b]
d205:    50 23 e0 7c            add B, B, [R_e07c|0xe07c]
d209:    50 23 e0 7d            add B, B, [R_e07d|0xe07d]
d20d:    50 23 e0 7e            add B, B, [R_e07e|0xe07e]
d211:    50 23 e0 7f            add B, B, [R_e07f|0xe07f]
d215:    30 21                  inc B, #2
d217:    35 27                  sll B, #8
d219:    34 26                  srl B, #7
d21b:    58                     add B, A
d21c:    55 28                  mov Z, B
d21e:    30 81                  inc Z, #2
d220:    d6 89 01 54            st Z, [0x0154]
d224:    47 9e 27 00 08         memset 0x28, 0x00, [Z]
d229:    50 98 00 28            add Z, Z, 0x0028
d22d:    47 4e 01 ff ff 08      memcpy 0x02, 0xffff, [Z]
d233:    30 81                  inc Z, #2
d235:    d6 89 01 0b            st Z, [0x010b]
d239:    3a                     clr A, #0
d23a:    81 e0 7c               ld AL, [R_e07c|0xe07c]
d23d:    20 1e                  inc AL, #15
d23f:    2d                     sll AL, #1
d240:    67 9e 00 08            memset A, 0x00, [Z]
d244:    50 08                  add Z, A
d246:    55 80                  mov A, Z
d248:    b1 01 16               st A, [0x0116]
d24b:    47 9e 59 00 08         memset 0x5a, 0x00, [Z]
d250:    50 98 00 5a            add Z, Z, 0x005a
d254:    09                     ret

R_d255:
    ; Writes a string to CRT0
    ; String is in Y, should be pointing 2 bytes into a pascal style string
d255:    55 60                  mov A, Y
d257:    31 01                  dec A, #2
d259:    b1 e2 b7               st A, [CRT0_Write_String|0xe2b7]
d25c:    d0 e2 b1               ld B, CRT0_WriteStruct|0xe2b1
d25f:    2e 2c 00 e1 1a         wpf1 0x00, [OPSYS_Page0|0xe11a]
d264:    66 10                  jsys Syscall_DoFileOp
d266:    66 08                  jsys Syscall_Flush
d268:    e2 b1                      op_struct = CRT0_WriteStruct
d26a:    2e 2c 00 e1 18         wpf1 0x00, [LOS_Page0|0xe118]
d26f:    50 76 00 50            add Y, Y, 0x0050
d273:    09                     ret

R_d274:
d274:    81 db 19               ld AL, [DiskNum|0xdb19]
d277:    a3 0b                  st AL, [0xd284|+0xb]	 ; set disknum

L_d279:
d279:    2e 2c 00 e1 1a         wpf1 0x00, [OPSYS_Page0|0xe11a]
d27e:    66 4c                  jsys Syscall_4c
d280:    01 90                      arg1 = (0x190)

R_d282:
d282:    00 00                      arg2 = (0x0)
d284:    00                         disknum = (0x0)

R_d285:
d285:    00 00                      arg4 = (0x0)
d287:    e1 21                      arg5 = ReadBuffer
d289:    01                         arg6 = (0x1)
d28a:    2e 2c 00 e1 18         wpf1 0x00, [LOS_Page0|0xe118]
d28f:    55 76 e1 21            mov Y, ReadBuffer|0xe121

R_d293:
d293:    2a                     clr AL, #0
d294:    a1 01 41               st AL, [0x0141]
d297:    47 8e 00 ff 06         memcmp 0x01, 0xff, [Y]
d29c:    15 06                  bnz L_d2a4
d29e:    30 10 d2 85            inc [R_d285|0xd285], #1
d2a2:    73 d5                  jmp L_d279

L_d2a4:
d2a4:    47 8e 02 00 02 84 06   memcmp 0x03, 0x000284, [Y]
d2ab:    15 05                  bnz L_d2b2
d2ad:    7b 7b                  call L_d32a
d2af:    71 d8 67               jmp R_d867

L_d2b2:
d2b2:    30 61                  inc Y, #2
d2b4:    09                     ret

R_d2b5:
d2b5:    7b dc                  call R_d293
d2b7:    47 48 03 60 e0 87      memcpy 0x04, [Y], [R_e087|0xe087]
d2bd:    30 63                  inc Y, #4
d2bf:    91 e3 8b               ld A, [R_e38b|0xe38b]
d2c2:    3d                     sll A, #1
d2c3:    50 01 01 07            add A, A, [0x0107]
d2c7:    d6 19 00 00            st A, [Z + 0x0000]
d2cb:    47 4d 01 00 00 00 02   memcpy 0x02, 0x0000, [A + 0x02]
d2d2:    47 9e 5c 00 08         memset 0x5d, 0x00, [Z]
d2d7:    47 41 00 e3 8c 80 01   memcpy 0x01, [R_e38c|0xe38c], [Z + 0x01]
d2de:    47 41 00 e0 87 80 03   memcpy 0x01, [R_e087|0xe087], [Z + 0x03]
d2e5:    47 4d 00 04 80 06      memcpy 0x01, 0x04, [Z + 0x06]
d2eb:    30 13 e0 88            inc [R_e088|0xe088], #4
d2ef:    47 41 00 e0 89 80 07   memcpy 0x01, [R_e089|0xe089], [Z + 0x07]
d2f6:    47 4d 00 01 80 12      memcpy 0x01, 0x01, [Z + 0x12]
d2fc:    47 41 00 e0 8a 80 16   memcpy 0x01, [R_e08a|0xe08a], [Z + 0x16]
d303:    47 41 00 e0 88 80 31   memcpy 0x01, [R_e088|0xe088], [Z + 0x31]
d30a:    47 9d 01 ff 80 32      memset 0x02, 0xff, [Z + 0x32]
d310:    47 4d 00 fd 80 56      memcpy 0x01, 0xfd, [Z + 0x56]
d316:    50 98 00 5c            add Z, Z, 0x005c
d31a:    30 10 e3 8b            inc [R_e38b|0xe38b], #1
d31e:    81 e0 7a               ld AL, [R_e07a|0xe07a]
d321:    29                     dec AL, #1
d322:    a1 e0 7a               st AL, [R_e07a|0xe07a]
d325:    15 8e                  bnz R_d2b5
d327:    71 d0 f6               jmp R_d0f6

L_d32a:
d32a:    91 e3 8d               ld A, [R_e38d|0xe38d]
d32d:    b1 e3 97               st A, [R_e397|0xe397]
d330:    91 e3 8d               ld A, [R_e38d|0xe38d]
d333:    3d                     sll A, #1
d334:    50 01 01 09            add A, A, [DevicesPtr|0x0109]
d338:    d6 19 00 00            st A, [Z + 0x0000]
d33c:    47 9e 3b 00 08         memset 0x3c, 0x00, [Z]
d341:    47 4d 01 47 00 80 00   memcpy 0x02, 0x4700, [Z + 0x00]
d348:    30 10 e3 93            inc [R_e393|0xe393], #1
d34c:    47 41 01 e3 93 80 03   memcpy 0x02, [R_e393|0xe393], [Z + 0x03]
d353:    47 4d 01 00 03 80 05   memcpy 0x02, 0x0003, [Z + 0x05]
d35a:    47 4d 05 c4 d5 cd cd d9 a0 80 07 memcpy 0x06, 0xc4d5cdcdd9a0, [Z + 0x07]
d365:    50 98 00 11            add Z, Z, 0x0011
d369:    30 01                  inc A, #2
d36b:    d6 19 00 00            st A, [Z + 0x0000]
d36f:    47 4d 01 00 00 00 02   memcpy 0x02, 0x0000, [A + 0x02]
d376:    47 4d 01 c7 00 80 00   memcpy 0x02, 0xc700, [Z + 0x00]
d37d:    30 10 e3 93            inc [R_e393|0xe393], #1
d381:    47 41 01 e3 93 80 03   memcpy 0x02, [R_e393|0xe393], [Z + 0x03]
d388:    30 10 e3 93            inc [R_e393|0xe393], #1
d38c:    47 4d 01 00 03 80 05   memcpy 0x02, 0x0003, [Z + 0x05]
d393:    47 4d 05 c2 cc c9 ce c4 a0 80 07 memcpy 0x06, 0xc2ccc9cec4a0, [Z + 0x07]
d39e:    47 4d 00 ff 80 1a      memcpy 0x01, 0xff, [Z + 0x1a]
d3a4:    47 9d 05 ff 80 25      memset 0x06, 0xff, [Z + 0x25]
d3aa:    50 98 00 2b            add Z, Z, 0x002b
d3ae:    30 11 e3 8d            inc [R_e38d|0xe38d], #2
d3b2:    09                     ret

R_d3b3:
d3b3:    81 e0 7b               ld AL, [R_e07b|0xe07b]
d3b6:    15 03                  bnz L_d3bb
d3b8:    71 d0 f6               jmp R_d0f6

L_d3bb:
d3bb:    29                     dec AL, #1
d3bc:    a1 e0 7b               st AL, [R_e07b|0xe07b]
d3bf:    79 d2 93               call R_d293
d3c2:    47 48 0c 60 e0 8b      memcpy 0x0d, [Y], [R_e08b|0xe08b]
d3c8:    50 76 00 0d            add Y, Y, 0x000d
d3cc:    91 e3 8d               ld A, [R_e38d|0xe38d]
d3cf:    3d                     sll A, #1
d3d0:    50 01 01 09            add A, A, [DevicesPtr|0x0109]
d3d4:    d6 19 00 00            st A, [Z + 0x0000]
d3d8:    47 4d 01 57 04 80 00   memcpy 0x02, 0x5704, [Z + 0x00]
d3df:    47 41 00 e0 91 80 02   memcpy 0x01, [R_e091|0xe091], [Z + 0x02]
d3e6:    47 40 00 e0 91 01 06   memcpy 0x01, [R_e091|0xe091], [0x0106]
d3ed:    47 41 01 e3 93 80 03   memcpy 0x02, [R_e393|0xe393], [Z + 0x03]
d3f4:    47 8c 00 c3 e0 92      memcmp 0x01, 0xc3, [R_e092|0xe092]
d3fa:    15 22                  bnz L_d41e
d3fc:    32 20                  clr B, #0
d3fe:    c1 e0 97               ld BL, [R_e097|0xe097]
d401:    78 32 00 06            mul B, B, 0x0006
d405:    51 23 d4 1c            sub B, B, [R_d41c|0xd41c]
d409:    14 42                  bz L_d44d
d40b:    30 90 00 03            inc [Z + 0x0003], #1
d40f:    32 20                  clr B, #0
d411:    c1 e0 97               ld BL, [R_e097|0xe097]
d414:    78 32 00 06            mul B, B, 0x0006
d418:    f3 02                  st B, [R_d41c|0xd41c|+0x2]
d41a:    73 2d                  jmp L_d449

R_d41c:
d41c:    00                     HALT
d41d:    00                     HALT

L_d41e:
d41e:    91 e3 91               ld A, [R_e391|0xe391]
d421:    15 20                  bnz L_d443
d423:    47 8c 00 c8 e0 92      memcmp 0x01, 0xc8, [R_e092|0xe092]
d429:    15 09                  bnz L_d434
d42b:    47 4c 01 00 02 e3 91   memcpy 0x02, 0x0002, [R_e391|0xe391]
d432:    73 0f                  jmp L_d443

L_d434:
d434:    47 8c 00 d0 e0 92      memcmp 0x01, 0xd0, [R_e092|0xe092]
d43a:    15 0d                  bnz L_d449
d43c:    47 4c 01 00 04 e3 91   memcpy 0x02, 0x0004, [R_e391|0xe391]

L_d443:
d443:    31 10 e3 91            dec [R_e391|0xe391], #1
d447:    15 04                  bnz L_d44d

L_d449:
d449:    30 10 e3 93            inc [R_e393|0xe393], #1

L_d44d:
d44d:    47 8c 00 c4 e0 92      memcmp 0x01, 0xc4, [R_e092|0xe092]
d453:    14 22                  bz L_d477
d455:    47 8c 00 d3 e0 92      memcmp 0x01, 0xd3, [R_e092|0xe092]
d45b:    14 1a                  bz L_d477
d45d:    47 8c 00 c3 e0 92      memcmp 0x01, 0xc3, [R_e092|0xe092]
d463:    15 09                  bnz L_d46e
d465:    47 4d 01 00 0e 80 05   memcpy 0x02, 0x000e, [Z + 0x05]
d46c:    73 18                  jmp L_d486

L_d46e:
d46e:    47 4d 01 00 01 80 05   memcpy 0x02, 0x0001, [Z + 0x05]
d475:    73 0f                  jmp L_d486

L_d477:
d477:    47 4d 01 00 0c 80 05   memcpy 0x02, 0x000c, [Z + 0x05]
d47e:    30 10 e3 93            inc [R_e393|0xe393], #1
d482:    30 90 00 03            inc [Z + 0x0003], #1

L_d486:
d486:    47 41 05 e0 8b 80 07   memcpy 0x06, [R_e08b|0xe08b], [Z + 0x07]
d48d:    47 4d 01 00 00 80 0d   memcpy 0x02, 0x0000, [Z + 0x0d]
d494:    47 41 01 e0 95 80 0f   memcpy 0x02, [R_e095|0xe095], [Z + 0x0f]
d49b:    47 8c 00 c4 e0 92      memcmp 0x01, 0xc4, [R_e092|0xe092]
d4a1:    14 3c                  bz L_d4df
d4a3:    47 8c 00 d3 e0 92      memcmp 0x01, 0xd3, [R_e092|0xe092]
d4a9:    14 2b                  bz L_d4d6
d4ab:    47 8c 00 c6 e0 92      memcmp 0x01, 0xc6, [R_e092|0xe092]
d4b1:    14 11                  bz L_d4c4
d4b3:    47 8c 00 c3 e0 92      memcmp 0x01, 0xc3, [R_e092|0xe092]
d4b9:    14 12                  bz L_d4cd
d4bb:    47 4d 01 03 2a 80 11   memcpy 0x02, 0x032a, [Z + 0x11]
d4c2:    73 22                  jmp L_d4e6

L_d4c4:
d4c4:    47 4d 01 06 54 80 11   memcpy 0x02, 0x0654, [Z + 0x11]
d4cb:    73 19                  jmp L_d4e6

L_d4cd:
d4cd:    47 4d 01 08 03 80 11   memcpy 0x02, 0x0803, [Z + 0x11]
d4d4:    73 10                  jmp L_d4e6

L_d4d6:
d4d6:    47 4d 01 00 60 80 11   memcpy 0x02, 0x0060, [Z + 0x11]
d4dd:    73 07                  jmp L_d4e6

L_d4df:
d4df:    47 4d 01 00 c0 80 11   memcpy 0x02, 0x00c0, [Z + 0x11]

L_d4e6:
d4e6:    47 41 00 e0 97 80 13   memcpy 0x01, [R_e097|0xe097], [Z + 0x13]
d4ed:    47 41 01 e0 93 80 17   memcpy 0x02, [R_e093|0xe093], [Z + 0x17]
d4f4:    50 90 00 19            add A, Z, 0x0019
d4f8:    d6 91 00 14            st Z, [A + 0x0014]
d4fc:    47 8c 00 d3 e0 92      memcmp 0x01, 0xd3, [R_e092|0xe092]
d502:    14 20                  bz L_d524
d504:    47 8c 00 c4 e0 92      memcmp 0x01, 0xc4, [R_e092|0xe092]
d50a:    14 18                  bz L_d524
d50c:    47 8c 00 c3 e0 92      memcmp 0x01, 0xc3, [R_e092|0xe092]
d512:    15 08                  bnz L_d51c
d514:    47 4d 00 ff 80 16      memcpy 0x01, 0xff, [Z + 0x16]
d51a:    73 0e                  jmp L_d52a

L_d51c:
d51c:    47 4d 00 5a 80 16      memcpy 0x01, 0x5a, [Z + 0x16]
d522:    73 06                  jmp L_d52a

L_d524:
d524:    47 4d 00 06 80 16      memcpy 0x01, 0x06, [Z + 0x16]

L_d52a:
d52a:    30 10 e3 8d            inc [R_e38d|0xe38d], #1
d52e:    50 98 00 19            add Z, Z, 0x0019
d532:    71 d3 b3               jmp R_d3b3

R_d535:
d535:    81 e0 7c               ld AL, [R_e07c|0xe07c]
d538:    15 03                  bnz L_d53d
d53a:    71 d0 f6               jmp R_d0f6

L_d53d:
d53d:    29                     dec AL, #1
d53e:    a1 e0 7c               st AL, [R_e07c|0xe07c]
d541:    79 d2 93               call R_d293
d544:    47 48 13 60 e0 98      memcpy 0x14, [Y], [R_e098|0xe098]
d54a:    50 76 00 14            add Y, Y, 0x0014
d54e:    d1 e3 95               ld B, [R_e395|0xe395]
d551:    15 07                  bnz L_d55a
d553:    47 40 01 e3 8d e3 95   memcpy 0x02, [R_e38d|0xe38d], [R_e395|0xe395]

L_d55a:
d55a:    91 e3 8d               ld A, [R_e38d|0xe38d]
d55d:    3d                     sll A, #1
d55e:    50 01 01 09            add A, A, [DevicesPtr|0x0109]
d562:    d6 19 00 00            st A, [Z + 0x0000]
d566:    3a                     clr A, #0
d567:    d1 e0 a8               ld B, [R_e0a8|0xe0a8]
d56a:    90 06 f0               ld A, 0x06f0
d56d:    42 30                  and AH, BL
d56f:    42 31                  and AL, BL
d571:    2c                     srl AL, #1
d572:    43 01                  or AL, AH
d574:    22 00                  clr AH, #0
d576:    d1 01 0b               ld B, [0x010b]
d579:    58                     add B, A
d57a:    d6 39 00 02            st B, [Z + 0x0002]
d57e:    91 e3 8f               ld A, [R_e38f|0xe38f]
d581:    51 20                  sub A, B
d583:    19 03                  ble L_d588
d585:    f1 e3 8f               st B, [R_e38f|0xe38f]

L_d588:
d588:    47 9e 2a 00 08         memset 0x2b, 0x00, [Z]
d58d:    47 4d 01 c7 02 80 00   memcpy 0x02, 0xc702, [Z + 0x00]
d594:    47 41 00 e0 aa 80 02   memcpy 0x01, [R_e0aa|0xe0aa], [Z + 0x02]
d59b:    30 10 e3 93            inc [R_e393|0xe393], #1
d59f:    47 41 01 e3 93 80 03   memcpy 0x02, [R_e393|0xe393], [Z + 0x03]
d5a6:    47 4d 01 00 08 80 05   memcpy 0x02, 0x0008, [Z + 0x05]
d5ad:    47 41 05 e0 98 80 07   memcpy 0x06, [R_e098|0xe098], [Z + 0x07]
d5b4:    47 41 01 e0 a8 80 0f   memcpy 0x02, [R_e0a8|0xe0a8], [Z + 0x0f]
d5bb:    47 4d 00 83 80 17      memcpy 0x01, 0x83, [Z + 0x17]
d5c1:    47 41 00 e0 a5 80 18   memcpy 0x01, [R_e0a5|0xe0a5], [Z + 0x18]
d5c8:    47 41 00 e0 a7 80 19   memcpy 0x01, [R_e0a7|0xe0a7], [Z + 0x19]
d5cf:    47 41 00 e0 9e 80 1a   memcpy 0x01, [R_e09e|0xe09e], [Z + 0x1a]
d5d6:    47 41 00 e0 ab 80 1c   memcpy 0x01, [R_e0ab|0xe0ab], [Z + 0x1c]
d5dd:    47 41 00 e0 a6 80 1e   memcpy 0x01, [R_e0a6|0xe0a6], [Z + 0x1e]
d5e4:    47 41 05 e0 9f 80 1f   memcpy 0x06, [R_e09f|0xe09f], [Z + 0x1f]
d5eb:    47 9d 05 ff 80 25      memset 0x06, 0xff, [Z + 0x25]
d5f1:    50 98 00 2b            add Z, Z, 0x002b
d5f5:    30 10 e3 8d            inc [R_e38d|0xe38d], #1
d5f9:    71 d5 35               jmp R_d535

R_d5fc:
d5fc:    81 e0 7d               ld AL, [R_e07d|0xe07d]
d5ff:    15 03                  bnz L_d604
d601:    71 d0 f6               jmp R_d0f6

L_d604:
d604:    29                     dec AL, #1
d605:    a1 e0 7d               st AL, [R_e07d|0xe07d]
d608:    79 d2 93               call R_d293
d60b:    47 48 09 60 e0 ac      memcpy 0x0a, [Y], [R_e0ac|0xe0ac]
d611:    50 76 00 0a            add Y, Y, 0x000a
d615:    91 e3 8d               ld A, [R_e38d|0xe38d]
d618:    3d                     sll A, #1
d619:    50 01 01 09            add A, A, [DevicesPtr|0x0109]
d61d:    d6 19 00 00            st A, [Z + 0x0000]
d621:    47 9e 2a 00 08         memset 0x2b, 0x00, [Z]
d626:    47 4d 01 42 03 80 00   memcpy 0x02, 0x4203, [Z + 0x00]
d62d:    47 41 00 e0 b5 80 02   memcpy 0x01, [R_e0b5|0xe0b5], [Z + 0x02]
d634:    30 10 e3 93            inc [R_e393|0xe393], #1
d638:    47 41 01 e3 93 80 03   memcpy 0x02, [R_e393|0xe393], [Z + 0x03]
d63f:    d0 d7 09               ld B, R_d709|0xd709

L_d642:
d642:    95 21                  ld A, [B++]
d644:    15 03                  bnz L_d649
d646:    71 d1 70               jmp R_d170

L_d649:
d649:    47 84 00 20 fe e0 b2   memcmp 0x01, [B + -0x2], [R_e0b2|0xe0b2]
d650:    15 f0                  bnz L_d642
d652:    22 00                  clr AH, #0
d654:    b5 88 05               st A, [Z + 0x05]
d657:    47 41 05 e0 ac 80 07   memcpy 0x06, [R_e0ac|0xe0ac], [Z + 0x07]
d65e:    47 41 01 e0 b3 80 0f   memcpy 0x02, [R_e0b3|0xe0b3], [Z + 0x0f]
d665:    47 8c 00 b9 e0 b2      memcmp 0x01, 0xb9, [R_e0b2|0xe0b2]
d66b:    14 1a                  bz L_d687
d66d:    47 8c 00 b6 e0 b2      memcmp 0x01, 0xb6, [R_e0b2|0xe0b2]
d673:    14 12                  bz L_d687
d675:    47 8c 00 d2 e0 b2      memcmp 0x01, 0xd2, [R_e0b2|0xe0b2]
d67b:    14 61                  bz L_d6de
d67d:    47 8c 00 c8 e0 b2      memcmp 0x01, 0xc8, [R_e0b2|0xe0b2]
d683:    14 59                  bz L_d6de
d685:    73 77                  jmp L_d6fe

L_d687:
d687:    47 4d 00 42 80 18      memcpy 0x01, 0x42, [Z + 0x18]
d68d:    47 4d 00 c2 80 00      memcpy 0x01, 0xc2, [Z + 0x00]
d693:    47 4d 00 c5 80 19      memcpy 0x01, 0xc5, [Z + 0x19]
d699:    47 4d 00 ff 80 1b      memcpy 0x01, 0xff, [Z + 0x1b]
d69f:    47 4d 01 00 01 80 1d   memcpy 0x02, 0x0001, [Z + 0x1d]
d6a6:    91 e0 b3               ld A, [R_e0b3|0xe0b3]
d6a9:    5d                     mov B, A
d6aa:    52 10 00 f0            and A, A, 0x00f0
d6ae:    24 11                  srl AL, #2
d6b0:    52 32 00 0f            and B, B, 0x000f
d6b4:    24 30                  srl BL, #1
d6b6:    53 20                  or A, B
d6b8:    a5 88 1a               st AL, [Z + 0x1a]
d6bb:    3d                     sll A, #1
d6bc:    50 01 01 0b            add A, A, [0x010b]
d6c0:    d6 19 00 02            st A, [Z + 0x0002]
d6c4:    d1 e3 8f               ld B, [R_e38f|0xe38f]
d6c7:    59                     sub B, A
d6c8:    19 03                  ble L_d6cd
d6ca:    b1 e3 8f               st A, [R_e38f|0xe38f]

L_d6cd:
d6cd:    47 4d 05 ff ff ff ff ff ff 80 25 memcpy 0x06, 0xffffffffffff, [Z + 0x25]
d6d8:    50 98 00 2b            add Z, Z, 0x002b
d6dc:    73 24                  jmp L_d702

L_d6de:
d6de:    91 01 0b               ld A, [0x010b]
d6e1:    d1 e0 b3               ld B, [R_e0b3|0xe0b3]
d6e4:    35 20                  sll B, #1
d6e6:    30 21                  inc B, #2
d6e8:    50 20                  add A, B
d6ea:    98                     ld A, [A]
d6eb:    d6 91 00 0f            st Z, [A + 0x000f]
d6ef:    47 4d 03 42 00 00 79 80 18 memcpy 0x04, 0x42000079, [Z + 0x18]
d6f8:    50 98 00 1e            add Z, Z, 0x001e
d6fc:    73 04                  jmp L_d702

L_d6fe:
d6fe:    50 98 00 11            add Z, Z, 0x0011

L_d702:
d702:    30 10 e3 8d            inc [R_e38d|0xe38d], #1
d706:    71 d5 fc               jmp R_d5fc

R_d709:
d709:    b0 02 b1               st A, 0x02b1
d70c:    05                     di
d70d:    b2 06 b3               st A, @[0x06b3]
d710:    07                     rl
d711:    b4 0b                  st A, @[0xd71e|+0xb]
d713:    b5 0d b6               st A, @[A++ + -0x4a]
d716:    04                     ei
d717:    b7                     unknown
d718:    0f                     rsys
d719:    b8 '8'
d71a:    10
d71b:    b9 '9'
d71c:    11
d71d:    d2 'R'
d71e:    0a
d71f:    c8 'H'
d720:    09
d721:    00
d722:    00

R_d723:
d723:    81 e0 7e               ld AL, [R_e07e|0xe07e]
d726:    15 03                  bnz L_d72b
d728:    71 d0 f6               jmp R_d0f6

L_d72b:
d72b:    29                     dec AL, #1
d72c:    a1 e0 7e               st AL, [R_e07e|0xe07e]
d72f:    79 d2 93               call R_d293
d732:    47 48 1b 60 e0 b6      memcpy 0x1c, [Y], [R_e0b6|0xe0b6]
d738:    50 76 00 1c            add Y, Y, 0x001c
d73c:    91 e3 8d               ld A, [R_e38d|0xe38d]
d73f:    3d                     sll A, #1
d740:    50 01 01 09            add A, A, [DevicesPtr|0x0109]
d744:    d6 19 00 00            st A, [Z + 0x0000]
d748:    47 9e 27 00 08         memset 0x28, 0x00, [Z]
d74d:    47 4d 01 06 09 80 00   memcpy 0x02, 0x0609, [Z + 0x00]
d754:    30 10 e3 93            inc [R_e393|0xe393], #1
d758:    47 41 01 e3 93 80 03   memcpy 0x02, [R_e393|0xe393], [Z + 0x03]
d75f:    47 41 05 e0 b6 80 07   memcpy 0x06, [R_e0b6|0xe0b6], [Z + 0x07]
d766:    47 41 14 e0 bc 80 11   memcpy 0x15, [R_e0bc|0xe0bc], [Z + 0x11]
d76d:    47 41 00 e0 d1 80 26   memcpy 0x01, [R_e0d1|0xe0d1], [Z + 0x26]
d774:    50 98 00 27            add Z, Z, 0x0027
d778:    30 10 e3 8d            inc [R_e38d|0xe38d], #1
d77c:    73 a5                  jmp R_d723

R_d77e:
d77e:    81 e0 7f               ld AL, [R_e07f|0xe07f]
d781:    15 03                  bnz L_d786
d783:    71 d0 f6               jmp R_d0f6

L_d786:
d786:    29                     dec AL, #1
d787:    a1 e0 7f               st AL, [R_e07f|0xe07f]
d78a:    79 d2 93               call R_d293
d78d:    47 48 11 60 e0 d2      memcpy 0x12, [Y], [R_e0d2|0xe0d2]
d793:    50 76 00 12            add Y, Y, 0x0012

R_d797:
d797:    81 e0 80               ld AL, [R_e080|0xe080]
d79a:    15 03                  bnz L_d79f
d79c:    71 d0 f6               jmp R_d0f6

L_d79f:
d79f:    29                     dec AL, #1
d7a0:    a1 e0 80               st AL, [R_e080|0xe080]
d7a3:    90 08 00               ld A, 0x0800
d7a6:    51 80                  sub A, Z
d7a8:    17 04                  bp L_d7ae
d7aa:    55 98 08 00            mov Z, 0x0800

L_d7ae:
d7ae:    79 d2 93               call R_d293
d7b1:    47 48 33 60 e0 e4      memcpy 0x34, [Y], [R_e0e4|0xe0e4]
d7b7:    50 76 00 34            add Y, Y, 0x0034
d7bb:    7e 63                  push {Y, Z}
d7bd:    47 40 00 db 19 d7 cf   memcpy 0x01, [DiskNum|0xdb19], [R_d7cf|0xd7cf]
d7c4:    d6 89 d7 d2            st Z, [R_d7d2|0xd7d2]
d7c8:    2e 2c 00 e1 1a         wpf1 0x00, [OPSYS_Page0|0xe11a]
d7cd:    66 02                  jsys Syscall_02

R_d7cf:
d7cf:    00                         arg1 = (0x0)
d7d0:    e0 ea                      arg2 = R_e0ea

R_d7d2:
d7d2:    00                     HALT
d7d3:    00                     HALT
d7d4:    01                     nop
d7d5:    2e 2c 00 e1 18         wpf1 0x00, [LOS_Page0|0xe118]
d7da:    7f 63                  pop {Y, Z}
d7dc:    38                     inc A, #1
d7dd:    5e                     mov Z, A
d7de:    81 e1 17               ld AL, [R_e117|0xe117]
d7e1:    67 9e 00 08            memset A, 0x00, [Z]
d7e5:    d6 93 00 05            st Z, [B + 0x0005]
d7e9:    91 e0 ff               ld A, [R_e0ff|0xe0ff]
d7ec:    14 2f                  bz L_d81d
d7ee:    7e 63                  push {Y, Z}
d7f0:    47 40 00 db 19 d8 02   memcpy 0x01, [DiskNum|0xdb19], [R_d802|0xd802]
d7f7:    d6 89 d8 05            st Z, [R_d805|0xd805]
d7fb:    2e 2c 00 e1 1a         wpf1 0x00, [OPSYS_Page0|0xe11a]
d800:    66 02                  jsys Syscall_02

R_d802:
d802:    00                         arg1 = (0x0)
d803:    e0 ff                      arg2 = R_e0ff

R_d805:
d805:    00                     HALT
d806:    00                     HALT
d807:    01                     nop
d808:    2e 2c 00 e1 18         wpf1 0x00, [LOS_Page0|0xe118]
d80d:    7f 63                  pop {Y, Z}
d80f:    38                     inc A, #1
d810:    5e                     mov Z, A
d811:    90 d8 5f               ld A, R_d85f|0xd85f
d814:    50 01 d8 5d            add A, A, [R_d85d|0xd85d]
d818:    f8                     st B, [A]
d819:    30 11 d8 5d            inc [R_d85d|0xd85d], #2

L_d81d:
d81d:    91 e3 8d               ld A, [R_e38d|0xe38d]
d820:    3d                     sll A, #1
d821:    50 01 01 09            add A, A, [DevicesPtr|0x0109]
d825:    d6 19 00 00            st A, [Z + 0x0000]
d829:    30 10 e3 93            inc [R_e393|0xe393], #1
d82d:    47 41 01 e3 93 80 03   memcpy 0x02, [R_e393|0xe393], [Z + 0x03]
d834:    47 4d 01 57 08 80 00   memcpy 0x02, 0x5708, [Z + 0x00]
d83b:    47 41 05 e0 e4 80 07   memcpy 0x06, [R_e0e4|0xe0e4], [Z + 0x07]
d842:    47 41 01 e1 14 80 0f   memcpy 0x02, [R_e114|0xe114], [Z + 0x0f]
d849:    47 41 00 e1 16 80 1a   memcpy 0x01, [R_e116|0xe116], [Z + 0x1a]
d850:    3a                     clr A, #0
d851:    81 e1 17               ld AL, [R_e117|0xe117]
d854:    50 08                  add Z, A
d856:    30 10 e3 8d            inc [R_e38d|0xe38d], #1
d85a:    71 d7 97               jmp R_d797

R_d85d:
d85d:    <null bytes>


R_d85f:
d85f:    00                     HALT
d860:    00                     HALT
d861:    00                     HALT
d862:    00                     HALT
d863:    00                     HALT
d864:    00                     HALT
d865:    00                     HALT
d866:    00                     HALT

R_d867:
d867:    91 e3 93               ld A, [R_e393|0xe393]
d86a:    b3 20                  st A, [0xd88c|+0x20]
d86c:    39                     dec A, #1
d86d:    67 9e 00 08            memset A, 0x00, [Z]
d871:    91 01 09               ld A, [DevicesPtr|0x0109]

L_d874:
d874:    55 13 00 00            mov B, [A + 0x0000]
d878:    14 10                  bz L_d88a
d87a:    30 01                  inc A, #2
d87c:    30 22                  inc B, #3
d87e:    55 37 00 00            mov Y, [B + 0x0000]
d882:    50 86                  add Y, Z
d884:    d6 37 00 00            st B, [Y + 0x0000]
d888:    73 ea                  jmp L_d874

L_d88a:
d88a:    50 98 00 00            add Z, Z, 0x0000
d88e:    d6 89 01 26            st Z, [EarlyInitDevicesPtr|0x0126]
d892:    93 c9                  ld A, [R_d85d|0xd85d|-0x37]
d894:    14 08                  bz L_d89e
d896:    67 41 d8 5f 80 02      memcpy A, [R_d85f|0xd85f], [Z + 0x02]
d89c:    50 08                  add Z, A

L_d89e:
d89e:    47 9e 03 00 08         memset 0x04, 0x00, [Z]
d8a3:    30 83                  inc Z, #4
d8a5:    d6 89 01 5c            st Z, [0x015c]
d8a9:    d1 01 09               ld B, [DevicesPtr|0x0109]
d8ac:    91 01 07               ld A, [0x0107]
d8af:    51 20                  sub A, B
d8b1:    3c                     srl A, #1
d8b2:    39                     dec A, #1
d8b3:    67 9e ff 08            memset A, 0xff, [Z]
d8b7:    38                     inc A, #1
d8b8:    50 08                  add Z, A
d8ba:    d6 89 01 20            st Z, [0x0120]
d8be:    32 20                  clr B, #0
d8c0:    c1 e0 83               ld BL, [R_e083|0xe083]
d8c3:    77 02                  div B, A

L_d8c5:
d8c5:    47 9e 04 ff 08         memset 0x05, 0xff, [Z]
d8ca:    30 84                  inc Z, #5
d8cc:    31 20                  dec B, #1
d8ce:    18 f5                  bgt L_d8c5
d8d0:    47 4e 01 ff 00 08      memcpy 0x02, 0xff00, [Z]
d8d6:    30 81                  inc Z, #2
d8d8:    d6 89 01 0d            st Z, [0x010d]
d8dc:    55 67 01 07            mov Y, [0x0107]
d8e0:    d0 e3 96               ld B, R_e396|0xe396

L_d8e3:
d8e3:    95 61                  ld A, [Y++]
d8e5:    14 56                  bz L_d93d
d8e7:    d6 19 00 04            st A, [Z + 0x0004]
d8eb:    47 4a 00 28            memcpy 0x01, [B], [Z]
d8ef:    30 80                  inc Z, #1
d8f1:    47 4e 01 ff ff 08      memcpy 0x02, 0xffff, [Z]
d8f7:    30 81                  inc Z, #2
d8f9:    47 4a 00 28            memcpy 0x01, [B], [Z]
d8fd:    30 80                  inc Z, #1
d8ff:    47 4e 01 ff ff 08      memcpy 0x02, 0xffff, [Z]
d905:    30 81                  inc Z, #2
d907:    47 4a 00 28            memcpy 0x01, [B], [Z]
d90b:    30 80                  inc Z, #1
d90d:    47 4e 01 ff ff 08      memcpy 0x02, 0xffff, [Z]
d913:    30 81                  inc Z, #2
d915:    47 4a 00 28            memcpy 0x01, [B], [Z]
d919:    30 80                  inc Z, #1
d91b:    47 4e 01 ff ff 08      memcpy 0x02, 0xffff, [Z]
d921:    30 81                  inc Z, #2
d923:    85 08 07               ld AL, [A + 0x07]
d926:    22 00                  clr AH, #0
d928:    31 02                  dec A, #3
d92a:    77 10 00 03            div A, A, 0x0003
d92e:    55 20                  mov A, B
d930:    39                     dec A, #1
d931:    67 9e ff 08            memset A, 0xff, [Z]
d935:    38                     inc A, #1
d936:    50 08                  add Z, A
d938:    d0 e3 98               ld B, R_e398|0xe398
d93b:    73 a6                  jmp L_d8e3

L_d93d:
d93d:    d1 01 0d               ld B, [0x010d]
d940:    51 82                  sub B, Z
d942:    78 32 00 03            mul B, B, 0x0003
d946:    31 20                  dec B, #1
d948:    f1 01 11               st B, [0x0111]
d94b:    55 67 01 07            mov Y, [0x0107]

L_d94f:
d94f:    95 61                  ld A, [Y++]
d951:    14 23                  bz L_d976
d953:    47 9e 09 a0 08         memset 0x0a, 0xa0, [Z]
d958:    50 98 00 0a            add Z, Z, 0x000a
d95c:    d6 19 00 17            st A, [Z + 0x0017]
d960:    85 08 16               ld AL, [A + 0x16]
d963:    22 00                  clr AH, #0
d965:    77 10 00 0a            div A, A, 0x000a
d969:    55 20                  mov A, B
d96b:    39                     dec A, #1
d96c:    67 9e a0 08            memset A, 0xa0, [Z]
d970:    50 08                  add Z, A
d972:    30 80                  inc Z, #1
d974:    73 d9                  jmp L_d94f

L_d976:
d976:    d6 89 01 1d            st Z, [0x011d]
d97a:    47 4e 01 00 00 08      memcpy 0x02, 0x0000, [Z]
d980:    50 98 01 92            add Z, Z, 0x0192
d984:    47 4e 03 00 8d 8d ff 08 memcpy 0x04, 0x008d8dff, [Z]
d98c:    30 83                  inc Z, #4
d98e:    91 01 0b               ld A, [0x010b]
d991:    31 01                  dec A, #2
d993:    d1 e3 8f               ld B, [R_e38f|0xe38f]
d996:    51 20                  sub A, B
d998:    b2 01 0b               st A, @[0x010b]
d99b:    92 01 07               ld A, @[0x0107]
d99e:    b1 01 03               st A, [CurrentProcess|0x0103]
d9a1:    91 01 07               ld A, [0x0107]

L_d9a4:
d9a4:    d1 e3 95               ld B, [R_e395|0xe395]
d9a7:    35 20                  sll B, #1
d9a9:    50 23 01 09            add B, B, [DevicesPtr|0x0109]
d9ad:    55 37 00 00            mov Y, [B + 0x0000]
d9b1:    d5 01                  ld B, [A++]
d9b3:    14 0b                  bz L_d9c0
d9b5:    d6 37 00 08            st B, [Y + 0x0008]
d9b9:    d0 e3 97               ld B, R_e397|0xe397
d9bc:    f3 e7                  st B, [0xd9a5|-0x19]
d9be:    73 e4                  jmp L_d9a4

L_d9c0:
d9c0:    d6 89 01 5e            st Z, [0x015e]
d9c4:    50 98 00 15            add Z, Z, 0x0015
d9c8:    90 08 00               ld A, 0x0800
d9cb:    51 80                  sub A, Z
d9cd:    17 04                  bp L_d9d3
d9cf:    55 98 08 00            mov Z, 0x0800

L_d9d3:
d9d3:    90 c7 01               ld A, 0xc701
d9d6:    50 80                  add A, Z
d9d8:    16 14                  blt L_d9ee

R_d9da:
d9da:    47 4c 01 e3 16 e2 b7   memcpy 0x02, R_e316|0xe316, [CRT0_Write_String|0xe2b7]	 ; "OPSYS OVERSIZE-LOAD PROCESS DISCONTINUED\r\n"
d9e1:    d0 e2 b1               ld B, CRT0_WriteStruct|0xe2b1
d9e4:    2e 2c 00 e1 1a         wpf1 0x00, [OPSYS_Page0|0xe11a]
d9e9:    66 10                  jsys Syscall_DoFileOp
d9eb:    05                     di

L_d9ec:
d9ec:    73 fe                  jmp L_d9ec

L_d9ee:
d9ee:    d6 89 01 01            st Z, [0x0101]
d9f2:    2e 2c 00 e1 1a         wpf1 0x00, [OPSYS_Page0|0xe11a]
d9f7:    81 db 19               ld AL, [DiskNum|0xdb19]
d9fa:    a3 06                  st AL, [0xda02|+0x6]
d9fc:    55 80                  mov A, Z
d9fe:    b3 05                  st A, [0xda05|+0x5]
da00:    66 02                  jsys Syscall_02
da02:    00                         arg1 = (0x0)
da03:    e3 76                      arg2 = R_e376
da05:    00                     HALT
da06:    00                     HALT
da07:    01                     nop
da08:    b1 e0 6b               st A, [R_e06b|0xe06b]
da0b:    2e 2c 00 e1 18         wpf1 0x00, [LOS_Page0|0xe118]
da10:    2e 1c f8 01 61         rpf 0xf8, [PageTableOne|0x0161]
da15:    2e 1c f8 01 81         rpf 0xf8, [PageTableTwo|0x0181]
da1a:    47 9c 0b ff 01 48      memset 0x0c, 0xff, [0x0148]
da20:    81 e1 1f               ld AL, [R_e11f|0xe11f]
da23:    24 12                  srl AL, #3
da25:    29                     dec AL, #1
da26:    67 9c 00 01 44         memset A, 0x00, [0x0144]
da2b:    81 e1 1f               ld AL, [R_e11f|0xe11f]
da2e:    52 10 00 07            and A, A, 0x0007
da32:    14 14                  bz L_da48
da34:    5b                     mov X, A
da35:    81 e1 1f               ld AL, [R_e11f|0xe11f]
da38:    24 12                  srl AL, #3
da3a:    50 10 01 44            add A, A, 0x0144
da3e:    5c                     mov Y, A
da3f:    2a                     clr AL, #0
da40:    29                     dec AL, #1

L_da41:
da41:    07                     rl
da42:    26 10                  rrc AL, #1
da44:    3f                     dec X
da45:    15 fa                  bnz L_da41
da47:    ab                     st AL, [Y]

L_da48:
da48:    91 e0 6b               ld A, [R_e06b|0xe06b]
da4b:    78 10 08 00            mul A, A, 0x0800
da4f:    f5 a2                  st B, [--S]
da51:    3a                     clr A, #0

L_da52:
da52:    06                     sl
da53:    36 00                  rrc A, #1
da55:    31 20                  dec B, #1
da57:    18 f9                  bgt L_da52
da59:    14 f7                  bz L_da52
da5b:    53 10 00 01            or A, A, 0x0001
da5f:    b1 01 44               st A, [0x0144]
da62:    f1 01 46               st B, [0x0146]
da65:    91 01 01               ld A, [0x0101]
da68:    95 08 01               ld A, [A + 0x01]
da6b:    52 10 f8 00            and A, A, 0xf800
da6f:    50 10 08 00            add A, A, 0x0800
da73:    5e                     mov Z, A
da74:    34 0a                  srl A, #11
da76:    47 4d 00 1e 10 01 81   memcpy 0x01, 0x1e, [A + 0x181]
da7d:    2e 2c 00 e1 1a         wpf1 0x00, [OPSYS_Page0|0xe11a]
da82:    47 4d 00 1e 10 01 81   memcpy 0x01, 0x1e, [A + 0x181]
da89:    47 4d 00 1e 10 01 61   memcpy 0x01, 0x1e, [A + 0x161]
da90:    d2 01 07               ld B, @[0x0107]
da93:    47 41 1f 01 61 20 36   memcpy 0x20, [PageTableOne|0x0161], [B + 0x36]
da9a:    2e 2c 00 e1 18         wpf1 0x00, [LOS_Page0|0xe118]
da9f:    5d                     mov B, A
daa0:    51 10 00 1c            sub A, A, 0x001c
daa4:    67 9d fd 30 01 82      memset A, 0xfd, [B + 0x182]
daaa:    95 a1                  ld A, [S++]
daac:    5d                     mov B, A
daad:    51 10 00 1c            sub A, A, 0x001c
dab1:    67 9d fd 30 01 62      memset A, 0xfd, [B + 0x162]
dab7:    47 40 00 db 19 dd 18   memcpy 0x01, [DiskNum|0xdb19], [R_dd18|0xdd18]
dabe:    47 40 00 db 19 de 5b   memcpy 0x01, [DiskNum|0xdb19], [R_de5b|0xde5b]
dac5:    91 01 09               ld A, [DevicesPtr|0x0109]

L_dac8:
dac8:    d5 01                  ld B, [A++]
daca:    15 03                  bnz L_dacf
dacc:    71 dc d2               jmp R_dcd2

L_dacf:
dacf:    7e 01                  push {A}
dad1:    55 37 00 05            mov Y, [B + 0x0005]
dad5:    14 1a                  bz L_daf1
dad7:    16 53                  blt L_db2c
dad9:    51 70 00 11            sub A, Y, 0x0011
dadd:    16 4d                  blt L_db2c
dadf:    35 60                  sll Y, #1
dae1:    50 74 dc aa            add X, Y, R_dcaa|0xdcaa
dae5:    55 55 00 00            mov X, [X + 0x0000]
dae9:    14 06                  bz L_daf1
daeb:    d6 35 00 05            st B, [X + 0x0005]
daef:    73 3b                  jmp L_db2c

L_daf1:
daf1:    d6 39 00 05            st B, [Z + 0x0005]
daf5:    50 74 dc aa            add X, Y, R_dcaa|0xdcaa
daf9:    d6 59 00 00            st X, [Z + 0x0000]
dafd:    34 60                  srl Y, #1
daff:    77 76 00 15            div Y, Y, 0x0015
db03:    50 76 db 30            add Y, Y, R_db30|0xdb30
db07:    d6 89 db 1c            st Z, [R_db1c|0xdb1c]
db0b:    d6 67 db 1a            st Y, [R_db1a|0xdb1a]
db0f:    79 df 1a               call R_df1a
db12:    2e 2c 00 e1 1a         wpf1 0x00, [OPSYS_Page0|0xe11a]
db17:    66 02                  jsys Syscall_02

DiskNum:
db19:    01                         arg1 = (0x1)

R_db1a:
db1a:    00 00                      arg2 = L_0000

R_db1c:
db1c:    00                     HALT
db1d:    00                     HALT
db1e:    01                     nop
db1f:    5e                     mov Z, A
db20:    2e 2c 00 e1 18         wpf1 0x00, [LOS_Page0|0xe118]
db25:    2e 0c 70 01 61         wpf 0x70, [PageTableOne|0x0161]
db2a:    30 80                  inc Z, #1

L_db2c:
db2c:    7f 01                  pop {A}
db2e:    73 98                  jmp L_dac8

R_db30:
db30:    c0 d3 d9 d3 ae c0 c9 cf c4 d1 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@IODQ           "
db45:    c0 d3 d9 d3 ae c0 c9 cf c4 b1 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@IOD1           "
db5a:    c0 d3 d9 d3 ae c0 c9 cf c4 b6 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@IOD6           "
db6f:    c0 d3 d9 d3 ae c0 c9 cf c4 b2 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@IOD2           "
db84:    c0 d3 d9 d3 ae c0 c9 cf c4 cd a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@IODM           "
db99:    c0 d3 d9 d3 ae c0 c9 cf c4 b3 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@IOD3           "
dbae:    c0 d3 d9 d3 ae c0 c9 cf c4 c4 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@IODD           "
dbc3:    c0 d3 d9 d3 ae c0 c9 cf c4 c5 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@IODE           "
dbd8:    c0 d3 d9 d3 ae c0 c9 cf c4 c6 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@IODF           "
dbed:    c0 d3 d9 d3 ae c0 c9 cf c4 c8 c8 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@IODHH          "
dc02:    c0 d3 d9 d3 ae c0 c9 cf c4 c8 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@IODH           "
dc17:    c0 d3 d9 d3 ae c0 c9 cf c4 c9 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@IODI           "
dc2c:    c0 d3 d9 d3 ae c0 c9 cf c4 c1 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@IODA           "
dc41:    c0 d3 d9 d3 ae c0 c9 cf c4 cb a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@IODK           "
dc56:    c0 d3 d9 d3 ae c0 c9 cf c4 b0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@IOD0           "
dc6b:    c0 d3 d9 d3 ae c0 c9 cf c4 b7 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@IOD7           "
dc80:    c0 d3 d9 d3 ae c0 c9 cf c4 b8 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@IOD8           "
dc95:    c0 d3 d9 d3 ae c0 c9 cf c4 b9 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@IOD9           "

R_dcaa:
dcaa:    <null bytes>


R_dcd2:
dcd2:    91 01 0b               ld A, [0x010b]
dcd5:    30 01                  inc A, #2

L_dcd7:
dcd7:    d1 e3 8f               ld B, [R_e38f|0xe38f]
dcda:    30 21                  inc B, #2
dcdc:    59                     sub B, A
dcdd:    19 03                  ble L_dce2
dcdf:    71 de 01               jmp R_de01

L_dce2:
dce2:    d5 01                  ld B, [A++]
dce4:    14 f1                  bz L_dcd7
dce6:    7e 01                  push {A}
dce8:    55 37 00 1b            mov Y, [B + 0x001b]
dcec:    52 70 ff f0            and A, Y, 0xfff0
dcf0:    14 08                  bz L_dcfa
dcf2:    32 40                  clr X, #0
dcf4:    d6 35 00 1b            st B, [X + 0x001b]
dcf8:    73 31                  jmp L_dd2b

L_dcfa:
dcfa:    d6 39 00 1b            st B, [Z + 0x001b]
dcfe:    77 76 00 15            div Y, Y, 0x0015
dd02:    50 76 dd 2f            add Y, Y, R_dd2f|0xdd2f
dd06:    d6 89 dd 1b            st Z, [R_dd1b|0xdd1b]
dd0a:    d6 67 dd 19            st Y, [R_dd19|0xdd19]
dd0e:    79 df 1a               call R_df1a
dd11:    2e 2c 00 e1 1a         wpf1 0x00, [OPSYS_Page0|0xe11a]
dd16:    66 02                  jsys Syscall_02

R_dd18:
dd18:    01                         arg1 = (0x1)

R_dd19:
dd19:    00 00                      arg2 = L_0000

R_dd1b:
dd1b:    00                     HALT
dd1c:    00                     HALT
dd1d:    01                     nop
dd1e:    5e                     mov Z, A
dd1f:    2e 2c 00 e1 18         wpf1 0x00, [LOS_Page0|0xe118]
dd24:    2e 0c 70 01 61         wpf 0x70, [PageTableOne|0x0161]
dd29:    30 80                  inc Z, #1

L_dd2b:
dd2b:    7f 01                  pop {A}
dd2d:    73 a8                  jmp L_dcd7

R_dd2f:
dd2f:    c0 d3 d9 d3 ae c0 c9 d3 d2 b0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@ISR0           "
dd44:    c0 d3 d9 d3 ae c0 c9 d3 d2 b1 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@ISR1           "
dd59:    c0 d3 d9 d3 ae c0 c9 d3 d2 b2 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@ISR2           "
dd6e:    c0 d3 d9 d3 ae c0 c9 d3 d2 b3 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@ISR3           "
dd83:    c0 d3 d9 d3 ae c0 c9 d3 d2 b4 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@ISR4           "
dd98:    c0 d3 d9 d3 ae c0 c9 d3 d2 b5 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@ISR5           "
ddad:    c0 d3 d9 d3 ae c0 c9 d3 d2 b6 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@ISR6           "
ddc2:    c0 d3 d9 d3 ae c0 c9 d3 d2 b7 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@ISR7           "
ddd7:    c0 d3 d9 d3 ae c0 c9 d3 d2 b8 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@ISR8           "
ddec:    c0 d3 d9 d3 ae c0 c9 d3 d2 b9 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@ISR9           "

R_de01:
de01:    91 01 0b               ld A, [0x010b]
de04:    30 01                  inc A, #2

L_de06:
de06:    d1 e3 8f               ld B, [R_e38f|0xe38f]
de09:    30 21                  inc B, #2
de0b:    59                     sub B, A
de0c:    19 03                  ble L_de11
de0e:    71 df ac               jmp R_dfac

L_de11:
de11:    d5 01                  ld B, [A++]
de13:    14 f1                  bz L_de06
de15:    7e 01                  push {A}
de17:    55 37 00 1d            mov Y, [B + 0x001d]
de1b:    52 70 ff f0            and A, Y, 0xfff0
de1f:    15 4d                  bnz L_de6e
de21:    77 76 00 03            div Y, Y, 0x0003
de25:    50 74 df 05            add X, Y, R_df05|0xdf05
de29:    55 55 00 00            mov X, [X + 0x0000]
de2d:    14 06                  bz L_de35
de2f:    d6 35 00 1d            st B, [X + 0x001d]
de33:    73 39                  jmp L_de6e

L_de35:
de35:    d6 39 00 1d            st B, [Z + 0x001d]
de39:    50 74 df 05            add X, Y, R_df05|0xdf05
de3d:    d6 59 00 00            st X, [Z + 0x0000]
de41:    77 76 00 07            div Y, Y, 0x0007
de45:    50 76 de 72            add Y, Y, R_de72|0xde72
de49:    d6 89 de 5e            st Z, [R_de5e|0xde5e]
de4d:    d6 67 de 5c            st Y, [R_de5c|0xde5c]
de51:    79 df 1a               call R_df1a
de54:    2e 2c 00 e1 1a         wpf1 0x00, [OPSYS_Page0|0xe11a]
de59:    66 02                  jsys Syscall_02

R_de5b:
de5b:    01                         arg1 = (0x1)

R_de5c:
de5c:    00 00                      arg2 = L_0000

R_de5e:
de5e:    00                     HALT
de5f:    00                     HALT
de60:    01                     nop
de61:    5e                     mov Z, A
de62:    2e 2c 00 e1 18         wpf1 0x00, [LOS_Page0|0xe118]
de67:    2e 0c 70 01 61         wpf 0x70, [PageTableOne|0x0161]
de6c:    30 80                  inc Z, #1

L_de6e:
de6e:    7f 01                  pop {A}
de70:    73 94                  jmp L_de06

R_de72:
de72:    c0 d3 d9 d3 ae c0 d0 c4 b0 b0 b0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@PD000          "
de87:    c0 d3 d9 d3 ae c0 d0 c4 b0 b0 b1 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@PD001          "
de9c:    c0 d3 d9 d3 ae c0 d0 c4 b0 b0 b2 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@PD002          "
deb1:    c0 d3 d9 d3 ae c0 d0 c4 b0 b0 b3 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@PD003          "
dec6:    c0 d3 d9 d3 ae c0 d0 c4 b0 b0 b4 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@PD004          "
dedb:    c0 d3 d9 d3 ae c0 d0 c4 b0 b0 b5 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@PD005          "
def0:    c0 d3 d9 d3 ae c0 d0 c4 b0 b0 b6 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "@SYS.@PD006          "

R_df05:
df05:    <null bytes>


R_df1a:
df1a:    7e 27                  push {B, X, Y, Z}
df1c:    51 90 78 00            sub A, Z, 0x7800
df20:    16 27                  blt L_df49
df22:    3a                     clr A, #0
df23:    45 81                  mov AL, ZH
df25:    07                     rl
df26:    34 02                  srl A, #3
df28:    73 70                  jmp L_df9a

L_df2a:
df2a:    b5 a2                  st A, [--S]
df2c:    50 12 01 81            add B, A, 0x0181
df30:    3a                     clr A, #0
df31:    89                     ld AL, [B]
df32:    51 10 00 fd            sub A, A, 0x00fd
df36:    15 58                  bnz L_df90
df38:    f5 a2                  st B, [--S]
df3a:    60 00 0e               ld X, 0x000e
df3d:    55 76 01 44            mov Y, 0x0144

L_df41:
df41:    85 61                  ld AL, [Y++]
df43:    28                     inc AL, #1
df44:    15 06                  bnz L_df4c
df46:    3f                     dec X
df47:    17 f8                  bp L_df41

L_df49:
df49:    71 d9 da               jmp R_d9da

L_df4c:
df4c:    31 60                  dec Y, #1
df4e:    29                     dec AL, #1
df4f:    55 64                  mov X, Y
df51:    d0 01 44               ld B, 0x0144
df54:    51 42                  sub B, X
df56:    32 40                  clr X, #0

L_df58:
df58:    2d                     sll AL, #1
df59:    11 03                  bnc L_df5e
df5b:    3e                     inc X
df5c:    73 fa                  jmp L_df58

L_df5e:
df5e:    35 22                  sll B, #3
df60:    50 42                  add B, X
df62:    95 a1                  ld A, [S++]
df64:    e8                     st BL, [A]
df65:    2e 2c 00 e1 1a         wpf1 0x00, [OPSYS_Page0|0xe11a]
df6a:    e8                     st BL, [A]
df6b:    e5 08 e0               st BL, [A + -0x20]
df6e:    92 01 07               ld A, @[0x0107]
df71:    47 41 1f 01 61 00 36   memcpy 0x20, [PageTableOne|0x0161], [A + 0x36]
df78:    80 80                  ld AL, 0x80
df7a:    07                     rl

L_df7b:
df7b:    3f                     dec X
df7c:    16 04                  blt L_df82
df7e:    26 10                  rrc AL, #1
df80:    73 f9                  jmp L_df7b

L_df82:
df82:    2e 2c 00 e1 18         wpf1 0x00, [LOS_Page0|0xe118]
df87:    cb                     ld BL, [Y]
df88:    43 13                  or BL, AL
df8a:    eb                     st BL, [Y]
df8b:    2e 0c 70 01 81         wpf 0x70, [PageTableTwo|0x0181]

L_df90:
df90:    95 a1                  ld A, [S++]
df92:    c0 00                  ld BL, 0x00
df94:    15 10                  bnz L_dfa6
df96:    20 30                  inc BL, #1
df98:    e3 f9                  st BL, [0xdf93|-0x7]

L_df9a:
df9a:    38                     inc A, #1
df9b:    5d                     mov B, A
df9c:    35 2a                  sll B, #11
df9e:    51 32 78 00            sub B, B, 0x7800
dfa2:    19 02                  ble L_dfa6
dfa4:    73 84                  jmp L_df2a

L_dfa6:
dfa6:    2a                     clr AL, #0
dfa7:    a3 ea                  st AL, [0xdf93|-0x16]
dfa9:    7f 27                  pop {B, X, Y, Z}
dfab:    09                     ret

R_dfac:
dfac:    91 01 03               ld A, [CurrentProcess|0x0103]
dfaf:    95 08 08               ld A, [A + 0x08]
dfb2:    95 08 05               ld A, [A + 0x05]
dfb5:    b2 01 26               st A, @[EarlyInitDevicesPtr|0x0126]
dfb8:    91 01 5e               ld A, [0x015e]
dfbb:    47 42 14 df 05 00      memcpy 0x15, [R_df05|0xdf05], [A]
dfc1:    2e 0c 70 01 81         wpf 0x70, [PageTableTwo|0x0181]
dfc6:    61 01 09               ld X, [DevicesPtr|0x0109]

L_dfc9:
dfc9:    d5 41                  ld B, [X++]
dfcb:    14 21                  bz L_dfee
dfcd:    85 28 01               ld AL, [B + 0x01]
dfd0:    45 10                  mov AH, AL
dfd2:    80 04                  ld AL, 0x04
dfd4:    41 01                  sub AL, AH
dfd6:    15 f1                  bnz L_dfc9
dfd8:    d6 39 00 14            st B, [Z + 0x0014]
dfdc:    79 df 1a               call R_df1a
dfdf:    85 28 16               ld AL, [B + 0x16]
dfe2:    29                     dec AL, #1
dfe3:    67 9e ff 08            memset A, 0xff, [Z]
dfe7:    28                     inc AL, #1
dfe8:    22 00                  clr AH, #0
dfea:    50 08                  add Z, A
dfec:    73 db                  jmp L_dfc9

L_dfee:
dfee:    2e 0c 78 01 61         wpf 0x78, [PageTableOne|0x0161]
dff3:    2e 2c 02 e1 18         wpf1 0x02, [LOS_Page0|0xe118]
dff8:    2e 2c 03 e1 18         wpf1 0x03, [LOS_Page0|0xe118]
dffd:    91 01 44               ld A, [0x0144]
e000:    52 10 ff fe            and A, A, 0xfffe
e004:    b1 01 44               st A, [0x0144]
e007:    32 02                  clr A, #2
e009:    b1 01 46               st A, [0x0146]
e00c:    93 5d                  ld A, [R_e06b|0xe06b|+0x5d]
e00e:    95 08 ff               ld A, [A + -0x1]
e011:    55 82                  mov B, Z
e013:    59                     sub B, A
e014:    10 02                  bc L_e018
e016:    55 80                  mov A, Z

L_e018:
e018:    52 10 f8 00            and A, A, 0xf800
e01c:    50 10 08 00            add A, A, 0x0800
e020:    b1 01 1a               st A, [0x011a]
e023:    05                     di
e024:    e1 f2 0f               st BL, [0xf20f]
e027:    3a                     clr A, #0
e028:    45 81                  mov AL, ZH
e02a:    34 02                  srl A, #3
e02c:    28                     inc AL, #1
e02d:    50 12 01 81            add B, A, 0x0181

L_e031:
e031:    f5 a2                  st B, [--S]
e033:    3a                     clr A, #0
e034:    89                     ld AL, [B]
e035:    51 10 00 fd            sub A, A, 0x00fd
e039:    14 22                  bz L_e05d
e03b:    89                     ld AL, [B]
e03c:    a5 a2                  st AL, [--S]
e03e:    80 fd                  ld AL, 0xfd
e040:    a9                     st AL, [B]
e041:    3a                     clr A, #0
e042:    85 a1                  ld AL, [S++]
e044:    5c                     mov Y, A
e045:    5b                     mov X, A
e046:    52 54 00 07            and X, X, 0x0007
e04a:    34 62                  srl Y, #3
e04c:    50 76 01 44            add Y, Y, 0x0144
e050:    80 7f                  ld AL, 0x7f
e052:    06                     sl

L_e053:
e053:    3f                     dec X
e054:    16 04                  blt L_e05a
e056:    26 10                  rrc AL, #1
e058:    73 f9                  jmp L_e053

L_e05a:
e05a:    cb                     ld BL, [Y]
e05b:    4a                     and BL, AL
e05c:    eb                     st BL, [Y]

L_e05d:
e05d:    80 00                  ld AL, 0x00
e05f:    15 09                  bnz L_e06a
e061:    28                     inc AL, #1
e062:    a3 fa                  st AL, [0xe05e|-0x6]
e064:    d5 a1                  ld B, [S++]
e066:    30 20                  inc B, #1
e068:    73 c7                  jmp L_e031

L_e06a:
e06a:    90 00 00               ld A, 0x0000
e06d:    75 08 fe               jmp [A + -0x2]
e070:    <null bytes>


R_e076:
e076:    <null bytes>


R_e077:
e077:    <null bytes>


R_e07a:
e07a:    <null bytes>


R_e07b:
e07b:    <null bytes>


R_e07c:
e07c:    <null bytes>


R_e07d:
e07d:    <null bytes>


R_e07e:
e07e:    <null bytes>


R_e07f:
e07f:    <null bytes>


R_e080:
e080:    <null bytes>


R_e081:
e081:    <null bytes>


R_e082:
e082:    <null bytes>


R_e083:
e083:    <null bytes>


R_e087:
e087:    <null bytes>


R_e088:
e088:    <null bytes>


R_e089:
e089:    <null bytes>


R_e08a:
e08a:    <null bytes>


R_e08b:
e08b:    <null bytes>


R_e091:
e091:    <null bytes>


R_e092:
e092:    <null bytes>


R_e093:
e093:    <null bytes>


R_e095:
e095:    <null bytes>


R_e097:
e097:    <null bytes>


R_e098:
e098:    <null bytes>


R_e09e:
e09e:    <null bytes>


R_e09f:
e09f:    <null bytes>


R_e0a5:
e0a5:    <null bytes>


R_e0a6:
e0a6:    <null bytes>


R_e0a7:
e0a7:    <null bytes>


R_e0a8:
e0a8:    <null bytes>


R_e0aa:
e0aa:    <null bytes>


R_e0ab:
e0ab:    <null bytes>


R_e0ac:
e0ac:    <null bytes>


R_e0b2:
e0b2:    <null bytes>


R_e0b3:
e0b3:    <null bytes>


R_e0b5:
e0b5:    <null bytes>


R_e0b6:
e0b6:    <null bytes>


R_e0bc:
e0bc:    <null bytes>


R_e0d1:
e0d1:    <null bytes>


R_e0d2:
e0d2:    <null bytes>


R_e0e4:
e0e4:    <null bytes>


R_e0ea:
e0ea:    <null bytes>


R_e0ff:
e0ff:    <null bytes>


R_e114:
e114:    00                     HALT
e115:    00                     HALT

R_e116:
e116:    00                     HALT

R_e117:
e117:    00                     HALT

LOS_Page0:
e118:    00                     (0x0)

R_e119:
e119:    0f                     rsys

OPSYS_Page0:
e11a:    1f                     (0x1f)

R_e11b:
e11b:    00                     HALT
e11c:    00                     HALT

WIPL_A:
e11d:    00 00                  (0x0)

R_e11f:
e11f:    1e                     (0x1e)

R_e120:
e120:    7f                     (0x7f)

ReadBuffer:
e121:    a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 a0 "                                                                                                                                                                                                                                                                                                                                                                                                                "

CRT0_WriteStruct:
e2b1:    00                     (0x0)
e2b2:    81                     (0x81)	 ; DeviceType?
e2b3:    00                     (0x0)
e2b4:    02                     (0x2)
e2b5:    00                     (0x0)
e2b6:    51                     (0x51)

CRT0_Write_String:
e2b7:    e1 21                  ReadBuffer
e2b9:    00 00                  (0x0)

CRT0_ReadStruct:
e2bb:    00                     (0x0)
e2bc:    81                     (0x81)
e2bd:    00                     (0x0)
e2be:    01                     (0x1)
e2bf:    00                     (0x0)
e2c0:    50                     (0x50)

CRT0_Read_String:
e2c1:    e1 21                  ReadBuffer
e2c3:    00 00                  (0x0)

R_e2c5:
e2c5:    5, "CODE="

R_e2cc:
e2cc:    7, "\r\nNAME="

R_e2d5:
e2d5:    5, "DISK="

R_e2dc:
e2dc:    32, "INVALID CONFIGURATION DATA SET\r\n"

R_e2fe:
e2fe:    17, "\x0c\x1b\x1cLOS 6.05 - B\r\n"

ClearScreen:
e311:    3, "\x1b\x1c\x0c"	 ; <esc><fs><ff> (escape, file seperator, form feed)

R_e316:
e316:    42, "OPSYS OVERSIZE-LOAD PROCESS DISCONTINUED\r\n"

R_e342:
e342:    00                     HALT

R_e343:
e343:    64

UserDiskNum:
e344:    01                     nop

DoAutoboot:
e345:    ff                     (0xff)

R_e346:
e346:    "          \0"

R_e351:
e351:    "          \0"

BootNameLen:
    ; This string is used as both a pascal string and a C string.
e35c:    00 04                  (0x4)

BootName:
e35e:    "@OSN                   \0"

R_e376:
e376:    "@SYS.OSN             \0"

R_e38c:
e38c:    <null bytes>


R_e38d:
e38d:    <null bytes>


R_e38f:
e38f:    <null bytes>


R_e391:
e391:    00                     HALT
e392:    00                     HALT

R_e393:
e393:    00                     HALT
e394:    00                     HALT

R_e395:
e395:    00                     HALT

R_e396:
e396:    00                     HALT

R_e397:
e397:    00                     HALT

R_e398:
e398:    00                     HALT

Tos_Entry:
e399:    73 2c                  jmp R_e3c7

Tos_Return:
e39b:    00                     HALT
e39c:    00                     HALT
e39d:    73 28                  jmp R_e3c7
e39f:    <null bytes>


R_e3c7:
e3c7:    6f e5 38               stcc [0xe538]
e3ca:    b1 e5 26               st A, [Debug_Regs_A|0xe526]
e3cd:    91 e4 8c               ld A, [R_e48c|0xe48c]
e3d0:    b1 e5 36               st A, [Debug_Regs_PC|0xe536]
e3d3:    73 48                  jmp L_e41d

R_e3d5:
e3d5:    6f e5 38               stcc [0xe538]
e3d8:    b1 e5 26               st A, [Debug_Regs_A|0xe526]
e3db:    91 e4 91               ld A, [R_e491|0xe491]
e3de:    b1 e5 36               st A, [Debug_Regs_PC|0xe536]
e3e1:    73 3a                  jmp L_e41d

R_e3e3:
e3e3:    45 c1                  mov AL, CH
e3e5:    52 10 00 f0            and A, A, 0x00f0
e3e9:    53 10 00 0e            or A, A, 0x000e
e3ed:    a3 01                  st AL, [0xe3f0|+0x1]
e3ef:    e6 0e                  mov A, IL0(P)
e3f1:    d1 e5 ce               ld B, [R_e5ce|0xe5ce]
e3f4:    59                     sub B, A
e3f5:    14 23                  bz L_e41a
e3f7:    d0 e3 99               ld B, Tos_Entry|0xe399
e3fa:    59                     sub B, A
e3fb:    11 08                  bnc L_e405
e3fd:    d0 e9 69               ld B, TopOfLoad|0xe969
e400:    59                     sub B, A
e401:    10 02                  bc L_e405
e403:    73 15                  jmp L_e41a

L_e405:
e405:    d0 ff aa               ld B, 0xffaa
e408:    f6 33 00               st BL, +0x0(B)
e40b:    b1 e4 8c               st A, [R_e48c|0xe48c]
e40e:    47 48 02 00 e4 8e      memcpy 0x03, [A], [R_e48e|0xe48e]
e414:    47 42 02 e5 d0 00      memcpy 0x03, [R_e5d0|0xe5d0], [A]

L_e41a:
e41a:    0a                     reti
e41b:    73 c6                  jmp R_e3e3

L_e41d:
e41d:    1e 04                  b?E L_e423
e41f:    80 05                  ld AL, 0x05
e421:    73 02                  jmp L_e425

L_e423:
e423:    80 04                  ld AL, 0x04

L_e425:
e425:    a1 e5 cc               st AL, [R_e5cc|0xe5cc]
e428:    05                     di
e429:    f1 e5 28               st B, [Debug_Regs_B|0xe528]
e42c:    69 e5 2a               st X, [Debug_Regs_X|0xe52a]
e42f:    d6 67 e5 2c            st Y, [Debug_Regs_Y|0xe52c]
e433:    d6 89 e5 2e            st Z, [Debug_Regs_Z|0xe52e]
e437:    d6 ab e5 30            st S, [Debug_Regs_S|0xe530]
e43b:    d6 cd e5 32            st C, [Debug_Regs_C|0xe532]
e43f:    d6 ef e5 34            st P, [Debug_Regs_P|0xe534]
e443:    e6 a8                  mov A, IL10(Z)
e445:    b1 e5 39               st A, [R_e539|0xe539]
e448:    91 e3 9b               ld A, [Tos_Return|0xe39b]
e44b:    14 07                  bz L_e454
e44d:    b1 e5 36               st A, [Debug_Regs_PC|0xe536]
e450:    3a                     clr A, #0
e451:    b1 e3 9b               st A, [Tos_Return|0xe39b]

L_e454:
e454:    81 e5 38               ld AL, [CCR_Value|0xe538]
e457:    32 20                  clr B, #0
e459:    2d                     sll AL, #1
e45a:    26 33                  rrc BL, #4
e45c:    2d                     sll AL, #1
e45d:    26 33                  rrc BL, #4
e45f:    e1 e5 25               st BL, [R_e525|0xe525]
e462:    32 20                  clr B, #0
e464:    2d                     sll AL, #1
e465:    27 33                  rlc BL, #4
e467:    2d                     sll AL, #1
e468:    27 30                  rlc BL, #1
e46a:    e1 e5 24               st BL, [R_e524|0xe524]
e46d:    55 ba e3 c7            mov S, R_e3c7|0xe3c7
e471:    93 19                  ld A, [R_e48c|0xe48c|+0x19]
e473:    14 06                  bz L_e47b
e475:    47 42 02 e4 8e 00      memcpy 0x03, [R_e48e|0xe48e], [A]

L_e47b:
e47b:    93 14                  ld A, [R_e491|0xe491|+0x14]
e47d:    14 06                  bz L_e485
e47f:    47 42 02 e4 93 00      memcpy 0x03, [R_e493|0xe493], [A]

L_e485:
e485:    3a                     clr A, #0
e486:    b3 04                  st A, [R_e48c|0xe48c|+0x4]
e488:    b3 07                  st A, [R_e491|0xe491|+0x7]
e48a:    73 0a                  jmp L_e496

R_e48c:
e48c:    <null bytes>


R_e48e:
e48e:    00                     HALT
e48f:    00                     HALT
e490:    00                     HALT

R_e491:
e491:    00                     HALT
e492:    00                     HALT

R_e493:
e493:    00                     HALT
e494:    00                     HALT
e495:    00                     HALT

L_e496:
e496:    80 c5                  ld AL, 0xc5
e498:    d0 f2 00               ld B, 0xf200
e49b:    f6 13 00               st AL, +0x0(B)	 ; Setup CRT0 to 9600 baud
e49e:    79 e6 32               call Mux0_EchoByte
e4a1:    80 aa                  ld AL, 0xaa	 ; "*"
e4a3:    79 e6 3e               call Mux0_WriteByte
e4a6:    91 e5 36               ld A, [Debug_Regs_PC|0xe536]
e4a9:    79 e5 dd               call Mux0_WriteHexWord
e4ac:    80 a8                  ld AL, 0xa8	 ; "("
e4ae:    79 e6 3e               call Mux0_WriteByte
e4b1:    91 e8 5e               ld A, [R_e85e|0xe85e]
e4b4:    d1 e5 36               ld B, [Debug_Regs_PC|0xe536]
e4b7:    51 20                  sub A, B
e4b9:    79 e5 dd               call Mux0_WriteHexWord
e4bc:    91 e5 36               ld A, [Debug_Regs_PC|0xe536]
e4bf:    88                     ld AL, [A]
e4c0:    79 e5 d6               call Mux0_WriteHexByte
e4c3:    80 a9                  ld AL, 0xa9	 ; ")"
e4c5:    79 e6 3e               call Mux0_WriteByte
e4c8:    60 e5 24               ld X, R_e524|0xe524

L_e4cb:
e4cb:    95 41                  ld A, [X++]
e4cd:    79 e5 dd               call Mux0_WriteHexWord
e4d0:    51 50 e5 36            sub A, X, Debug_Regs_PC|0xe536
e4d4:    15 f5                  bnz L_e4cb

TosPrompt:
e4d6:    79 e6 32               call Mux0_EchoByte
e4d9:    80 dc                  ld AL, 0xdc	 ; '\\'
e4db:    79 e6 3e               call Mux0_WriteByte	 ; Show prompt
e4de:    79 e6 10               call Mux0_ReadByte	 ; Get command
e4e1:    c0 da                  ld BL, 0xda	 ; 'Z'
e4e3:    49                     sub BL, AL
e4e4:    18 f0                  bgt TosPrompt
e4e6:    d0 00 c1               ld B, 0x00c1	 ; 'A'
e4e9:    49                     sub BL, AL
e4ea:    16 ea                  blt TosPrompt
e4ec:    35 20                  sll B, #1
e4ee:    90 e3 99               ld A, Tos_Entry|0xe399	 ; Pointers are relative to Entry
e4f1:    60 e9 35               ld X, R_e935|0xe935	 ; Pointer Offset Table
e4f4:    50 24                  add X, B
e4f6:    da                     ld B, [X]
e4f7:    14 dd                  bz TosPrompt
e4f9:    16 05                  blt L_e500
e4fb:    58                     add B, A	 ; Pointer is positive, we just add it to Entry, and jump to it with A = 0
e4fc:    f3 24                  st B, [0xe522|+0x24]	 ; Patch jmp at e521
e4fe:    73 20                  jmp L_e520

L_e500:
    ; Pointer is negative
    ; These commands take arguments which this dispatcher should read.
e500:    59                     sub B, A	 ; Subtract it from Entry to get a postive offset
e501:    f3 1f                  st B, [0xe522|+0x1f]	 ; Patch jmp at e512
e503:    3a                     clr A, #0
e504:    5b                     mov X, A
e505:    5c                     mov Y, A
e506:    5e                     mov Z, A	 ; Clear X, Y and Z
e507:    79 e6 67               call Mux0_ReadHex
e50a:    55 26                  mov Y, B
e50c:    c0 ac                  ld BL, 0xac
e50e:    49                     sub BL, AL
e50f:    15 0f                  bnz L_e520
e511:    79 e6 67               call Mux0_ReadHex
e514:    55 28                  mov Z, B
e516:    c0 ac                  ld BL, 0xac
e518:    49                     sub BL, AL
e519:    15 05                  bnz L_e520
e51b:    79 e6 67               call Mux0_ReadHex
e51e:    55 24                  mov X, B

L_e520:
e520:    3a                     clr A, #0
e521:    71 00 00               jmp L_0000

R_e524:
e524:    <null bytes>


R_e525:
e525:    <null bytes>


Debug_Regs_A:
e526:    <null bytes>


Debug_Regs_B:
e528:    <null bytes>


Debug_Regs_X:
e52a:    <null bytes>


Debug_Regs_Y:
e52c:    <null bytes>


Debug_Regs_Z:
e52e:    <null bytes>


Debug_Regs_S:
e530:    <null bytes>


Debug_Regs_C:
e532:    00 00                  (0x0)

Debug_Regs_P:
e534:    00 00                  (0x0)

Debug_Regs_PC:
e536:    00 00                  (0x0)

CCR_Value:
e538:    00                     (0x0)

R_e539:
e539:    00                     HALT
e53a:    00                     HALT

TOS_CommandG:
e53b:    55 60                  mov A, Y
e53d:    15 02                  bnz L_e541
e53f:    93 f5                  ld A, [Debug_Regs_PC|0xe536|-0xb]

L_e541:
e541:    b1 e5 ce               st A, [R_e5ce|0xe5ce]
e544:    55 80                  mov A, Z
e546:    14 0f                  bz L_e557
e548:    b1 e4 8c               st A, [R_e48c|0xe48c]
e54b:    47 48 02 00 e4 8e      memcpy 0x03, [A], [R_e48e|0xe48e]
e551:    47 42 02 e5 d0 00      memcpy 0x03, [R_e5d0|0xe5d0], [A]

L_e557:
e557:    55 40                  mov A, X
e559:    14 0f                  bz R_e56a
e55b:    b1 e4 91               st A, [R_e491|0xe491]
e55e:    47 48 02 00 e4 93      memcpy 0x03, [A], [R_e493|0xe493]
e564:    47 42 02 e5 d3 00      memcpy 0x03, [R_e5d3|0xe5d3], [A]

R_e56a:
e56a:    0e                     dly
e56b:    0e                     dly
e56c:    0e                     dly
e56d:    0e                     dly
e56e:    90 f2 01               ld A, 0xf201
e571:    f6 30 00               ld BL, +0x0(A)
e574:    e6 6e                  mov A, IL6(P)
e576:    b3 08                  st A, [0xe580|+0x8]	 ; save IL6's current Handler
e578:    90 e5 86               ld A, R_e586|0xe586	 ; load a new one
e57b:    d7 6e                  mov IL6(P), A
e57d:    04                     ei	 ; Allow interrupt to trigger
e57e:    0e                     dly	 ; wait
e57f:    90 00 00               ld A, 0x0000
e582:    d7 6e                  mov IL6(P), A
e584:    73 0a                  jmp L_e590

R_e586:
    ; Temporary IL6 interrupt handler
e586:    05                     di
e587:    90 f2 0f               ld A, 0xf20f
e58a:    f6 30 00               ld BL, +0x0(A)
e58d:    0a                     reti

L_e58e:
e58e:    73 fe                  jmp L_e58e

L_e590:
e590:    83 92                  ld AL, [R_e524|0xe524|-0x6e]
e592:    22 30                  clr BL, #0
e594:    2c                     srl AL, #1
e595:    26 30                  rrc BL, #1
e597:    24 13                  srl AL, #4
e599:    26 30                  rrc BL, #1
e59b:    83 88                  ld AL, [R_e525|0xe525|-0x78]
e59d:    25 13                  sll AL, #4
e59f:    26 30                  rrc BL, #1
e5a1:    25 13                  sll AL, #4
e5a3:    26 30                  rrc BL, #1
e5a5:    e3 91                  st BL, [CCR_Value|0xe538|-0x6f]
e5a7:    d1 e5 28               ld B, [Debug_Regs_B|0xe528]
e5aa:    61 e5 2a               ld X, [Debug_Regs_X|0xe52a]
e5ad:    55 67 e5 2c            mov Y, [Debug_Regs_Y|0xe52c]
e5b1:    55 89 e5 2e            mov Z, [Debug_Regs_Z|0xe52e]
e5b5:    55 ab e5 30            mov S, [Debug_Regs_S|0xe530]
e5b9:    55 cd e5 32            mov C, [Debug_Regs_C|0xe532]
e5bd:    55 ef e5 34            mov P, [Debug_Regs_P|0xe534]
e5c1:    91 e5 39               ld A, [R_e539|0xe539]
e5c4:    d7 a8                  mov IL10(Z), A
e5c6:    91 e5 26               ld A, [Debug_Regs_A|0xe526]
e5c9:    6e                     unknown
e5ca:    e5 'e'
e5cb:    38

R_e5cc:
e5cc:    04                     ei
e5cd:    71

R_e5ce:
e5ce:    00                     HALT
e5cf:    00                     HALT

R_e5d0:
e5d0:    71 e3 c7               jmp R_e3c7

R_e5d3:
e5d3:    71 e3 d5               jmp R_e3d5

Mux0_WriteHexByte:
    ; Mux0_WriteHexByte
    ; Takes a Byte in A, converts to hex and writes to MUX0 with leading space
e5d6:    6d a2                  st X, [--S]
e5d8:    60 ff fe               ld X, 0xfffe
e5db:    73 05                  jmp L_e5e2

Mux0_WriteHexWord:
    ; Mux0_WriteHexWord
    ; Takes a Word in A, converts to hex and writes to MUX0 with leading space
e5dd:    6d a2                  st X, [--S]
e5df:    60 ff fc               ld X, 0xfffc

L_e5e2:
e5e2:    f5 a2                  st B, [--S]
e5e4:    45 53                  mov BL, XL
e5e6:    e5 a2                  st BL, [--S]	 ; Push senital byte onto stak

L_e5e8:
    ; Loop, pushing nibbles onto stack
e5e8:    c0 0f                  ld BL, 0x0f
e5ea:    4a                     and BL, AL
e5eb:    e5 a2                  st BL, [--S]
e5ed:    34 03                  srl A, #4
e5ef:    3e                     inc X
e5f0:    15 f6                  bnz L_e5e8
e5f2:    80 a0                  ld AL, 0xa0	 ; ' '
e5f4:    7b 48                  call Mux0_WriteByte	 ; Write leading space

L_e5f6:
    ; Loop, popping nibbles, converting to the range 0-F and writing to MUX0
e5f6:    d0 b9 b0               ld B, 0xb9b0
e5f9:    85 a1                  ld AL, [S++]
e5fb:    16 0e                  blt L_e60b	 ; Stop when we see senital byte
e5fd:    40 31                  add AL, BL
e5ff:    41 12                  sub BH, AL
e601:    19 04                  ble L_e607
e603:    c0 07                  ld BL, 0x07
e605:    40 31                  add AL, BL

L_e607:
e607:    7b 35                  call Mux0_WriteByte
e609:    73 eb                  jmp L_e5f6

L_e60b:
    ; Done
e60b:    d5 a1                  ld B, [S++]
e60d:    65 a1                  ld X, [S++]
e60f:    09                     ret

Mux0_ReadByte:
e610:    f5 a2                  st B, [--S]

L_e612:
    ; Reads a byte from MUX0, echo it, converts to uppercase and returns in A
    ; Stores a copy of the byte in Mux0_LastReadByte
e612:    d0 f2 00               ld B, 0xf200
e615:    f6 12 00               ld AL, +0x0(B)
e618:    2c                     srl AL, #1
e619:    11 f7                  bnc L_e612
e61b:    f6 12 01               ld AL, +0x1(B)
e61e:    c0 80                  ld BL, 0x80
e620:    43 31                  or AL, BL
e622:    7b 1a                  call Mux0_WriteByte	 ; Echo
e624:    c0 e1                  ld BL, 0xe1
e626:    49                     sub BL, AL
e627:    16 04                  blt L_e62d
e629:    80 c1                  ld AL, 0xc1
e62b:    40 31                  add AL, BL

L_e62d:
e62d:    d5 a1                  ld B, [S++]

L_e62f:
e62f:    a3 0c                  st AL, [Mux0_LastReadByte|0xe63d|+0xc]
e631:    09                     ret

Mux0_EchoByte:
    ; Echos the last read byte (again?) from Mux0_LastReadByte
e632:    80 8d                  ld AL, 0x8d
e634:    c3 07                  ld BL, [Mux0_LastReadByte|0xe63d|+0x7]
e636:    49                     sub BL, AL
e637:    14 02                  bz L_e63b
e639:    7b 03                  call Mux0_WriteByte

L_e63b:
e63b:    0e                     dly
e63c:    09                     ret

Mux0_LastReadByte:
e63d:    00                     (0x0)

Mux0_WriteByte:
e63e:    45 10                  mov AH, AL
e640:    7b 1a                  call Mux0_ReadyToSend
e642:    45 01                  mov AL, AH
e644:    f6 13 01               st AL, +0x1(B)	 ; Write byte
                                              	 ; B is set to 0xf200 in the above call
e647:    80 8d                  ld AL, 0x8d
e649:    41 01                  sub AL, AH
e64b:    15 0b                  bnz L_e658	 ; If byte = '\r'
e64d:    7b 0d                  call Mux0_ReadyToSend
e64f:    6d a2                  st X, [--S]
e651:    65 a1                  ld X, [S++]
e653:    80 8a                  ld AL, 0x8a	 ; also print '\n'
e655:    f6 13 01               st AL, +0x1(B)

L_e658:
e658:    45 01                  mov AL, AH
e65a:    73 d3                  jmp L_e62f

Mux0_ReadyToSend:
e65c:    d0 f2 00               ld B, 0xf200
e65f:    f6 12 00               ld AL, +0x0(B)
e662:    24 11                  srl AL, #2
e664:    11 f6                  bnc Mux0_ReadyToSend
e666:    09                     ret

Mux0_ReadHex:
e667:    6d a2                  st X, [--S]
e669:    3a                     clr A, #0
e66a:    b3 30                  st A, [0xe69c|+0x30]
e66c:    a3 32                  st AL, [0xe6a0|+0x32]

L_e66e:
e66e:    32 40                  clr X, #0

L_e670:
e670:    3a                     clr A, #0
e671:    b3 2b                  st A, [0xe69e|+0x2b]

L_e673:
e673:    7b 9b                  call Mux0_ReadByte
e675:    a3 38                  st AL, [0xe6af|+0x38]
e677:    c0 b9                  ld BL, 0xb9
e679:    49                     sub BL, AL
e67a:    18 11                  bgt L_e68d
e67c:    c0 b0                  ld BL, 0xb0
e67e:    49                     sub BL, AL
e67f:    16 20                  blt L_e6a1

L_e681:
e681:    a3 1d                  st AL, [0xe6a0|+0x1d]
e683:    93 19                  ld A, [0xe69e|+0x19]
e685:    35 03                  sll A, #4
e687:    40 31                  add AL, BL
e689:    b3 13                  st A, [0xe69e|+0x13]
e68b:    73 e6                  jmp L_e673

L_e68d:
e68d:    c0 c6                  ld BL, 0xc6
e68f:    49                     sub BL, AL
e690:    18 0f                  bgt L_e6a1
e692:    c0 c1                  ld BL, 0xc1
e694:    49                     sub BL, AL
e695:    16 0a                  blt L_e6a1	 ; Check in range a
e697:    80 0a                  ld AL, 0x0a
e699:    48                     add BL, AL
e69a:    73 e5                  jmp L_e681
e69c:    00
e69d:    00
e69e:    00
e69f:    00
e6a0:    00

L_e6a1:
e6a1:    93 fb                  ld A, [0xe69e|-0x5]
e6a3:    55 44                  mov X, X
e6a5:    14 02                  bz L_e6a9
e6a7:    3b                     not A, #0
e6a8:    38                     inc A, #1

L_e6a9:
e6a9:    d3 f1                  ld B, [0xe69c|-0xf]
e6ab:    58                     add B, A
e6ac:    f3 ee                  st B, [0xe69c|-0x12]
e6ae:    80 00                  ld AL, 0x00
e6b0:    c0 ae                  ld BL, 0xae
e6b2:    49                     sub BL, AL
e6b3:    14 23                  bz L_e6d8
e6b5:    c0 ab                  ld BL, 0xab
e6b7:    49                     sub BL, AL
e6b8:    14 b4                  bz L_e66e
e6ba:    c0 ad                  ld BL, 0xad
e6bc:    49                     sub BL, AL
e6bd:    15 03                  bnz L_e6c2
e6bf:    3e                     inc X
e6c0:    73 ae                  jmp L_e670

L_e6c2:
e6c2:    65 a1                  ld X, [S++]
e6c4:    c0 a0                  ld BL, 0xa0
e6c6:    49                     sub BL, AL
e6c7:    14 21                  bz L_e6ea
e6c9:    c0 ac                  ld BL, 0xac
e6cb:    49                     sub BL, AL
e6cc:    14 1c                  bz L_e6ea
e6ce:    c0 8d                  ld BL, 0x8d
e6d0:    49                     sub BL, AL
e6d1:    14 17                  bz L_e6ea
e6d3:    65 a1                  ld X, [S++]

L_e6d5:
e6d5:    71 e4 d6               jmp TosPrompt

L_e6d8:
e6d8:    a3 c6                  st AL, [0xe6a0|-0x3a]
e6da:    91 e8 5e               ld A, [R_e85e|0xe85e]
e6dd:    d3 bd                  ld B, [0xe69c|-0x43]
e6df:    55 44                  mov X, X
e6e1:    14 02                  bz L_e6e5
e6e3:    3b                     not A, #0
e6e4:    38                     inc A, #1

L_e6e5:
e6e5:    58                     add B, A
e6e6:    f3 b4                  st B, [0xe69c|-0x4c]
e6e8:    73 89                  jmp L_e673

L_e6ea:
e6ea:    d3 b0                  ld B, [0xe69c|-0x50]
e6ec:    83 b2                  ld AL, [0xe6a0|-0x4e]
e6ee:    15 02                  bnz L_e6f2
e6f0:    30 41                  inc X, #2

L_e6f2:
e6f2:    83 bb                  ld AL, [0xe6af|-0x45]
e6f4:    09                     ret

TOS_CommandH:
e6f5:    55 60                  mov A, Y
e6f7:    79 e5 dd               call Mux0_WriteHexWord
e6fa:    73 d9                  jmp L_e6d5

TOS_CommandM:
e6fc:    8b                     ld AL, [Y]
e6fd:    79 e5 d6               call Mux0_WriteHexByte
e700:    80 ad                  ld AL, 0xad	 ; ']'
e702:    79 e6 3e               call Mux0_WriteByte

L_e705:
e705:    79 e6 67               call Mux0_ReadHex
e708:    eb                     st BL, [Y]
e709:    01                     nop
e70a:    30 60                  inc Y, #1
e70c:    c0 8d                  ld BL, 0x8d
e70e:    49                     sub BL, AL
e70f:    14 c4                  bz L_e6d5
e711:    c0 ac                  ld BL, 0xac
e713:    49                     sub BL, AL
e714:    14 ef                  bz L_e705
e716:    73 e4                  jmp TOS_CommandM

TOS_CommandI:
e718:    f6 16 00               ld AL, +0x0(Y)
e71b:    79 e5 d6               call Mux0_WriteHexByte
e71e:    80 ad                  ld AL, 0xad
e720:    79 e6 3e               call Mux0_WriteByte

L_e723:
e723:    79 e6 67               call Mux0_ReadHex
e726:    73 0e                  jmp L_e736

L_e728:
e728:    30 60                  inc Y, #1
e72a:    c0 8d                  ld BL, 0x8d
e72c:    49                     sub BL, AL
e72d:    14 a6                  bz L_e6d5
e72f:    c0 ac                  ld BL, 0xac
e731:    49                     sub BL, AL
e732:    14 ef                  bz L_e723
e734:    73 e2                  jmp TOS_CommandI

L_e736:
e736:    f6 37 00               st BL, +0x0(Y)
e739:    73 ed                  jmp L_e728

TosCmd_editregV:
e73b:    39                     dec A, #1

TosCmd_editregA:
e73c:    39                     dec A, #1

TosCmd_editregB:
e73d:    39                     dec A, #1

TosCmd_editregX:
e73e:    39                     dec A, #1

TosCmd_editregY:
e73f:    39                     dec A, #1

TosCmd_editregZ:
e740:    39                     dec A, #1

TosCmd_editregS:
e741:    39                     dec A, #1

TosCmd_editregC:
e742:    39                     dec A, #1

TosCmd_editregP:
e743:    5b                     mov X, A
e744:    3f                     dec X
e745:    3d                     sll A, #1
e746:    50 12 e5 34            add B, A, Debug_Regs_P|0xe534
e74a:    55 26                  mov Y, B

L_e74c:
e74c:    9b                     ld A, [Y]
e74d:    79 e5 dd               call Mux0_WriteHexWord	 ; Print current register value
e750:    80 ad                  ld AL, 0xad	 ; ]
e752:    79 e6 3e               call Mux0_WriteByte

L_e755:
e755:    79 e6 67               call Mux0_ReadHex
e758:    fb                     st B, [Y]
e759:    01                     nop
e75a:    d5 61                  ld B, [Y++]
e75c:    3e                     inc X
e75d:    18 64                  bgt L_e7c3
e75f:    c0 8d                  ld BL, 0x8d
e761:    49                     sub BL, AL
e762:    14 5f                  bz L_e7c3
e764:    c0 ac                  ld BL, 0xac
e766:    49                     sub BL, AL
e767:    14 ec                  bz L_e755
e769:    73 e1                  jmp L_e74c

TosCmd_hexDump:
    ; Hexdump
    ; Y = address
    ; 
e76b:    79 e6 32               call Mux0_EchoByte
e76e:    55 60                  mov A, Y
e770:    79 e5 dd               call Mux0_WriteHexWord	 ; Print Address
e773:    55 64                  mov X, Y
e775:    6b 2f                  st X, [0xe7a6|+0x2f]	 ; start_of_row
e777:    d0 00 0f               ld B, 0x000f
e77a:    52 24                  and X, B	 ; number of missing bytes for alignment
e77c:    6b 1d                  st X, [0xe79b|+0x1d]	 ; align_bytes
e77e:    55 42                  mov B, X
e780:    50 44                  add X, X
e782:    50 24                  add X, B	 ; X = align_bytes * 3

L_e784:
e784:    80 a0                  ld AL, 0xa0
e786:    79 e6 3e               call Mux0_WriteByte	 ; Pad with spaces
e789:    3f                     dec X
e78a:    17 f8                  bp L_e784

L_e78c:
e78c:    85 61                  ld AL, [Y++]
e78e:    79 e5 d6               call Mux0_WriteHexByte	 ; Write byte
e791:    55 64                  mov X, Y
e793:    d0 00 0f               ld B, 0x000f
e796:    52 24                  and X, B
e798:    15 f2                  bnz L_e78c	 ; Continue writing bytes until end of 16 byte row
e79a:    60 00 00               ld X, 0x0000	 ; <modified> align_bytes

L_e79d:
e79d:    80 a0                  ld AL, 0xa0
e79f:    79 e6 3e               call Mux0_WriteByte	 ; pad with spaces
e7a2:    3f                     dec X
e7a3:    17 f8                  bp L_e79d
e7a5:    90 00 00               ld A, 0x0000	 ; <modified> start_of_row
e7a8:    5c                     mov Y, A

L_e7a9:
e7a9:    85 61                  ld AL, [Y++]
e7ab:    53 10 00 80            or A, A, 0x0080	 ; Set ascii high bit
e7af:    28                     inc AL, #1
e7b0:    14 06                  bz L_e7b8	 ; Check for DEL
e7b2:    29                     dec AL, #1
e7b3:    c0 a0                  ld BL, 0xa0
e7b5:    49                     sub BL, AL	 ; Check for printable
e7b6:    10 02                  bc L_e7ba

L_e7b8:
e7b8:    80 ae                  ld AL, 0xae	 ; Replace with '^'

L_e7ba:
e7ba:    79 e6 3e               call Mux0_WriteByte
e7bd:    55 60                  mov A, Y
e7bf:    51 80                  sub A, Z

L_e7c1:
e7c1:    17 03                  bp L_e7c6	 ; Are we past the end?

L_e7c3:
e7c3:    71 e4 d6               jmp TosPrompt	 ; Next row

L_e7c6:
e7c6:    55 64                  mov X, Y
e7c8:    d0 00 0f               ld B, 0x000f
e7cb:    52 24                  and X, B
e7cd:    15 da                  bnz L_e7a9
e7cf:    73 9a                  jmp TosCmd_hexDump

TOS_CommandF:
    ; A memset?
    ; Y = Start
    ; Z = End
    ; X = Value
e7d1:    55 40                  mov A, X

L_e7d3:
e7d3:    55 62                  mov B, Y
e7d5:    51 82                  sub B, Z
e7d7:    16 e8                  blt L_e7c1
e7d9:    a5 61                  st AL, [Y++]
e7db:    73 f6                  jmp L_e7d3

TOS_CommandT:
e7dd:    55 60                  mov A, Y
e7df:    51 80                  sub A, Z
e7e1:    16 de                  blt L_e7c1
e7e3:    c5 61                  ld BL, [Y++]
e7e5:    e5 41                  st BL, [X++]
e7e7:    73 f4                  jmp TOS_CommandT

TOS_CommandQ:
e7e9:    91 e5 30               ld A, [Debug_Regs_S|0xe530]
e7ec:    5f                     mov S, A
e7ed:    79 e6 32               call Mux0_EchoByte
e7f0:    04                     ei
e7f1:    66 09                  jsys Syscall_Abort
e7f3:    01                         abort_code = (0x1)

TosCmd_Launch:
e7f4:    c6                     unknown
e7f5:    05                     di
e7f6:    32 c0                  clr C, #0	 ; Clear C, so our return level will be zero
e7f8:    2e 2c 00 e8 30         wpf1 0x00, [R_e830|0xe830]
e7fd:    3a                     clr A, #0
e7fe:    d7 0c                  mov IL0(C), A	 ; Clear IL0's C
e800:    2f 08                  ld_isr A
e802:    90 01 00               ld A, 0x0100	 ; Start executing at address 0x0100
e805:    d7 0e                  mov IL0(P), A
e807:    47 40 16 e8 19 01 00   memcpy 0x17, [R_e819|0xe819], [SyscallVector|0x0100]
e80e:    47 40 1f e8 30 01 40   memcpy 0x20, [R_e830|0xe830], [0x0140]
e815:    0a                     reti
e816:    71 01 00               jmp SyscallVector

R_e819:
    ; This gets copied to 0x100 by above command
e819:    2e 0c f8 01 40         wpf 0xf8, [0x0140]	 ; Load page table (below)
e81e:    2a                     clr AL, #0
e81f:    a1 f2 0d               st AL, [0xf20d]
e822:    a1 f1 4b               st AL, [0xf14b]
e825:    a1 f1 4d               st AL, [0xf14d]
e828:    3a                     clr A, #0
e829:    5d                     mov B, A
e82a:    5b                     mov X, A
e82b:    5c                     mov Y, A
e82c:    5e                     mov Z, A
e82d:    71 fd 00               jmp L_fd00

R_e830:
    ; Page table
    ; This gets copied to 0x140 by above command
e830:    00                     HALT
e831:    01                     nop
e832:    02                     sf
e833:    03                     rf
e834:    04                     ei
e835:    05                     di
e836:    06                     sl
e837:    07                     rl
e838:    08                     cl
e839:    09                     ret
e83a:    0a
e83b:    0b
e83c:    0c
e83d:    0d
e83e:    0e
e83f:    0f
e840:    10
e841:    11
e842:    12
e843:    13
e844:    14
e845:    15
e846:    16
e847:    17
e848:    18
e849:    19
e84a:    1a
e84b:    1b
e84c:    1c
e84d:    1d
e84e:    7e
e84f:    7f

TOS_CommandO:
e850:    55 60                  mov A, Y
e852:    15 09                  bnz L_e85d
e854:    91 00 5a               ld A, [0x005a]
e857:    95 0c 07               ld A, @[A + 0x07]
e85a:    95 08 0a               ld A, [A + 0x0a]

L_e85d:
e85d:    b0 '0'

R_e85e:
e85e:    00                     HALT
e85f:    00                     HALT
e860:    71 e4 d6               jmp TosPrompt

TOS_CommandU:
e863:    55 c0                  mov A, C
e865:    2f 08                  ld_isr A
e867:    55 40                  mov A, X
e869:    35 03                  sll A, #4
e86b:    30 03                  inc A, #4
e86d:    a3 01                  st AL, [0xe870|+0x1]
e86f:    2f 04                  ld_dma_mode A
e871:    2f 80                  ld_dma_addr Z
e873:    33 60                  not Y, #0
e875:    2f 62                  ld_dma_count Y
e877:    2f 06                  enable_dma
e879:    71 e4 d6               jmp TosPrompt

R_e87c:
e87c:    85 41                  ld AL, [X++]
e87e:    14 05                  bz L_e885
e880:    79 e6 3e               call Mux0_WriteByte
e883:    73 f7                  jmp R_e87c

L_e885:
e885:    09                     ret

TOS_CommandW:
e886:    80 ff                  ld AL, 0xff
e888:    a3 58                  st AL, [0xe8e2|+0x58]
e88a:    80 b0                  ld AL, 0xb0
e88c:    a3 16                  st AL, [0xe8a4|+0x16]
e88e:    2a                     clr AL, #0
e88f:    a3 53                  st AL, [R_e8e4|0xe8e4|+0x53]

L_e891:
e891:    83 4f                  ld AL, [0xe8e2|+0x4f]
e893:    28                     inc AL, #1
e894:    c0 08                  ld BL, 0x08
e896:    49                     sub BL, AL
e897:    17 4d                  bp L_e8e6
e899:    a3 47                  st AL, [0xe8e2|+0x47]
e89b:    7b df                  call R_e87c
e89d:    8d                     ld AL, [S]
e89e:    a0 a0                  st AL, 0xa0
e8a0:    a0 cd                  st AL, 0xcd
e8a2:    c1 'A'

R_e8a3:
e8a3:    d0 b0 a0               ld B, 0xb0a0
e8a6:    ad                     st AL, [S]
e8a7:    a0 00                  st AL, 0x00
e8a9:    30 10 e8 a3            inc [R_e8a3|0xe8a3], #1
e8ad:    80 ff                  ld AL, 0xff
e8af:    a3 32                  st AL, [0xe8e3|+0x32]

L_e8b1:
e8b1:    83 30                  ld AL, [0xe8e3|+0x30]
e8b3:    28                     inc AL, #1
e8b4:    c0 20                  ld BL, 0x20
e8b6:    49                     sub BL, AL
e8b7:    17 22                  bp L_e8db
e8b9:    a3 28                  st AL, [0xe8e3|+0x28]
e8bb:    2e 30 e8 e4 e8 e5      rpf1 [R_e8e4|0xe8e4], [R_e8e5|0xe8e5]
e8c1:    3a                     clr A, #0
e8c2:    83 20                  ld AL, [R_e8e4|0xe8e4|+0x20]
e8c4:    50 10 00 08            add A, A, 0x0008
e8c8:    a3 1a                  st AL, [R_e8e4|0xe8e4|+0x1a]
e8ca:    80 00                  ld AL, 0x00
e8cc:    a1 e5 f3               st AL, [R_e5f3|0xe5f3]
e8cf:    83 14                  ld AL, [R_e8e5|0xe8e5|+0x14]
e8d1:    79 e5 d6               call Mux0_WriteHexByte
e8d4:    80 a0                  ld AL, 0xa0
e8d6:    a1 e5 f3               st AL, [R_e5f3|0xe5f3]
e8d9:    73 d6                  jmp L_e8b1

L_e8db:
e8db:    83 07                  ld AL, [R_e8e4|0xe8e4|+0x7]
e8dd:    28                     inc AL, #1
e8de:    a3 04                  st AL, [R_e8e4|0xe8e4|+0x4]
e8e0:    73 af                  jmp L_e891
e8e2:    ff
e8e3:    ff

R_e8e4:
e8e4:    00                     HALT

R_e8e5:
e8e5:    00                     HALT

L_e8e6:
e8e6:    7b 94                  call R_e87c
e8e8:    8d                     ld AL, [S]
e8e9:    a0 a0                  st AL, 0xa0
e8eb:    a0 c4                  st AL, 0xc4
e8ed:    cd                     ld BL, [S]
e8ee:    c1 a0 a0               ld BL, [0xa0a0]
e8f1:    ad                     st AL, [S]
e8f2:    a0 c3                  st AL, 0xc3
e8f4:    ce                     ld BL, [C]
e8f5:    d4 ba                  ld B, @[L_e8b1|0xe8b1|-0x46]
e8f7:    00                     HALT
e8f8:    2f 03                  st_dma_count A
e8fa:    79 e5 dd               call Mux0_WriteHexWord
e8fd:    79 e8 7c               call R_e87c
e900:    a0 a0                  st AL, 0xa0
e902:    c1 c4 d2               ld BL, [0xc4d2]
e905:    ba                     st A, [X]
e906:    00                     HALT
e907:    2f 01                  st_dma_addr A
e909:    79 e5 dd               call Mux0_WriteHexWord
e90c:    79 e8 7c               call R_e87c
e90f:    a0 a0                  st AL, 0xa0
e911:    cd                     ld BL, [S]
e912:    c1 d0 ba               ld BL, [0xd0ba]
e915:    00                     HALT
e916:    2f 09                  st_isr A
e918:    79 e5 d6               call Mux0_WriteHexByte
e91b:    79 e6 32               call Mux0_EchoByte
e91e:    71 e4 d6               jmp TosPrompt

TOS_CommandN:
e921:    90 e3 e3               ld A, R_e3e3|0xe3e3	 ; Install interrupt handler into IL14
e924:    d7 ee                  mov IL14(P), A
e926:    91 e5 36               ld A, [Debug_Regs_PC|0xe536]
e929:    b1 e5 ce               st A, [R_e5ce|0xe5ce]
e92c:    90 ff ab               ld A, 0xffab
e92f:    f6 11 00               st AL, +0x0(A)
e932:    71 e5 6a               jmp R_e56a

R_e935:
e935:    03 a3                  (0x3a3)	 ; Key: A -> TosCmd_editregA
e937:    03 a4                  (0x3a4)	 ; Key: B -> TosCmd_editregB
e939:    03 a9                  (0x3a9)	 ; Key: C -> TosCmd_editregC
e93b:    fc 2e                  (-0x3d2)	 ; Key: D -> TosCmd_hexDump
e93d:    00 00                  (0x0)
e93f:    fb c8                  (-0x438)	 ; Key: F -> TOS_CommandF
e941:    fe 5e                  (-0x1a2)	 ; Key: G -> TOS_CommandG
e943:    fc a4                  (-0x35c)	 ; Key: H -> TOS_CommandH
e945:    fc 81                  (-0x37f)	 ; Key: I -> TOS_CommandI
e947:    00 00                  (0x0)
e949:    00 00                  (0x0)
e94b:    04 5b                  (0x45b)	 ; Key: L -> TosCmd_Launch

TosCmd_editMem:
e94d:    fc 9d                  (-0x363)	 ; Key: M -> TOS_CommandM
e94f:    05 88                  (0x588)	 ; Key: N -> TOS_CommandN
e951:    fb 49                  (-0x4b7)	 ; Key: O -> TOS_CommandO
e953:    03 aa                  (0x3aa)	 ; Key: P -> TosCmd_editregP
e955:    04 50                  (0x450)	 ; Key: Q -> TOS_CommandQ
e957:    00 00                  (0x0)
e959:    03 a8                  (0x3a8)	 ; Key: S -> TosCmd_editregS
e95b:    fb bc                  (-0x444)	 ; Key: T -> TOS_CommandT
e95d:    fb 36                  (-0x4ca)	 ; Key: U -> TOS_CommandU
e95f:    03 a2                  (0x3a2)	 ; Key: V -> TosCmd_editregV
e961:    04 ed                  (0x4ed)	 ; Key: W -> TOS_CommandW
e963:    03 a5                  (0x3a5)	 ; Key: X -> TosCmd_editregX
e965:    03 a6                  (0x3a6)	 ; Key: Y -> TosCmd_editregY
e967:    03 a7                  (0x3a7)	 ; Key: Z -> TosCmd_editregZ

TopOfLoad:
e969:    <null bytes>


L_f140:
f140:    <null bytes>


L_f200:
f200:    <null bytes>


L_f808:
f808:    <null bytes>


L_fd00:
fd00:    <null bytes>

