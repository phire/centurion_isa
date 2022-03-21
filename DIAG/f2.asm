
TEST_0:
8800:    00 49              0x49
8802:    "CPU INSTRUCTION TEST\r\n\0"

TEST_1:
8819:    05 bb              0x5bb
881b:    "CPU-6 MAPPING RAM TEST\r\n\0"

TEST_2:
8834:    07 5f              0x75f
8836:    "ROM SELF TEST\r\n\n\0"

TEST_3:
8847:    00 00              0x0

Entry_CPU_INSTRUCTION_TEST:
8849:    90 07 cc     liw A, 0x07cc
884c:    50 80        add r?, r?
884e:    7d 00        call A + 0x00
8850:    "\x1b\x1c\x0cCPU INSTRUCTION TEST, CONTROL-C TO EXIT\r\n\0"
887d:    6d a2        unknown
887f:    55 80        alu5 r?, r?
8881:    b5 a2        unknown
8883:    60 00 20     60 A, 0x0020 ; This is a testing that the 60 3 byte instruction is working.
                                   ; Which it will use later to test other multi-byte insturctions
                                   ; If the operand isn't consuemed, then a HALT instruction will be executed
8886:    90 05 a1     liw A, 0x05a1
8889:    50 80        add r?, r?
888b:    5c           unknown ; This might be installing an exception handler?
888c:    90 00 10     liw A, 0x0010

L4:
888f:    c5           unknown
8890:    61 e5 01     61 A, 0xe501
8893:    3f           unknown
8894:    15 f9        beq L4 ; clearing all regsiters?
8896:    03           flag3
8897:    07           flag7
8898:    c0 01        subb A, 0x01 ; if A is empty. This would set the overflow flag
889a:    11 01        b1 L5 ; Some tests for all the branch instructions
889c:    00           HALT

L5:
889d:    13 01        b3 L6
889f:    00           HALT

L6:
88a0:    17 01        b7 L7
88a2:    00           HALT

L7:
88a3:    15 01        beq L8
88a5:    00           HALT

L8:
88a6:    18 01        b8 L9
88a8:    00           HALT

L9:
88a9:    10 02        b0 L10 ; branch 10 is expected to not branch here
88ab:    11 01        b1 L11 ; The author could have used any branch here, but using 11 here
                             ; implies 11 is the opposite of 10

L10:
88ad:    00           HALT

L11:
88ae:    12 02        b2 L12
88b0:    13 01        b3 L13 ; likewise, 13 is the opposite of 12 (and so on, below)

L12:
88b2:    00           HALT

L13:
88b3:    14 02        bne L14
88b5:    15 01        beq L15

L14:
88b7:    00           HALT

L15:
88b8:    16 02        b6 L16
88ba:    17 01        b7 L17

L16:
88bc:    00           HALT

L17:
88bd:    19 02        b9 L18
88bf:    18 0a        b8 L19

L18:
88c1:    00           HALT

L20:
88c2:    18 04        b8 L21
88c4:    00           HALT

L22:
88c5:    18 07        b8 L23
88c7:    00           HALT

L21:
88c8:    18 fb        b8 L22
88ca:    00           HALT

L19:
88cb:    18 f5        b8 L20
88cd:    00           HALT

L23:
88ce:    08           flag8
88cf:    10 01        b0 L24
88d1:    00           HALT

L24:
88d2:    07           flag7
88d3:    11 01        b1 L25
88d5:    00           HALT

L25:
88d6:    06           flag6
88d7:    10 01        b0 L26
88d9:    00           HALT

L26:
88da:    08           flag8
88db:    11 01        b1 L27
88dd:    00           HALT

L27:
88de:    02           flag2
88df:    12 01        b2 L28
88e1:    00           HALT

L28:
88e2:    03           flag3
88e3:    13 01        b3 L29
88e5:    00           HALT

L29:
88e6:    01           flag1
88e7:    11 01        b1 L30
88e9:    00           HALT

L30:
88ea:    13 01        b3 L31
88ec:    00           HALT

L31:
88ed:    18 01        b8 L32
88ef:    00           HALT

L32:
88f0:    02           flag2
88f1:    06           flag6
88f2:    01           flag1
88f3:    10 01        b0 L33
88f5:    00           HALT

L33:
88f6:    12 01        b2 L34
88f8:    00           HALT

L34:
88f9:    2a           unknown ; This is potentially increment, 
88fa:    11 01        b1 L35
88fc:    00           HALT

L35:
88fd:    13 01        b3 L36
88ff:    00           HALT

L36:
8900:    14 01        bne L37
8902:    00           HALT

L37:
8903:    17 01        b7 L38
8905:    00           HALT

L38:
8906:    19 01        b9 L39
8908:    00           HALT

L39:
8909:    2b           unknown
890a:    13 01        b3 L40
890c:    00           HALT

L40:
890d:    11 01        b1 L41
890f:    00           HALT

L41:
8910:    16 01        b6 L42
8912:    00           HALT

L42:
8913:    19 01        b9 L43
8915:    00           HALT

L43:
8916:    06           flag6
8917:    02           flag2
8918:    22 70        unknown
891a:    11 01        b1 L44
891c:    00           HALT

