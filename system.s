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

.SECTION: 

VDP_INIT:          EQU $0000000

DMA_WAIT:          MACRO
@LOOP\@            BTST
DMA_WAIT:          ENDM
