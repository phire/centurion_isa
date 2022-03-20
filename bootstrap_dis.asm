
L21:
fc00:    1a 02        bEX L0
fc02:    73 03        jump L2

L0:
fc04:    71 80 01     jump 0x8001 L1

L2:
fc07:    80 c5        lib A, 0xc5
fc09:    a1 f2 00     stb A, 0xf200
fc0c:    80 8c        lib A, 0x8c
fc0e:    a1 f2 01     stb A, 0xf201
fc11:    0e           unknown
fc12:    0e           unknown

L33:
fc13:    90 10 00     liw A, 0x1000
fc16:    5f           unknown
fc17:    7b 79        call WriteString
fc19:    "D=\0"
fc1c:    7b 72        call ReadCharTrampoline
fc1e:    c0 c6        subb A, 0xc6
fc20:    49           unknown
fc21:    e5           unknown
fc22:    a2 14 0a     call_alt [0x140a]
fc25:    c0 c3        subb A, 0xc3
fc27:    49           unknown
fc28:    14 05        bne L23
fc2a:    c0 c8        subb A, 0xc8
fc2c:    49           unknown
fc2d:    15 50        beq L5

L23:
fc2f:    7b 72        call ReadChar
fc31:    c0 50        subb A, 0x50
fc33:    40 31        unknown
fc35:    16 48        b6 L5
fc37:    c5           unknown
fc38:    a1 16 7f     stb A, 0x167f
fc3b:    18 7f        b8 L24
fc3d:    c0 03        subb A, 0x03
fc3f:    49           unknown
fc40:    18 3d        b8 L5
fc42:    d0 0f 00     subw A, 0x0f00
fc45:    f5 a2        unknown
fc47:    32 20        unknown
fc49:    f5 a2        unknown
fc4b:    c0 88        subb A, 0x88
fc4d:    e5           unknown
fc4e:    a2 d0 83     call_alt [0xd083]
fc51:    00           unknown
fc52:    f5 a2        unknown
fc54:    d0 81 00     subw A, 0x8100
fc57:    06           flag6

L29:
fc58:    27 30        unknown
fc5a:    29           unknown
fc5b:    17 fb        b7 L29
fc5d:    f5 a2        unknown
fc5f:    2f 14        unknown
fc61:    2f 06        unknown
fc63:    2f a0        unknown
fc65:    90 ff f6     liw A, 0xfff6
fc68:    2f 02        unknown
fc6a:    7b 22        call L30
fc6c:    43 90        unknown
fc6e:    01           flag1
fc6f:    00           unknown
fc70:    2f 00        unknown
fc72:    90 f0 ff     liw A, 0xf0ff
fc75:    2f 02        unknown
fc77:    7b 15        call L30
fc79:    45           unknown
fc7a:    15 03        beq L5
fc7c:    71 01 03     jump 0x0103 L14

L5:
fc7f:    7b 11        call WriteString
fc81:    "\r\nERROR\r\n\0"
fc8b:    07           flag7
fc8c:    73 85        jump L33

L30:
fc8e:    73 73        jump L31

ReadCharTrampoline:
fc90:    73 11        jump ReadChar

WriteString:
fc92:    81 f2 00     ldb A, 0xf200
fc95:    2c           unknown
fc96:    2c           unknown
fc97:    11 f9        b1 WriteString
fc99:    85 41        ld r?, [r?++]
fc9b:    15 01        beq L3
fc9d:    09           ret 9

L3:
fc9e:    a1 f2 01     stb A, 0xf201
fca1:    73 ef        jump WriteString

ReadChar:
fca3:    84 ee        ldb A, [[pc-18]]
fca5:    2c           unknown
fca6:    11 fb        b1 ReadChar
fca8:    84 f5        ldb A, [[pc-11]]
fcaa:    c0 80        subb A, 0x80
fcac:    43 31        unknown
fcae:    c0 e0        subb A, 0xe0
fcb0:    49           unknown
fcb1:    16 04        b6 L22
fcb3:    c0 df        subb A, 0xdf
fcb5:    42           unknown
fcb6:    31

L22:
fcb7:    a4           unknown
fcb8:    e6           unknown
fcb9:    09           ret 9
fcba:    73
fcbb:    62

L24:
fcbc:    73 02        jump L25

L4:
fcbe:    73 bf        jump L5

L25:
fcc0:    c0 07        subb A, 0x07
fcc2:    49           unknown
fcc3:    18 ba        b8 L5
fcc5:    a1 f1 40     stb A, 0xf140
fcc8:    94 2d        unknown
fcca:    d0 00 10     subw A, 0x0010
fccd:    5a           unknown
fcce:    14 af        bne L5
fcd0:    3a           xor A, A
fcd1:    b1 f1 41     stw A, 0xf141
fcd4:    7b 3b        call L26
fcd6:    03           flag3

L28:
fcd7:    94 1e        unknown
fcd9:    d0 04 00     subw A, 0x0400
fcdc:    5a           unknown
fcdd:    15 a0        beq L5
fcdf:    d0 00 20     subw A, 0x0020
fce2:    5a           unknown
fce3:    14 f2        bne L28
fce5:    2f 04        unknown
fce7:    2f 06        unknown
fce9:    90 01 00     liw A, 0x0100
fcec:    2f 00        unknown
fcee:    90 ea 1f     liw A, 0xea1f
fcf1:    2f 02        unknown
fcf3:    7b 1c        call L26
fcf5:    00           unknown
fcf6:    81 f1 44     ldb A, 0xf144
fcf9:    15 84        beq L5
fcfb:    71 01 03     jump 0x0103 L14
fcfe:    7b 2f        call L20
fd00:    71 fc 00     jump 0xfc00 L21