L44:
891d:    13 01        b3 L45
891f:    00           HALT

L45:
8920:    14 01        bne L46
8922:    00           HALT

L46:
8923:    20 70        unknown
8925:    11 01        b1 L47
8927:    00           HALT

L47:
8928:    13 01        b3 L48
892a:    00           HALT

L48:
892b:    18 01        b8 L49
892d:    00           HALT

L49:
892e:    21 70        unknown
8930:    13 01        b3 L50
8932:    00           HALT

L50:
8933:    11 01        b1 L51
8935:    00           HALT

L51:
8936:    14 01        bne L52
8938:    00           HALT

L52:
8939:    21 70        unknown
893b:    13 01        b3 L53
893d:    00           HALT

L53:
893e:    11 01        b1 L54
8940:    00           HALT

L54:
8941:    16 01        b6 L55
8943:    00           HALT

L55:
8944:    20 70        unknown
8946:    13 01        b3 L56
8948:    00           HALT

L56:
8949:    11 01        b1 L57
894b:    00           HALT

L57:
894c:    14 01        bne L58
894e:    00           HALT

L58:
894f:    06           flag6
8950:    02           flag2
8951:    22 60        unknown ; Using 60 in the operand means the following branch will be skipped
                              ; if 22 doesn't consume it's operand
8953:    11 01        b1 L59
8955:    00           HALT

L59:
8956:    13 01        b3 L60
8958:    00           HALT

L60:
8959:    14 01        bne L61
895b:    00           HALT

L61:
895c:    20 60        unknown
895e:    11 01        b1 L62
8960:    00           HALT

L62:
8961:    13 01        b3 L63
8963:    00           HALT

L63:
8964:    18 01        b8 L64
8966:    00           HALT

L64:
8967:    21 60        unknown
8969:    13 01        b3 L65
896b:    00           HALT

L65:
896c:    11 01        b1 L66
896e:    00           HALT

L66:
896f:    14 01        bne L67
8971:    00           HALT

L67:
8972:    21 60        unknown
8974:    13 01        b3 L68
8976:    00           HALT

L68:
8977:    11 01        b1 L69
8979:    00           HALT

L69:
897a:    16 01        b6 L70
897c:    00           HALT

L70:
897d:    20 60        unknown
897f:    13 01        b3 L71
8981:    00           HALT

L71:
8982:    11 01        b1 L72
8984:    00           HALT

L72:
8985:    14 01        bne L73
8987:    00           HALT

L73:
8988:    06           flag6
8989:    02           flag2
898a:    32 20        unknown
898c:    11 01        b1 L74
898e:    00           HALT

L74:
898f:    13 01        b3 L75
8991:    00           HALT

L75:
8992:    14 01        bne L76
8994:    00           HALT

L76:
8995:    30 20        unknown
8997:    11 01        b1 L77
8999:    00           HALT

L77:
899a:    13 01        b3 L78
899c:    00           HALT

L78:
899d:    18 01        b8 L79
899f:    00           HALT

L79:
89a0:    21 30        unknown
89a2:    13 01        b3 L80
89a4:    00           HALT

L80:
89a5:    11 01        b1 L81
89a7:    00           HALT

L81:
89a8:    14 01        bne L82
89aa:    00           HALT

L82:
89ab:    31 20        unknown
89ad:    13 01        b3 L83
89af:    00           HALT

L83:
89b0:    11 01        b1 L84
89b2:    00           HALT

L84:
89b3:    16 01        b6 L85
89b5:    00           HALT

L85:
89b6:    30 20        unknown
89b8:    13 01        b3 L86
89ba:    00           HALT

L86:
89bb:    11 01        b1 L87
89bd:    00           HALT

L87:
89be:    14 01        bne L88
89c0:    00           HALT

L88:
89c1:    22 b0        unknown ; Is B0 a two byte instrution that we haven't encountered yet?
89c3:    23 b0        unknown
89c5:    11 01        b1 L89
89c7:    00           HALT

L89:
89c8:    13 01        b3 L90
89ca:    00           HALT

L90:
89cb:    16 01        b6 L91
89cd:    00           HALT

L91:
89ce:    26 b0        unknown
89d0:    10 01        b0 L92
89d2:    00           HALT

L92:
89d3:    17 01        b7 L93
89d5:    00           HALT

L93:
89d6:    13 01        b3 L94
89d8:    00           HALT

L94:
89d9:    25 b0        unknown
89db:    12 01        b2 L95
89dd:    00           HALT

L95:
89de:    11 01        b1 L96
89e0:    00           HALT

L96:
89e1:    16 01        b6 L97
89e3:    00           HALT

L97:
89e4:    20 b0        unknown
89e6:    13 01        b3 L98
89e8:    00           HALT

L98:
89e9:    23 b0        unknown
89eb:    13 01        b3 L99
89ed:    00           HALT

L99:
89ee:    11 01        b1 L100
89f0:    00           HALT

L100:
89f1:    14 01        bne L101
89f3:    00           HALT

L101:
89f4:    23 b0        unknown
89f6:    24 b0        unknown
89f8:    10 01        b0 L102
89fa:    00           HALT

