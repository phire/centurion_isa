8000:    00           HALT

DiagEntryPoint:
8001:    3a           clear A
8002:    b1 b8 00     stw A, 0xb800 ; This is the first word in Diag's 1KB of RAM
8005:    05           flag5
8006:    0e           delay 4.5ms
8007:    a1 f1 4f     stb A, 0xf14f
800a:    a1 f2 0d     stb A, 0xf20d
800d:    a1 f2 0f     stb A, 0xf20f
8010:    90 c0 00     liw A, 0xc000
8013:    5f           mov sp, A ; Set stack pointer just beyond top of Diag's 1KB of RAM
8014:    22 32        unknown
8016:    14 0b        b_z L_8023
8018:    90 80 77     liw A, 0x8077
801b:    b1 00 fe     stw A, 0x00fe ; This is writing a pointer directly into registers.
801e:    3a           clear A
801f:    b1 00 fc     stw A, 0x00fc ; Something really funky is going on here.
8022:    76           unknown ; I assume this is calling or jumpting to that function

L_8023:
8023:    3a           clear A
8024:    a1 f1 09     stb A, 0xf109 ; Turn Decimal Point 1 off
8027:    a1 f1 0b     stb A, 0xf10b ; Turn Decimal Point 2 off
802a:    a1 f1 0d     stb A, 0xf10d ; Turn Decimal Point 3 off
802d:    a1 f1 0f     stb A, 0xf10f ; Turn Decimal Point 4 off
8030:    81 f1 10     ldb A, 0xf110 ; A = Dip swiches value
8033:    c0 0f        lib B, 0x0f
8035:    42 31        and A, B ; A = A & 0x0f
8037:    a1 f1 10     stb A, 0xf110 ; Write A to hex displays
803a:    a1 f1 06     stb A, 0xf106 ; Unblank the hex displys
803d:    c0 0d        lib B, 0x0d
803f:    49           cmp B, A ; Compare with 0b1011
8040:    15 03        b_nz L_8045
8042:    71 87 28     jump 0x8728 AuxiliaryTestMenu ; If dipswitches == 0xb111: 
                                                    ;     Display Auxiliary Test Menu

L_8045:
8045:    c1 f1 10     ldb B, 0xf110
8048:    16 b7        b_lt DiagEntryPoint
804a:    3d           unknown
804b:    d0 80 55     liw B, 0x8055
804e:    58           unknown
804f:    99           unknown
8050:    a1 f1 08     stb A, 0xf108
8053:    75 00        jump A + 0x00

TestFunctions:
    ; This is the table of test functions
    ; The above code indexes into it based on DIP switches
8055:    80 01        (0x8001) ; DiagEntryPoint
8057:    80 8e        (0x808e) ; Test_01
8059:    81 1b        (0x811b) ; Test_02
805b:    81 83        (0x8183) ; Test_03
805d:    81 dc        (0x81dc) ; Test_04
805f:    82 03        (0x8203) ; Test_05
8061:    82 47        (0x8247) ; Test_06
8063:    82 84        (0x8284) ; Test_07
8065:    82 e3        (0x82e3) ; Test_08
8067:    83 7f        (0x837f) ; Test_09
8069:    84 6f        (0x846f) ; TOS_Entry: TestOS: This is a Monitor that operates over serial console
806b:    85 9d        (0x859d) ; Test_0b
806d:    86 b2        (0x86b2) ; Test_0c
806f:    87 28        (0x8728) ; AuxiliaryTestMenu
8071:    80 01        (0x8001) ; DiagEntryPoint
8073:    80 01        (0x8001) ; DiagEntryPoint

L_8075:
8075:    73 8a        jump DiagEntryPoint

Fail:
    ; Takes 4 bit error code, displays ((error code << 4) | 0xf) on hex displays
8077:    2d           rotate_left A
8078:    2d           rotate_left A
8079:    2d           rotate_left A
807a:    2d           rotate_left A
807b:    c0 0f        lib B, 0x0f
807d:    48           add B, A
807e:    e1 f1 10     stb B, 0xf110
8081:    a1 f1 0c     stb A, 0xf10c
8084:    a1 f1 0b     stb A, 0xf10b
8087:    a1 f1 06     stb A, 0xf106
808a:    3a           clear A
808b:    71 00 00     jump 0x0000 L_0000

Test_01:
808e:    32 40        unknown

L_8090:
8090:    c0 11        lib B, 0x11
8092:    2f 42        unknown
8094:    2f 03        unknown
8096:    51 40        sub? r?, r?
8098:    15 43        b_nz L_80dd
809a:    c0 21        lib B, 0x21
809c:    2f 40        unknown
809e:    2f 01        unknown
80a0:    51 40        sub? r?, r?
80a2:    15 39        b_nz L_80dd
80a4:    20 50        unknown
80a6:    20 40        unknown
80a8:    15 e6        b_nz L_8090
80aa:    90 00 12     liw A, 0x0012
80ad:    5c           unknown

L_80ae:
80ae:    55 60        alu5 r?, r?
80b0:    bb           unknown
80b1:    20 70        unknown
80b3:    20 70        unknown
80b5:    15 f7        b_nz L_80ae
80b7:    90 00 12     liw A, 0x0012
80ba:    5c           unknown

L_80bb:
80bb:    80 a8        lib A, 0xa8
80bd:    41 71        unknown
80bf:    14 05        b_z L_80c6
80c1:    9b           unknown
80c2:    51 60        sub? r?, r?
80c4:    15 15        b_nz L_80db

L_80c6:
80c6:    20 70        unknown
80c8:    20 70        unknown
80ca:    15 ef        b_nz L_80bb
80cc:    a1 f1 0a     stb A, 0xf10a

