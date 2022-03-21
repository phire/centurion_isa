8000:    00           HALT

L2:
8001:    3a           clear A
8002:    b1 b8 00     stw A, 0xb800 ; Probally setting the 7 segment LEDs to 0 0
8005:    05           flag5
8006:    0e           delay 4.5ms
8007:    a1 f1 4f     stb A, 0xf14f
800a:    a1 f2 0d     stb A, 0xf20d
800d:    a1 f2 0f     stb A, 0xf20f
8010:    90 c0 00     liw A, 0xc000
8013:    5f           mov sp, A
8014:    22 32        unknown
8016:    14 0b        b_z L0
8018:    90 80 77     liw A, 0x8077
801b:    b1 00 fe     stw A, 0x00fe
801e:    3a           clear A
801f:    b1 00 fc     stw A, 0x00fc
8022:    76           unknown

L0:
8023:    3a           clear A
8024:    a1 f1 09     stb A, 0xf109
8027:    a1 f1 0b     stb A, 0xf10b
802a:    a1 f1 0d     stb A, 0xf10d
802d:    a1 f1 0f     stb A, 0xf10f
8030:    81 f1 10     ldb A, 0xf110
8033:    c0 0f        lib B, 0x0f
8035:    42 31        and A, B
8037:    a1 f1 10     stb A, 0xf110
803a:    a1 f1 06     stb A, 0xf106
803d:    c0 0d        lib B, 0x0d
803f:    49           cmp A, B
8040:    15 03        b_nz L1
8042:    71 87 28     jump 0x8728 AuxiliaryTestMenu

L1:
8045:    c1 f1 10     c1 A, 0xf110
8048:    16 b7        b_lt L2
804a:    3d           unknown
804b:    d0 80 55     liw B, 0x8055
804e:    58           unknown
804f:    99           unknown
8050:    a1 f1 08     stb A, 0xf108
8053:    75 00        unknown jump 0x8055
8055:    80 01        lib A, 0x01
8057:    80 8e        lib A, 0x8e
8059:    81 1b 81     ldb A, 0x1b81
805c:    83 81        unknown
805e:    dc           unknown
805f:    82 03 82     82 A, 0x0382
8062:    47           unknown
8063:    82 84 82     82 A, 0x8482
8066:    e3           unknown
8067:    83 7f        unknown
8069:    84 6f        ldb A, [[pc+111]]
806b:    85 9d        unknown
806d:    86           unknown
806e:    b2           unknown
806f:    87           unknown
8070:    28           unknown
8071:    80 01        lib A, 0x01
8073:    80 01        lib A, 0x01

L9:
8075:    73 8a        jump L2

L29:
8077:    2d           unknown
8078:    2d           unknown
8079:    2d           unknown
807a:    2d           unknown
807b:    c0 0f        lib B, 0x0f
807d:    48           unknown

L28:
807e:    e1 f1 10     e1 A, 0xf110
8081:    a1 f1 0c     stb A, 0xf10c
8084:    a1 f1 0b     stb A, 0xf10b
8087:    a1 f1 06     stb A, 0xf106
808a:    3a           clear A
808b:    71 00 00     jump 0x0000 L4

L13:
808e:    32 40        unknown

L14:
8090:    c0 11        lib B, 0x11
8092:    2f 42        unknown
8094:    2f 03        unknown
8096:    51 40        sub? r?, r?
8098:    15 43        b_nz L5
809a:    c0 21        lib B, 0x21
809c:    2f 40        unknown
809e:    2f 01        unknown
80a0:    51 40        sub? r?, r?
80a2:    15 39        b_nz L5
80a4:    20 50        unknown
80a6:    20 40        unknown
80a8:    15 e6        b_nz L14
80aa:    90 00 12     liw A, 0x0012
80ad:    5c           unknown

L15:
80ae:    55 60        alu5 r?, r?
80b0:    bb           unknown
80b1:    20 70        unknown
80b3:    20 70        unknown
80b5:    15 f7        b_nz L15
80b7:    90 00 12     liw A, 0x0012
80ba:    5c           unknown

L17:
80bb:    80 a8        lib A, 0xa8
80bd:    41 71        unknown
80bf:    14 05        b_z L16
80c1:    9b           unknown
80c2:    51 60        sub? r?, r?
80c4:    15 15        b_nz L18

L16:
80c6:    20 70        unknown
80c8:    20 70        unknown
80ca:    15 ef        b_nz L17
80cc:    a1 f1 0a     stb A, 0xf10a

L12:
80cf:    81 f1 10     ldb A, 0xf110
80d2:    c0 0f        lib B, 0x0f
80d4:    42 31        and A, B
80d6:    29           unknown
80d7:    15 9c        b_nz L9
80d9:    73 b3        jump L13

L18:
80db:    c0 31        lib B, 0x31

L5:
80dd:    7b 04        call L6
80df:    73 ee        jump L12

L8:
80e1:    73 92        jump L9