L102:
89fb:    13 01        b3 L103
89fd:    00           HALT

L103:
89fe:    16 01        b6 L104
8a00:    00           HALT

L104:
8a01:    27 b0        unknown
8a03:    13 01        b3 L105
8a05:    00           HALT

L105:
8a06:    10 01        b0 L106
8a08:    00           HALT

L106:
8a09:    16 01        b6 L107
8a0b:    00           HALT

L107:
8a0c:    23 b0        unknown
8a0e:    14 01        bne L108
8a10:    00           HALT

L108:
8a11:    13 01        b3 L109
8a13:    00           HALT

L109:
8a14:    32 60        unknown
8a16:    33 60        unknown
8a18:    13 01        b3 L110
8a1a:    00           HALT

L110:
8a1b:    11 01        b1 L111
8a1d:    00           HALT

L111:
8a1e:    16 01        b6 L112
8a20:    00           HALT

L112:
8a21:    36 60        unknown
8a23:    10 01        b0 L113
8a25:    00           HALT

L113:
8a26:    17 01        b7 L114
8a28:    00           HALT

L114:
8a29:    13 01        b3 L115
8a2b:    00           HALT

L115:
8a2c:    35 60        unknown
8a2e:    12 01        b2 L116
8a30:    00           HALT

L116:
8a31:    11 01        b1 L117
8a33:    00           HALT

L117:
8a34:    16 01        b6 L118
8a36:    00           HALT

L118:
8a37:    30 60        unknown
8a39:    13 01        b3 L119
8a3b:    00           HALT

L119:
8a3c:    33 60        unknown
8a3e:    13 01        b3 L120
8a40:    00           HALT

L120:
8a41:    11 01        b1 L121
8a43:    00           HALT

L121:
8a44:    14 01        bne L122
8a46:    00           HALT

L122:
8a47:    33 60        unknown
8a49:    34 60        unknown
8a4b:    10 01        b0 L123
8a4d:    00           HALT

L123:
8a4e:    13 01        b3 L124
8a50:    00           HALT

L124:
8a51:    16 01        b6 L125
8a53:    00           HALT

L125:
8a54:    37 60        unknown
8a56:    13 01        b3 L126
8a58:    00           HALT

L126:
8a59:    10 01        b0 L127
8a5b:    00           HALT

L127:
8a5c:    16 01        b6 L128
8a5e:    00           HALT

L128:
8a5f:    33 60        unknown
8a61:    14 01        bne L129
8a63:    00           HALT

L129:
8a64:    13 01        b3 L130
8a66:    00           HALT

L130:
8a67:    32 40        unknown
8a69:    14 01        bne L131
8a6b:    00           HALT

L131:
8a6c:    3e           unknown
8a6d:    18 01        b8 L132
8a6f:    00           HALT

L132:
8a70:    3f           unknown
8a71:    14 01        bne L133
8a73:    00           HALT

L133:
8a74:    3f           unknown
8a75:    16 01        b6 L134
8a77:    00           HALT

L134:
8a78:    3e           unknown
8a79:    14 01        bne L135
8a7b:    00           HALT

L135:
8a7c:    3a           xor A, A
8a7d:    3b           unknown
8a7e:    3c           unknown
8a7f:    39           unknown
8a80:    3d           unknown
8a81:    38           unknown
8a82:    38           unknown
8a83:    38           unknown
8a84:    38           unknown
8a85:    14 01        bne L136
8a87:    00           HALT

L136:
8a88:    10 01        b0 L137
8a8a:    00           HALT

L137:
8a8b:    13 01        b3 L138
8a8d:    00           HALT

L138:
8a8e:    3a           xor A, A
8a8f:    80 aa        lib A, 0xaa
8a91:    11 01        b1 L139
8a93:    00           HALT

L139:
8a94:    13 01        b3 L140
8a96:    00           HALT

L140:
8a97:    16 01        b6 L141
8a99:    00           HALT

L141:
8a9a:    25 10        unknown
8a9c:    10 01        b0 L142
8a9e:    00           HALT

L142:
8a9f:    12 01        b2 L143
8aa1:    00           HALT

L143:
8aa2:    18 01        b8 L144
8aa4:    00           HALT

L144:
8aa5:    80 00        lib A, 0x00
8aa7:    14 01        bne L145
8aa9:    00           HALT

L145:
8aaa:    c0 80        subb A, 0x80
8aac:    10 01        b0 L146
8aae:    00           HALT

L146:
8aaf:    12 01        b2 L147
8ab1:    00           HALT

L147:
8ab2:    16 01        b6 L148
8ab4:    00           HALT

L148:
8ab5:    25 30        unknown
8ab7:    14 01        bne L149
8ab9:    00           HALT

L149:
8aba:    3a           xor A, A
8abb:    90 aa aa     liw A, 0xaaaa
8abe:    11 01        b1 L150
8ac0:    00           HALT

L150:
8ac1:    13 01        b3 L151
8ac3:    00           HALT

L151:
8ac4:    16 01        b6 L152
8ac6:    00           HALT

L152:
8ac7:    35 00        unknown
8ac9:    10 01        b0 L153
8acb:    00           HALT