L_80cf:
80cf:    81 f1 10     ldb A, 0xf110
80d2:    c0 0f        lib B, 0x0f
80d4:    42 31        and A, B
80d6:    29           unknown
80d7:    15 9c        b_nz L_8075
80d9:    73 b3        jump Test_01

L_80db:
80db:    c0 31        lib B, 0x31

L_80dd:
80dd:    7b 04        call L_80e3
80df:    73 ee        jump L_80cf

L_80e1:
80e1:    73 92        jump L_8075

L_80e3:
80e3:    e1 f1 10     stb B, 0xf110
80e6:    a1 f1 0b     stb A, 0xf10b
80e9:    a1 f1 0c     stb A, 0xf10c
80ec:    81 f1 10     ldb A, 0xf110
80ef:    2d           rotate_left A
80f0:    16 20        b_lt L_8112
80f2:    a1 f1 07     stb A, 0xf107
80f5:    90 00 64     liw A, 0x0064

L_80f8:
80f8:    0e           delay 4.5ms
80f9:    39           unknown
80fa:    15 fc        b_nz L_80f8
80fc:    a1 f1 06     stb A, 0xf106
80ff:    90 00 64     liw A, 0x0064

L_8102:
8102:    0e           delay 4.5ms
8103:    39           unknown
8104:    15 fc        b_nz L_8102
8106:    90 0f 00     liw A, 0x0f00
8109:    81 f1 10     ldb A, 0xf110
810c:    42 01        unknown
810e:    15 d3        b_nz L_80e3
8110:    73 cf        jump L_80e1

L_8112:
8112:    81 f1 10     ldb A, 0xf110
8115:    c0 0f        lib B, 0x0f
8117:    4a           and B, A
8118:    14 c7        b_z L_80e1
811a:    09           ret

Test_02:
811b:    90 81 71     liw A, 0x8171
811e:    b1 00 fe     stw A, 0x00fe
8121:    90 0f 00     liw A, 0x0f00
8124:    81 f1 10     ldb A, 0xf110
8127:    42 01        unknown
8129:    29           unknown
812a:    29           unknown
812b:    15 b4        b_nz L_80e1
812d:    90 01 00     liw A, 0x0100

L_8130:
8130:    5d           unknown
8131:    16 06        b_lt L_8139
8133:    f5 01        unknown
8135:    73 f9        jump L_8130

L_8137:
8137:    73 aa        jump L_80e3

L_8139:
8139:    90 01 00     liw A, 0x0100

L_813c:
813c:    d8           unknown
813d:    59           unknown
813e:    15 26        b_nz L_8166
8140:    38           unknown
8141:    38           unknown
8142:    17 f8        b7 L_813c
8144:    90 01 00     liw A, 0x0100
8147:    5c           unknown

L_8148:
8148:    55 60        alu5 r?, r?
814a:    3b           unknown
814b:    b5 61        unknown
814d:    55 66        alu5 r?, r?
814f:    17 f7        b7 L_8148
8151:    90 01 00     liw A, 0x0100
8154:    5c           unknown

L_8155:
8155:    9b           unknown
8156:    5d           unknown
8157:    33 20        unknown
8159:    51 62        sub? r?, r?
815b:    15 09        b_nz L_8166
815d:    95 61        unknown
815f:    17 f4        b7 L_8155
8161:    a1 f1 0a     stb A, 0xf10a
8164:    73 b5        jump Test_02

L_8166:
8166:    80 f0        lib A, 0xf0
8168:    42 01        unknown
816a:    28           unknown
816b:    28           unknown
816c:    4d           unknown
816d:    7b c8        call L_8137
816f:    73 aa        jump Test_02
8171:    c0
8172:    04
8173:    49
8174:    14
8175:    03
8176:    71
8177:    80
8178:    77
8179:    80
817a:    f0
817b:    42
817c:    81
817d:    28
817e:    28
817f:    4d
8180:    71
8181:    80
8182:    7e

Test_03:
8183:    60 00 10     60 A, 0x0010

L_8186:
8186:    90 10 00     liw A, 0x1000
8189:    40 50        unknown
818b:    b5 48        unknown
818d:    0c           unknown
818e:    90 81 a3     liw A, 0x81a3
8191:    b5 48        unknown
8193:    0e           delay 4.5ms
8194:    90 00 10     liw A, 0x0010
8197:    40 15        unknown
8199:    15 eb        b_nz L_8186
819b:    90 10 00     liw A, 0x1000
819e:    55 0c        alu5 r?, r?
81a0:    0a           unknown
81a1:    73 03        jump L_81a6
81a3:    55
81a4:    c4
81a5:    0a

L_81a6:
81a6:    60 00 10     60 A, 0x0010
81a9:    95 48        unknown
81ab:    04           flag4
81ac:    80 f0        lib A, 0xf0
81ae:    42 10        unknown
81b0:    45           unknown
81b1:    51 c0        sub? r?, r?
81b3:    10 40        b0 L_81f5
81b5:    31 41        unknown
81b7:    10 15        b0 L_81ce
81b9:    17 40        b7 L_81fb
81bb:    35 15        unknown
81bd:    eb           unknown
81be:    a1 f1 0a     stb A, 0xf10a
81c1:    90 0f 00     liw A, 0x0f00
81c4:    81 f1 10     ldb A, 0xf110
81c7:    42 01        unknown
81c9:    29           unknown
81ca:    29           unknown
81cb:    29           unknown
81cc:    14 b5        b_z Test_03

