
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
884c:    50 80        add A, indexBase
884e:    7d 00        call A + 0x00
8850:    "\x1b\x1c\x0cCPU INSTRUCTION TEST, CONTROL-C TO EXIT\r\n\0"
887d:    6d a2        unknown
887f:    55 80        alu5 r?, r?
8881:    b5 a2        unknown
8883:    60 00 20     60 A, 0x0020 ; This is a testing that the 60 3 byte instruction is working.
                                   ; Which it will use later to test other multi-byte insturctions
                                   ; If the operand isn't consuemed, then a HALT instruction will be executed
8886:    90 05 a1     liw A, 0x05a1
8889:    50 80        add A, indexBase
888b:    5c           unknown ; This might be installing an exception handler?
888c:    90 00 10     liw A, 0x0010

L_888f:
888f:    c5 61        unknown
8891:    e5 01        unknown
8893:    3f           unknown
8894:    15 f9        b_nz L_888f ; clearing all regsiters?
8896:    03           flag3
8897:    07           clear_carry?
8898:    c0 01        lib B, 0x01 ; if A is empty. This would set the overflow flag
889a:    11 01        b1 L_889d ; Some tests for all the branch instructions
889c:    00           HALT

L_889d:
889d:    13 01        b3 L_88a0
889f:    00           HALT

L_88a0:
88a0:    17 01        b7 L_88a3
88a2:    00           HALT

L_88a3:
88a3:    15 01        b_nz L_88a6
88a5:    00           HALT

L_88a6:
88a6:    18 01        b_gt L_88a9
88a8:    00           HALT

L_88a9:
88a9:    10 02        b0 L_88ad ; branch 10 is expected to not branch here
88ab:    11 01        b1 L_88ae ; The author could have used any branch here, but using 11 here
                                ; implies 11 is the opposite of 10

L_88ad:
88ad:    00           HALT

L_88ae:
88ae:    12 02        b2 L_88b2
88b0:    13 01        b3 L_88b3 ; likewise, 13 is the opposite of 12 (and so on, below)

L_88b2:
88b2:    00           HALT

L_88b3:
88b3:    14 02        b_z L_88b7
88b5:    15 01        b_nz L_88b8

L_88b7:
88b7:    00           HALT

L_88b8:
88b8:    16 02        b_lt L_88bc
88ba:    17 01        b7 L_88bd

L_88bc:
88bc:    00           HALT

L_88bd:
88bd:    19 02        b_le L_88c1
88bf:    18 0a        b_gt L_88cb

L_88c1:
88c1:    00           HALT

L_88c2:
88c2:    18 04        b_gt L_88c8
88c4:    00           HALT

L_88c5:
88c5:    18 07        b_gt L_88ce
88c7:    00           HALT

L_88c8:
88c8:    18 fb        b_gt L_88c5
88ca:    00           HALT

L_88cb:
88cb:    18 f5        b_gt L_88c2
88cd:    00           HALT

L_88ce:
88ce:    08           flag8
88cf:    10 01        b0 L_88d2
88d1:    00           HALT

L_88d2:
88d2:    07           clear_carry?
88d3:    11 01        b1 L_88d6
88d5:    00           HALT

L_88d6:
88d6:    06           flag6
88d7:    10 01        b0 L_88da
88d9:    00           HALT

L_88da:
88da:    08           flag8
88db:    11 01        b1 L_88de
88dd:    00           HALT

L_88de:
88de:    02           flag2
88df:    12 01        b2 L_88e2
88e1:    00           HALT

L_88e2:
88e2:    03           flag3
88e3:    13 01        b3 L_88e6
88e5:    00           HALT

L_88e6:
88e6:    01           nop
88e7:    11 01        b1 L_88ea
88e9:    00           HALT

L_88ea:
88ea:    13 01        b3 L_88ed
88ec:    00           HALT

L_88ed:
88ed:    18 01        b_gt L_88f0
88ef:    00           HALT

L_88f0:
88f0:    02           flag2
88f1:    06           flag6
88f2:    01           nop
88f3:    10 01        b0 L_88f6
88f5:    00           HALT

L_88f6:
88f6:    12 01        b2 L_88f9
88f8:    00           HALT

L_88f9:
88f9:    2a           unknown ; This is potentially increment, 
88fa:    11 01        b1 L_88fd
88fc:    00           HALT

L_88fd:
88fd:    13 01        b3 L_8900
88ff:    00           HALT