L153:
8acc:    12 01        b2 L154
8ace:    00           HALT

L154:
8acf:    18 01        b8 L155
8ad1:    00           HALT

L155:
8ad2:    90 00 00     liw A, 0x0000
8ad5:    14 01        bne L156
8ad7:    00           HALT

L156:
8ad8:    60 80 00     60 A, 0x8000
8adb:    10 01        b0 L157
8add:    00           HALT

L157:
8ade:    12 01        b2 L158
8ae0:    00           HALT

L158:
8ae1:    16 01        b6 L159
8ae3:    00           HALT

L159:
8ae4:    35 40        unknown
8ae6:    14 01        bne L160
8ae8:    00           HALT

L160:
8ae9:    80 aa        lib A, 0xaa
8aeb:    c0 aa        subb A, 0xaa
8aed:    41 13        unknown
8aef:    14 01        bne L161
8af1:    00           HALT

L161:
8af2:    10 01        b0 L162
8af4:    00           HALT

L162:
8af5:    13 01        b3 L163
8af7:    00           HALT

L163:
8af8:    c0 55        subb A, 0x55
8afa:    40 31        unknown
8afc:    11 01        b1 L164
8afe:    00           HALT

L164:
8aff:    13 01        b3 L165
8b01:    00           HALT

L165:
8b02:    2b           unknown
8b03:    14 01        bne L166
8b05:    00           HALT

L166:
8b06:    80 aa        lib A, 0xaa
8b08:    43 31        unknown
8b0a:    11 01        b1 L167
8b0c:    00           HALT

L167:
8b0d:    13 01        b3 L168
8b0f:    00           HALT

L168:
8b10:    2b           unknown
8b11:    14 01        bne L169
8b13:    00           HALT

L169:
8b14:    80 55        lib A, 0x55
8b16:    02           flag2
8b17:    06           flag6
8b18:    44 31        unknown
8b1a:    10 01        b0 L170
8b1c:    00           HALT

L170:
8b1d:    12 01        b2 L171
8b1f:    00           HALT

L171:
8b20:    14 01        bne L172
8b22:    00           HALT

L172:
8b23:    90 55 55     liw A, 0x5555
8b26:    d0 55 55     subw A, 0x5555
8b29:    51 02        sub? r?, r?
8b2b:    14 01        bne L173
8b2d:    00           HALT

L173:
8b2e:    10 01        b0 L174
8b30:    00           HALT

L174:
8b31:    13 01        b3 L175
8b33:    00           HALT

L175:
8b34:    d0 aa aa     subw A, 0xaaaa
8b37:    50 20        add r?, r?
8b39:    11 01        b1 L176
8b3b:    00           HALT

L176:
8b3c:    13 01        b3 L177
8b3e:    00           HALT

L177:
8b3f:    16 01        b6 L178
8b41:    00           HALT

L178:
8b42:    3b           unknown
8b43:    14 01        bne L179
8b45:    00           HALT

L179:
8b46:    90 55 55     liw A, 0x5555
8b49:    53 20        unknown
8b4b:    11 01        b1 L180
8b4d:    00           HALT

L180:
8b4e:    13 01        b3 L181
8b50:    00           HALT

L181:
8b51:    3b           unknown
8b52:    14 01        bne L182
8b54:    00           HALT

L182:
8b55:    90 aa aa     liw A, 0xaaaa
8b58:    06           flag6
8b59:    02           flag2
8b5a:    54 20        unknown
8b5c:    10 01        b0 L183
8b5e:    00           HALT

L183:
8b5f:    12 01        b2 L184
8b61:    00           HALT

L184:
8b62:    14 01        bne L185
8b64:    00           HALT

L185:
8b65:    90 aa 55     liw A, 0xaa55
8b68:    55 02        alu5 r?, r?
8b6a:    55 04        alu5 r?, r?
8b6c:    55 06        alu5 r?, r?
8b6e:    55 08        alu5 r?, r?
8b70:    55 8a        alu5 r?, r?
8b72:    55 8c        alu5 r?, r?
8b74:    55 80        alu5 r?, r?
8b76:    50 20        add r?, r?
8b78:    50 40        add r?, r?
8b7a:    50 60        add r?, r?
8b7c:    51 08        sub? r?, r?
8b7e:    51 8a        sub? r?, r?
8b80:    51 ac        sub? r?, r?
8b82:    51 c2        sub? r?, r?
8b84:    14 01        bne L186
8b86:    00           HALT

L186:
8b87:    d0 55 aa     subw A, 0x55aa
8b8a:    44 67        unknown
8b8c:    44 76        unknown
8b8e:    44 67        unknown
8b90:    54 62        unknown
8b92:    14 01        bne L187
8b94:    00           HALT

L187:
8b95:    45           unknown
8b96:    69 45 78     69 A, 0x4578
8b99:    44 c8        unknown
8b9b:    44 d9        unknown
8b9d:    55 88        alu5 r?, r?
8b9f:    14 01        bne L188
8ba1:    00           HALT

L188:
8ba2:    90 80 00     liw A, 0x8000
8ba5:    d0 00 01     subw A, 0x0001
8ba8:    59           unknown
8ba9:    12 01        b2 L189
8bab:    00           HALT