L6:
80e3:    e1 f1 10     e1 A, 0xf110
80e6:    a1 f1 0b     stb A, 0xf10b
80e9:    a1 f1 0c     stb A, 0xf10c
80ec:    81 f1 10     ldb A, 0xf110
80ef:    2d           unknown
80f0:    16 20        b_lt L7
80f2:    a1 f1 07     stb A, 0xf107
80f5:    90 00 64     liw A, 0x0064

L10:
80f8:    0e           delay 4.5ms
80f9:    39           unknown
80fa:    15 fc        b_nz L10
80fc:    a1 f1 06     stb A, 0xf106
80ff:    90 00 64     liw A, 0x0064

L11:
8102:    0e           delay 4.5ms
8103:    39           unknown
8104:    15 fc        b_nz L11
8106:    90 0f 00     liw A, 0x0f00
8109:    81 f1 10     ldb A, 0xf110
810c:    42 01        unknown
810e:    15 d3        b_nz L6
8110:    73 cf        jump L8

L7:
8112:    81 f1 10     ldb A, 0xf110
8115:    c0 0f        lib B, 0x0f
8117:    4a           unknown
8118:    14 c7        b_z L8
811a:    09           ret 9

L22:
811b:    90 81 71     liw A, 0x8171
811e:    b1 00 fe     stw A, 0x00fe
8121:    90 0f 00     liw A, 0x0f00
8124:    81 f1 10     ldb A, 0xf110
8127:    42 01        unknown
8129:    29           unknown
812a:    29           unknown
812b:    15 b4        b_nz L8
812d:    90 01 00     liw A, 0x0100

L26:
8130:    5d           unknown
8131:    16 06        b_lt L19
8133:    f5 01        unknown
8135:    73 f9        jump L26

L21:
8137:    73 aa        jump L6

L19:
8139:    90 01 00     liw A, 0x0100

L23:
813c:    d8           unknown
813d:    59           unknown
813e:    15 26        b_nz L20
8140:    38           unknown
8141:    38           unknown
8142:    17 f8        b7 L23
8144:    90 01 00     liw A, 0x0100
8147:    5c           unknown

L24:
8148:    55 60        alu5 r?, r?
814a:    3b           unknown
814b:    b5 61        unknown
814d:    55 66        alu5 r?, r?
814f:    17 f7        b7 L24
8151:    90 01 00     liw A, 0x0100
8154:    5c           unknown

L25:
8155:    9b           unknown
8156:    5d           unknown
8157:    33 20        unknown
8159:    51 62        sub? r?, r?
815b:    15 09        b_nz L20
815d:    95 61        unknown
815f:    17 f4        b7 L25
8161:    a1 f1 0a     stb A, 0xf10a
8164:    73 b5        jump L22

L20:
8166:    80 f0        lib A, 0xf0
8168:    42 01        unknown
816a:    28           unknown
816b:    28           unknown
816c:    4d           unknown
816d:    7b c8        call L21
816f:    73 aa        jump L22
8171:    c0 04        lib B, 0x04
8173:    49           cmp A, B
8174:    14 03        b_z L27
8176:    71 80 77     jump 0x8077 L29

L27:
8179:    80 f0        lib A, 0xf0
817b:    42 81        unknown
817d:    28           unknown
817e:    28           unknown
817f:    4d           unknown
8180:    71 80 7e     jump 0x807e L28

L39:
8183:    60 00 10     60 A, 0x0010

L30:
8186:    90 10 00     liw A, 0x1000
8189:    40 50        unknown
818b:    b5 48        unknown
818d:    0c           unknown
818e:    90 81 a3     liw A, 0x81a3
8191:    b5 48        unknown
8193:    0e           delay 4.5ms
8194:    90 00 10     liw A, 0x0010
8197:    40 15        unknown
8199:    15 eb        b_nz L30
819b:    90 10 00     liw A, 0x1000
819e:    55 0c        alu5 r?, r?
81a0:    0a           unknown
81a1:    73 03        jump L31
81a3:    55 c4        alu5 r?, r?
81a5:    0a           unknown

L31:
81a6:    60 00 10     60 A, 0x0010
81a9:    95 48        unknown
81ab:    04           flag4
81ac:    80 f0        lib A, 0xf0
81ae:    42 10        unknown
81b0:    45           unknown
81b1:    51 c0        sub? r?, r?
81b3:    10 40        b0 L32
81b5:    31 41        unknown
81b7:    10 15        b0 L37
81b9:    17 40        b7 L38
81bb:    35 15        unknown
81bd:    eb           unknown
81be:    a1 f1 0a     stb A, 0xf10a
81c1:    90 0f 00     liw A, 0x0f00
81c4:    81 f1 10     ldb A, 0xf110
81c7:    42 01        unknown
81c9:    29           unknown
81ca:    29           unknown
81cb:    29           unknown
81cc:    14 b5        b_z L39

L37:
81ce:    71 80 01     jump 0x8001 L2
81d1:    45           unknown
81d2:    51 28        sub? r?, r?
81d4:    28           unknown
81d5:    28           unknown
81d6:    4d           unknown
81d7:    79 80 e3     call L6
81da:    73 a7        jump L39
81dc:    80
81dd:    c5
81de:    a1
81df:    f2
81e0:    00