L_8900:
8900:    14 01        b_z L_8903
8902:    00           HALT

L_8903:
8903:    17 01        b7 L_8906
8905:    00           HALT

L_8906:
8906:    19 01        b_le L_8909
8908:    00           HALT

L_8909:
8909:    2b           unknown
890a:    13 01        b3 L_890d
890c:    00           HALT

L_890d:
890d:    11 01        b1 L_8910
890f:    00           HALT

L_8910:
8910:    16 01        b_lt L_8913
8912:    00           HALT

L_8913:
8913:    19 01        b_le L_8916
8915:    00           HALT

L_8916:
8916:    06           flag6
8917:    02           flag2
8918:    22 70        unknown
891a:    11 01        b1 L_891d
891c:    00           HALT

L_891d:
891d:    13 01        b3 L_8920
891f:    00           HALT

L_8920:
8920:    14 01        b_z L_8923
8922:    00           HALT

L_8923:
8923:    20 70        unknown
8925:    11 01        b1 L_8928
8927:    00           HALT

L_8928:
8928:    13 01        b3 L_892b
892a:    00           HALT

L_892b:
892b:    18 01        b_gt L_892e
892d:    00           HALT

L_892e:
892e:    21 70        unknown
8930:    13 01        b3 L_8933
8932:    00           HALT

L_8933:
8933:    11 01        b1 L_8936
8935:    00           HALT

L_8936:
8936:    14 01        b_z L_8939
8938:    00           HALT

L_8939:
8939:    21 70        unknown
893b:    13 01        b3 L_893e
893d:    00           HALT

L_893e:
893e:    11 01        b1 L_8941
8940:    00           HALT

L_8941:
8941:    16 01        b_lt L_8944
8943:    00           HALT

L_8944:
8944:    20 70        unknown
8946:    13 01        b3 L_8949
8948:    00           HALT

L_8949:
8949:    11 01        b1 L_894c
894b:    00           HALT

L_894c:
894c:    14 01        b_z L_894f
894e:    00           HALT

L_894f:
894f:    06           flag6
8950:    02           flag2
8951:    22 60        unknown ; Using 60 in the operand means the following branch will be skipped
                              ; if 22 doesn't consume it's operand
8953:    11 01        b1 L_8956
8955:    00           HALT

L_8956:
8956:    13 01        b3 L_8959
8958:    00           HALT

L_8959:
8959:    14 01        b_z L_895c
895b:    00           HALT

L_895c:
895c:    20 60        unknown
895e:    11 01        b1 L_8961
8960:    00           HALT

L_8961:
8961:    13 01        b3 L_8964
8963:    00           HALT

L_8964:
8964:    18 01        b_gt L_8967
8966:    00           HALT

L_8967:
8967:    21 60        unknown
8969:    13 01        b3 L_896c
896b:    00           HALT

L_896c:
896c:    11 01        b1 L_896f
896e:    00           HALT

L_896f:
896f:    14 01        b_z L_8972
8971:    00           HALT

L_8972:
8972:    21 60        unknown
8974:    13 01        b3 L_8977
8976:    00           HALT

L_8977:
8977:    11 01        b1 L_897a
8979:    00           HALT

L_897a:
897a:    16 01        b_lt L_897d
897c:    00           HALT

L_897d:
897d:    20 60        unknown
897f:    13 01        b3 L_8982
8981:    00           HALT

L_8982:
8982:    11 01        b1 L_8985
8984:    00           HALT

L_8985:
8985:    14 01        b_z L_8988
8987:    00           HALT

L_8988:
8988:    06           flag6
8989:    02           flag2
898a:    32 20        unknown
898c:    11 01        b1 L_898f
898e:    00           HALT

L_898f:
898f:    13 01        b3 L_8992
8991:    00           HALT

L_8992:
8992:    14 01        b_z L_8995
8994:    00           HALT

L_8995:
8995:    30 20        unknown
8997:    11 01        b1 L_899a
8999:    00           HALT

L_899a:
899a:    13 01        b3 L_899d
899c:    00           HALT

L_899d:
899d:    18 01        b_gt L_89a0
899f:    00           HALT

L_89a0:
89a0:    21 30        unknown
89a2:    13 01        b3 L_89a5
89a4:    00           HALT

L_89a5:
89a5:    11 01        b1 L_89a8
89a7:    00           HALT

L_89a8:
89a8:    14 01        b_z L_89ab
89aa:    00           HALT