L189:
8bac:    10 01        b0 L190
8bae:    00           HALT

L190:
8baf:    18 01        b8 L191
8bb1:    00           HALT

L191:
8bb2:    03           flag3
8bb3:    06           flag6
8bb4:    58           unknown
8bb5:    13 01        b3 L192
8bb7:    00           HALT

L192:
8bb8:    11 01        b1 L193
8bba:    00           HALT

L193:
8bbb:    33 20        unknown
8bbd:    14 01        bne L194
8bbf:    00           HALT

L194:
8bc0:    90 aa aa     liw A, 0xaaaa
8bc3:    d0 55 55     subw A, 0x5555
8bc6:    5e           unknown
8bc7:    5b           unknown
8bc8:    5a           unknown
8bc9:    14 01        bne L195
8bcb:    00           HALT

L195:
8bcc:    5a           unknown
8bcd:    14 01        bne L196
8bcf:    00           HALT

L196:
8bd0:    55 82        alu5 r?, r?
8bd2:    55 40        alu5 r?, r?
8bd4:    5a           unknown
8bd5:    51 40        sub? r?, r?
8bd7:    14 01        bne L197
8bd9:    00           HALT

L197:
8bda:    91 bf fc     ldw A, 0xbffc
8bdd:    5e           unknown
8bde:    91 00 26     ldw A, 0x0026
8be1:    14 01        bne L198
8be3:    00           HALT

L198:
8be4:    d1 00 24     d1 A, 0x0024
8be7:    16 01        b6 L199
8be9:    00           HALT

L199:
8bea:    61 00 22     61 A, 0x0022
8bed:    18 01        b8 L200
8bef:    00           HALT

L200:
8bf0:    b1 00 2c     stw A, 0x002c
8bf3:    14 01        bne L201
8bf5:    00           HALT

L201:
8bf6:    91 00 2c     ldw A, 0x002c
8bf9:    f1 00 2c     f1 A, 0x002c
8bfc:    16 01        b6 L202
8bfe:    00           HALT

L202:
8bff:    d1 00 2c     d1 A, 0x002c
8c02:    69 00 2c     69 A, 0x002c
8c05:    18 01        b8 L203
8c07:    00           HALT

L203:
8c08:    61 00 2c     61 A, 0x002c
8c0b:    54 42        unknown
8c0d:    58           unknown
8c0e:    33 20        unknown
8c10:    14 01        bne L204
8c12:    00           HALT

L204:
8c13:    91 bf fc     ldw A, 0xbffc
8c16:    5e           unknown
8c17:    91 00 10     ldw A, 0x0010
8c1a:    50 80        add r?, r?
8c1c:    b1 00 10     stw A, 0x0010
8c1f:    91 00 12     ldw A, 0x0012
8c22:    50 80        add r?, r?
8c24:    b1 00 12     stw A, 0x0012
8c27:    91 00 14     ldw A, 0x0014
8c2a:    50 80        add r?, r?
8c2c:    b1 00 14     stw A, 0x0014
8c2f:    91 00 16     ldw A, 0x0016
8c32:    50 80        add r?, r?
8c34:    b1 00 16     stw A, 0x0016
8c37:    91 00 18     ldw A, 0x0018
8c3a:    50 80        add r?, r?
8c3c:    b1 00 18     stw A, 0x0018
8c3f:    92 00 12     92 A, 0x0012
8c42:    18 01        b8 L205
8c44:    00           HALT

L205:
8c45:    d2 00 14     d2 A, 0x0014
8c48:    16 01        b6 L206
8c4a:    00           HALT

L206:
8c4b:    54 20        unknown
8c4d:    3b           unknown
8c4e:    14 01        bne L207
8c50:    00           HALT

L207:
8c51:    94 1c        unknown
8c53:    18 01        b8 L208
8c55:    00           HALT

L208:
8c56:    d4 19        unknown
8c58:    16 01        b6 L209
8c5a:    00           HALT

L209:
8c5b:    54 20        unknown
8c5d:    3b           unknown
8c5e:    14 01        bne L210
8c60:    00           HALT

L210:
8c61:    93           unknown
8c62:    0c           unknown
8c63:    d3           unknown
8c64:    0c           unknown
8c65:    58           unknown
8c66:    90 ff ba     liw A, 0xffba
8c69:    58           unknown
8c6a:    14 01        bne L211
8c6c:    00           HALT

L211:
8c6d:    73 04        jump L212
8c6f:    00
8c70:    22
8c71:    00
8c72:    24

L212:
8c73:    60 00 20     60 A, 0x0020
8c76:    9a           unknown
8c77:    d0 ff ff     subw A, 0xffff
8c7a:    59           unknown
8c7b:    14 01        bne L213
8c7d:    00           HALT

L213:
8c7e:    95           unknown
8c7f:    41 3b        unknown
8c81:    14 01        bne L214
8c83:    00           HALT

L214:
8c84:    95           unknown
8c85:    41 d5        unknown
8c87:    41 54        unknown
8c89:    20 3b        unknown
8c8b:    14 01        bne L215
8c8d:    00           HALT

L215:
8c8e:    9a           unknown
8c8f:    14 01        bne L216
8c91:    00           HALT