L31:
fd03:    85 41        ld r?, [r?++]
fd05:    a1 f8 00     stb A, 0xf800

L32:
fd08:    81 f8 01     ldb A, 0xf801
fd0b:    29           unknown
fd0c:    15 fa        beq L32
fd0e:    84 f6        ldb A, [[pc-10]]
fd10:    09           ret 9

L26:
fd11:    85 41        ld r?, [r?++]
fd13:    a1 f1 48     stb A, 0xf148

L27:
fd16:    84 df        ldb A, [[pc-33]]
fd18:    2c           unknown
fd19:    10 fb        b0 L27
fd1b:    09           ret 9

L12:
fd1c:    73 a0        jump L4
fd1e:    a5 a2        unknown
fd20:    90 1f 40     liw A, 0x1f40
fd23:    5e           unknown
fd24:    90 81 00     liw A, 0x8100
fd27:    b5 81        unknown
fd29:    80 84        lib A, 0x84
fd2b:    a5 81        unknown
fd2d:    85 a1        ld r?, [r?++]

L20:
fd2f:    14 04        bne L6
fd31:    c0 0f        subb A, 0x0f
fd33:    40 31        unknown

L6:
fd35:    a5 81        unknown
fd37:    80 83        lib A, 0x83
fd39:    a5 81        unknown
fd3b:    3a           xor A, A
fd3c:    b5 81        unknown
fd3e:    80 85        lib A, 0x85
fd40:    a5 81        unknown
fd42:    2a           unknown

L7:
fd43:    a5 81        unknown
fd45:    d0 01 90     subw A, 0x0190
fd48:    f5 81        unknown
fd4a:    28           unknown
fd4b:    c0 0e        subb A, 0x0e
fd4d:    49           unknown
fd4e:    15 f3        beq L7
fd50:    80 ff        lib A, 0xff
fd52:    a5 81        unknown
fd54:    80 08        lib A, 0x08
fd56:    7b 4e        call L8
fd58:    80 41        lib A, 0x41
fd5a:    a1 f8 08     stb A, 0xf808
fd5d:    0e           unknown
fd5e:    2a           unknown
fd5f:    a1 f8 08     stb A, 0xf808
fd62:    0e           unknown
fd63:    a1 f8 08     stb A, 0xf808
fd66:    0e           unknown
fd67:    90 1f 40     liw A, 0x1f40
fd6a:    2f 00        unknown
fd6c:    51 80        sub? r?, r?
fd6e:    3b           unknown
fd6f:    2f 02        unknown
fd71:    2f 34        unknown
fd73:    2f 06        unknown
fd75:    80 43        lib A, 0x43
fd77:    a1 f8 08     stb A, 0xf808
fd7a:    0e           unknown
fd7b:    0e           unknown
fd7c:    7b 20        call L9
fd7e:    73 02        jump L13

L11:
fd80:    73 9a        jump L12

L13:
fd82:    90 01 00     liw A, 0x0100
fd85:    2f 00        unknown
fd87:    90 ea 1f     liw A, 0xea1f
fd8a:    2f 02        unknown
fd8c:    2f 34        unknown
fd8e:    2f 06        unknown
fd90:    80 45        lib A, 0x45
fd92:    a1 f8 08     stb A, 0xf808
fd95:    80 08        lib A, 0x08
fd97:    7b 0d        call L8
fd99:    7b 03        call L9
fd9b:    71 01 03     jump 0x0103 L14

L9:
fd9e:    81 f8 08     ldb A, 0xf808
fda1:    15 01        beq L10
fda3:    09           ret 9

L10:
fda4:    73 da        jump L11

L8:
fda6:    c1 f8 09     c1 A, 0xf809
fda9:    4a           unknown
fdaa:    15 fa        beq L8
fdac:    09           ret 9
fdad:    8c           unknown
fdae:    00           unknown
fdaf:    8b 00        unknown
fdb1:    95           unknown
fdb2:    41 b3        unknown
fdb4:    03           flag3
fdb5:    79           unknown
fdb6:    4c           unknown
fdb7:    93           unknown
fdb8:    47           unknown
fdb9:    be           unknown
fdba:    6d a2        unknown
fdbc:    32 40        unknown

L19:
fdbe:    79           unknown
fdbf:    4c           unknown
fdc0:    e7           unknown
fdc1:    4d           unknown
fdc2:    14 2a        bne L15
fdc4:    c0 8d        subb A, 0x8d
fdc6:    49           unknown
fdc7:    14 25        bne L15
fdc9:    c0 b0        subb A, 0xb0
fdcb:    49           unknown
fdcc:    16 25        b6 L16
fdce:    80 09        lib A, 0x09
fdd0:    41 31        unknown
fdd2:    19 0e        b9 L17
fdd4:    80 11        lib A, 0x11
fdd6:    41 31        unknown
fdd8:    16 19        b6 L16
fdda:    c0 05        subb A, 0x05
fddc:    49           unknown
fddd:    18 14        b8 L16
fddf:    c0 0a        subb A, 0x0a
fde1:    48           unknown

L17:
fde2:    80 04        lib A, 0x04

L18:
fde4:    07           flag7
fde5:    37 40        unknown
fde7:    29           unknown
fde8:    18 fa        b8 L18
fdea:    40 35        unknown
fdec:    73 d0        jump L19

L15:
fdee:    55 40        alu5 r?, r?
fdf0:    65           unknown
fdf1:    a1 09 65     stb A, 0x0965
fdf4:    a1 73 be     stb A, 0x73be
fdf7:    d5           unknown
fdf8:    41 7d        unknown
fdfa:    80 0c        lib A, 0x0c
fdfc:    d0 4b 65     subw A, 0x4b65
fdff:    f5 00        unknown