L_89ab:
89ab:    31 20        unknown
89ad:    13 01        b3 L_89b0
89af:    00           HALT

L_89b0:
89b0:    11 01        b1 L_89b3
89b2:    00           HALT

L_89b3:
89b3:    16 01        b_lt L_89b6
89b5:    00           HALT

L_89b6:
89b6:    30 20        unknown
89b8:    13 01        b3 L_89bb
89ba:    00           HALT

L_89bb:
89bb:    11 01        b1 L_89be
89bd:    00           HALT

L_89be:
89be:    14 01        b_z L_89c1
89c0:    00           HALT

L_89c1:
89c1:    22 b0        unknown ; Is B0 a two byte instrution that we haven't encountered yet?
89c3:    23 b0        unknown
89c5:    11 01        b1 L_89c8
89c7:    00           HALT

L_89c8:
89c8:    13 01        b3 L_89cb
89ca:    00           HALT

L_89cb:
89cb:    16 01        b_lt L_89ce
89cd:    00           HALT

L_89ce:
89ce:    26 b0        unknown
89d0:    10 01        b0 L_89d3
89d2:    00           HALT

L_89d3:
89d3:    17 01        b7 L_89d6
89d5:    00           HALT

L_89d6:
89d6:    13 01        b3 L_89d9
89d8:    00           HALT

L_89d9:
89d9:    25 b0        unknown
89db:    12 01        b2 L_89de
89dd:    00           HALT

L_89de:
89de:    11 01        b1 L_89e1
89e0:    00           HALT

L_89e1:
89e1:    16 01        b_lt L_89e4
89e3:    00           HALT

L_89e4:
89e4:    20 b0        unknown
89e6:    13 01        b3 L_89e9
89e8:    00           HALT

L_89e9:
89e9:    23 b0        unknown
89eb:    13 01        b3 L_89ee
89ed:    00           HALT

L_89ee:
89ee:    11 01        b1 L_89f1
89f0:    00           HALT

L_89f1:
89f1:    14 01        b_z L_89f4
89f3:    00           HALT

L_89f4:
89f4:    23 b0        unknown
89f6:    24 b0        unknown
89f8:    10 01        b0 L_89fb
89fa:    00           HALT

L_89fb:
89fb:    13 01        b3 L_89fe
89fd:    00           HALT

L_89fe:
89fe:    16 01        b_lt L_8a01
8a00:    00           HALT

L_8a01:
8a01:    27 b0        unknown
8a03:    13 01        b3 L_8a06
8a05:    00           HALT

L_8a06:
8a06:    10 01        b0 L_8a09
8a08:    00           HALT

L_8a09:
8a09:    16 01        b_lt L_8a0c
8a0b:    00           HALT

L_8a0c:
8a0c:    23 b0        unknown
8a0e:    14 01        b_z L_8a11
8a10:    00           HALT

L_8a11:
8a11:    13 01        b3 L_8a14
8a13:    00           HALT

L_8a14:
8a14:    32 60        unknown
8a16:    33 60        unknown
8a18:    13 01        b3 L_8a1b
8a1a:    00           HALT

L_8a1b:
8a1b:    11 01        b1 L_8a1e
8a1d:    00           HALT

L_8a1e:
8a1e:    16 01        b_lt L_8a21
8a20:    00           HALT

L_8a21:
8a21:    36 60        unknown
8a23:    10 01        b0 L_8a26
8a25:    00           HALT

L_8a26:
8a26:    17 01        b7 L_8a29
8a28:    00           HALT

L_8a29:
8a29:    13 01        b3 L_8a2c
8a2b:    00           HALT

L_8a2c:
8a2c:    35 60        unknown
8a2e:    12 01        b2 L_8a31
8a30:    00           HALT

L_8a31:
8a31:    11 01        b1 L_8a34
8a33:    00           HALT

L_8a34:
8a34:    16 01        b_lt L_8a37
8a36:    00           HALT

L_8a37:
8a37:    30 60        unknown
8a39:    13 01        b3 L_8a3c
8a3b:    00           HALT

L_8a3c:
8a3c:    33 60        unknown
8a3e:    13 01        b3 L_8a41
8a40:    00           HALT

L_8a41:
8a41:    11 01        b1 L_8a44
8a43:    00           HALT

L_8a44:
8a44:    14 01        b_z L_8a47
8a46:    00           HALT

L_8a47:
8a47:    33 60        unknown
8a49:    34 60        unknown
8a4b:    10 01        b0 L_8a4e
8a4d:    00           HALT