L216:
8c92:    95           unknown
8c93:    42           unknown
8c94:    d5           unknown
8c95:    42           unknown
8c96:    54 20        unknown
8c98:    3b           unknown
8c99:    14 01        bne L217
8c9b:    00           HALT

L217:
8c9c:    d0 00 24     subw A, 0x0024
8c9f:    9a           unknown
8ca0:    65           unknown
8ca1:    28           unknown
8ca2:    fe           unknown
8ca3:    54 40        unknown
8ca5:    14 01        bne L218
8ca7:    00           HALT

L218:
8ca8:    95           unknown
8ca9:    28           unknown
8caa:    fc           unknown
8cab:    65           unknown
8cac:    29           unknown
8cad:    02           flag2
8cae:    50 40        add r?, r?
8cb0:    3b           unknown
8cb1:    14 01        bne L219
8cb3:    00           HALT

L219:
8cb4:    99           unknown
8cb5:    65           unknown
8cb6:    2a           unknown
8cb7:    fc           unknown
8cb8:    54 40        unknown
8cba:    3b           unknown
8cbb:    14 01        bne L220
8cbd:    00           HALT

L220:
8cbe:    60 00 10     60 A, 0x0010
8cc1:    95           unknown
8cc2:    44 d0        unknown
8cc4:    ff           unknown
8cc5:    ff           unknown
8cc6:    59           unknown
8cc7:    14 01        bne L221
8cc9:    00           HALT

L221:
8cca:    95           unknown
8ccb:    45           unknown
8ccc:    3b           unknown
8ccd:    14 01        bne L222
8ccf:    00           HALT

L222:
8cd0:    95           unknown
8cd1:    45           unknown
8cd2:    d5           unknown
8cd3:    45           unknown
8cd4:    54 20        unknown
8cd6:    3b           unknown
8cd7:    14 01        bne L223
8cd9:    00           HALT

L223:
8cda:    95           unknown
8cdb:    46           unknown
8cdc:    d5           unknown
8cdd:    46           unknown
8cde:    54 20        unknown
8ce0:    3b           unknown
8ce1:    14 01        bne L224
8ce3:    00           HALT

L224:
8ce4:    60 00 14     60 A, 0x0014
8ce7:    95           unknown
8ce8:    44 d5        unknown
8cea:    4c           unknown
8ceb:    fe           unknown
8cec:    54 20        unknown
8cee:    3b           unknown
8cef:    14 01        bne L225
8cf1:    00           HALT

L225:
8cf2:    95           unknown
8cf3:    4c           unknown
8cf4:    fc           unknown
8cf5:    d5           unknown
8cf6:    4d           unknown
8cf7:    02           flag2
8cf8:    50 20        add r?, r?
8cfa:    3b           unknown
8cfb:    14 01        bne L226
8cfd:    00           HALT

L226:
8cfe:    95           unknown
8cff:    44 d5        unknown
8d01:    4e           unknown
8d02:    fc           unknown
8d03:    54 20        unknown
8d05:    3b           unknown
8d06:    14 01        bne L227
8d08:    00           HALT

L227:
8d09:    0d           unknown
8d0a:    90 05 0a     liw A, 0x050a
8d0d:    50 80        add r?, r?
8d0f:    51 04        sub? r?, r?
8d11:    14 01        bne L228
8d13:    00           HALT

L228:
8d14:    90 00 3a     liw A, 0x003a
8d17:    5f           unknown
8d18:    60 20 20     60 A, 0x2020
8d1b:    7b 06        call L229
8d1d:    01           flag1
8d1e:    01           flag1
8d1f:    00           HALT
8d20:    73
8d21:    16
8d22:    00

L229:
8d23:    95           unknown
8d24:    41 d0        unknown
8d26:    01           flag1
8d27:    01           flag1
8d28:    54 20        unknown
8d2a:    14 01        bne L230
8d2c:    00           HALT

L230:
8d2d:    9d           unknown
8d2e:    d0 20 20     subw A, 0x2020
8d31:    54 20        unknown
8d33:    14 01        bne L231
8d35:    00           HALT

L231:
8d36:    3e           unknown
8d37:    09           ret 9
8d38:    60
8d39:    09
8d3a:    ef           unknown
8d3b:    90 11 ff     liw A, 0x11ff
8d3e:    b5 41        unknown
8d40:    55 42        alu5 r?, r?
8d42:    90 09 f1     liw A, 0x09f1
8d45:    59           unknown
8d46:    14 01        bne L235
8d48:    00           HALT

L235:
8d49:    60 09 ef     60 A, 0x09ef
8d4c:    95           unknown
8d4d:    41 d0        unknown
8d4f:    11 ff        b1 L236
8d51:    41 02        unknown
8d53:    14 01        bne L237
8d55:    00           HALT

L237:
8d56:    49           unknown
8d57:    14 01        bne L238
8d59:    00           HALT

L238:
8d5a:    90 60 66     liw A, 0x6066
8d5d:    2f 00        unknown
8d5f:    2f 21        unknown
8d61:    59           unknown
8d62:    14 01        bne L239
8d64:    00           HALT

