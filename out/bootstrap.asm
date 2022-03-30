
EntryPoint:
fc00:    1a 02        bs1 L_fc04 ; Check the Sense switch to see if we should jump straight to DIAG
fc02:    73 03        jump (PC+0x03) L_fc07

L_fc04:
fc04:    71 80 01     jump #0x8001 L_8001

L_fc07:
fc07:    80 c5        ld.b A, #0xc5
fc09:    a1 f2 00     st.b A, (0xf200) ; Configure the first port on the mux board to 9600 baud, 8N1
fc0c:    80 8c        ld.b A, #0x8c
fc0e:    a1 f2 01     st.b A, (0xf201) ; Write control code FF aka Form Feed to serial
                                       ; Should cause a printer to move to the next page, and
                                       ; cause a CRT terminal to clear the screen
fc11:    0e           delay 4.5ms
fc12:    0e           delay 4.5ms

Prompt:
fc13:    90 10 00     ld.w BA, #0x1000
fc16:    5f           mov SP, BA ; Setup stack at 0x1000 (probally)
fc17:    7b 79        call (PC+0x79) WriteString
fc19:    "D=\0"
fc1c:    7b 72        call (PC+0x72) ReadCharTramp
fc1e:    c0 c6        ld.b C, #0xc6 ; B == 'F'
fc20:    49           sub.b C, A
fc21:    e5 a2        st.b C, -(SP)
fc23:    14 0a        bzs GetNextChar
fc25:    c0 c3        ld.b C, #0xc3 ; B == 'C'
fc27:    49           sub.b C, A
fc28:    14 05        bzs GetNextChar
fc2a:    c0 c8        ld.b C, #0xc8 ; B == 'H'
fc2c:    49           sub.b C, A
fc2d:    15 50        bzc PrintError

GetNextChar:
fc2f:    7b 72        call (PC+0x72) ReadChar
fc31:    c0 50        ld.b C, #0x50
fc33:    40 31        add.b A, C
fc35:    16 48        blt PrintError ; Reject anything below ASCI 0x30 aka '0'
fc37:    c5 a1        ld.b C, (SP)+
fc39:    16 7f        blt L_fcba
fc3b:    18 7f        bgt LoadFromHawkTramp
fc3d:    c0 03        ld.b C, #0x03
fc3f:    49           sub.b C, A
fc40:    18 3d        bgt PrintError
fc42:    d0 0f 00     ld.w DC, #0x0f00
fc45:    f5 a2        st.w DC, -(SP)
fc47:    32 20        clr.w DC
fc49:    f5 a2        st.w DC, -(SP)
fc4b:    c0 88        ld.b C, #0x88
fc4d:    e5 a2        st.b C, -(SP)
fc4f:    d0 83 00     ld.w DC, #0x8300
fc52:    f5 a2        st.w DC, -(SP)
fc54:    d0 81 00     ld.w DC, #0x8100
fc57:    06           fsc

L_fc58:
fc58:    27 30        rlc.b C
fc5a:    29           dec.b A
fc5b:    17 fb        ble L_fc58
fc5d:    f5 a2        st.w DC, -(SP)
fc5f:    2f 14        DMA load 1, 4
fc61:    2f 06        DMA load 0, 6
fc63:    2f a0        DMA load 10, 0
fc65:    90 ff f6     ld.w BA, #0xfff6
fc68:    2f 02        DMA load 0, 2
fc6a:    7b 22        call (PC+0x22) L_fc8e
fc6c:    43           (0x43)
fc6d:    90 01 00     ld.w BA, #0x0100
fc70:    2f 00        DMA load 0, 0
fc72:    90 f0 ff     ld.w BA, #0xf0ff
fc75:    2f 02        DMA load 0, 2
fc77:    7b 15        call (PC+0x15) L_fc8e
fc79:    45 15        mov.b T, A
fc7b:    03           fcn
fc7c:    71 01 03     jump #0x0103 IPL_Entry_point