L_8a4e:
8a4e:    13 01        b3 L_8a51
8a50:    00           HALT

L_8a51:
8a51:    16 01        b_lt L_8a54
8a53:    00           HALT

L_8a54:
8a54:    37 60        unknown
8a56:    13 01        b3 L_8a59
8a58:    00           HALT

L_8a59:
8a59:    10 01        b0 L_8a5c
8a5b:    00           HALT

L_8a5c:
8a5c:    16 01        b_lt L_8a5f
8a5e:    00           HALT

L_8a5f:
8a5f:    33 60        unknown
8a61:    14 01        b_z L_8a64
8a63:    00           HALT

L_8a64:
8a64:    13 01        b3 L_8a67
8a66:    00           HALT

L_8a67:
8a67:    32 40        unknown
8a69:    14 01        b_z L_8a6c
8a6b:    00           HALT

L_8a6c:
8a6c:    3e           unknown
8a6d:    18 01        b_gt L_8a70
8a6f:    00           HALT

L_8a70:
8a70:    3f           unknown
8a71:    14 01        b_z L_8a74
8a73:    00           HALT

L_8a74:
8a74:    3f           unknown
8a75:    16 01        b_lt L_8a78
8a77:    00           HALT

L_8a78:
8a78:    3e           unknown
8a79:    14 01        b_z L_8a7c
8a7b:    00           HALT

L_8a7c:
8a7c:    3a           clear A
8a7d:    3b           unknown
8a7e:    3c           unknown
8a7f:    39           unknown
8a80:    3d           unknown
8a81:    38           unknown
8a82:    38           unknown
8a83:    38           unknown
8a84:    38           unknown
8a85:    14 01        b_z L_8a88
8a87:    00           HALT

L_8a88:
8a88:    10 01        b0 L_8a8b
8a8a:    00           HALT

L_8a8b:
8a8b:    13 01        b3 L_8a8e
8a8d:    00           HALT

L_8a8e:
8a8e:    3a           clear A
8a8f:    80 aa        lib A, 0xaa
8a91:    11 01        b1 L_8a94
8a93:    00           HALT

L_8a94:
8a94:    13 01        b3 L_8a97
8a96:    00           HALT

L_8a97:
8a97:    16 01        b_lt L_8a9a
8a99:    00           HALT

L_8a9a:
8a9a:    25 10        unknown
8a9c:    10 01        b0 L_8a9f
8a9e:    00           HALT

L_8a9f:
8a9f:    12 01        b2 L_8aa2
8aa1:    00           HALT

L_8aa2:
8aa2:    18 01        b_gt L_8aa5
8aa4:    00           HALT

L_8aa5:
8aa5:    80 00        lib A, 0x00
8aa7:    14 01        b_z L_8aaa
8aa9:    00           HALT

L_8aaa:
8aaa:    c0 80        lib B, 0x80
8aac:    10 01        b0 L_8aaf
8aae:    00           HALT

L_8aaf:
8aaf:    12 01        b2 L_8ab2
8ab1:    00           HALT

L_8ab2:
8ab2:    16 01        b_lt L_8ab5
8ab4:    00           HALT

L_8ab5:
8ab5:    25 30        unknown
8ab7:    14 01        b_z L_8aba
8ab9:    00           HALT

L_8aba:
8aba:    3a           clear A
8abb:    90 aa aa     liw A, 0xaaaa
8abe:    11 01        b1 L_8ac1
8ac0:    00           HALT

L_8ac1:
8ac1:    13 01        b3 L_8ac4
8ac3:    00           HALT

L_8ac4:
8ac4:    16 01        b_lt L_8ac7
8ac6:    00           HALT

L_8ac7:
8ac7:    35 00        unknown
8ac9:    10 01        b0 L_8acc
8acb:    00           HALT

L_8acc:
8acc:    12 01        b2 L_8acf
8ace:    00           HALT

L_8acf:
8acf:    18 01        b_gt L_8ad2
8ad1:    00           HALT

L_8ad2:
8ad2:    90 00 00     liw A, 0x0000
8ad5:    14 01        b_z L_8ad8
8ad7:    00           HALT

L_8ad8:
8ad8:    60 80 00     60 A, 0x8000
8adb:    10 01        b0 L_8ade
8add:    00           HALT

L_8ade:
8ade:    12 01        b2 L_8ae1
8ae0:    00           HALT