L_81ce:
81ce:    71 80 01     jump 0x8001 DiagEntryPoint
81d1:    45
81d2:    51
81d3:    28
81d4:    28
81d5:    28
81d6:    4d
81d7:    79
81d8:    80
81d9:    e3
81da:    73
81db:    a7

Test_04:
81dc:    80 c5        lib A, 0xc5
81de:    a1 f2 00     stb A, 0xf200

L_81e1:
81e1:    90 0f 00     liw A, 0x0f00
81e4:    81 f1 10     ldb A, 0xf110
81e7:    42 01        unknown
81e9:    29           unknown
81ea:    29           unknown
81eb:    29           unknown
81ec:    29           unknown
81ed:    14 03        b_z L_81f2
81ef:    71 80 01     jump 0x8001 DiagEntryPoint

L_81f2:
81f2:    81 f2 00     ldb A, 0xf200

L_81f5:
81f5:    2c           rotate_right A
81f6:    2c           rotate_right A
81f7:    11 e8        b1 L_81e1
81f9:    80 d5        lib A, 0xd5

L_81fb:
81fb:    a1 f2 01     stb A, 0xf201
81fe:    7b 29        call L_8229
8200:    04           flag4
8201:    73 de        jump L_81e1

Test_05:
8203:    80 c5        lib A, 0xc5
8205:    a1 f2 00     stb A, 0xf200

L_8208:
8208:    90 0f 00     liw A, 0x0f00
820b:    81 f1 10     ldb A, 0xf110
820e:    42 01        unknown
8210:    c0 05        lib B, 0x05
8212:    49           cmp B, A
8213:    14 03        b_z L_8218
8215:    71 80 01     jump 0x8001 DiagEntryPoint

L_8218:
8218:    81 f2 00     ldb A, 0xf200
821b:    2c           rotate_right A
821c:    11 ea        b1 L_8208
821e:    81 f2 01     ldb A, 0xf201
8221:    a1 f2 01     stb A, 0xf201
8224:    7b 03        call L_8229
8226:    05           flag5
8227:    73 df        jump L_8208

L_8229:
8229:    81 f2 00     ldb A, 0xf200
822c:    c0 1c        lib B, 0x1c
822e:    4a           and B, A
822f:    15 05        b_nz L_8236
8231:    a1 f1 0a     stb A, 0xf10a
8234:    3e           unknown
8235:    09           ret

L_8236:
8236:    45           unknown
8237:    31 2d        unknown
8239:    2d           rotate_left A
823a:    c5 41        unknown
823c:    48           add B, A
823d:    a1 f1 0b     stb A, 0xf10b
8240:    a1 f1 0c     stb A, 0xf10c
8243:    e1 f1 10     stb B, 0xf110
8246:    09           ret

Test_06:
8247:    80 c5        lib A, 0xc5
8249:    a1 f2 00     stb A, 0xf200
824c:    80 06        lib A, 0x06
824e:    a1 f2 0a     stb A, 0xf20a
8251:    90 82 6f     liw A, 0x826f
8254:    b1 00 6e     stw A, 0x006e
8257:    3a           clear A
8258:    b1 00 6c     stw A, 0x006c
825b:    04           flag4
825c:    a1 f2 0e     stb A, 0xf20e

L_825f:
825f:    90 0f 00     liw A, 0x0f00
8262:    81 f1 10     ldb A, 0xf110
8265:    42 01        unknown
8267:    c0 06        lib B, 0x06
8269:    49           cmp B, A
826a:    14 f3        b_z L_825f
826c:    71 80 01     jump 0x8001 DiagEntryPoint
826f:    81
8270:    f2
8271:    0f
8272:    15
8273:    0d
8274:    91
8275:    f2
8276:    00
8277:    a1
8278:    f2
8279:    01
827a:    91
827b:    00
827c:    0a
827d:    5f
827e:    7b
827f:    a9
8280:    06
8281:    0a
8282:    73
8283:    eb

Test_07:
8284:    32 40        unknown

L_8286:
8286:    55 46        alu5 r?, r?
8288:    45           unknown
8289:    51 a1        sub? r?, r?
828b:    f1 40 28     stw B, 0x4028
828e:    a1 f1 41     stb A, 0xf141
8291:    28           unknown
8292:    a1 f1 42     stb A, 0xf142
8295:    28           unknown
8296:    a1 f1 43     stb A, 0xf143
8299:    c1 f1 40     ldb B, 0xf140
829c:    80 07        lib A, 0x07
829e:    4a           and B, A
829f:    42 71        unknown
82a1:    49           cmp B, A
82a2:    15 38        b_nz L_82dc
82a4:    20 70        unknown
82a6:    c0 27        lib B, 0x27
82a8:    81 f1 41     ldb A, 0xf141
82ab:    41 71        unknown
82ad:    15 2f        b_nz L_82de
82af:    20 70        unknown
82b1:    c0 37        lib B, 0x37
82b3:    81 f1 42     ldb A, 0xf142
82b6:    41 71        unknown
82b8:    15 24        b_nz L_82de
82ba:    20 70        unknown
82bc:    c0 47        lib B, 0x47
82be:    81 f1 43     ldb A, 0xf143
82c1:    41 71        unknown
82c3:    15 19        b_nz L_82de
82c5:    80 0f        lib A, 0x0f
82c7:    c1 f1 10     ldb B, 0xf110
82ca:    4a           and B, A
82cb:    80 07        lib A, 0x07
82cd:    49           cmp B, A
82ce:    14 03        b_z L_82d3
82d0:    71 80 01     jump 0x8001 DiagEntryPoint