L33:
81e1:    90 0f 00     liw A, 0x0f00
81e4:    81 f1 10     ldb A, 0xf110
81e7:    42 01        unknown
81e9:    29           unknown
81ea:    29           unknown
81eb:    29           unknown
81ec:    29           unknown
81ed:    14 03        b_z L34
81ef:    71 80 01     jump 0x8001 L2

L34:
81f2:    81 f2 00     ldb A, 0xf200

L32:
81f5:    2c           rotate_right A
81f6:    2c           rotate_right A
81f7:    11 e8        b1 L33
81f9:    80 d5        lib A, 0xd5

L38:
81fb:    a1 f2 01     stb A, 0xf201
81fe:    7b 29        call L35
8200:    04           flag4
8201:    73 de        jump L33
8203:    80 c5        lib A, 0xc5
8205:    a1 f2 00     stb A, 0xf200

L41:
8208:    90 0f 00     liw A, 0x0f00
820b:    81 f1 10     ldb A, 0xf110
820e:    42 01        unknown
8210:    c0 05        lib B, 0x05
8212:    49           cmp A, B
8213:    14 03        b_z L40
8215:    71 80 01     jump 0x8001 L2

L40:
8218:    81 f2 00     ldb A, 0xf200
821b:    2c           rotate_right A
821c:    11 ea        b1 L41
821e:    81 f2 01     ldb A, 0xf201
8221:    a1 f2 01     stb A, 0xf201
8224:    7b 03        call L35
8226:    05           flag5
8227:    73 df        jump L41

L35:
8229:    81 f2 00     ldb A, 0xf200
822c:    c0 1c        lib B, 0x1c
822e:    4a           unknown
822f:    15 05        b_nz L36
8231:    a1 f1 0a     stb A, 0xf10a
8234:    3e           unknown
8235:    09           ret 9

L36:
8236:    45           unknown
8237:    31 2d        unknown
8239:    2d           unknown
823a:    c5           unknown
823b:    41 48        unknown
823d:    a1 f1 0b     stb A, 0xf10b
8240:    a1 f1 0c     stb A, 0xf10c
8243:    e1 f1 10     e1 A, 0xf110
8246:    09           ret 9
8247:    80
8248:    c5
8249:    a1
824a:    f2
824b:    00
824c:    80
824d:    06
824e:    a1
824f:    f2
8250:    0a
8251:    90
8252:    82
8253:    6f
8254:    b1
8255:    00
8256:    6e
8257:    3a
8258:    b1
8259:    00
825a:    6c
825b:    04
825c:    a1
825d:    f2
825e:    0e
825f:    90
8260:    0f
8261:    00
8262:    81
8263:    f1
8264:    10
8265:    42
8266:    01
8267:    c0
8268:    06
8269:    49
826a:    14
826b:    f3
826c:    71
826d:    80
826e:    01

L43:
826f:    81 f2 0f     ldb A, 0xf20f
8272:    15 0d        b_nz L42
8274:    91 f2 00     ldw A, 0xf200
8277:    a1 f2 01     stb A, 0xf201
827a:    91 00 0a     ldw A, 0x000a
827d:    5f           mov sp, A
827e:    7b a9        call L35
8280:    06           flag6

L42:
8281:    0a           unknown
8282:    73 eb        jump L43
8284:    32 40        unknown

L45:
8286:    55 46        alu5 r?, r?
8288:    45           unknown
8289:    51 a1        sub? r?, r?
828b:    f1 40 28     f1 A, 0x4028
828e:    a1 f1 41     stb A, 0xf141
8291:    28           unknown
8292:    a1 f1 42     stb A, 0xf142
8295:    28           unknown
8296:    a1 f1 43     stb A, 0xf143
8299:    c1 f1 40     c1 A, 0xf140
829c:    80 07        lib A, 0x07
829e:    4a           unknown
829f:    42 71        unknown
82a1:    49           cmp A, B
82a2:    15 38        b_nz L44
82a4:    20 70        unknown
82a6:    c0 27        lib B, 0x27
82a8:    81 f1 41     ldb A, 0xf141
82ab:    41 71        unknown
82ad:    15 2f        b_nz L46
82af:    20 70        unknown
82b1:    c0 37        lib B, 0x37
82b3:    81 f1 42     ldb A, 0xf142
82b6:    41 71        unknown
82b8:    15 24        b_nz L46
82ba:    20 70        unknown
82bc:    c0 47        lib B, 0x47
82be:    81 f1 43     ldb A, 0xf143
82c1:    41 71        unknown
82c3:    15 19        b_nz L46
82c5:    80 0f        lib A, 0x0f
82c7:    c1 f1 10     c1 A, 0xf110
82ca:    4a           unknown
82cb:    80 07        lib A, 0x07
82cd:    49           cmp A, B
82ce:    14 03        b_z L47
82d0:    71 80 01     jump 0x8001 L2

