;----------------------------------------------------------
;            SEGA MEGA DRIVE CLONE OF BREAKOUT
;                  (C) HARRY CLARK 2023
;----------------------------------------------------------

;----------------------------------------------------------
;      THIS FILE IS HERE JUST FOR THE DEFINES OF THE
;                      GAME LOGIC
;----------------------------------------------------------

.SECTION: GAME_LOGIC

;----------------------------------------------------------

GAME_LOGIC:

extern: CREATE_WINDOW
extern: DRAW_RECTANGLES
extern: DRAW_BALL
extern: GAME_START

PLAYER_X:        RS.L    0
PLAYER_Y:        RS.W    1

;----------------------------------------------------------
