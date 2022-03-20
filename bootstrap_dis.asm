
L20:
fc00:    1a 02              b? (10) L0
fc02:    73 03              jump L2

L0:
fc04:    71 80 01           jump 0x8001 L1

L2:
fc07:    80 c5              li r0, 0xc5
fc09:    a1 f2 00           st r0, 0xf200
fc0c:    80 8c              li r0, 0x8c
fc0e:    a1 f2 01           st r0, 0xf201
fc11:    0e                 unknown
fc12:    0e                 unknown
fc13:    90 10 00           90 r1, 0x1000
fc16:    5f                 unknown
fc17:    7b 79              call L3
fc19:    c4                 unknown
fc1a:    bd                 unknown
fc1b:    00                 unknown
fc1c:    7b 72              call L19
fc1e:    c0                 unknown
fc1f:    c6                 unknown
fc20:    71 fc 00           jump 0xfc00 L20
fc23:    85
fc24:    41
fc25:    a1
fc26:    f8
fc27:    00
fc28:    81
fc29:    f8
fc2a:    01
fc2b:    29
fc2c:    15
fc2d:    fa
fc2e:    84
fc2f:    f6
fc30:    09
fc31:    85
fc32:    41
fc33:    a1
fc34:    f1
fc35:    48
fc36:    84
fc37:    df
fc38:    2c
fc39:    10
fc3a:    fb
fc3b:    09
fc3c:    73
fc3d:    a0
fc3e:    a5
fc3f:    a2
fc40:    49
fc41:    e5
fc42:    a2
fc43:    14
fc44:    0a
fc45:    c0
fc46:    c3
fc47:    49
fc48:    14
fc49:    05
fc4a:    c0
fc4b:    c8
fc4c:    49
fc4d:    15
fc4e:    50
fc4f:    7b
fc50:    72
fc51:    c0
fc52:    50
fc53:    40
fc54:    31
fc55:    16
fc56:    48
fc57:    c5
fc58:    a1
fc59:    16
fc5a:    7f
fc5b:    18
fc5c:    7f
fc5d:    c0
fc5e:    03
fc5f:    49
fc60:    90
fc61:    1f
fc62:    40
fc63:    5e
fc64:    90
fc65:    81
fc66:    00
fc67:    b5
fc68:    81
fc69:    80
fc6a:    84
fc6b:    a5
fc6c:    81
fc6d:    85
fc6e:    a1
fc6f:    14
fc70:    04
fc71:    c0
fc72:    0f
fc73:    40
fc74:    31
fc75:    a5
fc76:    81
fc77:    80
fc78:    83
fc79:    a5
fc7a:    81
fc7b:    3a
fc7c:    b5
fc7d:    81
fc7e:    80
fc7f:    85
fc80:    18
fc81:    3d
fc82:    d0
fc83:    0f
fc84:    00
fc85:    f5
fc86:    a2
fc87:    32
fc88:    20
fc89:    f5
fc8a:    a2
fc8b:    c0
fc8c:    88
fc8d:    e5
fc8e:    a2
fc8f:    d0

L19:
fc90:    83                 unknown
fc91:    00                 unknown

L3:
fc92:    f5                 unknown

L7:
fc93:    a2                 unknown
fc94:    d0 81 00           cmp r0, 0x8100
fc97:    06                 unknown

L4:
fc98:    27                 unknown
fc99:    30                 unknown
fc9a:    29                 unknown
fc9b:    17 fb              b? (7) L4
fc9d:    f5                 unknown
fc9e:    a2                 unknown
fc9f:    2f                 unknown
fca0:    a5                 unknown
fca1:    81 2a a5           ld r0, 0x2aa5
fca4:    81 d0 01           ld r0, 0xd001
fca7:    90 f5 81           90 r1, 0xf581
fcaa:    28                 unknown
fcab:    c0                 unknown
fcac:    0e                 unknown
fcad:    49                 unknown
fcae:    15 f3              beq L5
fcb0:    80 ff              li r0, 0xff
fcb2:    a5                 unknown
fcb3:    81 80 08           ld r0, 0x8008
fcb6:    7b 4e              call L6
fcb8:    80 41              li r0, 0x41
fcba:    a1 f8 08           st r0, 0xf808
fcbd:    0e                 unknown
fcbe:    2a                 unknown
fcbf:    a1 14 2f           st r0, 0x142f
fcc2:    06                 unknown
fcc3:    2f                 unknown
fcc4:    a0                 unknown
fcc5:    90 ff f6           90 r1, 0xfff6
fcc8:    2f                 unknown
fcc9:    02                 unknown
fcca:    7b 22              call L8
fccc:    43                 unknown
fccd:    90 01 00           90 r1, 0x100
fcd0:    2f                 unknown
fcd1:    00                 unknown
fcd2:    90 f0 ff           90 r1, 0xf0ff
fcd5:    2f                 unknown
fcd6:    02                 unknown
fcd7:    7b 15              call L8

L18:
fcd9:    45                 unknown
fcda:    15 03              beq L17
fcdc:    71 01 03           jump 0x103 L15

L17:
fcdf:    7b f8              call L18
fce1:    08                 unknown
fce2:    0e                 unknown
fce3:    a1 f8 08           st r0, 0xf808
fce6:    0e                 unknown
fce7:    90 1f 40           90 r1, 0x1f40
fcea:    2f                 unknown
fceb:    00                 unknown
fcec:    51 80              sub? r?, r?