L47:
82d3:    20 50        unknown
82d5:    15 af        b_nz L45
82d7:    a1 f1 0a     stb A, 0xf10a
82da:    73 aa        jump L45

L44:
82dc:    c0 17        lib B, 0x17

L46:
82de:    79 80 e3     call L6
82e1:    73 a3        jump L45

L58:
82e3:    a1 f1 4d     stb A, 0xf14d
82e6:    32 40        unknown
82e8:    90 ff ff     liw A, 0xffff
82eb:    7b 52        call L48
82ed:    15 44        b_nz L57

L60:
82ef:    55 40        alu5 r?, r?
82f1:    3d           unknown
82f2:    3d           unknown
82f3:    3d           unknown
82f4:    3d           unknown
82f5:    7b 48        call L48
82f7:    15 3a        b_nz L57
82f9:    81 f1 10     ldb A, 0xf110
82fc:    c0 0f        lib B, 0x0f
82fe:    4a           unknown
82ff:    80 08        lib A, 0x08
8301:    49           cmp A, B
8302:    14 03        b_z L59
8304:    71 80 01     jump 0x8001 L2

L59:
8307:    3e           unknown
8308:    3e           unknown
8309:    90 03 2c     liw A, 0x032c
830c:    51 40        sub? r?, r?
830e:    15 df        b_nz L60
8310:    3f           unknown
8311:    3f           unknown

L62:
8312:    55 40        alu5 r?, r?
8314:    3d           unknown
8315:    3d           unknown
8316:    3d           unknown
8317:    3d           unknown
8318:    7b 25        call L48
831a:    15 17        b_nz L57
831c:    81 f1 10     ldb A, 0xf110
831f:    c0 0f        lib B, 0x0f
8321:    4a           unknown
8322:    80 08        lib A, 0x08
8324:    49           cmp A, B
8325:    14 03        b_z L61
8327:    71 80 01     jump 0x8001 L2

L61:
832a:    3f           unknown
832b:    3f           unknown
832c:    17 e4        b7 L62
832e:    a1 f1 0a     stb A, 0xf10a
8331:    73 b0        jump L58

L57:
8333:    2d           unknown
8334:    2d           unknown
8335:    2d           unknown
8336:    2d           unknown
8337:    c0 08        lib B, 0x08
8339:    48           unknown
833a:    79 80 e3     call L6
833d:    73 a4        jump L58

L48:
833f:    5d           unknown
8340:    17 0b        b7 L49
8342:    3a           clear A
8343:    a1 f1 40     stb A, 0xf140
8346:    b1 f1 41     stw A, 0xf141
8349:    80 03        lib A, 0x03
834b:    73 09        jump L56

L49:
834d:    b1 f1 41     stw A, 0xf141
8350:    2a           unknown
8351:    a1 f1 40     stb A, 0xf140
8354:    80 02        lib A, 0x02

L56:
8356:    a1 f1 48     stb A, 0xf148
8359:    90 01 90     liw A, 0x0190

L54:
835c:    d0 20 00     liw B, 0x2000
835f:    c1 f1 45     c1 A, 0xf145
8362:    42 23        unknown
8364:    15 08        b_nz L50
8366:    0e           delay 4.5ms
8367:    39           unknown
8368:    15 f2        b_nz L54
836a:    80 09        lib A, 0x09
836c:    73 05        jump L55

L50:
836e:    81 f1 44     ldb A, 0xf144
8371:    7b 01        call L51

L55:
8373:    09           ret 9

L51:
8374:    4d           unknown
8375:    15 01        b_nz L52
8377:    09           ret 9

L52:
8378:    2a           unknown