PrintError:
fc7f:    7b 11        call (PC+0x11) WriteString
fc81:    "\r\nERROR\r\n\0"
fc8b:    07           fcc
fc8c:    73 85        jump (PC-0x7b) Prompt

L_fc8e:
fc8e:    73 73        jump (PC+0x73) L_fd03

ReadCharTramp:
fc90:    73 11        jump (PC+0x11) ReadChar

WriteString:
fc92:    81 f2 00     ld.b A, (0xf200)
fc95:    2c           srl.b A
fc96:    2c           srl.b A
fc97:    11 f9        bcc WriteString
fc99:    85 41        ld.b A, (RT)+
fc9b:    15 01        bzc L_fc9e
fc9d:    09           ret

L_fc9e:
fc9e:    a1 f2 01     st.b A, (0xf201)
fca1:    73 ef        jump (PC-0x11) WriteString

ReadChar:
fca3:    84 ee        ld.b A, @(PC-0x12)
fca5:    2c           srl.b A
fca6:    11 fb        bcc ReadChar
fca8:    84 f5        ld.b A, @(PC-0xb)
fcaa:    c0 80        ld.b C, #0x80
fcac:    43 31        or.b A, C ; char | 0x80 - Force bit 7 to be set
fcae:    c0 e0        ld.b C, #0xe0
fcb0:    49           sub.b C, A ; Check if char is lowercase (greater than 0x60)
fcb1:    16 04        blt L_fcb7
fcb3:    c0 df        ld.b C, #0xdf
fcb5:    42 31        and.b A, C ; Clear bit 6, forcing it to be uppercase

L_fcb7:
fcb7:    a4 e6        st.b A, @(PC-0x1a)
fcb9:    09           ret

L_fcba:
fcba:    73 62        jump (PC+0x62) L_fd1e

LoadFromHawkTramp:
fcbc:    73 02        jump (PC+0x02) LoadFromHawk

L_fcbe:
fcbe:    73 bf        jump (PC-0x41) PrintError

LoadFromHawk:
fcc0:    c0 07        ld.b C, #0x07
fcc2:    49           sub.b C, A
fcc3:    18 ba        bgt PrintError
fcc5:    a1 f1 40     st.b A, (0xf140) ; HawkUnitSelect = A
fcc8:    94 2d        ld.w BA, @(PC+0x2d)
fcca:    d0 00 10     ld.w DC, #0x0010
fccd:    5a           and.w DC, BA
fcce:    14 af        bzs PrintError
fcd0:    3a           clr.w BA
fcd1:    b1 f1 41     st.w BA, (0xf141) ; HawkSectorAddressReg = (0, 0, 0)
fcd4:    7b 3b        call (PC+0x3b) DiskCommand ; DiskCommand(3) - ReturnTrackZero
fcd6:    03           fcn

L_fcd7:
fcd7:    94 1e        ld.w BA, @(PC+0x1e)
fcd9:    d0 04 00     ld.w DC, #0x0400
fcdc:    5a           and.w DC, BA
fcdd:    15 a0        bzc PrintError
fcdf:    d0 00 20     ld.w DC, #0x0020
fce2:    5a           and.w DC, BA
fce3:    14 f2        bzs L_fcd7
fce5:    2f 04        DMA load 0, 4
fce7:    2f 06        DMA load 0, 6
fce9:    90 01 00     ld.w BA, #0x0100 ; DMA transfer destination address
fcec:    2f 00        DMA load 0, 0
fcee:    90 ea 1f     ld.w BA, #0xea1f ; DMA transfer size, 0xffff - (14 sectors at 400 bytes each)
fcf1:    2f 02        DMA load 0, 2
fcf3:    7b 1c        call (PC+0x1c) DiskCommand ; DiskCommand(0) - Read
fcf5:    00           HALT
fcf6:    81 f1 44     ld.b A, (0xf144) ; Check Command Status (0 == success?)
fcf9:    15 84        bzc PrintError
fcfb:    71 01 03     jump #0x0103 IPL_Entry_point ; Transfer control to the IPL that was loaded off disk
fcfe:    7b 2f        call (PC+0x2f) L_fd2f