L_8ae1:
8ae1:    16 01        b_lt L_8ae4
8ae3:    00           HALT

L_8ae4:
8ae4:    35 40        unknown
8ae6:    14 01        b_z L_8ae9
8ae8:    00           HALT

L_8ae9:
8ae9:    80 aa        lib A, 0xaa
8aeb:    c0 aa        lib B, 0xaa
8aed:    41 13        unknown
8aef:    14 01        b_z L_8af2
8af1:    00           HALT

L_8af2:
8af2:    10 01        b0 L_8af5
8af4:    00           HALT

L_8af5:
8af5:    13 01        b3 L_8af8
8af7:    00           HALT

L_8af8:
8af8:    c0 55        lib B, 0x55
8afa:    40 31        add A, B
8afc:    11 01        b1 L_8aff
8afe:    00           HALT

L_8aff:
8aff:    13 01        b3 L_8b02
8b01:    00           HALT

L_8b02:
8b02:    2b           unknown
8b03:    14 01        b_z L_8b06
8b05:    00           HALT

L_8b06:
8b06:    80 aa        lib A, 0xaa
8b08:    43           or A, B
8b09:    31 11        unknown
8b0b:    01           nop
8b0c:    00           HALT
8b0d:    13
8b0e:    01
8b0f:    00
8b10:    2b
8b11:    14
8b12:    01
8b13:    00
8b14:    80
8b15:    55
8b16:    02
8b17:    06
8b18:    44
8b19:    31
8b1a:    10
8b1b:    01
8b1c:    00
8b1d:    12
8b1e:    01
8b1f:    00
8b20:    14
8b21:    01
8b22:    00
8b23:    90
8b24:    55
8b25:    55
8b26:    d0
8b27:    55
8b28:    55
8b29:    51
8b2a:    02
8b2b:    14
8b2c:    01
8b2d:    00
8b2e:    10
8b2f:    01
8b30:    00
8b31:    13
8b32:    01
8b33:    00
8b34:    d0
8b35:    aa
8b36:    aa
8b37:    50
8b38:    20
8b39:    11
8b3a:    01
8b3b:    00
8b3c:    13
8b3d:    01
8b3e:    00
8b3f:    16
8b40:    01
8b41:    00
8b42:    3b
8b43:    14
8b44:    01
8b45:    00
8b46:    90
8b47:    55
8b48:    55
8b49:    53
8b4a:    20
8b4b:    11
8b4c:    01
8b4d:    00
8b4e:    13
8b4f:    01
8b50:    00
8b51:    3b
8b52:    14
8b53:    01
8b54:    00
8b55:    90
8b56:    aa
8b57:    aa
8b58:    06
8b59:    02
8b5a:    54
8b5b:    20
8b5c:    10
8b5d:    01
8b5e:    00
8b5f:    12
8b60:    01
8b61:    00
8b62:    14
8b63:    01
8b64:    00
8b65:    90
8b66:    aa
8b67:    55
8b68:    55
8b69:    02
8b6a:    55
8b6b:    04
8b6c:    55
8b6d:    06
8b6e:    55
8b6f:    08
8b70:    55
8b71:    8a
8b72:    55
8b73:    8c
8b74:    55
8b75:    80
8b76:    50
8b77:    20
8b78:    50
8b79:    40
8b7a:    50
8b7b:    60
8b7c:    51
8b7d:    08
8b7e:    51
8b7f:    8a
8b80:    51
8b81:    ac
8b82:    51
8b83:    c2
8b84:    14
8b85:    01
8b86:    00
8b87:    d0
8b88:    55
8b89:    aa
8b8a:    44
8b8b:    67
8b8c:    44
8b8d:    76
8b8e:    44
8b8f:    67
8b90:    54
8b91:    62
8b92:    14
8b93:    01
8b94:    00
8b95:    45
8b96:    69
8b97:    45
8b98:    78
8b99:    44
8b9a:    c8
8b9b:    44
8b9c:    d9
8b9d:    55
8b9e:    88
8b9f:    14
8ba0:    01
8ba1:    00
8ba2:    90
8ba3:    80
8ba4:    00
8ba5:    d0
8ba6:    00
8ba7:    01
8ba8:    59
8ba9:    12
8baa:    01
8bab:    00
8bac:    10
8bad:    01
8bae:    00
8baf:    18
8bb0:    01
8bb1:    00
8bb2:    03
8bb3:    06
8bb4:    58
8bb5:    13
8bb6:    01
8bb7:    00
8bb8:    11
8bb9:    01
8bba:    00
8bbb:    33
8bbc:    20
8bbd:    14
8bbe:    01
8bbf:    00
8bc0:    90
8bc1:    aa
8bc2:    aa
8bc3:    d0
8bc4:    55
8bc5:    55
8bc6:    5e
8bc7:    5b
8bc8:    5a
8bc9:    14
8bca:    01
8bcb:    00
8bcc:    5a
8bcd:    14
8bce:    01
8bcf:    00
8bd0:    55
8bd1:    82
8bd2:    55
8bd3:    40
8bd4:    5a
8bd5:    51
8bd6:    40
8bd7:    14
8bd8:    01
8bd9:    00
8bda:    91
8bdb:    bf
8bdc:    fc
8bdd:    5e
8bde:    91
8bdf:    00
8be0:    26
8be1:    14
8be2:    01
8be3:    00
8be4:    d1
8be5:    00
8be6:    24
8be7:    16
8be8:    01
8be9:    00
8bea:    61
8beb:    00
8bec:    22
8bed:    18
8bee:    01
8bef:    00
8bf0:    b1
8bf1:    00
8bf2:    2c
8bf3:    14
8bf4:    01
8bf5:    00
8bf6:    91
8bf7:    00
8bf8:    2c
8bf9:    f1
8bfa:    00
8bfb:    2c
8bfc:    16
8bfd:    01
8bfe:    00
8bff:    d1
8c00:    00
8c01:    2c
8c02:    69
8c03:    00
8c04:    2c
8c05:    18
8c06:    01
8c07:    00
8c08:    61
8c09:    00
8c0a:    2c
8c0b:    54
8c0c:    42
8c0d:    58
8c0e:    33
8c0f:    20
8c10:    14
8c11:    01
8c12:    00
8c13:    91
8c14:    bf
8c15:    fc
8c16:    5e
8c17:    91
8c18:    00
8c19:    10
8c1a:    50
8c1b:    80
8c1c:    b1
8c1d:    00
8c1e:    10
8c1f:    91
8c20:    00
8c21:    12
8c22:    50
8c23:    80
8c24:    b1
8c25:    00
8c26:    12
8c27:    91
8c28:    00
8c29:    14
8c2a:    50
8c2b:    80
8c2c:    b1
8c2d:    00
8c2e:    14
8c2f:    91
8c30:    00
8c31:    16
8c32:    50
8c33:    80
8c34:    b1
8c35:    00
8c36:    16
8c37:    91
8c38:    00
8c39:    18
8c3a:    50
8c3b:    80
8c3c:    b1
8c3d:    00
8c3e:    18
8c3f:    92
8c40:    00
8c41:    12
8c42:    18
8c43:    01
8c44:    00
8c45:    d2
8c46:    00
8c47:    14
8c48:    16
8c49:    01
8c4a:    00
8c4b:    54
8c4c:    20
8c4d:    3b
8c4e:    14
8c4f:    01
8c50:    00
8c51:    94
8c52:    1c
8c53:    18
8c54:    01
8c55:    00
8c56:    d4
8c57:    19
8c58:    16
8c59:    01
8c5a:    00
8c5b:    54
8c5c:    20
8c5d:    3b
8c5e:    14
8c5f:    01
8c60:    00
8c61:    93
8c62:    0c
8c63:    d3
8c64:    0c
8c65:    58
8c66:    90
8c67:    ff
8c68:    ba
8c69:    58
8c6a:    14
8c6b:    01
8c6c:    00
8c6d:    73
8c6e:    04
8c6f:    00
8c70:    22
8c71:    00
8c72:    24
8c73:    60
8c74:    00
8c75:    20
8c76:    9a
8c77:    d0
8c78:    ff
8c79:    ff
8c7a:    59
8c7b:    14
8c7c:    01
8c7d:    00
8c7e:    95
8c7f:    41
8c80:    3b
8c81:    14
8c82:    01
8c83:    00
8c84:    95
8c85:    41
8c86:    d5
8c87:    41
8c88:    54
8c89:    20
8c8a:    3b
8c8b:    14
8c8c:    01
8c8d:    00
8c8e:    9a
8c8f:    14
8c90:    01
8c91:    00
8c92:    95
8c93:    42
8c94:    d5
8c95:    42
8c96:    54
8c97:    20
8c98:    3b
8c99:    14
8c9a:    01
8c9b:    00
8c9c:    d0
8c9d:    00
8c9e:    24
8c9f:    9a
8ca0:    65
8ca1:    28
8ca2:    fe
8ca3:    54
8ca4:    40
8ca5:    14
8ca6:    01
8ca7:    00
8ca8:    95
8ca9:    28
8caa:    fc
8cab:    65
8cac:    29
8cad:    02
8cae:    50
8caf:    40
8cb0:    3b
8cb1:    14
8cb2:    01
8cb3:    00
8cb4:    99
8cb5:    65
8cb6:    2a
8cb7:    fc
8cb8:    54
8cb9:    40
8cba:    3b
8cbb:    14
8cbc:    01
8cbd:    00
8cbe:    60
8cbf:    00
8cc0:    10
8cc1:    95
8cc2:    44
8cc3:    d0
8cc4:    ff
8cc5:    ff
8cc6:    59
8cc7:    14
8cc8:    01
8cc9:    00
8cca:    95
8ccb:    45
8ccc:    3b
8ccd:    14
8cce:    01
8ccf:    00
8cd0:    95
8cd1:    45
8cd2:    d5
8cd3:    45
8cd4:    54
8cd5:    20
8cd6:    3b
8cd7:    14
8cd8:    01
8cd9:    00
8cda:    95
8cdb:    46
8cdc:    d5
8cdd:    46
8cde:    54
8cdf:    20
8ce0:    3b
8ce1:    14
8ce2:    01
8ce3:    00
8ce4:    60
8ce5:    00
8ce6:    14
8ce7:    95
8ce8:    44
8ce9:    d5
8cea:    4c
8ceb:    fe
8cec:    54
8ced:    20
8cee:    3b
8cef:    14
8cf0:    01
8cf1:    00
8cf2:    95
8cf3:    4c
8cf4:    fc
8cf5:    d5
8cf6:    4d
8cf7:    02
8cf8:    50
8cf9:    20
8cfa:    3b
8cfb:    14
8cfc:    01
8cfd:    00
8cfe:    95
8cff:    44
8d00:    d5
8d01:    4e
8d02:    fc
8d03:    54
8d04:    20
8d05:    3b
8d06:    14
8d07:    01
8d08:    00
8d09:    0d
8d0a:    90
8d0b:    05
8d0c:    0a
8d0d:    50
8d0e:    80
8d0f:    51
8d10:    04
8d11:    14
8d12:    01
8d13:    00
8d14:    90
8d15:    00
8d16:    3a
8d17:    5f
8d18:    60
8d19:    20
8d1a:    20
8d1b:    7b
8d1c:    06
8d1d:    01
8d1e:    01
8d1f:    00
8d20:    73
8d21:    16
8d22:    00
8d23:    95
8d24:    41
8d25:    d0
8d26:    01
8d27:    01
8d28:    54
8d29:    20
8d2a:    14
8d2b:    01
8d2c:    00
8d2d:    9d
8d2e:    d0
8d2f:    20
8d30:    20
8d31:    54
8d32:    20
8d33:    14
8d34:    01
8d35:    00
8d36:    3e
8d37:    09
8d38:    60
8d39:    09
8d3a:    ef           unknown
8d3b:    90 11 ff     liw A, 0x11ff
8d3e:    b5 41        unknown
8d40:    55 42        alu5 r?, r?
8d42:    90 09 f1     liw A, 0x09f1
8d45:    59           unknown
8d46:    14 01        b_z L_8d49
8d48:    00           HALT