L_82d3:
82d3:    20 50        unknown
82d5:    15 af        b_nz L_8286
82d7:    a1 f1 0a     stb A, 0xf10a
82da:    73 aa        jump L_8286

L_82dc:
82dc:    c0 17        lib B, 0x17

L_82de:
82de:    79 80 e3     call L_80e3
82e1:    73 a3        jump L_8286

Test_08:
82e3:    a1 f1 4d     stb A, 0xf14d
82e6:    32 40        unknown
82e8:    90 ff ff     liw A, 0xffff
82eb:    7b 52        call L_833f
82ed:    15 44        b_nz L_8333

L_82ef:
82ef:    55 40        alu5 r?, r?
82f1:    3d           unknown
82f2:    3d           unknown
82f3:    3d           unknown
82f4:    3d           unknown
82f5:    7b 48        call L_833f
82f7:    15 3a        b_nz L_8333
82f9:    81 f1 10     ldb A, 0xf110
82fc:    c0 0f        lib B, 0x0f
82fe:    4a           and B, A
82ff:    80 08        lib A, 0x08
8301:    49           cmp B, A
8302:    14 03        b_z L_8307
8304:    71 80 01     jump 0x8001 DiagEntryPoint

L_8307:
8307:    3e           unknown
8308:    3e           unknown
8309:    90 03 2c     liw A, 0x032c
830c:    51 40        sub? r?, r?
830e:    15 df        b_nz L_82ef
8310:    3f           unknown
8311:    3f           unknown

L_8312:
8312:    55 40        alu5 r?, r?
8314:    3d           unknown
8315:    3d           unknown
8316:    3d           unknown
8317:    3d           unknown
8318:    7b 25        call L_833f
831a:    15 17        b_nz L_8333
831c:    81 f1 10     ldb A, 0xf110
831f:    c0 0f        lib B, 0x0f
8321:    4a           and B, A
8322:    80 08        lib A, 0x08
8324:    49           cmp B, A
8325:    14 03        b_z L_832a
8327:    71 80 01     jump 0x8001 DiagEntryPoint

L_832a:
832a:    3f           unknown
832b:    3f           unknown
832c:    17 e4        b7 L_8312
832e:    a1 f1 0a     stb A, 0xf10a
8331:    73 b0        jump Test_08

L_8333:
8333:    2d           rotate_left A
8334:    2d           rotate_left A
8335:    2d           rotate_left A
8336:    2d           rotate_left A
8337:    c0 08        lib B, 0x08
8339:    48           add B, A
833a:    79 80 e3     call L_80e3
833d:    73 a4        jump Test_08

L_833f:
833f:    5d           unknown
8340:    17 0b        b7 L_834d
8342:    3a           clear A
8343:    a1 f1 40     stb A, 0xf140
8346:    b1 f1 41     stw A, 0xf141
8349:    80 03        lib A, 0x03
834b:    73 09        jump L_8356

L_834d:
834d:    b1 f1 41     stw A, 0xf141
8350:    2a           unknown
8351:    a1 f1 40     stb A, 0xf140
8354:    80 02        lib A, 0x02

L_8356:
8356:    a1 f1 48     stb A, 0xf148
8359:    90 01 90     liw A, 0x0190

L_835c:
835c:    d0 20 00     liw B, 0x2000
835f:    c1 f1 45     ldb B, 0xf145
8362:    42 23        unknown
8364:    15 08        b_nz L_836e
8366:    0e           delay 4.5ms
8367:    39           unknown
8368:    15 f2        b_nz L_835c
836a:    80 09        lib A, 0x09
836c:    73 05        jump L_8373

L_836e:
836e:    81 f1 44     ldb A, 0xf144
8371:    7b 01        call L_8374

L_8373:
8373:    09           ret

L_8374:
8374:    4d           unknown
8375:    15 01        b_nz L_8378
8377:    09           ret

L_8378:
8378:    2a           unknown

L_8379:
8379:    28           unknown
837a:    24 30        unknown
837c:    11 fb        b1 L_8379
837e:    09           ret

Test_09:
837f:    a1 f1 4d     stb A, 0xf14d
8382:    90 ff ff     liw A, 0xffff
8385:    7b b8        call L_833f
8387:    15 2a        b_nz L_83b3
8389:    90 32 bf     liw A, 0x32bf
838c:    b1 f1 41     stw A, 0xf141
838f:    90 fe 6f     liw A, 0xfe6f
8392:    2f 02        unknown
8394:    90 01 00     liw A, 0x0100
8397:    2f 00        unknown
8399:    2f 04        unknown
839b:    2f 06        unknown
839d:    2a           unknown
839e:    a1 f1 48     stb A, 0xf148
83a1:    79 84 52     call L_8452
83a4:    c0 20        lib B, 0x20
83a6:    4a           and B, A
83a7:    15 19        b_nz L_83c2
83a9:    4d           unknown
83aa:    15 04        b_nz L_83b0
83ac:    c0 a9        lib B, 0xa9
83ae:    73 0d        jump L_83bd

L_83b0:
83b0:    79 83 74     call L_8374

L_83b3:
83b3:    a1 f1 4d     stb A, 0xf14d
83b6:    2d           rotate_left A
83b7:    2d           rotate_left A
83b8:    2d           rotate_left A
83b9:    2d           rotate_left A
83ba:    c0 09        lib B, 0x09
83bc:    48           add B, A

L_83bd:
83bd:    79 80 e3     call L_80e3
83c0:    73 bd        jump Test_09