L53:
8379:    28           unknown
837a:    24 30        unknown
837c:    11 fb        b1 L53
837e:    09           ret 9
837f:    a1
8380:    f1
8381:    4d
8382:    90
8383:    ff
8384:    ff
8385:    7b
8386:    b8
8387:    15
8388:    2a
8389:    90
838a:    32
838b:    bf
838c:    b1
838d:    f1
838e:    41
838f:    90
8390:    fe
8391:    6f
8392:    2f
8393:    02
8394:    90
8395:    01
8396:    00
8397:    2f
8398:    00
8399:    2f
839a:    04
839b:    2f
839c:    06
839d:    2a
839e:    a1
839f:    f1
83a0:    48
83a1:    79
83a2:    84
83a3:    52
83a4:    c0
83a5:    20
83a6:    4a
83a7:    15
83a8:    19
83a9:    4d
83aa:    15
83ab:    04
83ac:    c0
83ad:    a9
83ae:    73
83af:    0d
83b0:    79
83b1:    83
83b2:    74
83b3:    a1
83b4:    f1
83b5:    4d
83b6:    2d
83b7:    2d
83b8:    2d
83b9:    2d
83ba:    c0
83bb:    09
83bc:    48
83bd:    79
83be:    80
83bf:    e3
83c0:    73
83c1:    bd
83c2:    90
83c3:    84
83c4:    67
83c5:    b1
83c6:    00
83c7:    2e
83c8:    3a
83c9:    b1
83ca:    00
83cb:    2c
83cc:    a1
83cd:    f1
83ce:    4f
83cf:    a1
83d0:    f1
83d1:    4e
83d2:    04
83d3:    60
83d4:    00
83d5:    01
83d6:    d0
83d7:    0f
83d8:    09
83d9:    81
83da:    f1
83db:    10
83dc:    42
83dd:    21
83de:    49
83df:    14
83e0:    03
83e1:    71
83e2:    80
83e3:    01
83e4:    2a
83e5:    a1
83e6:    00
83e7:    20
83e8:    55
83e9:    40
83ea:    79
83eb:    83
83ec:    3f
83ed:    15
83ee:    c4
83ef:    81
83f0:    00
83f1:    20
83f2:    15
83f3:    04
83f4:    c0
83f5:    b9
83f6:    73
83f7:    c5
83f8:    2a
83f9:    a1
83fa:    00
83fb:    20
83fc:    90
83fd:    e6
83fe:    ff
83ff:    2f
8400:    02
8401:    90
8402:    01
8403:    00
8404:    2f
8405:    00
8406:    2f
8407:    06
8408:    2a
8409:    a1
840a:    f1
840b:    48
840c:    7b
840d:    44
840e:    15
840f:    a0
8410:    81
8411:    00
8412:    20
8413:    15
8414:    04
8415:    c0
8416:    c9
8417:    73
8418:    a4
8419:    2f
841a:    03
841b:    38
841c:    14
841d:    04
841e:    c0
841f:    d9
8420:    73
8421:    9b
8422:    2f
8423:    01
8424:    d0
8425:    1a
8426:    00
8427:    59
8428:    14
8429:    04
842a:    c0
842b:    e9
842c:    73
842d:    8f
842e:    90
842f:    00
8430:    0f
8431:    50
8432:    40
8433:    d1
8434:    f1
8435:    41
8436:    59
8437:    14
8438:    04
8439:    c0
843a:    f9
843b:    73
843c:    e3
843d:    35
843e:    40
843f:    80
8440:    19
8441:    0e
8442:    29
8443:    15
8444:    fc
8445:    90
8446:    40
8447:    00
8448:    51
8449:    40
844a:    15
844b:    8a
844c:    a1
844d:    f1
844e:    0a
844f:    71
8450:    83
8451:    7f
8452:    90
8453:    01
8454:    90
8455:    c1
8456:    f1
8457:    44
8458:    24
8459:    30
845a:    11
845b:    07
845c:    0e
845d:    39
845e:    15
845f:    f5
8460:    80
8461:    09
8462:    09
8463:    81
8464:    f1
8465:    44
8466:    09
8467:    20
8468:    00
8469:    a1
846a:    f1
846b:    4f
846c:    0a
846d:    73
846e:    f8
846f:    b5
8470:    a2
8471:    a1
8472:    f1
8473:    0a
8474:    b1
8475:    00
8476:    10
8477:    90
8478:    00
8479:    12
847a:    f5
847b:    01
847c:    6d
847d:    01
847e:    55
847f:    62
8480:    f5
8481:    01
8482:    55
8483:    82
8484:    f5
8485:    01
8486:    55
8487:    a2
8488:    30
8489:    20
848a:    30
848b:    20
848c:    f5
848d:    01
848e:    55
848f:    c2
8490:    f5
8491:    01
8492:    55
8493:    e2
8494:    f5
8495:    01
8496:    80
8497:    c5
8498:    a1
8499:    f2
849a:    00
849b:    85
849c:    a1
849d:    7b
849e:    7a
849f:    85
84a0:    a1
84a1:    7b
84a2:    76
84a3:    c0
84a4:    5c
84a5:    7b
84a6:    67
84a7:    7b
84a8:    57
84a9:    45
84aa:    31
84ab:    c0
84ac:    4d
84ad:    49
84ae:    14
84af:    33
84b0:    c0
84b1:    47
84b2:    49
84b3:    14
84b4:    0a
84b5:    c0
84b6:    51
84b7:    49
84b8:    15
84b9:    e9
84ba:    90
84bb:    80
84bc:    01
84bd:    73
84be:    04
84bf:    7b
84c0:    79
84c1:    55
84c2:    80
84c3:    b1
84c4:    00
84c5:    20
84c6:    d0
84c7:    00
84c8:    1e
84c9:    99
84ca:    55
84cb:    0e
84cc:    95
84cd:    22
84ce:    55
84cf:    0c
84d0:    95
84d1:    22
84d2:    5f
84d3:    95
84d4:    22
84d5:    5e
84d6:    95
84d7:    22
84d8:    5c
84d9:    65
84da:    22
84db:    d5
84dc:    22
84dd:    91
84de:    00
84df:    10
84e0:    72
84e1:    00
84e2:    20
84e3:    7b
84e4:    55
84e5:    55
84e6:    86
84e7:    8b
84e8:    7b
84e9:    2f
84ea:    7b
84eb:    4e
84ec:    45
84ed:    91
84ee:    c1
84ef:    bf
84f0:    92
84f1:    14
84f2:    01
84f3:    ab
84f4:    13
84f5:    04
84f6:    30
84f7:    60
84f8:    73
84f9:    f0
84fa:    11
84fb:    a7
84fc:    30
84fd:    60
84fe:    73
84ff:    e7
8500:    7b
8501:    55
8502:    81
8503:    f2
8504:    00
8505:    2c
8506:    11
8507:    f8
8508:    81
8509:    f2
850a:    01
850b:    c0
850c:    7f
850d:    4a

