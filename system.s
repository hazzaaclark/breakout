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

.SECTION: REGISTERS

;-----------------------------------------------------------

REGISTERS:


VDP_INIT:    EQU   $00000000 
VDP_STATUS:  EQU   $00000004
VDP_CTRL:    EQU   $00000004

;-----------------------------------------------------------

;-----------------------------------------------------------

.SECTION: SYSTEM_MACROS

SYSTEM_MACROS:

DMA_WAIT:          MACRO
@LOOP\@            BTST 1, VDP_STATUS+1 // ALLOCATE A BIT NUMBER TO THE DESTINATION OF THE VDP_STATUS
                   BNE.S @LOOP\@ // JUMP TO THIS VARIABLE IF THE ZERO FLAG IS CLEAR; END THE LOOP AFTER
                   ENDM

;-----------------------------------------------------------