L_83c2:
83c2:    90 84 67     liw A, 0x8467
83c5:    b1 00 2e     stw A, 0x002e
83c8:    3a           clear A
83c9:    b1 00 2c     stw A, 0x002c
83cc:    a1 f1 4f     stb A, 0xf14f
83cf:    a1 f1 4e     stb A, 0xf14e
83d2:    04           flag4
83d3:    60 00 01     60 A, 0x0001

L_83d6:
83d6:    d0 0f 09     liw B, 0x0f09
83d9:    81 f1 10     ldb A, 0xf110
83dc:    42 21        unknown
83de:    49           cmp B, A
83df:    14 03        b_z L_83e4
83e1:    71 80 01     jump 0x8001 DiagEntryPoint

L_83e4:
83e4:    2a           unknown
83e5:    a1 00 20     stb A, 0x0020
83e8:    55 40        alu5 r?, r?
83ea:    79 83 3f     call L_833f
83ed:    15 c4        b_nz L_83b3
83ef:    81 00 20     ldb A, 0x0020
83f2:    15 04        b_nz L_83f8
83f4:    c0 b9        lib B, 0xb9
83f6:    73 c5        jump L_83bd

L_83f8:
83f8:    2a           unknown
83f9:    a1 00 20     stb A, 0x0020
83fc:    90 e6 ff     liw A, 0xe6ff
83ff:    2f 02        unknown
8401:    90 01 00     liw A, 0x0100
8404:    2f 00        unknown
8406:    2f 06        unknown
8408:    2a           unknown
8409:    a1 f1 48     stb A, 0xf148
840c:    7b 44        call L_8452
840e:    15 a0        b_nz L_83b0
8410:    81 00 20     ldb A, 0x0020
8413:    15 04        b_nz L_8419
8415:    c0 c9        lib B, 0xc9
8417:    73 a4        jump L_83bd

L_8419:
8419:    2f 03        unknown
841b:    38           unknown
841c:    14 04        b_z L_8422
841e:    c0 d9        lib B, 0xd9

L_8420:
8420:    73 9b        jump L_83bd

L_8422:
8422:    2f 01        unknown
8424:    d0 1a 00     liw B, 0x1a00
8427:    59           unknown
8428:    14 04        b_z L_842e
842a:    c0 e9        lib B, 0xe9
842c:    73 8f        jump L_83bd

L_842e:
842e:    90 00 0f     liw A, 0x000f
8431:    50 40        unknown
8433:    d1 f1 41     ldw A, 0xf141
8436:    59           unknown
8437:    14 04        b_z L_843d
8439:    c0 f9        lib B, 0xf9
843b:    73 e3        jump L_8420

L_843d:
843d:    35 40        unknown
843f:    80 19        lib A, 0x19

L_8441:
8441:    0e           delay 4.5ms
8442:    29           unknown
8443:    15 fc        b_nz L_8441
8445:    90 40 00     liw A, 0x4000
8448:    51 40        sub? r?, r?
844a:    15 8a        b_nz L_83d6
844c:    a1 f1 0a     stb A, 0xf10a
844f:    71 83 7f     jump 0x837f Test_09

L_8452:
8452:    90 01 90     liw A, 0x0190

L_8455:
8455:    c1 f1 44     ldb B, 0xf144
8458:    24 30        unknown
845a:    11 07        b1 L_8463
845c:    0e           delay 4.5ms
845d:    39           unknown
845e:    15 f5        b_nz L_8455
8460:    80 09        lib A, 0x09
8462:    09           ret

L_8463:
8463:    81 f1 44     ldb A, 0xf144
8466:    09           ret
8467:    20
8468:    00
8469:    a1
846a:    f1
846b:    4f
846c:    0a
846d:    73
846e:    f8

TOS_Entry:
    ; TestOS: This is a Monitor that operates over serial console
846f:    b5 a2        unknown
8471:    a1 f1 0a     stb A, 0xf10a
8474:    b1 00 10     stw A, 0x0010
8477:    90 00 12     liw A, 0x0012
847a:    f5 01        unknown
847c:    6d 01        unknown
847e:    55 62        alu5 r?, r?
8480:    f5 01        unknown
8482:    55 82        alu5 r?, r?
8484:    f5 01        unknown
8486:    55 a2        alu5 r?, r?
8488:    30 20        unknown
848a:    30 20        unknown
848c:    f5 01        unknown
848e:    55 c2        alu5 r?, r?
8490:    f5 01        unknown
8492:    55 e2        alu5 r?, r?
8494:    f5 01        unknown
8496:    80 c5        lib A, 0xc5
8498:    a1 f2 00     stb A, 0xf200 ; Configure UART
849b:    85 a1        pop_byte A
849d:    7b 7a        call WriteHexByte
849f:    85 a1        pop_byte A
84a1:    7b 76        call WriteHexByte

TOS_PromptLoop:
84a3:    c0 5c        lib B, 0x5c ; ''
84a5:    7b 67        call WriteByte
84a7:    7b 57        call ReadByteWithEcho
84a9:    45           unknown
84aa:    31 c0        unknown
84ac:    4d           unknown
84ad:    49           cmp B, A
84ae:    14 33        b_z L_84e3
84b0:    c0 47        lib B, 0x47 ; 'G'
84b2:    49           cmp B, A
84b3:    14 0a        b_z G_Command
84b5:    c0 51        lib B, 0x51 ; 'Q'
84b7:    49           cmp B, A
84b8:    15 e9        b_nz TOS_PromptLoop
84ba:    90 80 01     liw A, 0x8001 ; Start of ROM
84bd:    73 04        jump Q_Command

G_Command:
84bf:    7b 79        call ReadHexWord
84c1:    55 80        alu5 r?, r?