ReadByte:
850e:    81 f2 00     ldb A, 0xf200
8511:    2c           rotate_right A
8512:    2c           rotate_right A
8513:    11 f9        b1 ReadByte
8515:    e1 f2 01     e1 A, 0xf201
8518:    09           ret 9

L76:
8519:    7b 05        call L77
851b:    45 01        swap_bytes A
851d:    7b 01        call L77
851f:    09           ret 9

L77:
8520:    22 00        unknown
8522:    36 00        unknown
8524:    36 00        unknown
8526:    36 00        unknown
8528:    36 00        unknown
852a:    26 00        unknown
852c:    c0 0a        lib B, 0x0a
852e:    49           cmp A, B
852f:    16 05        b_lt L78
8531:    c0 37        lib B, 0x37

L79:
8533:    48           unknown
8534:    73 d8        jump ReadByte

L78:
8536:    c0 30        lib B, 0x30
8538:    73 f9        jump L79
853a:    3a
853b:    5e
853c:    a1
853d:    bf
853e:    92
853f:    7b
8540:    bf
8541:    7b
8542:    25
8543:    17
8544:    01
8545:    09
8546:    35
8547:    80
8548:    35
8549:    80
854a:    35
854b:    80
854c:    35
854d:    80
854e:    43
854f:    19
8550:    80
8551:    01
8552:    a1
8553:    bf
8554:    92
8555:    73
8556:    e8
8557:    80
8558:    0f
8559:    c1
855a:    f1
855b:    10
855c:    4a
855d:    80
855e:    0a
855f:    49
8560:    15
8561:    01
8562:    09
8563:    71
8564:    80
8565:    01

ReadByteTramp:
8566:    73 a6        jump ReadByte

L83:
8568:    45           unknown
8569:    31 c0        unknown
856b:    30 49        unknown
856d:    16 13        b_lt L84
856f:    c0 47        lib B, 0x47
8571:    49           cmp A, B
8572:    17 1e        b7 L86
8574:    c0 40        lib B, 0x40
8576:    4a           unknown
8577:    14 04        b_z L87
8579:    c0 09        lib B, 0x09
857b:    40 31        add A, B

L87:
857d:    c0 0f        lib B, 0x0f
857f:    42 31        and A, B
8581:    09           ret 9

L84:
8582:    c0 20        lib B, 0x20
8584:    49           cmp A, B
8585:    15 02        b_nz L85
8587:    2b           unknown
8588:    09           ret 9

L85:
8589:    c0 2c        lib B, 0x2c
858b:    49           cmp A, B
858c:    15 04        b_nz L86
858e:    02           flag2
858f:    07           clear_carry?
8590:    2b           unknown
8591:    09           ret 9

L86:
8592:    c0 0a        lib B, 0x0a
8594:    7b d0        call ReadByteTramp
8596:    c0 7f        lib B, 0x7f
8598:    7b cc        call ReadByteTramp
859a:    2a           unknown
859b:    2b           unknown
859c:    09           ret 9
859d:    a1
859e:    f2
859f:    0d
85a0:    a1
85a1:    f1
85a2:    4d
85a3:    a1
85a4:    f1
85a5:    0a
85a6:    80
85a7:    c5
85a8:    a4
85a9:    7a
85aa:    80
85ab:    8c
85ac:    a1
85ad:    f2
85ae:    01
85af:    0e
85b0:    0e

L73:
85b1:    7b 70        call WriteString
85b3:    "D=\0"
85b6:    7b 7c        call ReadChar
85b8:    c0 c8        lib B, 0xc8
85ba:    49           cmp A, B
85bb:    e5 a2        unknown
85bd:    14 05        b_z L66
85bf:    c0 c6        lib B, 0xc6
85c1:    49           cmp A, B
85c2:    15 4e        b_nz L67

L66:
85c4:    7b 6e        call ReadChar
85c6:    c0 50        lib B, 0x50
85c8:    40 31        add A, B
85ca:    16 46        b_lt L67
85cc:    c5           unknown
85cd:    a1 14 7d     stb A, 0x147d
85d0:    c0 03        lib B, 0x03
85d2:    49           cmp A, B
85d3:    18 3d        b_gt L67
85d5:    d0 0f 00     liw B, 0x0f00
85d8:    f5 a2        unknown
85da:    32 20        unknown
85dc:    f5 a2        unknown
85de:    c0 88        lib B, 0x88
85e0:    e5 a2        unknown
85e2:    d0 83 00     liw B, 0x8300
85e5:    f5 a2        unknown
85e7:    d0 81 00     liw B, 0x8100
85ea:    06           flag6