AlternativeEntryPoint:
fd00:    71 fc 00     jump #0xfc00 EntryPoint

L_fd03:
fd03:    85 41        ld.b A, (RT)+
fd05:    a1 f8 00     st.b A, (0xf800)

L_fd08:
fd08:    81 f8 01     ld.b A, (0xf801)
fd0b:    29           dec.b A
fd0c:    15 fa        bzc L_fd08
fd0e:    84 f6        ld.b A, @(PC-0xa)
fd10:    09           ret

DiskCommand:
fd11:    85 41        ld.b A, (RT)+
fd13:    a1 f1 48     st.b A, (0xf148)

WaitForHawkCommand:
fd16:    84 df        ld.b A, @(PC-0x21) ; 0xf144
fd18:    2c           srl.b A
fd19:    10 fb        bcs WaitForHawkCommand
fd1b:    09           ret

L_fd1c:
fd1c:    73 a0        jump (PC-0x60) L_fcbe

L_fd1e:
fd1e:    a5 a2        st.b A, -(SP)
fd20:    90 1f 40     ld.w BA, #0x1f40
fd23:    5e           mov HL, BA
fd24:    90 81 00     ld.w BA, #0x8100
fd27:    b5 81        st.w BA, (HL)+
fd29:    80 84        ld.b A, #0x84
fd2b:    a5 81        st.b A, (HL)+
fd2d:    85 a1        ld.b A, (SP)+

L_fd2f:
fd2f:    14 04        bzs L_fd35
fd31:    c0 0f        ld.b C, #0x0f
fd33:    40 31        add.b A, C

L_fd35:
fd35:    a5 81        st.b A, (HL)+
fd37:    80 83        ld.b A, #0x83
fd39:    a5 81        st.b A, (HL)+
fd3b:    3a           clr.w BA
fd3c:    b5 81        st.w BA, (HL)+
fd3e:    80 85        ld.b A, #0x85
fd40:    a5 81        st.b A, (HL)+
fd42:    2a           clr.b A

L_fd43:
fd43:    a5 81        st.b A, (HL)+
fd45:    d0 01 90     ld.w DC, #0x0190
fd48:    f5 81        st.w DC, (HL)+
fd4a:    28           inc.b A
fd4b:    c0 0e        ld.b C, #0x0e
fd4d:    49           sub.b C, A
fd4e:    15 f3        bzc L_fd43
fd50:    80 ff        ld.b A, #0xff
fd52:    a5 81        st.b A, (HL)+
fd54:    80 08        ld.b A, #0x08
fd56:    7b 4e        call (PC+0x4e) L_fda6
fd58:    80 41        ld.b A, #0x41
fd5a:    a1 f8 08     st.b A, (0xf808)
fd5d:    0e           delay 4.5ms
fd5e:    2a           clr.b A
fd5f:    a1 f8 08     st.b A, (0xf808)
fd62:    0e           delay 4.5ms
fd63:    a1 f8 08     st.b A, (0xf808)
fd66:    0e           delay 4.5ms
fd67:    90 1f 40     ld.w BA, #0x1f40
fd6a:    2f 00        DMA load 0, 0
fd6c:    51 80        sub.w BA, HL
fd6e:    3b           not.w BA
fd6f:    2f 02        DMA load 0, 2
fd71:    2f 34        DMA load 3, 4
fd73:    2f 06        DMA load 0, 6
fd75:    80 43        ld.b A, #0x43
fd77:    a1 f8 08     st.b A, (0xf808)
fd7a:    0e           delay 4.5ms
fd7b:    0e           delay 4.5ms
fd7c:    7b 20        call (PC+0x20) L_fd9e
fd7e:    73 02        jump (PC+0x02) L_fd82