Q_Command:
84c3:    b1 00 20     stw A, 0x0020
84c6:    d0 00 1e     liw B, 0x001e
84c9:    99           unknown
84ca:    55 0e        alu5 r?, r?
84cc:    95 22        unknown
84ce:    55 0c        alu5 r?, r?
84d0:    95 22        unknown
84d2:    5f           mov sp, A
84d3:    95 22        unknown
84d5:    5e           unknown
84d6:    95 22        unknown
84d8:    5c           unknown
84d9:    65 22        unknown
84db:    d5           unknown
84dc:    22 91        unknown
84de:    00           HALT
84df:    10 72        b0 L_8553
84e1:    00           HALT
84e2:    20

L_84e3:
84e3:    7b 55        call ReadHexWord
84e5:    55 86        alu5 r?, r?

L_84e7:
84e7:    8b 7b        unknown
84e9:    2f 7b        unknown
84eb:    4e           unknown
84ec:    45           unknown
84ed:    91 c1 bf     ldw A, 0xc1bf
84f0:    92 14 01     92 A, 0x1401
84f3:    ab           unknown
84f4:    13 04        b3 L_84fa
84f6:    30 60        unknown
84f8:    73 f0        jump L_84ea

L_84fa:
84fa:    11 a7        b1 TOS_PromptLoop
84fc:    30 60        unknown
84fe:    73 e7        jump L_84e7

ReadByteWithEcho:
8500:    7b 55        call CheckForReset ; Jumps back to the start of F1 if some condition is met
8502:    81 f2 00     ldb A, 0xf200
8505:    2c           rotate_right A
8506:    11 f8        b1 ReadByteWithEcho
8508:    81 f2 01     ldb A, 0xf201
850b:    c0 7f        lib B, 0x7f
850d:    4a           and B, A

WriteByte:
850e:    81 f2 00     ldb A, 0xf200
8511:    2c           rotate_right A
8512:    2c           rotate_right A
8513:    11 f9        b1 WriteByte
8515:    e1 f2 01     stb B, 0xf201
8518:    09           ret

WriteHexByte:
8519:    7b 05        call WriteHexNibble
851b:    45 01        swap_bytes A
851d:    7b 01        call WriteHexNibble
851f:    09           ret

WriteHexNibble:
8520:    22 00        unknown
8522:    36 00        unknown
8524:    36 00        unknown
8526:    36 00        unknown
8528:    36 00        unknown
852a:    26 00        unknown
852c:    c0 0a        lib B, 0x0a
852e:    49           cmp B, A
852f:    16 05        b_lt L_8536
8531:    c0 37        lib B, 0x37

L_8533:
8533:    48           add B, A
8534:    73 d8        jump WriteByte

L_8536:
8536:    c0 30        lib B, 0x30
8538:    73 f9        jump L_8533

ReadHexWord:
853a:    3a           clear A
853b:    5e           unknown
853c:    a1 bf 92     stb A, 0xbf92 ; Diag SRAM

L_853f:
853f:    7b bf        call ReadByteWithEcho
8541:    7b 25        call AsciiToHexNibble
8543:    17 01        b7 L_8546
8545:    09           ret

L_8546:
8546:    35 80        unknown
8548:    35 80        unknown
854a:    35 80        unknown
854c:    35 80        unknown
854e:    43 19        unknown
8550:    80 01        lib A, 0x01
8552:    a1 bf 92     stb A, 0xbf92
8555:    73 e8        jump L_853f

CheckForReset:
8557:    80 0f        lib A, 0x0f
8559:    c1 f1 10     ldb B, 0xf110
855c:    4a           and B, A
855d:    80 0a        lib A, 0x0a
855f:    49           cmp B, A
8560:    15 01        b_nz L_8563
8562:    09           ret

L_8563:
8563:    71 80 01     jump 0x8001 DiagEntryPoint

WriteByteTramp:
8566:    73 a6        jump WriteByte

AsciiToHexNibble:
8568:    45           unknown
8569:    31 c0        unknown
856b:    30 49        unknown
856d:    16 13        b_lt L_8582
856f:    c0 47        lib B, 0x47
8571:    49           cmp B, A
8572:    17 1e        b7 L_8592
8574:    c0 40        lib B, 0x40
8576:    4a           and B, A
8577:    14 04        b_z L_857d
8579:    c0 09        lib B, 0x09
857b:    40 31        add A, B

L_857d:
857d:    c0 0f        lib B, 0x0f
857f:    42 31        and A, B
8581:    09           ret

L_8582:
8582:    c0 20        lib B, 0x20
8584:    49           cmp B, A
8585:    15 02        b_nz L_8589
8587:    2b           unknown
8588:    09           ret

L_8589:
8589:    c0 2c        lib B, 0x2c
858b:    49           cmp B, A
858c:    15 04        b_nz L_8592
858e:    02           flag2
858f:    07           clear_carry?
8590:    2b           unknown
8591:    09           ret

L_8592:
8592:    c0 0a        lib B, 0x0a ; '\n'
8594:    7b d0        call WriteByteTramp
8596:    c0 7f        lib B, 0x7f ; This is the ascii DEL charater
8598:    7b cc        call WriteByteTramp
859a:    2a           unknown
859b:    2b           unknown
859c:    09           ret

Test_0b:
859d:    a1 f2 0d     stb A, 0xf20d
85a0:    a1 f1 4d     stb A, 0xf14d
85a3:    a1 f1 0a     stb A, 0xf10a
85a6:    80 c5        lib A, 0xc5
85a8:    a4 7a        unknown
85aa:    80 8c        lib A, 0x8c
85ac:    a1 f2 01     stb A, 0xf201
85af:    0e           delay 4.5ms
85b0:    0e           delay 4.5ms

