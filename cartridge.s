;----------------------------------------------------------
;            SEGA MEGA DRIVE CLONE OF BREAKOUT
;                  (C) HARRY CLARK 2023
;----------------------------------------------------------

;----------------------------------------------------------
;     THIS FILE PERTAINS TO THE DECLARATIONS OF
;             THE CARTRIDGE INFORMATION
;----------------------------------------------------------

;----------------------------------------------------------
; THIS IS JUST A GENERAL PRACTISE USED WHEN WRITING SOFTWARE
; FOR MEGA DRIVE GAMES AS SHOWCASED BY DECOMP'S OF MD GAMES
;----------------------------------------------------------

.GLOBAL: CARTRIDGE

CARTRIDGE:

ORG:              $0000 ;; DEFINE A 4 BYTE STACK LOCATION COUNTER
DC.L:             STACK_PTR ;; STACK POINTER
DC.L:             PROGRAM_COUNTER ;; PROGRAM COUNTER