L_8d49:
8d49:    60 09 ef     60 A, 0x09ef
8d4c:    95 41        unknown
8d4e:    d0 11 ff     liw B, 0x11ff
8d51:    41 02        unknown
8d53:    14 01        b_z L_8d56
8d55:    00           HALT

L_8d56:
8d56:    49           cmp B, A
8d57:    14 01        b_z L_8d5a
8d59:    00           HALT

L_8d5a:
8d5a:    90 60 66     liw A, 0x6066
8d5d:    2f 00        unknown
8d5f:    2f 21        unknown
8d61:    59           unknown
8d62:    14 01        b_z L_8d65
8d64:    00           HALT

L_8d65:
8d65:    90 46 11     liw A, 0x4611
8d68:    2f 02        unknown
8d6a:    2f 23        unknown
8d6c:    59           unknown
8d6d:    14 01        b_z L_8d70
8d6f:    00           HALT

L_8d70:
8d70:    81 f2 00     ldb A, 0xf200
8d73:    2c           rotate_right A
8d74:    11 18        b1 L_8d8e
8d76:    81 f2 01     ldb A, 0xf201
8d79:    c0 80        lib B, 0x80
8d7b:    43           or A, B
8d7c:    31 c0        unknown
8d7e:    83 49        unknown
8d80:    15 0c        b_nz L_8d8e
8d82:    61 bf fe     61 A, 0xbffe
8d85:    91 bf fc     ldw A, 0xbffc
8d88:    d0 07 74     liw B, 0x0774
8d8b:    58           unknown
8d8c:    75 20        jump A + 0x20

