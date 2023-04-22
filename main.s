;----------------------------------------------------------
;            SEGA MEGA DRIVE CLONE OF BREAKOUT
;                  (C) HARRY CLARK 2023
;----------------------------------------------------------

;----------------------------------------------------------
;     THIS SECTION PERTAINS TO THE MAIN FUNCTIONALITY OF
;          THE PROGRAM; USING THE METHODS DEFINED FROM
;                     THE OTHER FILES
;----------------------------------------------------------

INCLUDE: SYSTEM
INCLUDE: GAME_LOGIC

.SECTION: .TEXT

.GLOBAL: MAIN

;----------------------------------------------------------
;                 VRAM MEMORY MAPPING
;----------------------------------------------------------

BLANK_CHAR:      EQU     $0000-$00200
SPRITE_CHAR:     EQU     $0020-$8000
CHAR_MAP:        EQU     4096

;----------------------------------------------------------
;        INTILIASE THE VDP THROUGH THE SYSTEM
;                   AND GAME LOGIC
;----------------------------------------------------------
;----------------------------------------------------------
;
;   CREATE TEMPORARY BUFFERS FOR THE GAME INITIALISATION
;           TO DRAW THE GRAPHICS ON SCREEM
;----------------------------------------------------------

VDP_INIT:        MOVE.L    #0    PLAYER_X
                 MOVE.W    #1    PLAYER_Y

                 DMA_DUMP_DATA    #4*32, $20 ;; DUMP THE DMA CHARACTERS BY 32 BYTES INTO REGISTER 20     

;----------------------------------------------------------



MAIN:
