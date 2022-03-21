
TEST_0:
9800:    02 ce              0x2ce
9802:    "01133 CMD AUX MEMORY TEST\r\n\0"

TEST_1:
981e:    03 d9              0x3d9
9820:    "01133 CMD SEEK TEST\r\n\0"

TEST_2:
9836:    04 9d              0x49d
9838:    "01133 CMD READ TEST\r\n\0"

TEST_3:
984e:    02 d9              0x2d9
9850:    "FINCH AUX MEMORY TEST\r\n\0"

TEST_4:
9868:    05 3c              0x53c
986a:    "FINCH SEEK TEST\r\n\0"

TEST_5:
987c:    05 ff              0x5ff
987e:    "FINCH READ TEST\r\n\0"

TEST_6:
9890:    06 9e              0x69e
9892:    "ROM SELF TEST\r\n\n\0"

TEST_7:
98a3:    00 00              0x0

WriteString:
98a5:    85 41        ld r?, [r?++]
98a7:    15 01        beq L0
98a9:    09           ret 9

L0:
98aa:    7b 02        call L1
98ac:    73 f7        jump WriteString

L1:
98ae:    c1 f2 00     c1 A, 0xf200
98b1:    24 30        unknown
98b3:    24 30        unknown
98b5:    11 f7        b1 L1
98b7:    a1 f2 01     stb A, 0xf201
98ba:    09           ret 9

ReadChar:
98bb:    81 f2 00     ldb A, 0xf200
98be:    2c           unknown
98bf:    11 fa        b1 ReadChar
98c1:    81 f2 01     ldb A, 0xf201
98c4:    09           ret 9

Fn_0c5:
98c5:    a5 a2        unknown
98c7:    45           unknown
98c8:    01           flag1
98c9:    7b 05        call Fn_0d0
98cb:    85 a1        ld r?, [r?++]
98cd:    7b 01        call Fn_0d0
98cf:    09           ret 9

Fn_0d0:
98d0:    a5 a2        unknown
98d2:    c0 f0        subb A, 0xf0
98d4:    42           unknown
98d5:    31 07        unknown
98d7:    26 10        unknown
98d9:    2c           unknown
98da:    2c           unknown
98db:    2c           unknown
98dc:    c0 b0        subb A, 0xb0
98de:    40 31        unknown
98e0:    c0 b9        subb A, 0xb9
98e2:    49           unknown
98e3:    19 04        b9 L2
98e5:    c0 07        subb A, 0x07
98e7:    40 31        unknown

L2:
98e9:    7b c3        call L1
98eb:    85 a1        ld r?, [r?++]
98ed:    c0 0f        subb A, 0x0f
98ef:    42           unknown
98f0:    31 c0        unknown
98f2:    b0 40 31     b0 A, 0x4031
98f5:    c0 b9        subb A, 0xb9
98f7:    49           unknown
98f8:    19 04        b9 L3
98fa:    c0 07        subb A, 0x07
98fc:    40 31        unknown

L3:
98fe:    7b ae        call L1
9900:    09           ret 9

FinishTest:
9901:    a1 f1 0a     stb A, 0xf10a
9904:    81 f2 00     ldb A, 0xf200
9907:    2c           unknown
9908:    11 57        b1 L4
990a:    81 f2 01     ldb A, 0xf201
990d:    c0 80        subb A, 0x80
990f:    43 31        unknown
9911:    c0 83        subb A, 0x83
9913:    49           unknown
9914:    15 4b        beq L4
9916:    81 01 08     ldb A, 0x0108
9919:    14 32        bne L5
991b:    7a 01 12     call [0x0112]
991e:    "\r\n*** FAIL ***\0"
992d:    a1 f1 0b     stb A, 0xf10b
9930:    a1 f1 0c     stb A, 0xf10c

PressSpaceThenExit:
9933:    7a 01 12     call [0x0112]
9936:    "\r\nPRESS SPACE\x07\r\n\0"
9947:    7a 01 02     call [0x0102]
994a:    72 01 00     jump [{N:#06x}] ;

L5:
994d:    7a 01 12     call [0x0112]
9950:    "\r\n*** PASS ***\0"
995f:    73 d2        jump PressSpaceThenExit

L4:
9961:    90 c0 00     liw A, 0xc000
9964:    5f           unknown
9965:    91 01 1a     ldw A, 0x011a
9968:    5e           unknown
9969:    95           unknown
996a:    41 50        unknown
996c:    80 75        lib A, 0x75
996e:    00           HALT

PrintCtrlCToExit:
996f:    7a 01 12     call [0x0112]
9972:    "\r\n(CONTROL-C TO EXIT)\r\n\0"
998a:    09           ret 9

Init:
998b:    3a           xor A, A
998c:    b1 01 08     stw A, 0x0108
998f:    90 01 ee     liw A, 0x01ee
9992:    50 80        add r?, r?
9994:    b1 01 18     stw A, 0x0118
9997:    90 00 d0     liw A, 0x00d0
999a:    50 80        add r?, r?
999c:    b1 01 0a     stw A, 0x010a
999f:    90 02 91     liw A, 0x0291
99a2:    50 80        add r?, r?
99a4:    b1 01 0c     stw A, 0x010c
99a7:    90 01 6f     liw A, 0x016f
99aa:    50 80        add r?, r?
99ac:    b1 01 06     stw A, 0x0106
99af:    90 00 bb     liw A, 0x00bb
99b2:    50 80        add r?, r?
99b4:    b1 01 02     stw A, 0x0102
99b7:    90 00 a5     liw A, 0x00a5

L7:
99ba:    50 80        add r?, r?
99bc:    b1 01 12     stw A, 0x0112
99bf:    90 00 c5     liw A, 0x00c5
99c2:    50 80        add r?, r?
99c4:    b1 01 10     stw A, 0x0110
99c7:    90 01 01     liw A, 0x0101
99ca:    50 80        add r?, r?
99cc:    b1 01 04     stw A, 0x0104
99cf:    90 01 33     liw A, 0x0133
99d2:    50 80        add r?, r?
99d4:    b1 01 0e     stw A, 0x010e
99d7:    55 80        alu5 r?, r?
99d9:    b1 01 1a     stw A, 0x011a
99dc:    95           unknown
99dd:    41 b1        unknown
99df:    01           flag1
99e0:    14 38        bne L6
99e2:    b1 01 16     stw A, 0x0116
99e5:    55 40        alu5 r?, r?
99e7:    65           unknown
99e8:    a1 69 01     stb A, 0x6901
99eb:    00           HALT
99ec:    75
99ed:    00

Fn_1ee:
99ee:    7a 01 0c     call [0x010c]
99f1:    6d a2        unknown
99f3:    60 03 e8     60 A, 0x03e8

L14:
99f6:    82           unknown
99f7:    01           flag1
99f8:    16 c0        b6 L7
99fa:    08           flag8
99fb:    4a           unknown
99fc:    14 2b        bne L8
99fe:    0e           unknown
99ff:    3f           unknown
9a00:    15 f4        beq L14
9a02:    7a 01 12     call [0x0112]
9a05:    "*** BUSY DID NOT CLEAR ***\0"
9a20:    a1 f1 0b     stb A, 0xf10b
9a23:    a1 f1 0c     stb A, 0xf10c
9a26:    72 01 0e     jump [{N:#06x}] ;

L8:
9a29:    60 03 e8     60 A, 0x03e8

L13:
9a2c:    2c           unknown
9a2d:    10 2b        b0 L9
9a2f:    0e           unknown
9a30:    3f           unknown
9a31:    15 f9        beq L13
9a33:    7a 01 12     call [0x0112]
9a36:    "*** FOUT NEVER CAME ON ***\0"
9a51:    a1 f1 0b     stb A, 0xf10b
9a54:    a1 f1 0c     stb A, 0xf10c
9a57:    72 01 0e     jump [{N:#06x}] ;

L9:
9a5a:    03           flag3
9a5b:    82           unknown
9a5c:    01           flag1
9a5d:    14 15        bne L10
9a5f:    03           flag3
9a60:    65           unknown
9a61:    a1 09 a5     stb A, 0x09a5
9a64:    a2 7a 01     call_alt [0x7a01]
9a67:    12
9a68:    "*** \0"
9a6d:    85 a1        ld r?, [r?++]
9a6f:    7a 01 0a     call [0x010a]
9a72:    7a
9a73:    01

L10:
9a74:    12
9a75:    " ERROR ***\r\n\0"
9a82:    80 01        lib A, 0x01
9a84:    a1 01 08     stb A, 0x0108
9a87:    a1 f1 0b     stb A, 0xf10b
9a8a:    a1 f1 0c     stb A, 0xf10c
9a8d:    65           unknown
9a8e:    a1 02 09     stb A, 0x0209

Fn_291:
9a91:    6d a2        unknown
9a93:    0e           unknown
9a94:    60 03 e8     60 A, 0x03e8

L17:
9a97:    82           unknown
9a98:    01           flag1
9a99:    16 2c        b6 L15
9a9b:    2c           unknown
9a9c:    11 2d        b1 L16
9a9e:    0e           unknown
9a9f:    3f           unknown
9aa0:    15 f5        beq L17
9aa2:    7a 01 12     call [0x0112]
9aa5:    "*** FIN DID NOT GO OFF ***\r\n\0"
9ac2:    a1 f1 0b     stb A, 0xf10b
9ac5:    a1
9ac6:    f1

L15:
9ac7:    0c           unknown
9ac8:    72 01 0e     jump [{N:#06x}] ;

L16:
9acb:    65           unknown
9acc:    a1 09 90     stb A, 0x0990
9acf:    01           flag1
9ad0:    8b 50        unknown
9ad2:    80 7d        lib A, 0x7d
9ad4:    00           HALT
9ad5:    f8
9ad6:    08
9ad7:    73
9ad8:    09

Entry_FINCH_AUX_MEMORY_TEST:
9ad9:    90 01 8b     liw A, 0x018b
9adc:    50 80        add r?, r?
9ade:    7d 00        call A + 0x00
9ae0:    f8           unknown
9ae1:    00           HALT
9ae2:    7a 01 06     call [0x0106]
9ae5:    32 60        unknown
9ae7:    60 0f 00     60 A, 0x0f00
9aea:    55 60        alu5 r?, r?
9aec:    d0 01 1c     subw A, 0x011c

L43:
9aef:    a5 21        unknown
9af1:    28           unknown
9af2:    28           unknown
9af3:    28           unknown
9af4:    3f           unknown
9af5:    15 f8        beq L43
9af7:    90 f0 ff     liw A, 0xf0ff
9afa:    2f 02        unknown
9afc:    90

L30:
9afd:    01           flag1
9afe:    1c 2f        b?? L31
9b00:    00           HALT
9b01:    2f
9b02:    34
9b03:    2f
9b04:    06
9b05:    80
9b06:    46
9b07:    a2
9b08:    01
9b09:    14
9b0a:    7a
9b0b:    01
9b0c:    0c
9b0d:    80
9b0e:    01
9b0f:    a2
9b10:    01
9b11:    14
9b12:    7a
9b13:    01
9b14:    0c
9b15:    2a
9b16:    a2
9b17:    01
9b18:    14
9b19:    7a
9b1a:    01
9b1b:    0c
9b1c:    80
9b1d:    0f
9b1e:    a2
9b1f:    01
9b20:    14
9b21:    7a
9b22:    01
9b23:    0c
9b24:    2a
9b25:    a2
9b26:    01
9b27:    14
9b28:    7a
9b29:    01
9b2a:    18
9b2b:    60
9b2c:    0f
9b2d:    00
9b2e:    3a

L31:
9b2f:    d0 01 1c     subw A, 0x011c

L32:
9b32:    a5 21        unknown
9b34:    3f           unknown
9b35:    15 fb        beq L32
9b37:    90 f0 ff     liw A, 0xf0ff
9b3a:    2f 02        unknown
9b3c:    90 01 1c     liw A, 0x011c
9b3f:    2f 00        unknown
9b41:    2f 34        unknown
9b43:    2f 06        unknown
9b45:    80 47        lib A, 0x47
9b47:    a2 01 14     call_alt [0x0114]
9b4a:    7a 01 0c     call [0x010c]
9b4d:    80 01        lib A, 0x01
9b4f:    a2 01 14     call_alt [0x0114]
9b52:    7a 01 0c     call [0x010c]
9b55:    2a           unknown

L29:
9b56:    a2 01 14     call_alt [0x0114]
9b59:    7a 01 0c     call [0x010c]
9b5c:    80 0f        lib A, 0x0f
9b5e:    a2 01 14     call_alt [0x0114]
9b61:    7a 01 0c     call [0x010c]
9b64:    2a           unknown
9b65:    a2 01 14     call_alt [0x0114]
9b68:    7a 01 18     call [0x0118]
9b6b:    b5 a2        unknown
9b6d:    60 0f 00     60 A, 0x0f00
9b70:    d0 01 1c     subw A, 0x011c
9b73:    55 60        alu5 r?, r?
9b75:    45           unknown
9b76:    10 85        b0 L30
9b78:    21 bd        unknown
9b7a:    41 01        unknown
9b7c:    15 12        beq L33
9b7e:    20 00        unknown
9b80:    20 00        unknown
9b82:    20 00        unknown
9b84:    3f           unknown
9b85:    15 f0        beq L34
9b87:    95           unknown
9b88:    a1 20 70     stb A, 0x2070
9b8b:    7a 01 04     call [0x0104]
9b8e:    02           flag2
9b8f:    e5           unknown

L33:
9b90:    a1 f1 0b     stb A, 0xf10b
9b93:    a1 f1 0c     stb A, 0xf10c
9b96:    f5 a2        unknown
9b98:    7a 01 12     call [0x0112]
9b9b:    "*** ERROR, ADDR=\0"
9bac:    95           unknown
9bad:    a1 39 7a     stb A, 0x397a
9bb0:    01           flag1
9bb1:    10 7a        b0 L28
9bb3:    01           flag1
9bb4:    12
9bb5:    " EXP=\0"
9bbb:    85 a1        ld r?, [r?++]
9bbd:    7a 01 0a     call [0x010a]
9bc0:    7a 01 12     call [0x0112]
9bc3:    " ACT=\0"
9bc9:    85 a1        ld r?, [r?++]
9bcb:    7a 01 0a     call [0x010a]
9bce:    7a 01 12     call [0x0112]
9bd1:    " ***\0"
9bd6:    72 01 0e     jump [{N:#06x}] ;

Entry_01133_CMD_SEEK_TEST:
9bd9:    90 01 8b     liw A, 0x018b
9bdc:    50 80        add r?, r?
9bde:    7d 00        call A + 0x00
9be0:    f8           unknown
9be1:    08           flag8
9be2:    7a 01 06     call [0x0106]
9be5:    d0 41 4d     subw A, 0x414d
9be8:    90 81 00     liw A, 0x8100
9beb:    b5 21        unknown
9bed:    90 82 ff     liw A, 0x82ff
9bf0:    b9           unknown
9bf1:    90 ff fb     liw A, 0xfffb
9bf4:    2f 02        unknown
9bf6:    90 41 4d     liw A, 0x414d
9bf9:    2f 00        unknown
9bfb:    2f 34        unknown
9bfd:    2f 06        unknown
9bff:    80 43        lib A, 0x43
9c01:    a2 01 14     call_alt [0x0114]
9c04:    7a 01 18     call [0x0118]
9c07:    13 09        b3 L18

L19:
9c09:    a1 f1 0b     stb A, 0xf10b
9c0c:    a1 f1 0c     stb A, 0xf10c
9c0f:    72 01 0e     jump [{N:#06x}] ;

L18:
9c12:    80 45        lib A, 0x45
9c14:    a2 01 14     call_alt [0x0114]
9c17:    7a 01 18     call [0x0118]
9c1a:    12 ed        b2 L19
9c1c:    d0 41 4f     subw A, 0x414f
9c1f:    90 84 00     liw A, 0x8400
9c22:    b5 21        unknown
9c24:    80 83        lib A, 0x83
9c26:    a5 21        unknown
9c28:    3a           xor A, A
9c29:    b5 21        unknown
9c2b:    39           unknown
9c2c:    a9           unknown

L28:
9c2d:    38           unknown
9c2e:    38           unknown
9c2f:    b1 41 b1     stw A, 0x41b1

L22:
9c32:    90 41 4d     liw A, 0x414d
9c35:    2f 00        unknown
9c37:    90 ff f7     liw A, 0xfff7
9c3a:    2f 02        unknown
9c3c:    2f 34        unknown
9c3e:    2f 06        unknown
9c40:    80 43        lib A, 0x43
9c42:    a2 01 14     call_alt [0x0114]
9c45:    7a 01 18     call [0x0118]
9c48:    12 bf        b2 L19
9c4a:    80 45        lib A, 0x45
9c4c:    a2 01 14     call_alt [0x0114]
9c4f:    7a 01 18     call [0x0118]
9c52:    13 1c        b3 L20
9c54:    7a 01 12     call [0x0112]
9c57:    "TRACK=\0"
9c5e:    91 41 52     ldw A, 0x4152
9c61:    7a 01 10     call [0x0110]
9c64:    7a 01 12     call [0x0112]
9c67:    "\r\n\0"
9c6a:    a1 f1 0b     stb A, 0xf10b
9c6d:    a1 f1 0c     stb A, 0xf10c

L20:
9c70:    91 41 b1     ldw A, 0x41b1
9c73:    16 1a        b6 L21
9c75:    d1 41 52     d1 A, 0x4152
9c78:    50 20        add r?, r?
9c7a:    b1 41 52     stw A, 0x4152
9c7d:    d0 03 36     subw A, 0x0336
9c80:    59           unknown
9c81:    15 af        beq L22
9c83:    3a           xor A, A
9c84:    39           unknown
9c85:    b1 41 b1     stw A, 0x41b1
9c88:    80 10        lib A, 0x10
9c8a:    a1 41 50     stb A, 0x4150
9c8d:    73 a3        jump L22

L21:
9c8f:    91 41 52     ldw A, 0x4152
9c92:    39           unknown
9c93:    b1 41 52     stw A, 0x4152
9c96:    17 9a        b7 L22
9c98:    7a 01 04     call [0x0104]
9c9b:    03           flag3
9c9c:    e5           unknown

Entry_01133_CMD_READ_TEST:
9c9d:    90 01 8b     liw A, 0x018b
9ca0:    50 80        add r?, r?
9ca2:    7d 00        call A + 0x00
9ca4:    f8           unknown
9ca5:    08           flag8
9ca6:    7a 01 06     call [0x0106]
9ca9:    90 41 4d     liw A, 0x414d
9cac:    5c           unknown
9cad:    90 81 00     liw A, 0x8100
9cb0:    b5 61        unknown
9cb2:    90 84 00     liw A, 0x8400
9cb5:    b5 61        unknown
9cb7:    80 83        lib A, 0x83
9cb9:    a5 61        unknown
9cbb:    3a           xor A, A
9cbc:    b5 61        unknown
9cbe:    80 85        lib A, 0x85
9cc0:    a5 61        unknown
9cc2:    d0 10 00     subw A, 0x1000

L23:
9cc5:    e5           unknown
9cc6:    61 90 01     61 A, 0x9001
9cc9:    90 b5 61     liw A, 0xb561
9ccc:    20 30        unknown
9cce:    21 20        unknown
9cd0:    15 f3        beq L23
9cd2:    80 ff        lib A, 0xff
9cd4:    ab           unknown

L27:
9cd5:    90 ff c3     liw A, 0xffc3
9cd8:    2f 02        unknown
9cda:    90 41 4d     liw A, 0x414d
9cdd:    2f 00        unknown
9cdf:    2f 34        unknown
9ce1:    2f 06        unknown
9ce3:    80 43        lib A, 0x43
9ce5:    a2 01 14     call_alt [0x0114]
9ce8:    7a 01 18     call [0x0118]
9ceb:    13 09        b3 L24
9ced:    a1 f1 0b     stb A, 0xf10b
9cf0:    a1 f1 0c     stb A, 0xf10c
9cf3:    72 01 0e     jump [{N:#06x}] ;

L24:
9cf6:    90 e6 ff     liw A, 0xe6ff
9cf9:    2f 02        unknown
9cfb:    90 01 1c     liw A, 0x011c
9cfe:    2f 00        unknown
9d00:    2f 34        unknown
9d02:    2f 06        unknown
9d04:    80 45        lib A, 0x45
9d06:    a2 01 14     call_alt [0x0114]
9d09:    7a 01 18     call [0x0118]
9d0c:    13 16        b3 L25
9d0e:    7a 01 12     call [0x0112]
9d11:    "TRACK=\0"
9d18:    91 41 52     ldw A, 0x4152
9d1b:    7a 01 10     call [0x0110]
9d1e:    7a 01 12     call [0x0112]
9d21:    "\r\n\0"

L25:
9d24:    91 41 52     ldw A, 0x4152
9d27:    15 01        beq L26
9d29:    38           unknown

L26:
9d2a:    3d           unknown
9d2b:    b1 41 52     stw A, 0x4152
9d2e:    d0 03 36     subw A, 0x0336
9d31:    59           unknown
9d32:    19 a1        b9 L27
9d34:    a1 f1 0a     stb A, 0xf10a
9d37:    7a 01 04     call [0x0104]
9d3a:    04           flag4
9d3b:    a9           unknown

Entry_FINCH_SEEK_TEST:
9d3c:    90 01 8b     liw A, 0x018b
9d3f:    50 80        add r?, r?
9d41:    7d 00        call A + 0x00
9d43:    f8           unknown
9d44:    00           HALT
9d45:    7a 01 06     call [0x0106]
9d48:    d0 41 4d     subw A, 0x414d
9d4b:    90 81 02     liw A, 0x8102
9d4e:    b5 21        unknown
9d50:    90 84 00     liw A, 0x8400
9d53:    b5 21        unknown
9d55:    90 82 ff     liw A, 0x82ff
9d58:    b9           unknown
9d59:    90 ff f9     liw A, 0xfff9
9d5c:    2f 02        unknown
9d5e:    90 41 4d     liw A, 0x414d
9d61:    2f 00        unknown
9d63:    2f 34        unknown
9d65:    2f 06        unknown
9d67:    80 43        lib A, 0x43
9d69:    a2 01 14     call_alt [0x0114]
9d6c:    7a 01 18     call [0x0118]
9d6f:    13 09        b3 L44

L37:
9d71:    a1 f1 0b     stb A, 0xf10b
9d74:    a1 f1 0c     stb A, 0xf10c
9d77:    72 01 0e     jump [{N:#06x}] ;

L44:
9d7a:    80 45        lib A, 0x45
9d7c:    a2 01 14     call_alt [0x0114]
9d7f:    7a 01 18     call [0x0118]
9d82:    12 ed        b2 L37
9d84:    d0 41 4f     subw A, 0x414f
9d87:    90 84 00     liw A, 0x8400
9d8a:    b5 21        unknown
9d8c:    80 83        lib A, 0x83
9d8e:    a5 21        unknown
9d90:    3a           xor A, A
9d91:    b5 21        unknown
9d93:    39           unknown
9d94:    a9           unknown
9d95:    38           unknown
9d96:    38           unknown
9d97:    b1 41 b1     stw A, 0x41b1

L36:
9d9a:    90 41 4d     liw A, 0x414d
9d9d:    2f 00        unknown
9d9f:    90 ff f7     liw A, 0xfff7
9da2:    2f 02        unknown
9da4:    2f 34        unknown
9da6:    2f 06        unknown
9da8:    80 43        lib A, 0x43
9daa:    a2 01 14     call_alt [0x0114]
9dad:    7a 01 18     call [0x0118]
9db0:    12 bf        b2 L37
9db2:    80 45        lib A, 0x45
9db4:    a2 01 14     call_alt [0x0114]
9db7:    7a 01 18     call [0x0118]
9dba:    13 1c        b3 L38
9dbc:    7a 01 12     call [0x0112]
9dbf:    "TRACK=\0"
9dc6:    91 41 52     ldw A, 0x4152
9dc9:    7a 01 10     call [0x0110]
9dcc:    7a 01 12     call [0x0112]
9dcf:    "\r\n\0"
9dd2:    a1 f1 0b     stb A, 0xf10b
9dd5:    a1 f1 0c     stb A, 0xf10c

L38:
9dd8:    91 41 b1     ldw A, 0x41b1
9ddb:    16 14        b6 L35
9ddd:    91 41 52     ldw A, 0x4152
9de0:    38           unknown
9de1:    b1 41 52     stw A, 0x4152
9de4:    d0 02 5c     subw A, 0x025c
9de7:    59           unknown
9de8:    15 b0        beq L36
9dea:    3a           xor A, A
9deb:    39           unknown
9dec:    b1 41 b1     stw A, 0x41b1
9def:    73 a9        jump L36

L35:
9df1:    91 41 52     ldw A, 0x4152
9df4:    39           unknown
9df5:    b1 41 52     stw A, 0x4152
9df8:    17 a0        b7 L36
9dfa:    7a 01 04     call [0x0104]
9dfd:    05           flag5
9dfe:    48           unknown

Entry_FINCH_READ_TEST:
9dff:    90 01 8b     liw A, 0x018b
9e02:    50 80        add r?, r?
9e04:    7d 00        call A + 0x00
9e06:    f8           unknown
9e07:    00           HALT
9e08:    7a 01 06     call [0x0106]
9e0b:    90 41 4d     liw A, 0x414d
9e0e:    5c           unknown
9e0f:    90 81 02     liw A, 0x8102
9e12:    b5 61        unknown
9e14:    90 84 00     liw A, 0x8400
9e17:    b5 61        unknown
9e19:    80 83        lib A, 0x83
9e1b:    a5 61        unknown
9e1d:    3a           xor A, A
9e1e:    b5 61        unknown
9e20:    80 8a        lib A, 0x8a
9e22:    a5 61        unknown
9e24:    d0 10 00     subw A, 0x1000

L45:
9e27:    e5           unknown
9e28:    61 90 01     61 A, 0x9001
9e2b:    90 b5 61     liw A, 0xb561
9e2e:    20 30        unknown
9e30:    21 20        unknown
9e32:    15 f3        beq L45
9e34:    80 ff        lib A, 0xff
9e36:    ab           unknown

L40:
9e37:    90 ff c3     liw A, 0xffc3
9e3a:    2f 02        unknown
9e3c:    90 41 4d     liw A, 0x414d
9e3f:    2f 00        unknown
9e41:    2f 34        unknown
9e43:    2f 06        unknown
9e45:    80 43        lib A, 0x43
9e47:    a2 01 14     call_alt [0x0114]
9e4a:    7a 01 18     call [0x0118]
9e4d:    13 09        b3 L41
9e4f:    a1 f1 0b     stb A, 0xf10b
9e52:    a1 f1 0c     stb A, 0xf10c
9e55:    72 01 0e     jump [{N:#06x}] ;

L41:
9e58:    90 e6 ff     liw A, 0xe6ff
9e5b:    2f 02        unknown
9e5d:    90 01 1c     liw A, 0x011c
9e60:    2f 00        unknown
9e62:    2f 34        unknown
9e64:    2f 06        unknown
9e66:    80 45        lib A, 0x45
9e68:    a2 01 14     call_alt [0x0114]
9e6b:    7a 01 18     call [0x0118]
9e6e:    13 16        b3 L42
9e70:    7a 01 12     call [0x0112]
9e73:    "TRACK=\0"
9e7a:    91 41 52     ldw A, 0x4152
9e7d:    7a 01 10     call [0x0110]
9e80:    7a 01 12     call [0x0112]
9e83:    "\r\n\0"

L42:
9e86:    91 41 52     ldw A, 0x4152
9e89:    15 01        beq L39
9e8b:    38           unknown

L39:
9e8c:    3d           unknown
9e8d:    b1 41 52     stw A, 0x4152
9e90:    d0 02 5d     subw A, 0x025d
9e93:    59           unknown
9e94:    19 a1        b9 L40
9e96:    a1 f1 0a     stb A, 0xf10a
9e99:    7a 01 04     call [0x0104]
9e9c:    06           flag6
9e9d:    0b           unknown

Entry_ROM_SELF_TEST:
9e9e:    90 01 8b     liw A, 0x018b
9ea1:    50 80        add r?, r?
9ea3:    7d 00        call A + 0x00
9ea5:    00           HALT
9ea6:    00
9ea7:    55 86        alu5 r?, r?
9ea9:    3a           xor A, A

L46:
9eaa:    85 61        ld r?, [r?++]
9eac:    40 10        unknown
9eae:    d0 06 ed     subw A, 0x06ed
9eb1:    50 82        add r?, r?
9eb3:    51 62        sub? r?, r?
9eb5:    15 f3        beq L46
9eb7:    8b 41        unknown
9eb9:    01           flag1
9eba:    15 18        beq L47
9ebc:    7a 01 12     call [0x0112]
9ebf:    "\n\r*** PASS ***\0"
9ece:    a1 f1 0a     stb A, 0xf10a
9ed1:    72 01 0e     jump [{N:#06x}] ;

L47:
9ed4:    7a 01 12     call [0x0112]
9ed7:    "*** FAIL ***\0"
9ee4:    a1 f1 0b     stb A, 0xf10b
9ee7:    a1 f1 0c     stb A, 0xf10c
9eea:    72 01 0e     jump [{N:#06x}] ;
9eed:    c5
9eee:    00
9eef:    00
