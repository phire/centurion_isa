
L_ef00:
ef00:    1c 03        b_sense2 L_ef05
ef02:    71 ef c0     jump 0xefc0 L_efc0

L_ef05:
ef05:    80 01        lib A, 0x01
ef07:    1d 01        b_sense3 L_ef0a
ef09:    2a           xor AL, AL

L_ef0a:
ef0a:    a1 f1 4b     stb A, 0xf14b
ef0d:    90 01 00     liw A, 0x0100
ef10:    b1 ff f0     stw A, 0xfff0
ef13:    a1 ff f4     stb A, 0xfff4
ef16:    a1 ff f7     stb A, 0xfff7
ef19:    5f           rotate_left A, B
ef1a:    90 e8 8f     liw A, 0xe88f
ef1d:    b1 ff f2     stw A, 0xfff2
ef20:    80 03        lib A, 0x03
ef22:    7b 06        call L_ef2a
ef24:    80 00        lib A, 0x00
ef26:    7b 02        call L_ef2a
ef28:    75 a0        jump A + 0xa0

L_ef2a:
ef2a:    a1 f1 48     stb A, 0xf148

L_ef2d:
ef2d:    81 f1 44     ldb A, 0xf144
ef30:    2c           shift_right AL, AL
ef31:    15 cd        b_nz L_ef00
ef33:    10 f8        b0 L_ef2d
ef35:    81 f1 45     ldb A, 0xf145
ef38:    c0 30        lib B, 0x30
ef3a:    42 31        xor AL, BL
ef3c:    49           sub AL, BL
ef3d:    15 ee        b_nz L_ef2d
ef3f:    09           ret

L_efc0:
efc0:    90 f0 b0     liw A, 0xf0b0
efc3:    1d 03        b_sense3 L_efc8
efc5:    90 f0 a0     liw A, 0xf0a0

L_efc8:
efc8:    55 0c        mov G, A
efca:    90 00 f0     liw A, 0x00f0
efcd:    5f           rotate_left A, B

L_efce:
efce:    7b 1f        call L_efef
efd0:    4d           mov AL, BL
efd1:    7b 1c        call L_efef
efd3:    5b           or A, B
efd4:    4e           rotate_right AL, BL
efd5:    7b 18        call L_efef
efd7:    45 16        mov DH, AL
efd9:    7b 14        call L_efef
efdb:    4c           shift_right AL, BL

L_efdc:
efdc:    3f           rotate_left A, A
efdd:    16 06        b_lt L_efe5
efdf:    7b 0e        call L_efef
efe1:    a5 61        unknown
efe3:    73 f7        jump L_efdc

L_efe5:
efe5:    7b 08        call L_efef
efe7:    15 e2        b_nz L_efcb
efe9:    45 99        mov EL, EL
efeb:    15 e1        b_nz L_efce
efed:    75 60        jump A + 0x60

L_efef:
efef:    85 c8        unknown
eff1:    01           nop
eff2:    16 d7        b_lt L_efcb
eff4:    2c           shift_right AL, AL
eff5:    11 03        b1 L_effa
eff7:    a5 c8        unknown
eff9:    03           flag3

L_effa:
effa:    2c           shift_right AL, AL
effb:    11 f2        b1 L_efef
effd:    8e           unknown
effe:    48           add AL, BL
efff:    09           ret