L68:
85eb:    27 30        unknown
85ed:    29           unknown
85ee:    17 fb        b7 L68
85f0:    f5 a2        unknown
85f2:    2f 14        unknown
85f4:    2f 06        unknown
85f6:    2f a0        unknown
85f8:    90 ff f6     liw A, 0xfff6
85fb:    2f 02        unknown
85fd:    7b 22        call L69
85ff:    43 90        unknown
8601:    01           nop
8602:    00           HALT
8603:    2f 00        unknown
8605:    90 f0 ff     liw A, 0xf0ff
8608:    2f 02        unknown
860a:    7b 7e        call L70
860c:    45           unknown
860d:    15 03        b_nz L67
860f:    71 01 03     jump 0x0103 L72

L67:
8612:    7b 0f        call WriteString
8614:    "\r\nERROR\r\n\0"
861e:    07           clear_carry?
861f:    73 90        jump L73

L69:
8621:    73 67        jump L70

WriteString:
8623:    81 f2 00     ldb A, 0xf200
8626:    2c           rotate_right A
8627:    2c           rotate_right A
8628:    11 f9        b1 WriteString
862a:    85 41        unknown
862c:    15 01        b_nz L3
862e:    09           ret 9

L3:
862f:    a1 f2 01     stb A, 0xf201
8632:    73 ef        jump WriteString

ReadChar:
8634:    7b 6d        call L63
8636:    84 ec        ldb A, [[pc-20]]
8638:    2c           rotate_right A
8639:    11 f9        b1 ReadChar
863b:    84 f3        ldb A, [[pc-13]]
863d:    c0 80        lib B, 0x80
863f:    43 31        or A, B
8641:    c0 e0        lib B, 0xe0
8643:    49           cmp A, B
8644:    16 04        b_lt L65
8646:    c0 df        lib B, 0xdf
8648:    42 31        and A, B

L65:
864a:    a4           unknown
864b:    e4           unknown
864c:    09           ret 9
864d:    c0
864e:    07
864f:    49
8650:    18
8651:    c0
8652:    a1
8653:    f1
8654:    40
8655:    94
8656:    2d
8657:    d0
8658:    00
8659:    10
865a:    5a
865b:    14
865c:    b5
865d:    3a
865e:    b1
865f:    f1
8660:    41
8661:    7b
8662:    35
8663:    03
8664:    94
8665:    1e
8666:    d0
8667:    04
8668:    00
8669:    5a
866a:    15
866b:    a6
866c:    d0
866d:    00
866e:    20
866f:    5a
8670:    14
8671:    f2
8672:    2f
8673:    04
8674:    2f
8675:    06
8676:    90
8677:    01
8678:    00
8679:    2f
867a:    00
867b:    90
867c:    ea
867d:    1f
867e:    2f
867f:    02
8680:    7b
8681:    16
8682:    00
8683:    81
8684:    f1
8685:    44
8686:    15
8687:    8a
8688:    73
8689:    85

L70:
868a:    85 41        unknown
868c:    a1 f8 00     stb A, 0xf800

L71:
868f:    81 f8 01     ldb A, 0xf801
8692:    29           unknown
8693:    15 fa        b_nz L71
8695:    84 f6        ldb A, [[pc-10]]
8697:    09           ret 9
8698:    85
8699:    41
869a:    a1
869b:    f1
869c:    48
869d:    84
869e:    e5
869f:    2c
86a0:    10
86a1:    fb
86a2:    09

L63:
86a3:    80 0f        lib A, 0x0f
86a5:    c1 f1 10     c1 A, 0xf110
86a8:    4a           unknown
86a9:    80 0b        lib A, 0x0b
86ab:    49           cmp A, B
86ac:    15 01        b_nz L64
86ae:    09           ret 9

