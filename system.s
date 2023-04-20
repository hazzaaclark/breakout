;----------------------------------------------------------
;            SEGA MEGA DRIVE CLONE OF BREAKOUT
;                  (C) HARRY CLARK 2023
;----------------------------------------------------------

;----------------------------------------------------------
;        THIS FILE PERTAINS TO THE FUNCTIONALTIY
;        OF THE SYSTEM; TAKING INTO ACCOUNT INSTANCE
;        SUCH AS HEAP AND STACK, DMA, AND OTHER MACROS
;        TO HELP PARSE INFORMATION THROUGH THE CONSOLE
;----------------------------------------------------------

;----------------------------------------------------------
; DOCUMENTATION USED: 
; https://www.nxp.com/docs/en/reference-manual/MC68000UM.pdf
;
; https://www.copetti.org/writings/consoles/mega-drive-genesis/
;----------------------------------------------------------

.GLOBAL: SYSTEM

.SECTION: REGISTERS

;-----------------------------------------------------------

REGISTERS:

BIG_ENDIAN: 1 << 30
LITTLE_ENDIAN: 1 << 4

VDP_INIT:    EQU   $00000000 
VDP_STATUS:  EQU   $00000004
VDP_CTRL:    EQU   $00000004

VRAM:        EQU   %01* BIG_ENDIAN +% 0000 * LITLE_ENDIAN
VSRAM:       EQU   %01* BIG_ENDIAN +% 0000 * LITLE_ENDIAN
CRAM:        EQU   %11* BIG_ENDIAN +% 0000 * LITLE_ENDIAN
STACK_SIZE:  EQU   1024

;-----------------------------------------------------------

;-----------------------------------------------------------

.SECTION: SYSTEM_MACROS

SYSTEM_MACROS:

DMA_WAIT:          MACRO
@LOOP\@            BTST 1, VDP_STATUS+1 // ALLOCATE A BIT NUMBER TO THE DESTINATION OF THE VDP_STATUS
                   BNE.S @LOOP\@ // JUMP TO THIS VARIABLE IF THE ZERO FLAG IS CLEAR INSIDE OF THE SUPERVISOR STATE 
                                // END THE LOOP AFTER
                   ENDM

// SIMILAR TO A SHIFT, WHEN DEALING WITH DMA, WHEN THE LAST CORRESPONDING VALUE IS AT THE END
// ROTATE IT BACK AROUND TO A PARTICULAR DESTINATION BY A DETERMINE AMOUNT, (B, W, L)

DMA_CONTROL:       MACRO
                   ROL.L #2, \2 
                   ROR   #2, \2
                   SWAP \2 // SWAP INTO THE FIRST 16 BITS
                   ENDM

;-----------------------------------------------------------