L8:
fcee:    3b                 unknown
fcef:    2f                 unknown
fcf0:    02                 unknown
fcf1:    2f                 unknown
fcf2:    34                 unknown
fcf3:    2f                 unknown
fcf4:    06                 unknown
fcf5:    80 43              li r0, 0x43
fcf7:    a1 f8 08           st r0, 0xf808
fcfa:    0e                 unknown
fcfb:    0e                 unknown
fcfc:    7b 20              call L9
fcfe:    73 02              jump L16
fd00:    11

s_error:
fd01:    "\r\nERROR\r\n\0"
fd0b:    07                 unknown
fd0c:    73 85              jump L7
fd0e:    73
fd0f:    73
fd10:    73
fd11:    11
fd12:    81
fd13:    f2
fd14:    00
fd15:    2c
fd16:    2c
fd17:    11
fd18:    f9
fd19:    85
fd1a:    41
fd1b:    15
fd1c:    01
fd1d:    09

L9:
fd1e:    a1 f2 73           st r0, 0xf273
fd21:    9a                 unknown
fd22:    90 01 00           90 r1, 0x100
fd25:    2f                 unknown
fd26:    00                 unknown
fd27:    90 ea 1f           90 r1, 0xea1f
fd2a:    2f                 unknown
fd2b:    02                 unknown
fd2c:    2f                 unknown
fd2d:    34                 unknown
fd2e:    2f                 unknown
fd2f:    06                 unknown
fd30:    80 45              li r0, 0x45

L14:
fd32:    a1 f8 08           st r0, 0xf808
fd35:    80 08              li r0, 0x8
fd37:    7b 0d              call L10
fd39:    7b 03              call L13
fd3b:    71 01 03           jump 0x103 L15

L13:
fd3e:    81 f8 01           ld r0, 0xf801
fd41:    73 ef              jump L14

L11:
fd43:    84                 unknown
fd44:    ee                 unknown
fd45:    2c                 unknown

L10:
fd46:    11 fb              bne L11
fd48:    84                 unknown
fd49:    f5                 unknown
fd4a:    c0                 unknown
fd4b:    80 43              li r0, 0x43
fd4d:    31                 unknown
fd4e:    c0                 unknown
fd4f:    e0                 unknown
fd50:    49                 unknown
fd51:    16 04              b? (6) L12
fd53:    c0                 unknown
fd54:    df                 unknown
fd55:    42                 unknown
fd56:    31                 unknown

L12:
fd57:    a4                 unknown
fd58:    e6                 unknown
fd59:    09                 ret 9
fd5a:    73
fd5b:    62
fd5c:    73
fd5d:    02
fd5e:    73
fd5f:    bf
fd60:    08
fd61:    15
fd62:    01
fd63:    09
fd64:    73
fd65:    da
fd66:    c1
fd67:    f8
fd68:    09
fd69:    4a
fd6a:    15
fd6b:    fa
fd6c:    09
fd6d:    8c
fd6e:    00
fd6f:    8b
fd70:    00
fd71:    95
fd72:    41
fd73:    b3
fd74:    03
fd75:    79
fd76:    4c
fd77:    93
fd78:    47
fd79:    be
fd7a:    6d
fd7b:    a2
fd7c:    32
fd7d:    40
fd7e:    79
fd7f:    4c
fd80:    c0
fd81:    07
fd82:    49
fd83:    18
fd84:    ba
fd85:    a1
fd86:    f1
fd87:    40
fd88:    94
fd89:    2d
fd8a:    d0
fd8b:    00
fd8c:    10
fd8d:    5a
fd8e:    14
fd8f:    af
fd90:    3a
fd91:    b1
fd92:    f1
fd93:    41
fd94:    7b
fd95:    3b
fd96:    03
fd97:    94
fd98:    1e
fd99:    d0
fd9a:    04
fd9b:    00
fd9c:    5a
fd9d:    15
fd9e:    a0
fd9f:    d0
fda0:    e7
fda1:    4d
fda2:    14
fda3:    2a
fda4:    c0
fda5:    8d
fda6:    49
fda7:    14
fda8:    25
fda9:    c0
fdaa:    b0
fdab:    49
fdac:    16
fdad:    25
fdae:    80
fdaf:    09
fdb0:    41
fdb1:    31
fdb2:    19
fdb3:    0e
fdb4:    80
fdb5:    11
fdb6:    41
fdb7:    31
fdb8:    16
fdb9:    19
fdba:    c0
fdbb:    05
fdbc:    49
fdbd:    18
fdbe:    14
fdbf:    c0
fdc0:    00
fdc1:    20
fdc2:    5a
fdc3:    14
fdc4:    f2
fdc5:    2f
fdc6:    04
fdc7:    2f
fdc8:    06
fdc9:    90
fdca:    01
fdcb:    00
fdcc:    2f
fdcd:    00
fdce:    90
fdcf:    ea
fdd0:    1f
fdd1:    2f
fdd2:    02
fdd3:    7b
fdd4:    1c
fdd5:    00
fdd6:    81
fdd7:    f1
fdd8:    44
fdd9:    15
fdda:    84
fddb:    71
fddc:    01
fddd:    03
fdde:    7b
fddf:    2f
fde0:    0a
fde1:    48
fde2:    80
fde3:    04
fde4:    07
fde5:    37
fde6:    40
fde7:    29
fde8:    18
fde9:    fa
fdea:    40
fdeb:    35
fdec:    73
fded:    d0
fdee:    55
fdef:    40
fdf0:    65
fdf1:    a1
fdf2:    09
fdf3:    65
fdf4:    a1
fdf5:    73
fdf6:    be
fdf7:    d5
fdf8:    41
fdf9:    7d
fdfa:    80
fdfb:    0c
fdfc:    d0
fdfd:    4b
fdfe:    65
fdff:    f5
