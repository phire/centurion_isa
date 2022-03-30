
L_ef00:
ef00:    1c 03        bs3 L_ef05
ef02:    71 ef c0     jump #0xefc0 L_efc0

L_ef05:
ef05:    80 01        ld.b A, #0x01
ef07:    1d 01        bs4 L_ef0a
ef09:    2a           clr.b A

L_ef0a:
ef0a:    a1 f1 4b     st.b A, (0xf14b)
ef0d:    90 01 00     ld.w BA, #0x0100
ef10:    b1 ff f0     st.w BA, (0xfff0)
ef13:    a1 ff f4     st.b A, (0xfff4)
ef16:    a1 ff f7     st.b A, (0xfff7)
ef19:    5f           mov SP, BA
ef1a:    90 e8 8f     ld.w BA, #0xe88f
ef1d:    b1 ff f2     st.w BA, (0xfff2)
ef20:    80 03        ld.b A, #0x03
ef22:    7b 06        call (PC+0x06) L_ef2a
ef24:    80 00        ld.b A, #0x00
ef26:    7b 02        call (PC+0x02) L_ef2a
ef28:    75 a0        jump (A + 0xa0)

L_ef2a:
ef2a:    a1 f1 48     st.b A, (0xf148)

L_ef2d:
ef2d:    81 f1 44     ld.b A, (0xf144)
ef30:    2c           srl.b A
ef31:    15 cd        bzc L_ef00
ef33:    10 f8        bcs L_ef2d
ef35:    81 f1 45     ld.b A, (0xf145)
ef38:    c0 30        ld.b C, #0x30
ef3a:    42 31        and.b A, C
ef3c:    49           sub.b C, A
ef3d:    15 ee        bzc L_ef2d
ef3f:    09           ret

L_efc0:
efc0:    90 f0 b0     ld.w BA, #0xf0b0
efc3:    1d 03        bs4 L_efc8
efc5:    90 f0 a0     ld.w BA, #0xf0a0

L_efc8:
efc8:    55 0c        mov.w QU, BA
efca:    90 00 f0     ld.w BA, #0x00f0
efcd:    5f           mov SP, BA

L_efce:
efce:    7b 1f        call (PC+0x1f) L_efef
efd0:    4d           mov.b C, A
efd1:    7b 1c        call (PC+0x1c) L_efef
efd3:    5b           or.w DC, BA
efd4:    4e           unknown
efd5:    7b 18        call (PC+0x18) L_efef
efd7:    45 16        mov.b E, A
efd9:    7b 14        call (PC+0x14) L_efef
efdb:    4c           xor.b C, A

L_efdc:
efdc:    3f           dec RT
efdd:    16 06        blt L_efe5
efdf:    7b 0e        call (PC+0x0e) L_efef
efe1:    a5 61        st.b A, (EF)+
efe3:    73 f7        jump (PC-0x09) L_efdc

L_efe5:
efe5:    7b 08        call (PC+0x08) L_efef
efe7:    15 e2        bzc L_efcb
efe9:    45 99        mov.b L, L
efeb:    15 e1        bzc L_efce
efed:    75 60        jump (A + 0x60)

L_efef:
efef:    85 c8 01     ld.b A, +0x1(QU)+
eff2:    16 d7        blt L_efcb
eff4:    2c           srl.b A
eff5:    11 03        bcc L_effa
eff7:    a5 c8 03     st.b A, +0x3(QU)+

L_effa:
effa:    2c           srl.b A
effb:    11 f2        bcc L_efef
effd:    8e           ld.b A, (QU)
effe:    48           add.b C, A
efff:    09           ret