L_85b1:
85b1:    7b 70        call WriteString
85b3:    "D=\0"
85b6:    7b 7c        call ReadChar
85b8:    c0 c8        lib B, 0xc8
85ba:    49           cmp B, A
85bb:    e5 a2        unknown
85bd:    14 05        b_z L_85c4
85bf:    c0 c6        lib B, 0xc6
85c1:    49           cmp B, A
85c2:    15 4e        b_nz L_8612

L_85c4:
85c4:    7b 6e        call ReadChar
85c6:    c0 50        lib B, 0x50
85c8:    40 31        add A, B
85ca:    16 46        b_lt L_8612
85cc:    c5 a1        unknown
85ce:    14 7d        b_z L_864d
85d0:    c0 03        lib B, 0x03
85d2:    49           cmp B, A
85d3:    18 3d        b_gt L_8612
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

L_85eb:
85eb:    27 30        unknown
85ed:    29           unknown
85ee:    17 fb        b7 L_85eb
85f0:    f5 a2        unknown
85f2:    2f 14        unknown
85f4:    2f 06        unknown
85f6:    2f a0        unknown
85f8:    90 ff f6     liw A, 0xfff6
85fb:    2f 02        unknown
85fd:    7b 22        call L_8621
85ff:    43 90        unknown
8601:    01           nop
8602:    00           HALT
8603:    2f 00        unknown
8605:    90 f0 ff     liw A, 0xf0ff
8608:    2f 02        unknown
860a:    7b 7e        call L_868a
860c:    45           unknown
860d:    15 03        b_nz L_8612

L_860f:
860f:    71 01 03     jump 0x0103 L_0103

L_8612:
8612:    7b 0f        call WriteString
8614:    "\r\nERROR\r\n\0"
861e:    07           clear_carry?
861f:    73 90        jump L_85b1

L_8621:
8621:    73 67        jump L_868a

WriteString:
8623:    81 f2 00     ldb A, 0xf200
8626:    2c           rotate_right A
8627:    2c           rotate_right A
8628:    11 f9        b1 WriteString
862a:    85 41        ldb A, [sp]++
862c:    15 01        b_nz L_862f
862e:    09           ret

L_862f:
862f:    a1 f2 01     stb A, 0xf201
8632:    73 ef        jump WriteString

ReadChar:
8634:    7b 6d        call L_86a3
8636:    84 ec        ldb A, [[pc-20]]
8638:    2c           rotate_right A
8639:    11 f9        b1 ReadChar
863b:    84 f3        ldb A, [[pc-13]]
863d:    c0 80        lib B, 0x80
863f:    43 31        unknown
8641:    c0 e0        lib B, 0xe0
8643:    49           cmp B, A
8644:    16 04        b_lt L_864a
8646:    c0 df        lib B, 0xdf
8648:    42 31        and A, B

L_864a:
864a:    a4 e4        unknown
864c:    09           ret

L_864d:
864d:    c0 07        lib B, 0x07
864f:    49           cmp B, A
8650:    18 c0        b_gt L_8612
8652:    a1 f1 40     stb A, 0xf140
8655:    94 2d        unknown
8657:    d0 00 10     liw B, 0x0010
865a:    5a           unknown
865b:    14 b5        b_z L_8612
865d:    3a           clear A
865e:    b1 f1 41     stw A, 0xf141
8661:    7b 35        call L_8698
8663:    03           flag3

L_8664:
8664:    94 1e        unknown
8666:    d0 04 00     liw B, 0x0400
8669:    5a           unknown
866a:    15 a6        b_nz L_8612
866c:    d0 00 20     liw B, 0x0020
866f:    5a           unknown
8670:    14 f2        b_z L_8664
8672:    2f 04        unknown
8674:    2f 06        unknown
8676:    90 01 00     liw A, 0x0100
8679:    2f 00        unknown
867b:    90 ea 1f     liw A, 0xea1f
867e:    2f 02        unknown
8680:    7b 16        call L_8698
8682:    00           HALT
8683:    81 f1 44     ldb A, 0xf144
8686:    15 8a        b_nz L_8612
8688:    73 85        jump L_860f

L_868a:
868a:    85 41        ldb A, [sp]++
868c:    a1 f8 00     stb A, 0xf800

L_868f:
868f:    81 f8 01     ldb A, 0xf801
8692:    29           unknown
8693:    15 fa        b_nz L_868f
8695:    84 f6        ldb A, [[pc-10]]
8697:    09           ret

L_8698:
8698:    85 41        ldb A, [sp]++
869a:    a1 f1 48     stb A, 0xf148

L_869d:
869d:    84 e5        ldb A, [[pc-27]]
869f:    2c           rotate_right A
86a0:    10 fb        b0 L_869d
86a2:    09           ret

L_86a3:
86a3:    80 0f        lib A, 0x0f
86a5:    c1 f1 10     ldb B, 0xf110
86a8:    4a           and B, A
86a9:    80 0b        lib A, 0x0b
86ab:    49           cmp B, A
86ac:    15 01        b_nz L_86af
86ae:    09           ret

L_86af:
86af:    71 80 01     jump 0x8001 DiagEntryPoint

Test_0c:
86b2:    d0 0f 0c     liw B, 0x0f0c
86b5:    81 f1 10     ldb A, 0xf110
86b8:    42 21        unknown
86ba:    49           cmp B, A
86bb:    14 03        b_z L_86c0
86bd:    71 80 01     jump 0x8001 DiagEntryPoint

L_86c0:
86c0:    60 80 00     60 A, 0x8000
86c3:    3a           clear A