L_fd80:
fd80:    73 9a        jump (PC-0x66) L_fd1c

L_fd82:
fd82:    90 01 00     ld.w BA, #0x0100
fd85:    2f 00        DMA load 0, 0
fd87:    90 ea 1f     ld.w BA, #0xea1f
fd8a:    2f 02        DMA load 0, 2
fd8c:    2f 34        DMA load 3, 4
fd8e:    2f 06        DMA load 0, 6
fd90:    80 45        ld.b A, #0x45
fd92:    a1 f8 08     st.b A, (0xf808)
fd95:    80 08        ld.b A, #0x08
fd97:    7b 0d        call (PC+0x0d) L_fda6
fd99:    7b 03        call (PC+0x03) L_fd9e
fd9b:    71 01 03     jump #0x0103 IPL_Entry_point

L_fd9e:
fd9e:    81 f8 08     ld.b A, (0xf808)
fda1:    15 01        bzc L_fda4
fda3:    09           ret

L_fda4:
fda4:    73 da        jump (PC-0x26) L_fd80

L_fda6:
fda6:    c1 f8 09     ld.b C, (0xf809)
fda9:    4a           and.b C, A
fdaa:    15 fa        bzc L_fda6
fdac:    09           ret
fdad:    8c           ld.b A, (HL)
fdae:    00           HALT
fdaf:    8b           ld.b A, (EF)
fdb0:    00           HALT
fdb1:    95 41        ld.w BA, (RT)+
fdb3:    b3 03        st.w BA, (PC+0x3)

L_fdb5:
fdb5:    79 4c 93     call #0x4c93 L_4c93
fdb8:    47 be        unk7.b Y, P
fdba:    6d a2        st.w RT, -(SP)
fdbc:    32 40        clr.w RT

L_fdbe:
fdbe:    79 4c e7     call #0x4ce7 L_4ce7
fdc1:    4d           mov.b C, A
fdc2:    14 2a        bzs L_fdee
fdc4:    c0 8d        ld.b C, #0x8d
fdc6:    49           sub.b C, A
fdc7:    14 25        bzs L_fdee
fdc9:    c0 b0        ld.b C, #0xb0
fdcb:    49           sub.b C, A
fdcc:    16 25        blt L_fdf3
fdce:    80 09        ld.b A, #0x09
fdd0:    41 31        sub.b A, C
fdd2:    19 0e        ble L_fde2
fdd4:    80 11        ld.b A, #0x11
fdd6:    41 31        sub.b A, C
fdd8:    16 19        blt L_fdf3
fdda:    c0 05        ld.b C, #0x05
fddc:    49           sub.b C, A
fddd:    18 14        bgt L_fdf3
fddf:    c0 0a        ld.b C, #0x0a
fde1:    48           add.b C, A

L_fde2:
fde2:    80 04        ld.b A, #0x04

L_fde4:
fde4:    07           fcc
fde5:    37 40        rlc.w RT
fde7:    29           dec.b A
fde8:    18 fa        bgt L_fde4
fdea:    40 35        add.b T, C
fdec:    73 d0        jump (PC-0x30) L_fdbe

L_fdee:
fdee:    55 40        mov.w BA, RT
fdf0:    65 a1        ld.w RT, (SP)+
fdf2:    09           ret

L_fdf3:
fdf3:    65 a1        ld.w RT, (SP)+
fdf5:    73 be        jump (PC-0x42) L_fdb5
fdf7:    d5 41        ld.w DC, (RT)+
fdf9:    7d 80        call (A + 0x80)
fdfb:    0c           unknown
fdfc:    d0 4b 65     ld.w DC, #0x4b65
fdff:    f5 00        st.w DC, (BA)
