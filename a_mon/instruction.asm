

MNEMONIC_TABLE:

; Flag Manulip instructions, 00-07
;    ds "hltnopfsnfcnfsifcifscfcc"
; misc instructions  08-0f
;    ds "fcaretrti?????????dly???"
; branch instructions 10-1f
;    ds "bc\0bncbn\0bnnbz\0bnzbz\0bltble"
;    ds "bgtbgebs0bs1bs2bs3bs4bs5"
; One arg ALU instructions 20-3f
;    ds "incdecclrnotsrlslrrcrlc"
; Two arg ALU instructions 40-5f
;    ds "addsubandor\0xormov??????"
; all remaining instrctions
;    ds "ld\0st\0jmpcal\0sysdb\0dw\0ds\0"

; Function scan_mnemonic_table
; Takes a pointer into the instruction and finds a matching mnemonic
;   args:
;     YZ = buffer_ptr
;   locals:
;     M = count
;     N = tmp
;     YZ = buffer_ptr
;
;     KL = mnemonic_table_ptr
;       mnemonic_table needs to not cross 256 byte boundary

;   Returns:
;     carry_set if no match
;     offset in X
;     updated buffer ptr in YZ
;
;   Size: 45 bytes

scan_mnemonic_table:
    clr.w   MN
    ld.w    WX, MNEMONIC_TABLE
    mov.w   KL, WX
    st.w    YZ, -(SP) ; TODO: save bytes by using global instead of stack?

mnmloop:
    ld.w    WX, #0300
    ld.w    YZ, (SP)
chrloop:
    ld.b    X, (KL)+
    bz mnm_match
    mov.b   N, X
    ld.b    X, (YZ)+
    sub.b   X, N

    dec.b   W
    bnz chrloop

next:
    add.b   L, W ; saves 3 bytes, but prevents KL from crossing 256byte boundary
    inc.b   M
    ld.b    X, #38 ; Number of entries in MNEMONIC_TABLE
    sub.b   X, M
    bnz mnmloop

; no match
    ld.w YZ, (SP)+
    fsc ; Set carry flag as error
    ret

mnm_match:
    ld.w WX, (SP)+
    mov.b X, M
    ret

; Function assemble_instruction
; Takes a pointer into the instruction assembles it to bytes
assemble_instruction:
    ;call scan_mnemonic_table
    ;bcs error
    ; mnenomic offset in X
    ld.b   Z, #10
    sub.b  Z, X
    bnz assemble_instruction
