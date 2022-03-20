00000000:
    1a 02
    73 03
    71
    80 01 80 ; 0x180 -> r0
    c5
    a1 f2 00 ; r2 -> [0xf200] - mux register

    80 8c
    a1 f2 01 ; r2 -> [0xf201] - mux register

    0e
    0e
    90 10 00
    5f
    7b 79
    c4 bd 00
    7b 72 c0 c6
00000020:

    71 fc 00

    85 41

    a1 f8 00 ; r2 -> [0xf800]

loop:
    81 f8 01 ; r0 -> [0xf801]

    29 ; a compare or decrement operator?

    15 fa ; conditional branch to loop

    84 f6
    09 ; ret

00000031:
    85 41

    a1 f1 48 ; r2 -> [0xf148] - hawk command reg

    84 df
    2c
    10 fb ; conditional branch -5
    09 ; ret

    73 a0 a5 a2
00000040: 49 e5 a2 14 0a c0 c3 49 14 05 c0 c8 49 15 50 7b
00000050: 72 c0 50 40 31 16 48 c5 a1 16 7f 18 7f c0 03 49
00000060: 90 1f 40 5e 90
    81 00 b5
    81 80 84
    a5 81 85
    a1 14 04

00000071:
    c0 0f 40 31 a5 81 80 83 a5 81 3a b5 81 80 85
00000080: 18 3d d0 0f 00 f5 a2 32 20 f5 a2 c0 88 e5 a2 d0
00000090: 83 00 f5 a2 d0 81 00 06 27 30 29 17 fb f5 a2 2f
000000a0: a5 81 2a a5 81 d0 01 90 f5 81 28 c0 0e 49 15 f3
000000b0: 80 ff a5

    81 80 08 ; r0 -> [0xf808]

    7b 4e 80 41

    a1 f8 08 ; r2 -> [0xf808]
    0e 2a a1

000000c0: 14 2f 06 2f a0 90 ff f6 2f 02 7b 22 43 90 01 00
000000d0: 2f 00 90 f0 ff 2f 02 7b 15 45 15 03 71 01 03 7b
000000e0: f8 08 0e
    a1 f8 08 ; r2 -> [0xf808]
    0e 90 1f 40 2f 00 51 80 3b 2f
000000f0: 02 2f 34 2f 06 80 43
    a1 f8 08 ; r2 -> [0xf808]
    0e 0e 7b 20 73 02 11

00000101:
    8d 8a c5 d2 d2 cf d2 8d 8a 00 ; ASCII "\n\rERROR\n\r\0"

    07 73 85 73 73
00000110:
    73 11

    81 f2 00 ; r0 -> [0xf200]

    2c 2c

    11 f9

    85 41 15 01 09

    a1 f2 73 ; r2 -> 0xf273
00000121: 9a 90 01 00 2f 00 90 ea 1f 2f 02 2f 34 2f 06
00000130: 80 45
    a1 f8 08
    80 08
    7b 0d
    7b 03
    71 01 03
    81 f8 01 ; r0 -> [0xf801]
    00000141:
    73 ef

loop:
    84 ee
    2c
    11 fb ; conditional branch to loop

    84 f5 c0 80 43 31 c0 e0
00000150: 49 16 04 c0 df 42 31 a4 e6 09 73 62 73 02 73 bf
00000160: 08 15 01 09 73 da
    c1 f8 09 ; r4 -> [0xf809]
    4a 15 fa 09 8c 00 8b
00000170: 00 95 41 b3 03 79 4c 93 47 be 6d a2 32 40 79 4c
00000180: c0 07 49 18 ba

    a1 f1 40 ; r2 -> [0xf140] - hawk unit select

    94 2d d0 00 10 5a 14 af
00000190: 3a

    b1 f1 41 ; r2 -> [0xf141] - hawk sector address reg

    7b 3b 03 94 1e d0 04 00 5a 15 a0 d0
000001a0: e7 4d 14 2a c0 8d 49 14 25 c0 b0 49 16 25 80 09
000001b0: 41 31 19 0e 80 11 41 31 16 19 c0 05 49 18 14 c0
000001c0: 00 20 5a 14 f2 2f 04 2f 06 90 01 00 2f 00 90 ea
000001d0: 1f 2f 02 7b 1c 00

    81 f1 44 ; r2 -> [0xf144] - unknown hawk register

    15 84 71 01 03 7b 2f
000001e0: 0a 48 80 04 07 37 40 29 18 fa 40 35 73 d0 55 40
000001f0: 65
    a1 09 65
    a1 73 be
    d5 41 7d 80 0c d0 4b 65 f5