L239:
8d65:    90 46 11     liw A, 0x4611
8d68:    2f 02        unknown
8d6a:    2f 23        unknown
8d6c:    59           unknown
8d6d:    14 01        bne L240
8d6f:    00           HALT

L240:
8d70:    81 f2 00     ldb A, 0xf200
8d73:    2c           unknown
8d74:    11 18        b1 L241
8d76:    81 f2 01     ldb A, 0xf201
8d79:    c0 80        subb A, 0x80
8d7b:    43 31        unknown
8d7d:    c0 83        subb A, 0x83
8d7f:    49           unknown
8d80:    15 0c        beq L241
8d82:    61 bf fe     61 A, 0xbffe
8d85:    91 bf fc     ldw A, 0xbffc
8d88:    d0 07 74     subw A, 0x0774
8d8b:    58           unknown
8d8c:    75           unknown
8d8d:    20

L241:
8d8e:    a1 f1 0a     stb A, 0xf10a
8d91:    90 bf fc     liw A, 0xbffc
8d94:    5f           unknown
8d95:    95           unknown
8d96:    a1 5e 65     stb A, 0x5e65
8d99:    a1 90 00     stb A, 0x9000
8d9c:    7d 50        call A + 0x50
8d9e:    80 75        lib A, 0x75
8da0:    00           HALT

Fn_5a1:
8da1:    05           flag5
8da2:    b1 05 b3     stw A, 0x05b3
8da5:    05           flag5
8da6:    b5 05        unknown
8da8:    b7           unknown
8da9:    05           flag5
8daa:    b9           unknown
8dab:    00           HALT
8dac:    00
8dad:    00
8dae:    00
8daf:    00
8db0:    00
8db1:    ff
8db2:    ff
8db3:    55
8db4:    55
8db5:    aa
8db6:    aa
8db7:    00
8db8:    00
8db9:    80
8dba:    01

Entry_CPU6_MAPPING_RAM_TEST:
8dbb:    90 07 cc     liw A, 0x07cc
8dbe:    50 80        add r?, r?
8dc0:    7d 00        call A + 0x00
8dc2:    "\x1b\x1c\x0cCPU-6 MAPPING RAM TEST, CONTROL-C TO EXIT\r\n\0"
8df1:    22 32        unknown
8df3:    15 3a        beq L232
8df5:    90 07 cc     liw A, 0x07cc
8df8:    50 80        add r?, r?
8dfa:    7d 00        call A + 0x00
8dfc:    "\r\n*** THIS TEST WILL NOT RUN ON CPU-5 ***\r\n\0"
8e28:    90 07 8a     liw A, 0x078a
8e2b:    50 80        add r?, r?
8e2d:    75           unknown
8e2e:    00           HALT

L232:
8e2f:    90 06 d9     liw A, 0x06d9
8e32:    50 80        add r?, r?
8e34:    7d 00        call A + 0x00
8e36:    47           unknown
8e37:    40 ff        unknown
8e39:    01           flag1
8e3a:    00           HALT
8e3b:    02
8e3c:    00
8e3d:    7b
8e3e:    36
8e3f:    01
8e40:    7b
8e41:    33
8e42:    02
8e43:    7b
8e44:    30
8e45:    03
8e46:    7b
8e47:    2d
8e48:    04
8e49:    7b
8e4a:    2a
8e4b:    05
8e4c:    7b
8e4d:    27
8e4e:    06
8e4f:    7b
8e50:    24
8e51:    07
8e52:    7b
8e53:    53
8e54:    7b
8e55:    1f
8e56:    00
8e57:    7b
8e58:    73
8e59:    a1
8e5a:    f1
8e5b:    0a
8e5c:    81
8e5d:    f2
8e5e:    00
8e5f:    2c
8e60:    11
8e61:    cd
8e62:    81
8e63:    f2
8e64:    01
8e65:    c0
8e66:    80
8e67:    43
8e68:    31
8e69:    c0
8e6a:    83
8e6b:    49
8e6c:    15
8e6d:    c1
8e6e:    90
8e6f:    07
8e70:    74
8e71:    50
8e72:    80
8e73:    75
8e74:    00
8e75:    3a
8e76:    85
8e77:    41
8e78:    35
8e79:    04
8e7a:    20
8e7b:    00
8e7c:    7e
8e7d:    45
8e7e:    5c
8e7f:    5e
8e80:    20
8e81:    80
8e82:    60
8e83:    00
8e84:    20
8e85:    d0
8e86:    01
8e87:    00
8e88:    8b
8e89:    28
8e8a:    ab
8e8b:    ac
8e8c:    7b
8e8d:    76
8e8e:    7b
8e8f:    49
8e90:    47
8e91:    80
8e92:    ff
8e93:    01
8e94:    00
8e95:    02
8e96:    00
8e97:    15
8e98:    69
8e99:    31
8e9a:    20
8e9b:    15
8e9c:    eb
8e9d:    30
8e9e:    60
8e9f:    30
8ea0:    80
8ea1:    3f
8ea2:    15
8ea3:    e1
8ea4:    7f
8ea5:    45
8ea6:    09
8ea7:    2e
8ea8:    1c
8ea9:    f8
8eaa:    03
8eab:    00
8eac:    2e
8ead:    0c
8eae:    f9
8eaf:    03
8eb0:    00
8eb1:    80
8eb2:    01
8eb3:    a5
8eb4:    a2
8eb5:    2a
8eb6:    a5
8eb7:    a2
8eb8:    6d
8eb9:    a2
8eba:    a5
8ebb:    a2
8ebc:    60
8ebd:    06
8ebe:    c2
8ebf:    50
8ec0:    84
8ec1:    0f
8ec2:    7b
8ec3:    15
8ec4:    47
8ec5:    40
8ec6:    ff
8ec7:    01
8ec8:    00
8ec9:    02
8eca:    00
8ecb:    09
8ecc:    2e
8ecd:    1c
8ece:    f9
8ecf:    03
8ed0:    00
8ed1:    2e
8ed2:    0c
8ed3:    f8