L_8d8e:
8d8e:    a1 f1 0a     stb A, 0xf10a
8d91:    90 bf fc     liw A, 0xbffc
8d94:    5f           mov sp, A
8d95:    95 a1        unknown
8d97:    5e           unknown
8d98:    65 a1        unknown
8d9a:    90 00 7d     liw A, 0x007d
8d9d:    50 80        add A, indexBase
8d9f:    75 00        jump A + 0x00

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
8dbe:    50 80        add A, indexBase
8dc0:    7d 00        call A + 0x00
8dc2:    "\x1b\x1c\x0cCPU-6 MAPPING RAM TEST, CONTROL-C TO EXIT\r\n\0"
8df1:    22 32        unknown
8df3:    15 3a        b_nz L_8e2f
8df5:    90 07 cc     liw A, 0x07cc
8df8:    50 80        add A, indexBase
8dfa:    7d 00        call A + 0x00
8dfc:    "\r\n*** THIS TEST WILL NOT RUN ON CPU-5 ***\r\n\0"
8e28:    90 07 8a     liw A, 0x078a
8e2b:    50 80        add A, indexBase
8e2d:    75 00        jump A + 0x00

L_8e2f:
8e2f:    90 06 d9     liw A, 0x06d9
8e32:    50 80        add A, indexBase
8e34:    7d 00        call A + 0x00
8e36:    47           unknown
8e37:    40 ff        unknown
8e39:    01           nop
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