L_86c4:
86c4:    85 41        ldb A, [sp]++
86c6:    40 10        unknown
86c8:    d0 87 f9     liw B, 0x87f9
86cb:    51 42        sub? r?, r?
86cd:    15 f5        b_nz L_86c4
86cf:    8a           unknown
86d0:    41 01        unknown
86d2:    15 49        b_nz L_871d
86d4:    90 b8 00     liw A, 0xb800
86d7:    5b           unknown
86d8:    5c           unknown
86d9:    d0 04 00     liw B, 0x0400

L_86dc:
86dc:    a8           unknown
86dd:    38           unknown
86de:    31 20        unknown
86e0:    15 fa        b_nz L_86dc
86e2:    d0 04 00     liw B, 0x0400

L_86e5:
86e5:    8a           unknown
86e6:    41 51        unknown
86e8:    15 3a        b_nz L_8724
86ea:    3e           unknown
86eb:    31 20        unknown
86ed:    15 f6        b_nz L_86e5
86ef:    d0 04 00     liw B, 0x0400
86f2:    55 64        alu5 r?, r?

L_86f4:
86f4:    45           unknown
86f5:    51 2b        sub? r?, r?
86f7:    a5 41        unknown
86f9:    31 20        unknown
86fb:    15 f7        b_nz L_86f4
86fd:    d0 04 00     liw B, 0x0400
8700:    55 64        alu5 r?, r?

L_8702:
8702:    8a           unknown
8703:    2b           unknown
8704:    41 51        unknown
8706:    15 1c        b_nz L_8724
8708:    3e           unknown
8709:    31 20        unknown
870b:    15 f5        b_nz L_8702
870d:    a1 f1 0c     stb A, 0xf10c
8710:    a1 f1 0a     stb A, 0xf10a
8713:    a1 f1 0e     stb A, 0xf10e
8716:    80 88        lib A, 0x88
8718:    a1 f1 10     stb A, 0xf110
871b:    73 95        jump Test_0c

L_871d:
871d:    c0 1c        lib B, 0x1c

L_871f:
871f:    79 80 e3     call L_80e3
8722:    73 8e        jump Test_0c

L_8724:
8724:    c0 2c        lib B, 0x2c
8726:    73 f7        jump L_871f

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

Aux_ReadTestEntry:
874f:    95 41        unknown
8751:    19 21        b_le NextRom
8753:    d0 07 ff     liw B, 0x07ff
8756:    59           unknown
8757:    18 1b        b_gt NextRom
8759:    30 60        unknown
875b:    d0 f8 00     liw B, 0xf800
875e:    52 42        unknown
8760:    50 20        unknown
8762:    b5 a2        unknown
8764:    55 60        alu5 r?, r?
8766:    79 85 19     call WriteHexByte ; Print the Test Number
8769:    c0 bd        lib B, 0xbd ; '='

Aux_PrintTestName:
876b:    79 85 0e     call WriteByte ; Print('=')
876e:    c5 41        unknown
8770:    15 f9        b_nz Aux_PrintTestName ; Print the Test Name
8772:    73 db        jump Aux_ReadTestEntry

NextRom:
8774:    d0 f8 00     liw B, 0xf800
8777:    52 24        unknown
8779:    90 08 00     liw A, 0x0800
877c:    50 04        unknown
877e:    90 f0 00     liw A, 0xf000
8781:    51 40        sub? r?, r?
8783:    15 ca        b_nz Aux_ReadTestEntry
8785:    79 86 23     call WriteString
8788:    "\r\nENTER TEST NUMBER:\0"
879d:    32 40        unknown

Aux_CheckDIPs:
    ; If the DIPs are nolonger configured for the Auxiliary Test Menu, then
    ; jump back to start of DIAG
879f:    80 0f        lib A, 0x0f
87a1:    c1 f1 10     ldb B, 0xf110 ; Read DIP switches
87a4:    4a           and B, A
87a5:    80 0d        lib A, 0x0d
87a7:    49           cmp B, A
87a8:    14 03        b_z Aux_CheckSerial
87aa:    71 80 01     jump 0x8001 DiagEntryPoint

Aux_CheckSerial:
87ad:    81 f2 00     ldb A, 0xf200
87b0:    2c           rotate_right A
87b1:    11 ec        b1 Aux_CheckDIPs
87b3:    c1 f2 01     ldb B, 0xf201
87b6:    80 5f        lib A, 0x5f
87b8:    41 31        unknown
87ba:    19 03        b_le Aux_GotByte
87bc:    80 df        lib A, 0xdf
87be:    4a           and B, A

Aux_GotByte:
87bf:    e1 f2 01     stb B, 0xf201 ; Echo Testnum back to terminal
87c2:    79 85 68     call AsciiToHexNibble ; Convert to hex; Since there aren't many tests, this counts as convert to interger
87c5:    16 0c        b_lt L_87d3
87c7:    35 40        unknown
87c9:    35 40        unknown
87cb:    35 40        unknown
87cd:    35 40        unknown
87cf:    43 15        unknown
87d1:    73 cc        jump Aux_CheckDIPs

L_87d3:
87d3:    55 40        alu5 r?, r?
87d5:    18 03        b_gt L_87da

L_87d7:
87d7:    71 87 28     jump 0x8728 AuxiliaryTestMenu

L_87da:
87da:    51 60        sub? r?, r?
87dc:    16 f9        b_lt L_87d7
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
87f7:    75 00        jump A + 0x00
87f9:    3e
87fa:    00
87fb:    00
87fc:    00
87fd:    00
87fe:    00
87ff:    00