L0:
8ed4:    03           flag3
8ed5:    00           HALT
8ed6:    2a
8ed7:    73
8ed8:    da

Fn_6d9:
8ed9:    2e           unknown
8eda:    1c f8        b?? L0
8edc:    01           flag1
8edd:    00           HALT
8ede:    2e
8edf:    1c
8ee0:    f9
8ee1:    01
8ee2:    20
8ee3:    2e
8ee4:    1c
8ee5:    fa
8ee6:    01
8ee7:    40
8ee8:    2e
8ee9:    1c
8eea:    fb
8eeb:    01
8eec:    60
8eed:    2e
8eee:    1c
8eef:    fc
8ef0:    01
8ef1:    80
8ef2:    2e
8ef3:    1c
8ef4:    fd
8ef5:    01
8ef6:    a0
8ef7:    2e
8ef8:    1c
8ef9:    fe
8efa:    01
8efb:    c0
8efc:    2e
8efd:    1c
8efe:    ff
8eff:    01
8f00:    e0
8f01:    09
8f02:    73
8f03:    29
8f04:    2e
8f05:    0c
8f06:    f8
8f07:    01
8f08:    00
8f09:    2e
8f0a:    0c
8f0b:    f9
8f0c:    01
8f0d:    20
8f0e:    2e
8f0f:    0c
8f10:    fa
8f11:    01
8f12:    40
8f13:    2e
8f14:    0c
8f15:    fb
8f16:    01
8f17:    60
8f18:    2e
8f19:    0c
8f1a:    fc
8f1b:    01
8f1c:    80
8f1d:    2e
8f1e:    0c
8f1f:    fd
8f20:    01
8f21:    a0
8f22:    2e
8f23:    0c
8f24:    fe
8f25:    01
8f26:    c0
8f27:    2e
8f28:    0c
8f29:    ff
8f2a:    01
8f2b:    e0
8f2c:    09
8f2d:    7f
8f2e:    45
8f2f:    65
8f30:    a1
8f31:    90
8f32:    07
8f33:    cc
8f34:    50
8f35:    80
8f36:    7d
8f37:    00
8f38:    "\r\n*** MAP RAM ERROR ***\r\n\0"
8f52:    a1 f1 0b     stb A, 0xf10b
8f55:    a1 f1 0c     stb A, 0xf10c
8f58:    90 07 8a     liw A, 0x078a
8f5b:    50 80        add r?, r?
8f5d:    75           unknown
8f5e:    00           HALT

Entry_ROM_SELF_TEST:
8f5f:    55 86        alu5 r?, r?
8f61:    3a           xor A, A

L233:
8f62:    85 61        ld r?, [r?++]
8f64:    40 10        unknown
8f66:    d0 07 dd     subw A, 0x07dd
8f69:    50 82        add r?, r?
8f6b:    51 62        sub? r?, r?
8f6d:    15 f3        beq L233
8f6f:    8b 41        unknown
8f71:    01           flag1
8f72:    15 32        beq L234
8f74:    7b 56        call WriteString
8f76:    "\r\n*** PASS ***\r\n\0"
8f87:    a1 f1 0a     stb A, 0xf10a

L3:
8f8a:    7b 40        call WriteString
8f8c:    "PRESS SPACE\x07\r\n\0"

L2:
8f9b:    81 f2 00     ldb A, 0xf200
8f9e:    2c           unknown
8f9f:    11 fa        b1 L2
8fa1:    81 f2 01     ldb A, 0xf201
8fa4:    75           unknown
8fa5:    40 7b        unknown
8fa7:    24
8fa8:    "\r\n*** CHECK SUM ERROR ***\r\n\0"
8fc4:    a1 f1 0b     stb A, 0xf10b
8fc7:    a1 f1 0c     stb A, 0xf10c
8fca:    73 be        jump L3

WriteString:
8fcc:    81 f2 00     ldb A, 0xf200
8fcf:    2c           unknown
8fd0:    2c           unknown
8fd1:    11 f9        b1 WriteString
8fd3:    85 41        ld r?, [r?++]
8fd5:    15 01        beq L1
8fd7:    09           ret 9

L1:
8fd8:    a1 f2 01     stb A, 0xf201
8fdb:    73 ef        jump WriteString
8fdd:    82
8fde:    00
8fdf:    00