L_8ed4:
8ed4:    03           flag3
8ed5:    00           HALT
8ed6:    2a
8ed7:    73
8ed8:    da

Fn_6d9:
8ed9:    2e           unknown
8eda:    1c f8        b_sence2 L_8ed4
8edc:    01           nop
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
8f5b:    50 80        add A, indexBase
8f5d:    75 00        jump A + 0x00

Entry_ROM_SELF_TEST:
8f5f:    55 86        alu5 r?, r?
8f61:    3a           clear A

ChecksumLoop:
8f62:    85 61        unknown ; Load Byte via base+index, post-increment index
8f64:    40 10        unknown
8f66:    d0 07 dd     liw B, 0x07dd
8f69:    50 82        unknown
8f6b:    51 62        sub? r?, r?
8f6d:    15 f3        b_nz ChecksumLoop
8f6f:    8b 41        unknown ; Load Byte via base+index
8f71:    01           nop
8f72:    15 32        b_nz ChecksumFail
8f74:    7b 56        call WriteString
8f76:    "\r\n*** PASS ***\r\n\0"
8f87:    a1 f1 0a     stb A, 0xf10a

L_8f8a:
8f8a:    7b 40        call WriteString
8f8c:    "PRESS SPACE\x07\r\n\0"

WaitForKey:
8f9b:    81 f2 00     ldb A, 0xf200
8f9e:    2c           rotate_right A
8f9f:    11 fa        b1 WaitForKey
8fa1:    81 f2 01     ldb A, 0xf201
8fa4:    75 40        jump A + 0x40

ChecksumFail:
8fa6:    7b 24        call WriteString
8fa8:    "\r\n*** CHECK SUM ERROR ***\r\n\0"
8fc4:    a1 f1 0b     stb A, 0xf10b
8fc7:    a1 f1 0c     stb A, 0xf10c
8fca:    73 be        jump L_8f8a

WriteString:
8fcc:    81 f2 00     ldb A, 0xf200
8fcf:    2c           rotate_right A
8fd0:    2c           rotate_right A
8fd1:    11 f9        b1 WriteString
8fd3:    85 41        ldb A, [sp]++
8fd5:    15 01        b_nz L_8fd8
8fd7:    09           ret

L_8fd8:
8fd8:    a1 f2 01     stb A, 0xf201
8fdb:    73 ef        jump WriteString
8fdd:    82
8fde:    00
8fdf:    00