L64:
86af:    71 80 01     jump 0x8001 L2
86b2:    d0
86b3:    0f
86b4:    0c
86b5:    81
86b6:    f1
86b7:    10
86b8:    42
86b9:    21
86ba:    49
86bb:    14
86bc:    03
86bd:    71
86be:    80
86bf:    01
86c0:    60
86c1:    80
86c2:    00
86c3:    3a
86c4:    85
86c5:    41
86c6:    40
86c7:    10
86c8:    d0
86c9:    87
86ca:    f9
86cb:    51
86cc:    42
86cd:    15
86ce:    f5
86cf:    8a
86d0:    41
86d1:    01
86d2:    15
86d3:    49
86d4:    90
86d5:    b8
86d6:    00
86d7:    5b
86d8:    5c
86d9:    d0
86da:    04
86db:    00
86dc:    a8
86dd:    38
86de:    31
86df:    20
86e0:    15
86e1:    fa
86e2:    d0
86e3:    04
86e4:    00
86e5:    8a
86e6:    41
86e7:    51
86e8:    15
86e9:    3a
86ea:    3e
86eb:    31
86ec:    20
86ed:    15
86ee:    f6
86ef:    d0
86f0:    04
86f1:    00
86f2:    55
86f3:    64
86f4:    45
86f5:    51
86f6:    2b
86f7:    a5
86f8:    41
86f9:    31
86fa:    20
86fb:    15
86fc:    f7
86fd:    d0
86fe:    04
86ff:    00
8700:    55
8701:    64
8702:    8a
8703:    2b
8704:    41
8705:    51
8706:    15
8707:    1c
8708:    3e
8709:    31
870a:    20
870b:    15
870c:    f5
870d:    a1
870e:    f1
870f:    0c
8710:    a1
8711:    f1
8712:    0a
8713:    a1
8714:    f1
8715:    0e
8716:    80
8717:    88
8718:    a1
8719:    f1
871a:    10
871b:    73
871c:    95
871d:    c0
871e:    1c
871f:    79
8720:    80
8721:    e3
8722:    73
8723:    8e
8724:    c0
8725:    2c
8726:    73
8727:    f7

AuxiliaryTestMenu:
8728:    a1 f1 08     stb A, 0xf108
872b:    80 c5        lib A, 0xc5
872d:    a1 f2 00     stb A, 0xf200
8730:    0e           delay 4.5ms
8731:    79 86 23     call WriteString
8734:    "\x0c\x1b\x1cAUXILIARY TESTS\r\n\n\0"
874a:    60 88 00     60 A, 0x8800
874d:    3a           clear A
874e:    5c           unknown

L75:
874f:    95 41        unknown
8751:    19 21        b_le L74
8753:    d0 07 ff     liw B, 0x07ff
8756:    59           unknown
8757:    18 1b        b_gt L74
8759:    30 60        unknown
875b:    d0 f8 00     liw B, 0xf800 ; will wrap around to 0x800, the length of each ROM
875e:    52           unknown
875f:    42 50        unknown
8761:    20 b5        unknown
8763:    a2 55 60     call_alt [0x5560]
8766:    79 85 19     call L76
8769:    c0 bd        lib B, 0xbd ; '='
876b:    79 85 0e     call ReadByte
876e:    c5           unknown
876f:    41 15        unknown
8771:    f9           unknown
8772:    73 db        jump L75

L74:
8774:    d0 f8 00     liw B, 0xf800 ; will wrap around to 0x800, the length of each ROM
8777:    52           unknown
8778:    24 90        unknown
877a:    08           flag8
877b:    00           HALT
877c:    50 04        unknown
877e:    90 f0 00     liw A, 0xf000
8781:    51 40        sub? r?, r?
8783:    15 ca        b_nz L75
8785:    79 86 23     call WriteString
8788:    "\r\nENTER TEST NUMBER:\0"
879d:    32 40        unknown

L81:
879f:    80 0f        lib A, 0x0f
87a1:    c1 f1 10     c1 A, 0xf110
87a4:    4a           unknown
87a5:    80 0d        lib A, 0x0d
87a7:    49           cmp A, B
87a8:    14 03        b_z L80
87aa:    71 80 01     jump 0x8001 L2

L80:
87ad:    81 f2 00     ldb A, 0xf200
87b0:    2c           rotate_right A
87b1:    11 ec        b1 L81
87b3:    c1 f2 01     c1 A, 0xf201
87b6:    80 5f        lib A, 0x5f
87b8:    41 31        unknown
87ba:    19 03        b_le L82
87bc:    80 df        lib A, 0xdf
87be:    4a           unknown

L82:
87bf:    e1 f2 01     e1 A, 0xf201
87c2:    79 85 68     call L83
87c5:    16 0c        b_lt L88
87c7:    35 40        unknown
87c9:    35 40        unknown
87cb:    35 40        unknown
87cd:    35 40        unknown
87cf:    43 15        unknown
87d1:    73 cc        jump L81

L88:
87d3:    55 40        alu5 r?, r?
87d5:    18 03        b_gt L89

L90:
87d7:    71 87 28     jump 0x8728 AuxiliaryTestMenu

L89:
87da:    51 60        sub? r?, r?
87dc:    16 f9        b_lt L90
87de:    55 40        alu5 r?, r?
87e0:    3d           unknown
87e1:    3b           unknown
87e2:    38           unknown
87e3:    d0 c0 00     liw B, 0xc000
87e6:    50 20        unknown
87e8:    98           unknown
87e9:    55 2a        alu5 r?, r?
87eb:    60 80 01     60 A, 0x8001
87ee:    d0 f8 00     liw B, 0xf800
87f1:    5a           unknown
87f2:    55 28        alu5 r?, r?
87f4:    a1 f1 0e     stb A, 0xf10e
87f7:    75 00        unknown jump 0x87f9
87f9:    3e           unknown
87fa:    00           HALT
87fb:    00           HALT
87fc:    00           HALT
87fd:    00           HALT
87fe:    00           HALT
87ff:    00           HALT
