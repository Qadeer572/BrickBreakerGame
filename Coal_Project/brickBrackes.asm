INCLUDE Irvine32.inc
includelib Irvine32.lib
includelib Kernel32.lib
includelib User32.lib
includelib Winmm.lib
include macros.inc

PlaySound PROTO,
pszSound:PTR BYTE,
hmod:DWORD,
fdwSound:DWORD


.data



SND_FILENAME DWORD 20001h
   musicfile DB "BB.wav",0

heartShape db ' __   __',13,10
           db ' (\_ _/)  ', 13, 10
           db ' ((\ /)) ', 13, 10
           db ' (OOOO) ', 13, 10
           db '  (OO) ', 13, 10
           db '   OO  ', 13, 10
           db 0

 tableHeader db 'Player Name          LEVEL                   Score', 13, 10, 0 
scoreDisplay db '                 ||============================================================================================================================||', 13, 10
             db '                 ||                                                                                                                            ||', 13, 10
             db '                 ||                                                                                                                            ||', 13, 10
             db '                 ||                                                                                                                            ||', 13, 10
             db '                 ||                                                            HIGHEST SCORE                                                   ||', 13, 10
             db '                 ||                                                                                                                            ||', 13, 10
             db '                 ||============================================================================================================================||', 13, 10
             db 0



BRICK_LOGO  db '                         BBBBBBB    RRRRRRR      III    CCCCCCC     K       K         ',13,10
            db '                         B      B   R      R      I    C            K     K           ',13,10
            db '                         BBBBBBB    RRRRRRR       I   C             KKKkK             ',13,10
            db '                         B      B   R     R       I    C            K    K           ',13,10
            db '                         BBBBBBB    R      R     III    CCCCCCC     K      K         ',13,10
            db 0

BREAKER_LOGO db '                                                                               ',13,10
            db '    BBBBBBB    RRRRRRR     III     CCCCCCC     K     K   EEEEEEE    RRRRRRR    ',13,10
            db '    B     B    R      R     I     C            K   K     E          R      R    ',13,10
            db '    BBBBBBB    RRRRRRR      I    C             KKK       EEEE       RRRRRRR    ',13,10
            db '    B     B    R      R     I     C            K   K     E          R     R     ',13,10
            db '    BBBBBBB    R       R   III     CCCCCCC     K     K   EEEEEEE    R      R    ',13,10
            db 0
START             DB '                                               ___ ___ ___ ___ ___   ',13,10
                  DB '                                              / __|_ _| . | . |_ _|  ',13,10
                  DB '                                              \__ \| ||   |   /| |   ',13,10
                  DB '                                              <___/|_||_|_|_\_\|_|   ',13,10
                  DB 0   

INSTRUCTIONS    DB '                                     _ _ _ ___ ___ ___ _ _ ___ ___ _ ___ _ _ ___ ',13,10
                DB '                                    | | \ / __|_ _| . | | |  _|_ _| | . | \ / __>',13,10
                DB '                                    | |   \__ \| ||   |   | <__| || | | |   \__ \',13,10
                DB '                                    |_|_\_<___/|_||_\_`___`___/|_||_`___|_\_<___/',13,10
                DB 0
            
TITLE_SCREEN     db '                                     _   _     _      ___   ___   ___   ___                           ', 13,10
                 db '                                    | | | |   | |    / __| | _ \ |   \ | __|                          ', 13,10
                 db '                                    | |_| |   | |__  \__ \ |  _/ | |) || _|                           ', 13,10
                 db '                                     \___/    |____| |___/ |_|   |___/ |___|                          ', 13,10
                 db 0



EXITED           DB '                                                  _____  _ _ ___   ',13,10
                 DB '                                                 | __\ \/ | |_ _|  ',13,10
                 DB '                                                 | _> \ \ | || |   ',13,10
                 DB '                                                 |____/\_\|_||_|   ',13,10
                 DB 0

circle_row1 db '        ~*~*~*~*~*        ', 13,10, 0
circle_row2 db '     */            \*     ', 13,10, 0
circle_row3 db '   **                 **   ', 13,10, 0
circle_row4 db '  *                      *  ', 13,10, 0
circle_row5 db ' *                         * ', 13,10, 0
circle_row6 db ' *                           * ', 13,10, 0
circle_row7 db ' *                             * ', 13,10, 0
circle_row8 db '  *                              *  ', 13,10, 0
circle_row9 db '   **                               **   ', 13,10, 0
circle_row10 db '     **                                **     ', 13,10, 0
circle_row11 db '        ~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*        ', 13,10, 0

                                           
 POINTER            DB'  <<<<<<<<<<<<<<<<   ',13,10
                    DB 0
;---------Pause /  resume Data-----------

tempPause BYTE "Press 'R' for Resume ",0
tempResume Byte "                     ",0
pauseScreen         db'                 $$$$$$$\  $$$$$$$$\  $$$$$$\  $$\   $$\ $$\      $$\ $$$$$$$$\ ',13,10
                    db'                 $$  __$$\ $$  _____|$$  __$$\ $$ |  $$ |$$$\    $$$ |$$  _____|',13,10
                    db'                 $$ |  $$ |$$ |      $$ /  \__|$$ |  $$ |$$$$\  $$$$ |$$ |      ',13,10
                    db'                 $$$$$$$  |$$$$$\    \$$$$$$\  $$ |  $$ |$$\$$\$$ $$ |$$$$$\    ',13,10
                    db'                 $$  __$$< $$  __|    \____$$\ $$ |  $$ |$$ \$$$  $$ |$$  __|   ',13,10
                    db'                 $$ |  $$ |$$ |      $$\   $$ |$$ |  $$ |$$ |\$  /$$ |$$ |      ',13,10
                    db'                 $$ |  $$ |$$$$$$$$\ \$$$$$$  |\$$$$$$  |$$ | \_/ $$ |$$$$$$$$\ ',13,10
                    db'                 \__|  \__|\________| \______/  \______/ \__|     \__|\________|',13,10
                    db'                                                                                ',13,10
                    db'                                                                                ',13,10
                    db'                                                                                ',13,10
                    db'                             $$$$$$$$\ $$\   $$\ $$$$$$\ $$$$$$$$\              ',13,10
                    db'                             $$  _____|$$ |  $$ |\_$$  _|\__$$  __|             ',13,10
                    db'                             $$ |      \$$\ $$  |  $$ |     $$ |                ',13,10
                    db'                             $$$$$\     \$$$$  /   $$ |     $$ |                ',13,10
                    db'                             $$  __|    $$  $$<    $$ |     $$ |                ',13,10
                    db'                             $$ |      $$  /\$$\   $$ |     $$ |                ',13,10
                    db'                             $$$$$$$$\ $$ /  $$ |$$$$$$\    $$ |                ',13,10
                    db'                             \________|\__|  \__|\______|   \__|                ',13,10
                    db 0; Controls Section


; Controls Section
CONTROLS_SCREEN db '                +================ CONTROLS =================+',13,10
                db '                |                                          |',13,10 
                db '                |    >>> Use [W A S D] to move paddle     |',13,10
                db '                |    >>> Use [1,2,3] to navigate screens  |',13,10
                db '                +================ GAMEPLAY =================+',13,10
                db '                |                                          |',13,10
                db '                |    >>> Hit bricks with the ball         |',13,10
                db '                |    >>> Keep ball above paddle           |',13,10
                db '                |    >>> Break all bricks to win!         |',13,10
                db '                |                                          |',13,10
                db '                +================ SCORING ==================+',13,10
                db '                |                                          |',13,10
                db '                |    >>> Each brick = 10 Points           |',13,10
                db '                |    >>> Level complete = 100 Points      |',13,10
                db '                |    >>> High scores auto-saved           |',13,10
                db '                |                                          |',13,10
                db '                +==========================================+',13,10
                db 0

LEVEL1_LOGO db '                                                                               ',13,10
            db '      L        EEEEEEE   V       V    EEEEEEE   L        111111                ',13,10
            db '      L        E         V       V    E         L           1                  ',13,10
            db '      L        EEEE      V       V    EEEE      L           1                  ',13,10
            db '      L        E         V       V    E         L           1                  ',13,10
            db '      LLLLLL   EEEEEEE    VVVVVVV     EEEEEEE   LLLLLL   111111                ',13,10
            db 0

LEVEL2_LOGO db '                                                                               ',13,10
            db '      L        EEEEEEE   V       V    EEEEEEE   L        222222                ',13,10
            db '      L        E         V       V    E         L        2    2                ',13,10
            db '      L        EEEE      V       V    EEEE      L           22                 ',13,10
            db '      L        E          V     V     E         L         2                    ',13,10
            db '      LLLLLL   EEEEEEE     VVVVV      EEEEEEE   LLLLLL   2222222               ',13,10
            db 0

LEVEL3_LOGO db '                                                                               ',13,10
            db '      L        EEEEEEE   V       V    EEEEEEE   L        333333                ',13,10
            db '      L        E         V       V    E         L            3                 ',13,10
            db '      L        EEEE      V       V    EEEE      L          33                  ',13,10
            db '      L        E          V     V     E         L            3                 ',13,10
            db '      LLLLLL   EEEEEEE     VVVVV      EEEEEEE   LLLLLL   333333                ',13,10
            db 0


gameOverScreen    db'                    ______        ______  _______     _____  _    _ _______ ______                                    ',13,10
                  db'                   / _____)  /\  |  ___ \(_______)   / ___ \| |  | (_______(_____ \                                    ',13,10
                  db'                  | /  ___  /  \ | | _ | |_____     | |   | | |  | |_____   _____) )                                   ',13,10
                  db'                  | | (___)/ /\ \| || || |  ___)    | |   | |\ \/ /|  ___) (_____ (                                    ',13,10
                  db'                  | \____/| |__| | || || | |_____   | |___| | \  / | |_____      | |                                   ',13,10
                  db'                   \_____/|______|_||_||_|_______)   \_____/   \/  |_______)     |_|                                   ',13,10
                  db 0  


;----------------------------
;  <--Checking Variable to Control direction -->
;----------------------------
    
checkleft db 0;
checkright db 0;
checkpaddleleft db 0;
checkpaddleright db 0;
checkup db 0;
checkdown db 0;


;----------------------------
;  <--Player Credentials -->
;----------------------------

                               
    current_Player dd ?;                                                                  
    names db 10 dup(?);
    menuSelect db 0;
    ; Add arrow key scan codes
    UP_ARROW    equ 72
    DOWN_ARROW  equ 80
    ESC_KEY     equ 27
    ENTER_KEY   equ 13
    MAX_NAME_LEN equ 10
    
    invalidNameMsg db "Name must be between 1-10 characters. Try again.",0
    exitConfirmMsg db "Are you sure you want to exit? (Y/N)",0


;----------------------------
;  <--File Handling-->
;----------------------------

namesFile db "output.txt",0    ; File for player names
scoresFile db "Score.txt",0  ; File for scores
levelFile db "Level.txt",0  ; File that Store Level of the Players 
fileHandle dd ?                         ; Variable to store file handle
buffer db 10 dup(0)                     ; Buffer to read/write data
highestScore dd 0                       ; Variable to store highest score
newScore dd ?                           ; Variable to store the current score
HIGH_SCORE db "High Score: ", 0         ; Message to display
bytesRead dd ?                          ; Number of bytes read
bytesWritten dd ?                       ; Number of bytes written


    ;------Brick draw Data------
    brickcolor db ' '   ; Define the character to represent a brick
    xCord db 0          ; Starting X-coordinate (can be updated)
    yCord db 0          ; Starting Y-coordinate (can be updated)
    paddleXCord db 0
    paddleYCord db 0
    bSize db 5          ; Fixed number of rows (height)
    
    ; Fixed brick dimensions (length and width)
    brickLength Dword 12    ; Number of columns (width)
    brickWidth Dword 2   ; Number of rows (height)

    xBallPos  BYTE 20
    yBallPos Byte 20
    padleWidth Byte 12

;----------------------------
;  <--File Handling -->
;----------------------------y


NA1 db 'Player1',0
NA2 db 'Player2',0
NA3 db 'Player3',0
NA4 db 'Player4',0
NA5 db 'Player5',0
NA6 db 'Player6',0
NA7 db 'Player7',0
NA8 db 'Player8',0
NA9 db 'Player9',0
NA10 db 'Player10',0


scores db 0,0,0,0,0,0,0,0,0,0
level db 0,0,0,0,0,0,0,0,0,0

; Add/modify in .data section:




;----------------------------
;  <--Leader Board-->
;----------------------------y

;----------------------------
;  <--Draw Game Boundary-->
;----------------------------y
inputChar Byte ?               
leftBoundary BYTE 4          
rightBoundary BYTE 89      
topBoundary BYTE 1           
bottomBoundary BYTE 29       
levelSelect BYTE 1


; Gravity Select for the ball 

ballXPos    DB 20          ; Initial X-position of the ball
ballYPos    DB 20          ; Initial Y-position of the ball
ballDX      DB -1            ; Ball X-direction velocity (+1 for right, -1 for left)
ballDY      DB 1           ; Ball Y-direction velocity (-1 to move up, +1 to move down)
gravity     DB  0        ; Gravity effect (increasing vertical velocity)ballXPos    DB 20           ; Initial X-position of the ball
BrickX      DB ?
BrickY      DB ?
BrickIndex  DWord ?
;code start from here =========== ===========
;================================================================================================================================================================================================


;================================================================================================================================

;-------------Level 1 brick pattern Cordinate---------- 


Brick Struct
  BrickXPos BYTE ?
  BrickYPos BYTE ?
  BgColor   BYTE ?
Brick ENDS


;========Level 1 Data==========
level1BrickXcord db 5,17,29,41,53,65,77,5,17,29,41,53,65,77,5,17,29,41,53,65,77,5,17,29,41,53,65,77,5,17,29,41,53,65,77
;level1BrickYcord db 10,10,10,10,10,10,10,8,8,8,8,8,8,8,6,6,6,6,6,6,6,4,4,4,4,4,4,4,2,2,2,2,2,2,2
level1BrickYcord db 2,2,2,2,2,2,2,4,4,4,4,4,4,4,6,6,6,6,6,6,6,8,8,8,8,8,8,8,10,10,10,10,10,10,10
brickTypesL1 db 3, 7, 9, 8, 13, 2, 5,
              1, 3, 6, 9, 12, 7, 4,
              9, 8, 7, 6, 15, 4, 3,
              1, 11, 12, 13, 14, 9, 4,
              8, 7, 6, 5, 4, 3, 2

level1BrickStatus db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

L1Loopsize DWord 35


;=========Level 2 Data======
level2BrickXcord db 5,17,29,41,53,65,77,5,17,29,41,53,65,77,5,17,29,41,53,65,77,5,17,29,41,53,65,77,5,17,29,41,53,65,77
level2BrickYcord db 2,2,2,2,2,2,2,4,4,4,4,4,4,4,6,6,6,6,6,6,6,8,8,8,8,8,8,8,10,10,10,10,10,10,10
brickTypesL2 db 3, 7, 9, 8, 13, 2, 5,
              10, 3, 6, 9, 12, 7, 4,
              9, 8, 7, 6, 15, 4, 3,
              1, 11, 12, 13, 14, 9, 4,
              8, 7, 6, 5, 4, 3, 2
alternateTypeL2 db 1, 2, 3, 4, 5, 6, 7,
              8, 9 ,10, 11, 15, 13, 14,
              7, 6, 5, 4, 3, 2, 1,
              12, 1, 2,10, 15, 3, 2,
              9, 10, 11, 12, 13, 14, 15

level2BrickStatus db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

L2Loopsize DWord 35

;=========Level 3 Data======
level3BrickXcord db 5,17,29,41,53,65,77,5,17,29,41,53,65,77,5,17,29,41,53,65,77,5,17,29,41,53,65,77,5,17,29,41,53,65,77
level3BrickYcord db 2,2,2,2,2,2,2,4,4,4,4,4,4,4,6,6,6,6,6,6,6,8,8,8,8,8,8,8,10,10,10,10,10,10,10
brickTypesL3 db 3, 7, 9, 3, 13, 2, 5,
              1, 3, 6, 5, 12, 7, 14,
              9, 14, 7, 7, 15, 4, 3,
              1, 7, 8, 8, 8, 7, 4,
              9, 7, 6, 14, 4, 3, 2
alternateTypeL3 db 1, 2, 3, 4, 5, 6, 7,
              10, 11, 12, 13, 14, 15, 1,
              7, 6, 9, 5, 3, 4, 11,
              1, 14,15 , 11, 12, 10, 3,
              8, 5, 7, 6, 5, 4, 1

;level3BrickStatus db 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
level3BrickStatus db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
L3Loopsize DWord 35
index Dword ?
BrickSY BYTE ?
BrickSX BYTE ?
;-------Player Life Data----------
playerLife DB  3
BrickColors Dword ?
Score DB 0
BrickNum DB 30
onGoingLevel DB 0
level1Completion DB 0
level2Completion DB 0
level3Completion DB 0
ScorePrompt BYTE "Score : ",0
namePrompt  BYTE "Name : ",0
StartPrompt BYTE "Press 'S' to Start",0
removeStart BYTE "                  ",0
levelPrompt BYTE "Level : ",0
playerLifePrompt BYTE  "Remaining Life :",0
overGamePrompt   BYTE  "!!! Game Over ",0
totalScorePrompt BYTE   "Total Score : ",0



; ================================================================================================================================================================================================
; Code Section 
; ================================================================================================================================================================================================


.code

 ;-------------------------------------------------------
; <--File Handling -->
;-------------------------------------------------------

; Procedure to write player names to a separate file
WritePlayerNames PROC
    ; Create/Open names file
    mov edx, OFFSET namesFile
    call CreateOutputFile
    mov fileHandle, eax
    
    ; Check if file was created successfully
    cmp eax, INVALID_HANDLE_VALUE
    je write_error

    ; Write Player1
    mov edx, OFFSET NA1
    mov ecx, SIZEOF NA1
    mov eax, fileHandle
    call WriteToFile
    jc write_error

    ; Write Player2
    mov edx, OFFSET NA2
    mov ecx, SIZEOF NA2
    mov eax, fileHandle
    call WriteToFile
    jc write_error

    ; Write Player3
    mov edx, OFFSET NA3
    mov ecx, SIZEOF NA3
    mov eax, fileHandle
    call WriteToFile
    jc write_error

    ; Write Player4
    mov edx, OFFSET NA4
    mov ecx, SIZEOF NA4
    mov eax, fileHandle
    call WriteToFile
    jc write_error

    ; Write Player5
    mov edx, OFFSET NA5
    mov ecx, SIZEOF NA5
    mov eax, fileHandle
    call WriteToFile
    jc write_error

   ; Write Player6
    mov edx, OFFSET NA6
    mov ecx, SIZEOF NA6
    mov eax, fileHandle
    call WriteToFile
    jc write_error

; Write Player7
    mov edx, OFFSET NA7
    mov ecx, SIZEOF NA7
    mov eax, fileHandle
    call WriteToFile
    jc write_error

; Write Player8
    mov edx, OFFSET NA8
    mov ecx, SIZEOF NA8
    mov eax, fileHandle
    call WriteToFile
    jc write_error

; Write Player9
    mov edx, OFFSET NA9
    mov ecx, SIZEOF NA9
    mov eax, fileHandle
    call WriteToFile
    jc write_error

; Write Player10
    mov edx, OFFSET NA10
    mov ecx, SIZEOF NA10
    mov eax, fileHandle
    call WriteToFile
    jc write_error

    ; Close the file
    mov eax, fileHandle
    call CloseFile
    ret

write_error:
    ret
WritePlayerNames ENDP

; Procedure to write scores to a separate file
WritePlayerScores PROC
    ; Create/Open scores file
    mov edx, OFFSET scoresFile
    call CreateOutputFile
    mov fileHandle, eax
    
    ; Check if file was created successfully
    cmp eax, INVALID_HANDLE_VALUE
    je write_error

    ; Write all scores at once
    mov edx, OFFSET scores
    mov ecx, 10          ; Size of scores array
    mov eax, fileHandle
    call WriteToFile
    jc write_error

    ; Close the file
    mov eax, fileHandle
    call CloseFile
    ret

write_error:
    ret
WritePlayerScores ENDP

; Procedure to read player names from file
ReadPlayerNames PROC
    ; Open existing names file
    mov edx, OFFSET namesFile
    call OpenInputFile
    mov fileHandle, eax

    ; Check if file opened successfully
    cmp eax, INVALID_HANDLE_VALUE
    je read_error

    ; Read Player1
    mov edx, OFFSET NA1
    mov ecx, SIZEOF NA1
    mov eax, fileHandle
    call ReadFromFile
    jc read_error

    ; Read Player2
    mov edx, OFFSET NA2
    mov ecx, SIZEOF NA2
    mov eax, fileHandle
    call ReadFromFile
    jc read_error

    ; Read Player3
    mov edx, OFFSET NA3
    mov ecx, SIZEOF NA3
    mov eax, fileHandle
    call ReadFromFile
    jc read_error

    ; Read Player4
    mov edx, OFFSET NA4
    mov ecx, SIZEOF NA4
    mov eax, fileHandle
    call ReadFromFile
    jc read_error

    ; Read Player5
    mov edx, OFFSET NA5
    mov ecx, SIZEOF NA5
    mov eax, fileHandle
    call ReadFromFile
    jc read_error

; Read Player6
    mov edx, OFFSET NA6
    mov ecx, SIZEOF NA6
    mov eax, fileHandle
    call ReadFromFile
    jc read_error

; Read Player7
    mov edx, OFFSET NA7
    mov ecx, SIZEOF NA7
    mov eax, fileHandle
    call ReadFromFile
    jc read_error

; Read Player8
    mov edx, OFFSET NA8
    mov ecx, SIZEOF NA8
    mov eax, fileHandle
    call ReadFromFile
    jc read_error

; Read Player9
    mov edx, OFFSET NA9
    mov ecx, SIZEOF NA9
    mov eax, fileHandle
    call ReadFromFile
    jc read_error

; Read Player10
    mov edx, OFFSET NA10
    mov ecx, SIZEOF NA10
    mov eax, fileHandle
    call ReadFromFile
    jc read_error

    ; Close the file
    mov eax, fileHandle
    call CloseFile
    ret

read_error:
    ret
ReadPlayerNames ENDP




; Procedure to read scores from file
ReadPlayerScores PROC
    ; Open existing scores file
    mov edx, OFFSET scoresFile
    call OpenInputFile
    mov fileHandle, eax

    ; Check if file opened successfully
    cmp eax, INVALID_HANDLE_VALUE
    je read_error

    ; Read all scores at once
    mov edx, OFFSET scores
    mov ecx, 10          ; Size of scores array
    mov eax, fileHandle
    call ReadFromFile
    jc read_error

    ; Close the file
    mov eax, fileHandle
    call CloseFile
    ret

read_error:
    ret
ReadPlayerScores ENDP


ReadPlayerLevels PROC
    ; Open existing scores file
    mov edx, OFFSET levelFile
    call OpenInputFile
    mov fileHandle, eax

    ; Check if file opened successfully
    cmp eax, INVALID_HANDLE_VALUE
    je read_error

    ; Read all scores at once
    mov edx, OFFSET level
    mov ecx, 10          ; Size of scores array
    mov eax, fileHandle
    call ReadFromFile
    jc read_error

    ; Close the file
    mov eax, fileHandle
    call CloseFile
    ret

read_error:
    ret
ReadPlayerLevels ENDP


; Procedure to write levels to a separate file
WritePlayerLevels PROC
    ; Create/Open levels file
    mov edx, OFFSET levelFile
    call CreateOutputFile
    mov fileHandle, eax
    
    ; Check if file was created successfully
    cmp eax, INVALID_HANDLE_VALUE
    je write_error

    ; Write all levels at once
    mov edx, OFFSET level
    mov ecx, 10          ; Size of levels array
    mov eax, fileHandle
    call WriteToFile
    jc write_error

    ; Close the file
    mov eax, fileHandle
    call CloseFile
    ret

write_error:
    ret
WritePlayerLevels ENDP




; Add this procedure to sort names and scores
; Modified sorting procedure with optimized jumps
SortLeaderboard PROC
    pushad              ; Save all registers

    mov ecx, 4          ; outer loop counter (n-1 iterations)
    
outer_start:
    mov esi, 0         ; index for inner loop

compare_loop:
    ; Compare adjacent scores
    movzx eax, byte ptr [scores + esi]        ; current score
    movzx ebx, byte ptr [scores + esi + 1]    ; next score
    
    ; If current score is less than next score, swap them
    cmp eax, ebx
    jge no_swap        ; if current >= next, don't swap
    
    ; Swap scores
    mov dl, [scores + esi]
    mov dh, [scores + esi + 1]
    mov [scores + esi], dh
    mov [scores + esi + 1], dl
    
    ; Now swap the corresponding names
    push esi
    
    ; Determine which names to swap
    cmp esi, 0
    jne check_second
    mov edi, OFFSET NA1
    mov edx, OFFSET NA2
    jmp swap_names

check_second:
    cmp esi, 1
    jne check_third
    mov edi, OFFSET NA2
    mov edx, OFFSET NA3
    jmp swap_names

check_third:
    cmp esi, 2
    jne check_fourth
    mov edi, OFFSET NA3
    mov edx, OFFSET NA4
    jmp swap_names

check_fourth:
    cmp esi, 3
    jne check_fifth
    mov edi, OFFSET NA4
    mov edx, OFFSET NA5
    jmp swap_names

 check_fifth:
    cmp esi, 4
    jne check_sixth
    mov edi, OFFSET NA5
    mov edx, OFFSET NA6
    jmp swap_names

check_sixth:
    cmp esi, 5
    jne check_seventh
    mov edi, OFFSET NA6
    mov edx, OFFSET NA7
    jmp swap_names

check_seventh:
    cmp esi, 6
    jne check_eighth
    mov edi, OFFSET NA7
    mov edx, OFFSET NA8
    jmp swap_names

check_eighth:
    cmp esi, 7
    jne check_ninth
    mov edi, OFFSET NA8
    mov edx, OFFSET NA9
    jmp swap_names

check_ninth:
    mov edi, OFFSET NA9
    mov edx, OFFSET NA10


swap_names:
    ; Swap the names
    push ecx
    xor ecx, ecx        ; Initialize counter for name swapping
    
swap_char:
    mov al, [edi + ecx]
    mov bl, [edx + ecx]
    mov [edi + ecx], bl
    mov [edx + ecx], al
    inc ecx
    cmp ecx, 8          ; Compare with name length
    jl swap_char
    
    pop ecx
    pop esi

no_swap:
    inc esi
    cmp esi, ecx        ; compare with outer loop counter
    jl compare_loop     ; if not done, continue inner loop
    
    dec ecx             ; decrease outer loop counter
    jnz outer_start     ; if not zero, continue outer loop

sort_done:
    popad               ; Restore all registers
    ret
SortLeaderboard ENDP



;-----------------------------------
; <--Check Boundary Function-->
;-----------------------------------
CheckBoundary PROC
    ; Check if the player is within the left and right boundaries
    mov al, paddleXCord                ; Load current X coordinate

    cmp al, leftBoundary         ; If xCord <= leftBoundary, restrict left movement
    jle leftRestrict

    add al,padleWidth
    cmp al, rightBoundary        ; If xCord >= rightBoundary, restrict right movement
    jge rightRestrict
    ret                          ; If within bounds, do nothing (skip the rest)

leftRestrict:
    mov al, leftBoundary         ; Reset xCord to leftBoundary if player tries to go beyond
    mov paddleXCord, al
    inc paddleXCord
    ret                          ; Return to prevent further movement to the left

rightRestrict:
    mov al, rightBoundary        ; Reset xCord to rightBoundary if player tries to go beyond
    mov paddleXCord,al 
    mov cl,padleWidth
    sub paddleXCord,cl
    ret                          ; Return to prevent further movement to the right
CheckBoundary ENDP

;------------------------------
; <--Draw Game Boundary-->
;------------------------------
DrawBoundary PROC
    mov eax, white 
    mov ebx,16
    mul ebx
    call SetTextColor

    ; Draw top border (horizontal)
    mov dl, leftBoundary
    mov dh, topBoundary
topBorderLoop:
    call Gotoxy
    mov al, ' '                ;Draw horizontal top border
    call WriteChar
    inc dl
    cmp dl, rightBoundary
    jl topBorderLoop
topBorderEnd:

    ; Draw bottom border (horizontal)
    mov dl, leftBoundary
    mov dh, bottomBoundary
bottomBorderLoop:
    call Gotoxy
    mov al, ' '                ; Draw horizontal bottom border
    call WriteChar
    inc dl
    cmp dl, rightBoundary
    jl bottomBorderLoop
bottomBorderEnd:

    ; Draw left border (vertical)
    mov dl, leftBoundary
    dec dl
    mov dh, topBoundary
leftBorderLoop:
    call Gotoxy
    mov al, ' '                ; Draw vertical left border
    call WriteChar
   mov al, ' '                ; Draw vertical left border
    call WriteChar
     
    inc dh
    cmp dh, bottomBoundary
    jle leftBorderLoop
leftBorderEnd:

    ; Draw right border (vertical)
    mov dl, rightBoundary
    mov dh, topBoundary
rightBorderLoop:
    call Gotoxy
    mov al, ' '                ; Draw vertical right border
    call WriteChar
    mov al, ' '                ; Draw vertical right border
    call WriteChar
    inc dh
    cmp dh, bottomBoundary
    jle rightBorderLoop
rightBorderEnd:

    ret
DrawBoundary ENDP

;-----------------------------
; <--Set Background and Text Color for Player-->
;-----------------------------
setCornerColor  PROC
    mov eax, red                ; Set background color to blue (replace with your blue color code)
    mov ebx, 16
    mul eax
    call SetTextColor
    ret
setCornerColor  ENDP
SetPlayerBGColor PROC
    mov eax, Yellow             ; Set background color to blue (replace with your blue color code)
    mov ebx, 16
    mul eax
    call SetTextColor
    ret
SetPlayerBGColor ENDP

;------------------------------------------
; <--Draw Player with Background Color-->
;------------------------------------------
DrawPlayer PROC
   
    call SetPlayerBGColor      ; Set background color for player (blue)
    mov dl, paddleXCord              ; Get the starting X-coordinate
    mov dh, paddleYCord              ; Get the starting Y-coordinate
    call Gotoxy                ; Move to the starting position
    movzx ecx, padleWidth      ; Set width of the player (6 characters wide)
    dec ecx
    call setCornerColor
draw_player_row:
    mov al, " "                ; Set character to draw (can be changed to any other symbol)
    call WriteChar             ; Draw the character at the current position
    
    call SetPlayerBGColor
    ;call nextMove
    ;cornerSetup:
     ; call setCornerColor
    ;nextMove:
    inc dl                     ; Move right (increment X-coordinate)
    loop draw_player_row       ; Repeat for the next character in the row
    call setCornerColor
    mov al," "
    call writeChar
    ret
    
DrawPlayer ENDP

;-------------------------------------------------------
; <--Update Player Position with Background Color-->
;-------------------------------------------------------
UpdatePlayer PROC
    mov dl, paddleXCord              ; Get the starting X-coordinate
    mov dh, paddleYCord              ; Get the starting Y-coordinate
    call Gotoxy                ; Move to the starting position
    mov eax, 1                  
    mov ebx, 16
    mul eax
    call SetTextColor
    movzx ecx, padleWidth      ; Get the player's width (padleWidth) dynamically

clear_player_row:
    mov al, " "                ; Clear by drawing space (background color)
    call WriteChar             ; Clear the character at the current position
    inc dl                     ; Move right (increment X-coordinate)
    loop clear_player_row      ; Repeat for the next character in the row
    ret
UpdatePlayer ENDP
;--------------------------------------------
;   <-----check special Bricks------>
;--------------------------------------------
checkSpecialBrick PROC
  mov index,4
  RandomLoop:
   cmp index,0
   je skip
   mov eax,35
   call randomRange
   
   mov ebx,offset level3BrickStatus
   mov bl,[ebx+eax]
   cmp bl,3
   je RandomLoop

   


   mov ebx,offset brickTypesL3
   mov bl,[ebx+eax]
   cmp bl,8
   je RandomLoop

   cmp bl,14
   je RandomLoop


   mov edx,offset level3BrickStatus
   mov bl,3
   mov [edx+eax],bl


   mov ebx,offset brickTypesL3
   mov dl,[ebx+eax]
   add score,dl

   mov esi,offset level3BrickXcord
   mov dl,[esi+eax]
   mov edi,offset level3BrickYcord
   mov dh,[edi+eax]

   mov BrickSX,dl
   mov BrickSY,dh

   call RemoveSpecialBrick


    

   dec index
   jmp RandomLoop
   skip:
    ret
checkSpecialBrick ENDP
;-------------------------------
; <--Input Handler Function-->
;-------------------------------
HandleInput PROC
    ; Check if 'A' or 'a' key is pressed
    invoke GetKeyState, 'A'
    test ax, 8000h
    jnz MoveLeft
    invoke GetKeyState, 'a'
    test ax, 8000h
    jnz MoveLeft

    ; Check if 'D' or 'd' key is pressed
    invoke GetKeyState, 'D'
    test ax, 8000h
    jnz MoveRight
    invoke GetKeyState, 'd'
    test ax, 8000h
    jnz MoveRight

    invoke GetKeyState, 'P'
    test ax,8000h
    jnz pauseGame
    ret
HandleInput ENDP

;-------------------------------
; <--Left Move-->
;-------------------------------
MoveLeft PROC
    call UpdatePlayer           ; Clear current player position (clear background)
    sub paddleXCord,4                 ; Decrement xCord (move left)
    call CheckBoundary          ; Check if movement is within bounds (not crossing left boundary)
    call DrawPlayer             ; Draw player at the new position
    ret
MoveLeft ENDP

;-------------------------------
; <--Right Move-->
;-------------------------------
MoveRight PROC
    call UpdatePlayer           ; Clear current player position (clear background)
    add paddleXCord,4                   ; Increment xCord (move right)
    call CheckBoundary          ; Check if movement is within bounds (not crossing right boundary)
    call DrawPlayer             ; Draw player at the new position
    ret
MoveRight ENDP


 
;--------------------------------------
;    <----Draw Bricks game---->
;--------------------------------------
DrawBricks PROC
    mov dl,xCord
    mov dh,yCord
    call GotoXY

    mov ebx,16
    mul ebx
    call setTextColor
    mov ecx, brickWidth      ; Set number of rows (height)
    mov ebx, brickLength     ; Set number of columns (width)
draw_row:
    
    push ecx                 ; Save row loop counter
    mov ecx, ebx             ; Number of bricks per row

draw_column:
    mov al, brickcolor       ; Load the brick character
    call WriteChar           ; Display the brick character
    loop draw_column         ; Loop to print all columns in this row

    call CrLf 
    
    mov dl,xCord
    inc yCord
    mov dh,yCord
    call GotoXY

    pop ecx                  
    loop draw_row        
    ret                      ; Return from the procedure
DrawBricks ENDP

BrickCollisionMotion PROC
    ; Horizontal collision check
    mov al, ballXPos
    mov bl, BrickX
    cmp al, bl
    jle SetLeftFlag            ; Ball hits the left boundary of the brick

    mov bl, BrickX
    add bl, 12                 ; Brick width is assumed to be 12 units
    cmp al, bl
    jge SetRightFlag           ; Ball hits the right boundary of the brick

    ; Vertical collision check
    mov al, ballYPos
    mov bl, BrickY
    cmp al, bl
    jle SetUpFlag              ; Ball hits the top boundary of the brick

    mov bl, BrickY
    add bl, 2                  ; Brick height is assumed to be 2 units
    cmp al, bl
    jge SetDownFlag            ; Ball hits the bottom boundary of the brick

    ret                        ; No collision, exit function

; Set collision flags and reverse ball direction
SetLeftFlag:
    mov checkleft, 1
    neg ballDX                 ; Reverse horizontal direction
    ret

SetRightFlag:
    mov checkright, 1
    neg ballDX                 ; Reverse horizontal direction
    ret

SetUpFlag:
    mov checkup, 1
    neg ballDY                 ; Reverse vertical direction
    ret

SetDownFlag:
    mov checkdown, 1
    neg ballDY                 ; Reverse vertical direction
    ret

BrickCollisionMotion ENDP

BallMotionAfterCollision PROC
       ; Check horizontal boundaries and set flags
    mov al, ballXPos
    mov bl,leftBoundary
    inc bl
    cmp al,bl
    jle SetLeftFlag           ; Set flag if ball hits the left boundary
    mov bl,rightBoundary
    dec bl
    cmp al,bl 
    jge SetRightFlag          ; Set flag if ball hits the right boundary

    ; Check vertical boundaries and set flags
    mov al, ballYPos
    mov bl,topBoundary
    inc bl
    cmp al,bl
    jle SetUpFlag             ; Set flag if ball hits the top boundary
    mov bl,bottomBoundary
    dec bl
    cmp al,bl
    jge SetDownFlag           ; Set flag if ball hits the bottom boundary

    ret

SetLeftFlag:
    mov checkleft, 1
    neg ballDX                ; Reverse horizontal direction
    ret

SetRightFlag:
    mov checkright, 1
    neg ballDX                ; Reverse horizontal direction
    ret

SetUpFlag:
    mov checkup, 1
    neg ballDY                ; Reverse vertical direction
    ret

SetDownFlag:
    mov checkdown, 1
    neg ballDY                ; Reverse vertical direction
    ret
BallMotionAfterCollision ENDP

;--------------------------------------
;    <----Ball Functionality ---->
;--------------------------------------
UpdateBall PROC
     
    ; Clear current ball position
    mov dl, ballXPos          ; Current X position
    mov dh, ballYPos          ; Current Y position
    call Gotoxy
    mov eax,black
    mov ebx,16
    mul ebx
    call setTextColor
    mov al, ' '               ; Clear with space character
    call WriteChar

    ; Update ball position based on velocity
    mov al, ballDX
    add ballXPos, al          ; Update X position
    mov al, ballDY
    add ballYPos, al          ; Update Y position

    ; Apply gravity (increment vertical speed)
    mov al, gravity
    add ballDY, al
    call BallMotionAfterCollision
    ret
UpdateBall ENDP






;------------------------------------
;-    <----Collision Checking ------>
;------------------------------------
CheckCollision PROC
    ; Check if the ball is at paddle level
    mov al, ballYPos          ; Load ball's Y position
    mov bl, paddleYCord             ; Load paddle's Y position
    dec bl                    ; Adjust for paddle height if needed
    cmp al, bl
    jne NoCollision           ; Skip if ball is not at paddle level

    ; Check horizontal alignment with paddle
    mov al, ballXPos          ; Load ball's X position
    cmp al, paddleXCord             ; Compare ball X with paddle's left edge
    jl NoCollision            ; Ball is left of paddle

    mov cl, padleWidth       ; Load paddle width
    add cl, paddleXCord            ; Calculate paddle's right edge
    cmp al, cl                ; Compare ball X with paddle's right edge
    jg NoCollision            ; Ball is right of paddle

    ; Collision detected: reverse ball's vertical direction
     
     
    neg ballDY                ; Reverse vertical speed to simulate bounce

    

    ; Set flags based on ball's position relative to paddle edges
    cmp al, paddleXCord             ; Check if ball hits paddle's left edge
    je SetPaddleLeftFlag

    cmp al, cl                ; Check if ball hits paddle's right edge
    je SetPaddleRightFlag

     


    jmp EndCollisionCheck     ; Skip to end if middle of paddle

setstaticX:
   mov ballDx,0
   jmp EndCollisioncheck

SetPaddleLeftFlag:
    mov checkpaddleleft, 1    ; Set left edge collision flag
    mov ballDX,1
    jmp EndCollisionCheck

SetPaddleRightFlag:
    mov checkpaddleright, 1   ; Set right edge collision flag
    mov ballDX,-1
EndCollisionCheck:
    ret

NoCollision:
    call checkMissingPaddle
    ret
CheckCollision ENDP

;-----------------------------------------
;   <----Remove Special Bricks----->
;-----------------------------------------
removeSpecialBrick PROC
    mov BrickIndex, 1          ; Initialize the brick row counter (1st row)
    mov dl, BrickSX             ; Set starting X-coordinate
    mov dh, BrickSY             ; Set starting Y-coordinate

RemoveRow:
    call gotoXY                ; Move cursor to the current brick position
    mov cl, 1                  ; Initialize column counter for clearing characters in the row

RemoveChar:
    mov eax, black             ; Set color to black (assuming 'black' is defined elsewhere)
    mov ebx, 16                ; Multiplier for text color settings
    mul ebx
    call setTextColor          ; Set the text color

    mov al, " "                ; Replace brick character with a space to "remove" it visually
    call writeChar             ; Write the character at the current cursor position

    inc dl                     ; Move to the next column (increment X position)
    inc cl                     ; Increment column counter
    cmp cl, 12                 ; Check if all 12 characters in the row are processed
    jle RemoveChar             ; If not, continue clearing the row

    cmp BrickIndex, 2          ; Check if both rows (2 rows high) have been cleared
    jge exitFunction           ; Exit if both rows are done

    inc BrickIndex             ; Move to the next row
    mov dl, BrickSX              ; Reset X-coordinate to the start of the brick
    mov dh,BrickSY 
    inc dh                     ; Move down to the next row (increment Y position)
    jmp RemoveRow              ; Repeat the process for the next row

exitFunction:
    ret                        ; Return from the procedure
removeSpecialBrick ENDP

;----------------------------------
;   <---Remove Brick---->
;----------------------------------
removeBrick PROC
    mov BrickIndex, 1          ; Initialize the brick row counter (1st row)
    mov dl, BrickX             ; Set starting X-coordinate
    mov dh, BrickY             ; Set starting Y-coordinate

RemoveRow:
    call gotoXY                ; Move cursor to the current brick position
    mov cl, 1                  ; Initialize column counter for clearing characters in the row

RemoveChar:
    mov eax, black             ; Set color to black (assuming 'black' is defined elsewhere)
    mov ebx, 16                ; Multiplier for text color settings
    mul ebx
    call setTextColor          ; Set the text color

    mov al, " "                ; Replace brick character with a space to "remove" it visually
    call writeChar             ; Write the character at the current cursor position

    inc dl                     ; Move to the next column (increment X position)
    inc cl                     ; Increment column counter
    cmp cl, 12                 ; Check if all 12 characters in the row are processed
    jle RemoveChar             ; If not, continue clearing the row

    cmp BrickIndex, 2          ; Check if both rows (2 rows high) have been cleared
    jge exitFunction           ; Exit if both rows are done

    inc BrickIndex             ; Move to the next row
    mov dl, BrickX             ; Reset X-coordinate to the start of the brick
    mov dh,BrickY
    inc dh                     ; Move down to the next row (increment Y position)
    jmp RemoveRow              ; Repeat the process for the next row

exitFunction:
    ret                        ; Return from the procedure
removeBrick ENDP


;--===========================================
; 
; ===============================================

PrintCircle PROC
    ; Initialize the pointer to the start of the circle array
     mov dh, 5
    mov dl, 100
    call GotoXY
    mov eax,Blue
    call SetTextColor
    mov edx,offset circle_row1
    call Writestring
    call CrLf
    mov dh, 6
	mov dl, 100
	call GotoXY
    mov eax,Brown
	call SetTextColor
	mov edx,offset circle_row2
	call Writestring
	call CrLf
	mov dh, 7
	mov dl, 100
	call GotoXY
    mov eax,RED
   call SetTextColor
	mov edx,offset circle_row3
	call Writestring
	call CrLf
	mov dh, 8
	mov dl, 100
	call GotoXY
    mov eax,Green
    call SetTextColor
	mov edx,offset circle_row4
	call Writestring
	call CrLf
	mov dh, 9
	mov dl, 100
	call GotoXY
    mov eax,Blue
	call SetTextColor
	mov edx,offset circle_row5
	call Writestring
   
	call CrLf
	mov dh, 10
	mov dl, 100
	call GotoXY
     mov eax,White
     call SetTextColor
	mov edx,offset circle_row6
	call Writestring
	call CrLf
	mov dh, 11
	mov dl, 100
	call GotoXY
    mov eax,White
    call SetTextColor
    mov edx,offset circle_row7
	call Writestring
    
   
;                                 ////////////////////////////////////////////
    
    call CrLf
	mov dh, 12
	mov dl, 100
	call GotoXY
    mov eax,Yellow
	call SetTextColor
	mov edx,offset circle_row8
	call Writestring
   
    
  
    call CrLf
	mov dh, 13
	mov dl, 105
	call GotoXY
    mov eax,RED
	call SetTextColor
	mov edx,offset circle_row9
    	call Writestring
	call CrLf
	mov dh, 14
	mov dl, 100
	call GotoXY
    mov eax,red
    call SetTextColor
	mov edx,offset circle_row10
	call Writestring
	call CrLf
	mov dh, 15
	mov dl, 100
	call GotoXY
	mov edx,offset circle_row11
	call Writestring
	call CrLf
    

PrintCircle ENDP

removePlayerLife PROC
mov dl,125
 mov dh,14
 call gotoXY
  
 
 mov index,3
  
 printLoop:
  cmp index,0
  je skip

  mov al,' '
  call writeChar
  mov al,' '
  call writeChar
  
   dec index
   jmp printLoop

  skip:
 ret
removePlayerLife ENDP


printPlayerLife PROC
 call removePlayerLife
 mov dl,108
 mov dh,14
 call gotoXY
 mov edx,offset playerLifePrompt
 call writeString
 movzx ecx,playerLife

 mov dl,125
 mov dh,14
 call gotoXY
 movzx eax,playerLife
 mov index,eax
  
 printLoop:
  cmp index,0
  je skip

  mov al,'@'
  call writeChar
  mov al,' '
  call writeChar
  
   dec index
   jmp printLoop

  skip:
 ret
printPlayerLife  ENDP
;------------------------------------------
;  <---Level 3 Brick Hitting check---->
;------------------------------------------
checkBrickL3Hitting PROC
   mov esi, offset level3BrickXcord     ; Load X-coordinate array address
    mov edi, offset level3BrickYcord     ; Load Y-coordinate array address
    
    mov ecx, 0                          ; Initialize brick index to 0
finding_XY_coordinates:
    cmp ecx, 35                          ; Check if all 35 bricks have been processed
    jge exitFunction                     ; Exit if done


      


    ; Check X-coordinate collision

    mov bl, [esi + ecx]                  ; Load current brick's X-coordinate
    mov al, bl
    add al, 12                           ; Calculate the end of the brick (width is 12)



    dec bl
    cmp ballXPos, bl
    je nextStepX
    
    cmp ballXPos, bl
    jl nextBrick                         ; Ball is left of the brick


    nextStepX:
    ;inc al
    cmp ballXPos, al
    jg nextBrick                         ; Ball is right of the brick

    ; Check Y-coordinate collision
    mov bl, [edi + ecx]                  ; Load current brick's Y-coordinate
    mov al, bl
    add al, 2                            ; Calculate the end of the brick (height is 2)

    dec bl
    cmp ballYPos,bl
    je nextStepY

    
    cmp ballYPos, bl
    jl nextBrick                         ; Ball is above the brick

    nextStepY:
   ; inc al
    cmp ballYPos, al
    jg nextBrick                         ; Ball is below the brick


    ;==============Check if the brick is already broken (if hit twice)=========
    mov ebx, offset brickTypesL3
    mov al,[ebx+ecx]
    cmp al,8
    je bounceBack
   


    mov ebx, offset level3BrickStatus    ; Load status array address
    mov al, [ebx + ecx]                  ; Load current brick's status (hit count)
    cmp al, 3                            ; If brick has been hit twice, it's ready to break
    je nextBrick                         ; Skip processing if already broken
    
     
     
     
    ;========= Mark Brick First Hit======


    mov edx,offset BrickTypesL3
    mov dl,[edx+ecx]
    cmp dl,14
    je specialBrick

    mov edx, offset alternateTypeL3
    mov dl,[edx+ecx]
    movzx edx,dl
    mov BrickColors,edx


    cmp al,0
    je firstHit

    ;========= Mark Brick second Hit======
    mov BrickColors,13
    cmp al,1
    je secondHit

    ;========Update Status of Brick========
    inc al
    mov [ebx + ecx], al

    ;=============Store collision coordinates=============
    mov al, [esi + ecx]                   ; X-coordinate of the brickaaaaaa
    mov BrickX, al
    mov al, [edi + ecx]                   ; Y-coordinate of the brick
    mov BrickY, al

    

    ;=============Update the score based on the brick type==============
    mov ebx, offset brickTypesL3
    mov bl, [ebx + ecx]                  ; Get the brick type
    mov al, Score
    add al,bl                           ; Update score by adding the brick's value
    mov Score, al


    ;================Remove the brick visually=========================
    mov dl, BrickX                       ; Set X-coordinate for gotoXY
    mov dh, BrickY                       ; Set Y-coordinate for gotoXY
    call gotoXY                          ; Move cursor to the brick's position
    call removeBrick                     ; Remove the brick visually (ensure this clears the area)

    
     
    

    ;==========UpdateLevel Completion Status=============

    inc BrickNum
    cmp BrickNum,35
    jge exitLevel

    ; Handle ball collision effect (update direction or position)
    call BrickCollisionMotion            ; Alter ball's trajectory after collision
    ret
bounceBack:
    mov al, [esi + ecx]                   ; X-coordinate of the brickaaaaaa
     
    mov BrickX, al
    
    mov al, [edi + ecx]                   ; Y-coordinate of the brick
    cmp al,ballYpos
    jl decrementY
    
    jmp movementY
    decrementY :
      ;dec al
    
    movementY:
       mov BrickY, al


    

    mov dl, BrickX                       ; Set X-coordinate for gotoXY
    mov dh, BrickY                       ; Set Y-coordinate for gotoXY
    call gotoXY
    call BrickCollisionMotion
    ret
firstHit:
    ;======Update Status=====
    inc al
    mov [ebx+ecx],al
    ;=====Store collision coordinates======
    
    mov al, [esi + ecx]                   ; X-coordinate of the brickaaaaaa
    mov BrickX, al
    mov xCord,al
    mov al, [edi + ecx]                   ; Y-coordinate of the brick
    mov BrickY, al
    mov yCord,al
    ;========First Hit===========
    
    mov dl,BrickX
    mov dh,BrickY
    mov xCord,dl
    mov dh,BrickY
    mov yCord,dh


     
    mov eax,BrickColors
    call DrawBricks
    call BrickCollisionMotion
    ret
secondHit:
    ;======Update Status=====
    inc al
    mov [ebx+ecx],al
    mov BrickIndex,ecx
    ;=====Store collision coordinates======
    mov al, [esi + ecx]                   ; X-coordinate of the brickaaaaaa
    mov BrickX, al
    mov xCord,al
    mov al, [edi + ecx]                   ; Y-coordinate of the brick
    mov BrickY, al
    mov yCord,al
    ;========First Hit===========
    push ecx
    call removeBrick
    pop ecx
    mov ebx,offset brickTypesL2
    
    mov eax,11
    mov dl,BrickX
    mov dh,BrickY
    mov xCord,dl
    mov dh,BrickY
    mov yCord,dh
    call DrawBricks
    call BrickCollisionMotion
    ret
specialBrick:
    mov al,3
    mov ebx , offset level3BrickStatus
    mov [ebx+ecx],al
    mov al,[esi+ecx]
    mov BrickX,al
    mov al,[edi+ecx]
    mov BrickY,al

    mov ebx,offset brickTypesL3
    mov al,[ebx+ecx]
    add score,al
    call checkSpecialBrick
    call RemoveBrick
    call BrickCollisionMotion
    add padleWidth,2
    call DrawPlayer
    ret
nextBrick:
    inc ecx                              ; Move to the next brick
    jmp finding_XY_coordinates           ; Check the next brick
exitFunction:
    ret
exitLevel:
   mov level3completion,1
   ret
checkBrickL3Hitting ENDP
 
 


;------------------------------------------
;  <---Level 2 Brick Hitting check---->
;------------------------------------------
checkBrickL2Hitting PROC
   mov esi, offset level2BrickXcord     ; Load X-coordinate array address
    mov edi, offset level2BrickYcord     ; Load Y-coordinate array address
    
    mov ecx, 0                          ; Initialize brick index to 0
finding_XY_coordinates:
    cmp ecx, 35                          ; Check if all 35 bricks have been processed
    jge exitFunction                     ; Exit if done

    ; Check X-coordinate collision
    mov bl, [esi + ecx]                  ; Load current brick's X-coordinate
    mov al, bl
    add al, 12                           ; Calculate the end of the brick (width is 12)
    cmp ballXPos, bl
    jl nextBrick                         ; Ball is left of the brick
    cmp ballXPos, al
    jg nextBrick                         ; Ball is right of the brick

    ; Check Y-coordinate collision
    mov bl, [edi + ecx]                  ; Load current brick's Y-coordinate
    mov al, bl
    add al, 2                            ; Calculate the end of the brick (height is 2)
    cmp ballYPos, bl
    jl nextBrick                         ; Ball is above the brick
    cmp ballYPos, al
    jg nextBrick                         ; Ball is below the brick

    ;==============Check if the brick is already broken (if hit twice)=========
    mov ebx, offset level2BrickStatus    ; Load status array address
    mov al, [ebx + ecx]                  ; Load current brick's status (hit count)
    cmp al, 2                            ; If brick has been hit twice, it's ready to break
    je nextBrick                         ; Skip processing if already broken
    
     
     mov edx, offset AlternateTypeL2
     mov dl,[edx+ecx]
     movzx edx,dl
     mov BrickColors,edx
     
    ;========= Mark Brick First Hit======
    cmp al,0
    je firstHit


    ;========Update Status of Brick========
    inc al
    mov [ebx + ecx], al

    ;=============Store collision coordinates=============
    mov al, [esi + ecx]                   ; X-coordinate of the brickaaaaaa
    mov BrickX, al
    mov al, [edi + ecx]                   ; Y-coordinate of the brick
    mov BrickY, al

    

    ;=============Update the score based on the brick type==============
    mov ebx, offset brickTypesL2
    mov bl, [ebx + ecx]                  ; Get the brick type
    mov al, Score
    add al,bl                           ; Update score by adding the brick's value
    mov Score, al


    ;================Remove the brick visually=========================
    mov dl, BrickX                       ; Set X-coordinate for gotoXY
    mov dh, BrickY                       ; Set Y-coordinate for gotoXY
    call gotoXY                          ; Move cursor to the brick's position
    call removeBrick                     ; Remove the brick visually (ensure this clears the area)

    
     
    

    ;==========UpdateLevel Completion Status=============

    inc BrickNum
    cmp BrickNum,35
    jge exitLevel

    ; Handle ball collision effect (update direction or position)
    call BrickCollisionMotion            ; Alter ball's trajectory after collision
    ret
firstHit:
    ;======Update Status=====
    inc al
    mov [ebx+ecx],al
    ;=====Store collision coordinates======
    
    mov al, [esi + ecx]                   ; X-coordinate of the brickaaaaaa
    mov BrickX, al
    mov xCord,al
    mov al, [edi + ecx]                   ; Y-coordinate of the brick
    mov BrickY, al
    mov yCord,al
    ;========First Hit===========
    
    mov dl,BrickX
    mov dh,BrickY
    mov xCord,dl
    mov dh,BrickY
    mov yCord,dh


     
    mov eax,BrickColors
    call DrawBricks
    call BrickCollisionMotion
    ret
nextBrick:
    inc ecx                              ; Move to the next brick
    jmp finding_XY_coordinates           ; Check the next brick
exitFunction:
    ret
exitLevel:
   mov level2completion,1
   ret
checkBrickL2Hitting ENDP
;------------------------------------------
;  <---Level 1 Brick Hitting check---->
;------------------------------------------

checkBrickL1Hitting PROC
   mov esi, offset level1BrickXcord     ; Load X-coordinate array address
    mov edi, offset level1BrickYcord     ; Load Y-coordinate array address
    
    mov ecx, 0                          ; Initialize brick index to 0
finding_XY_coordinates:
    cmp ecx, 35                          ; Check if all 35 bricks have been processed
    jge exitFunction                     ; Exit if done

    ; Check X-coordinate collision
    mov bl, [esi + ecx]                  ; Load current brick's X-coordinate
    mov al, bl
    add al, 12                           ; Calculate the end of the brick (width is 12)
    cmp ballXPos, bl
    jl nextBrick                         ; Ball is left of the brick
    cmp ballXPos, al
    jg nextBrick                         ; Ball is right of the brick

    ; Check Y-coordinate collision
    mov bl, [edi + ecx]                  ; Load current brick's Y-coordinate
    mov al, bl
    add al, 2                            ; Calculate the end of the brick (height is 2)
    cmp ballYPos, bl
    jl nextBrick                         ; Ball is above the brick
    cmp ballYPos, al
    jg nextBrick                         ; Ball is below the brick

    ; Check if the brick is already broken (if hit twice)
    mov ebx, offset level1BrickStatus    ; Load status array address
    mov al, [ebx + ecx]                  ; Load current brick's status (hit count)
    cmp al, 1                            ; If brick has been hit twice, it's ready to break
    je nextBrick                         ; Skip processing if already broken
    
    ; Mark brick as broken (collision detected)
    mov al, 1                             ; Set status to broken (after two hits)
    mov [ebx + ecx], al

    ; Store collision coordinates
    mov al, [esi + ecx]                   ; X-coordinate of the brick
    mov BrickX, al
    mov al, [edi + ecx]                   ; Y-coordinate of the brick
    mov BrickY, al


    ;=============Update the score based on the brick type==============
    mov ebx, offset brickTypesL1
    mov bl, [ebx + ecx]                  ; Get the brick type
    mov al, Score
    add al,bl                           ; Update score by adding the brick's value
    mov Score, al


    ;================Remove the brick visually=========================
    mov dl, BrickX                       ; Set X-coordinate for gotoXY
    mov dh, BrickY                       ; Set Y-coordinate for gotoXY
    call gotoXY                          ; Move cursor to the brick's position
    call removeBrick                     ; Remove the brick visually (ensure this clears the area)

    
     
    

    ;==========UpdateLevel Completion Status=============

    inc BrickNum
    cmp BrickNum,35
    jge exitLevel

    ; Handle ball collision effect (update direction or position)
    call BrickCollisionMotion            ; Alter ball's trajectory after collision
    ret
nextBrick:
    inc ecx                              ; Move to the next brick
    jmp finding_XY_coordinates           ; Check the next brick
exitFunction:
    ret
exitLevel:
   mov level1completion,1
   ret
checkBrickL1Hitting ENDP


;------------------------------------------------------------
;  <---Print Circle around the Score Board ---->
;------------------------------------------------------------




;------------------------------------------------------
;    <------Print Circle End 
;------------------------------------------------------



;------------------------------------------------------
;    <------check Whether ball hit bottom Boundary
;------------------------------------------------------
checkMissingPaddle PROC
    mov al,ballYPos
    mov bl,bottomBoundary
    dec bl
    cmp al,bl
    je exitProcessGame
    ret
    exitProcessGame:
       dec playerLife
       mov bl,3
       cmp playerLife,0
       je exitgameLoop
        

        mov dl,ballXPos
        mov dh,ballYPos
        call gotoXY
        mov al,' '
        call writechar

        mov ballDX,1
        mov ballDY,1
        mov al,paddleXCord
        mov ballxPos,al
        mov ballYPos,20
         
        
        call DrawBall            ; Redraw the ball at the new position
        call pauseGame

       ret 
      exitgameLoop:


       mov dl,40
       mov dh,20
       call gotoXY

       mov edx,offset totalScorePrompt
       call writeString

       movzx eax,score
       call writeDec

       mov dl,40
       mov dh,22
       call gotoXY
       mov edx,offset overGamePrompt
       call writeString

       
       mov al,score;
       mov scores[4],al
       mov al,names;
       mov NA1,al;
      
      

       mov dl,40
       inc bottomBoundary
       mov dh,bottomBoundary
       
       call gotoXY
       exit
checkMissingPaddle ENDP


;------------------------------------
;-    <----Ball Draw------>
;------------------------------------
DrawBall PROC
    mov eax,white
    call setTextcolor
    mov dl, ballXPos
    mov dh, ballYPos
    call Gotoxy
    mov al, 'O'             
    call WriteChar
    ret
DrawBall ENDP
;------------------------------------
;-    <----Level 3 Proc------>
;------------------------------------

Gamelevel3 PROC
   mov yCord,2
   mov xCord,5
   mov eax,3
   call DrawBricks

   mov yCord,2
   mov xCord,17
   mov eax,7
   call DrawBricks

   mov yCord,2
   mov xCord,29
   mov eax,9
   call DrawBricks

   mov yCord,2
   mov xCord,41
   mov eax,14
   call DrawBricks

   mov yCord,2
   mov xCord,53
   mov eax,13
   call DrawBricks

   mov yCord,2
   mov xCord,65
   mov eax,2
   call DrawBricks

   mov yCord,2
   mov xCord,77
   mov eax,5
   call DrawBricks
    
    
    ;-------Row # 2 -------
   mov yCord,4
   mov xCord,5
   mov eax,14
   mov brickcolor,' '
   call DrawBricks
   mov brickcolor,' '

   mov yCord,4
   mov xCord,17
   mov eax,3
   call DrawBricks

   mov yCord,4
   mov xCord,29
   mov eax,6
   call DrawBricks

   mov yCord,4
   mov xCord,41
   mov eax,1
    
   call DrawBricks

    
   mov yCord,4
   mov xCord,53
   mov eax,12
   call DrawBricks

   mov yCord,4
   mov xCord,65
   mov eax,7
   call DrawBricks

   mov brickcolor,' '
   mov yCord,4
   mov xCord,77
   mov eax,14
   call DrawBricks
   mov brickcolor,' '
        ;-------Row # 3 -------
   mov yCord,6
   mov xCord,5
   mov eax,9
   call DrawBricks
  
   mov yCord,6
   mov xCord,17
   mov eax,15
   call DrawBricks

   mov brickcolor,' '
   mov yCord,6
   mov xCord,29
   mov eax,4
   call DrawBricks

   mov yCord,6
   mov xCord,41
   mov eax,6
   call DrawBricks

    mov yCord,6
    mov xCord,53
    mov eax,15
    call DrawBricks

    mov yCord,6
    mov xCord,65
    mov eax,4
    call DrawBricks

    mov yCord,6
    mov xCord,77
    mov eax,3
    call DrawBricks

    ;-----Row 4-----
    mov yCord,8
    mov xCord,5
    mov eax,1
    call DrawBricks

    mov brickcolor,' '
    mov yCord,8
    mov xCord,17
    mov eax,5
    call DrawBricks
    mov brickcolor,'*'

    mov yCord,8
    mov xCord,29
    mov eax,8
    call DrawBricks

    mov yCord,8
    mov xCord,41
    mov eax,8
    call DrawBricks

    mov yCord,8
    mov xCord,53
    mov eax,8
    call DrawBricks

    mov brickcolor,' '
    mov yCord,8
    mov xCord,65
    mov eax,9
    call DrawBricks
    mov brickcolor,' '

    mov yCord,8
    mov xCord,77
   mov eax,4
    call DrawBricks


    ;-------Row 5------
    mov yCord,10
    mov xCord,5
    mov eax,10
    call DrawBricks

    mov yCord,10
    mov xCord,17
    mov eax,7
    call DrawBricks

    mov yCord,10
    mov xCord,29
    mov eax,6
    call DrawBricks

    mov yCord,10
    mov xCord,41
    mov eax,5
    call DrawBricks

    mov yCord,10
    mov xCord,53
    mov eax,4
    call DrawBricks

    mov yCord,10
    mov xCord,65
    mov eax,3
    call DrawBricks

    mov yCord,10
    mov xCord,77
    mov eax,2
    call DrawBricks
    

    add yCord,10
    mov dl,xCord
    mov dh,yCord
    call GotoXY
    mov eax,1
    call setTextColor
    ret
Gamelevel3 ENDP

;------------------------------------
;-    <----Level 2 Proc------>
;------------------------------------

Gamelevel2 PROC
   mov yCord,2
    mov xCord,5
    mov eax,3
    call DrawBricks

    mov yCord,2
    mov xCord,17
    mov eax,7
    call DrawBricks

    mov yCord,2
    mov xCord,29
    mov eax,9
    call DrawBricks

    mov yCord,2
    mov xCord,41
    mov eax,8
    call DrawBricks

    mov yCord,2
    mov xCord,53
    mov eax,13
    call DrawBricks

    mov yCord,2
    mov xCord,65
    mov eax,2
    call DrawBricks

    mov yCord,2
    mov xCord,77
    mov eax,5
    call DrawBricks
    
    
    ;-------Row # 2 -------
    mov yCord,4
    mov xCord,5
    mov eax,1
    call DrawBricks

    mov yCord,4
    mov xCord,17
    mov eax,3
    call DrawBricks

    mov yCord,4
    mov xCord,29
    mov eax,6
    call DrawBricks

    mov yCord,4
    mov xCord,41
    mov eax,9
    call DrawBricks

    mov yCord,4
    mov xCord,53
    mov eax,12
    call DrawBricks

    mov yCord,4
    mov xCord,65
    mov eax,7
    call DrawBricks

    mov yCord,4
    mov xCord,77
    mov eax,4
    call DrawBricks
        ;-------Row # 3 -------
    mov yCord,6
    mov xCord,5
    mov eax,9
    call DrawBricks

    mov yCord,6
    mov xCord,17
    mov eax,8
    call DrawBricks

    mov yCord,6
    mov xCord,29
    mov eax,7
    call DrawBricks

    mov yCord,6
    mov xCord,41
    mov eax,6
    call DrawBricks

    mov yCord,6
    mov xCord,53
    mov eax,15
    call DrawBricks

    mov yCord,6
    mov xCord,65
    mov eax,4
    call DrawBricks

    mov yCord,6
    mov xCord,77
    mov eax,3
    call DrawBricks

    ;-----Row 4-----
    mov yCord,8
    mov xCord,5
    mov eax,1
    call DrawBricks

    mov yCord,8
    mov xCord,17
    mov eax,11
    call DrawBricks

    mov yCord,8
    mov xCord,29
    mov eax,12
    call DrawBricks

    mov yCord,8
    mov xCord,41
    mov eax,13
    call DrawBricks

    mov yCord,8
    mov xCord,53
    mov eax,14
    call DrawBricks

    mov yCord,8
    mov xCord,65
    mov eax,9
    call DrawBricks

    mov yCord,8
    mov xCord,77
    mov eax,4
    call DrawBricks


    ;-------Row 5------
    mov yCord,10
    mov xCord,5
    mov eax,8
    call DrawBricks

    mov yCord,10
    mov xCord,17
    mov eax,7
    call DrawBricks

    mov yCord,10
    mov xCord,29
    mov eax,6
    call DrawBricks

    mov yCord,10
    mov xCord,41
    mov eax,5
    call DrawBricks

    mov yCord,10
    mov xCord,53
    mov eax,4
    call DrawBricks

    mov yCord,10
    mov xCord,65
    mov eax,3
    call DrawBricks

    mov yCord,10
    mov xCord,77
    mov eax,2
    call DrawBricks
    

    add yCord,10
    mov dl,xCord
    mov dh,yCord
    call GotoXY
    mov eax,1
    call setTextColor
    ret
Gamelevel2 ENDP


;------------------------------------
;-    <----Level 1 Proc------>
;------------------------------------
Gamelevel1 PROC
    mov yCord,2
    mov xCord,5
    mov eax,3
    call DrawBricks

    mov yCord,2
    mov xCord,17
    mov eax,7
    call DrawBricks

    mov yCord,2
    mov xCord,29
    mov eax,9
    call DrawBricks

    mov yCord,2
    mov xCord,41
    mov eax,8
    call DrawBricks

    mov yCord,2
    mov xCord,53
    mov eax,13
    call DrawBricks

    mov yCord,2
    mov xCord,65
    mov eax,2
    call DrawBricks

    mov yCord,2
    mov xCord,77
    mov eax,5
    call DrawBricks
    
    
    ;-------Row # 2 -------
    mov yCord,4
    mov xCord,5
    mov eax,1
    call DrawBricks

    mov yCord,4
    mov xCord,17
    mov eax,3
    call DrawBricks

    mov yCord,4
    mov xCord,29
    mov eax,6
    call DrawBricks

    mov yCord,4
    mov xCord,41
    mov eax,9
    call DrawBricks

    mov yCord,4
    mov xCord,53
    mov eax,12
    call DrawBricks

    mov yCord,4
    mov xCord,65
    mov eax,7
    call DrawBricks

    mov yCord,4
    mov xCord,77
    mov eax,4
    call DrawBricks
        ;-------Row # 3 -------
    mov yCord,6
    mov xCord,5
    mov eax,9
    call DrawBricks

    mov yCord,6
    mov xCord,17
    mov eax,8
    call DrawBricks

    mov yCord,6
    mov xCord,29
    mov eax,7
    call DrawBricks

    mov yCord,6
    mov xCord,41
    mov eax,6
    call DrawBricks

    mov yCord,6
    mov xCord,53
    mov eax,15
    call DrawBricks

    mov yCord,6
    mov xCord,65
    mov eax,4
    call DrawBricks

    mov yCord,6
    mov xCord,77
    mov eax,3
    call DrawBricks

    ;-----Row 4-----
    mov yCord,8
    mov xCord,5
    mov eax,1
    call DrawBricks

    mov yCord,8
    mov xCord,17
    mov eax,11
    call DrawBricks

    mov yCord,8
    mov xCord,29
    mov eax,12
    call DrawBricks

    mov yCord,8
    mov xCord,41
    mov eax,13
    call DrawBricks

    mov yCord,8
    mov xCord,53
    mov eax,14
    call DrawBricks

    mov yCord,8
    mov xCord,65
    mov eax,9
    call DrawBricks

    mov yCord,8
    mov xCord,77
    mov eax,4
    call DrawBricks


    ;-------Row 5------
    mov yCord,10
    mov xCord,5
    mov eax,8
    call DrawBricks

    mov yCord,10
    mov xCord,17
    mov eax,7
    call DrawBricks

    mov yCord,10
    mov xCord,29
    mov eax,6
    call DrawBricks

    mov yCord,10
    mov xCord,41
    mov eax,5
    call DrawBricks

    mov yCord,10
    mov xCord,53
    mov eax,4
    call DrawBricks

    mov yCord,10
    mov xCord,65
    mov eax,3
    call DrawBricks

    mov yCord,10
    mov xCord,77
    mov eax,2
    call DrawBricks
    

    add yCord,10
    mov dl,xCord
    mov dh,yCord
    call GotoXY
    mov eax,1
    call setTextColor
    ret
  Gamelevel1 ENDP

;-----------------------------
;  Game Function  
;----------------------------

PauseGame PROC
    mov dh,15
    mov dl,15
    call gotoXY
    mov edx, OFFSET tempPause
    call WriteString

     
    waitForResume:
        call readChar
        cmp al,'r'
        jne waitforResume
        mov dh,15
        mov dl,15
        call gotoXY
        mov edx, OFFSET tempResume
        call WriteString

        mov eax,black
        mov ebx,16
        mul ebx
        call setTextColor
        mov eax,white
        call setTextcolor
    ret
PauseGame ENDP

;-----------------------------
;  Functionelity  
;----------------------------




InitializeGame PROC
    ; Initialize game variables, draw initial state
    mov yCord, 2
    mov xCord, 5
    mov eax, 3
    call DrawBricks

    ; Initialize other rows and bricks as needed
    ; ...

    ; Initialize ball and paddle positions
    mov ballXPos, 40
    mov ballYPos, 20
    mov ballDX, 1
    mov ballDY, -1
    mov xCord, 40
    mov yCord, 22
    ret
InitializeGame ENDP

DrawGame PROC

    call ClearScreen

    ; Draw bricks
    call DrawBricks

    ; Draw paddle
    call DrawPlayer

    ; Draw ball
    call DrawBall
    ret
DrawGame ENDP

ClearScreen PROC
    call clrscr
    ret
ClearScreen ENDP




  ;----------------------------
  ;
  ;   <--Main function-->
  ;
  ;-----------------------------


main PROC

   INVOKE PlaySound, OFFSET musicfile, NULL, snd_filename

; Display Logo of the game 
    mov dh,0
    mov dl,0
    call GotoXY
    mov eax,RED
    call SetTextColor
    call CrLf
    call Crlf
    mov edx,OFFSET BRICK_LOGO
    call Writestring
    call Crlf
    call Crlf
    mov dh,10
    mov dl,30
    call GotoXY
    mov eax,Yellow
    call SetTextColor
    call CrLf
    call Crlf
    mov edx,OFFSET BREAKER_LOGO
    call Writestring
    call Crlf
    call Crlf
    call waitmsg;
    call clrscr;



  ; Name Input 

  ;------------------------------------
  ;  <--Enter Name-->
  ;-----------------------------------
   ;NAME INPUT
    mov dh,0
    mov dl,0
    call gotoxy
    mwrite "Enter Name :"
    mov edx,offset names
    mov ecx,20
    call readstring
    mov current_Player,eax;
    call clrscr

     mov eax,White
    call SetTextColor

    ;-------------------------------------------
    ;         <----Start Manu---->
    ;------------------------------------------
    point1:
        mov dl,70
        mov dh,3
        call gotoxy
        mov eax,GREEN
        call SetTextColor
        mov edx,offset POINTER
        call writestring
        mov menuSelect,1
    jmp start_tab

    point2:
        mov dl,80
        mov dh,12
        call gotoxy
        mov eax,Yellow
        call SetTextColor
        mov edx,offset POINTER
        call writestring
        mov menuSelect,2
    jmp start_tab

    point3:
        mov dl,80
        mov dh,15
        call gotoxy
        mov eax,white
        call SetTextColor
        mov edx,offset POINTER
        call writestring
        mov menuSelect,3
    jmp start_tab

    point4:
        mov dl,70
        mov dh,27
        call gotoxy
        mov eax,RED
        call SetTextColor
        mov edx,offset POINTER
        call writestring
        mov menuSelect,4
    jmp start_tab

;--------------------------------
;   <-----Display start Manu--->
;---------------------------------
  start_tab:
     ; Display "Start"
    mov dl, 0
    mov dh, 1
    call gotoxy
    mov eax,GREEN
    call SetTextColor
    mov edx, offset START
    call writestring

    ; Display "Instructions"
    mov dl, 0
    mov dh, 10
    call gotoxy
    mov eax,YELLOW
    call SetTextColor
    mov edx, offset INSTRUCTIONS
    call writestring

    ; Display "Exit"
   

    mov dl, 0
    mov dh, 17
    call gotoxy
    mov eax,BROWN
    call SetTextColor
    mov edx, offset TITLE_SCREEN
    call writestring


     ; Display "Exit"
    mov dl, 0
    mov dh, 25
    call gotoxy
    mov eax,RED
    call SetTextColor
    mov edx, offset EXITED
    call writestring
    

    call readchar
    call clrscr
    cmp al,'1'
    je point1
    cmp al,'2'
    je point2
    cmp al,'3'
    je point3
    cmp al,13
    cmp al,'4'
    je point4

    je selection

;----------------------------------
;   <---select in Manu---->
;-----------------------------------
selection:
    cmp menuSelect,1
    je startGame
    cmp menuSelect,2
    je INSTRUCTIONSSCREEN
    cmp menuSelect,3
    je highScore;
    cmp menuSelect,4
    je confirmExit    ; New label to confirm exit

    ;---------------------
    ;  <--Nae Validation-->
    ;---------------------
    validateName:
        cmp ecx,0     ; Check if name is empty
        je invalidName
        cmp ecx,MAX_NAME_LEN
        ja invalidName
        ret

    invalidName:
        mov edx,OFFSET invalidNameMsg
        call WriteString
        call Crlf
;        jmp nameInput  Jump back to name input

    confirmExit:
        mov edx,OFFSET exitConfirmMsg
        call WriteString
        call ReadChar
        cmp al,'Y'
        je exitGame
        cmp al,'y'
        je exitGame
        jmp start_tab  

    exitGame:
        mov eax,0     ; Return code 0
        call ExitProcess
;-----------------------------
;   <---start Game Manu--->
;-----------------------------
startGame:

   level1Label:
        mov dl,50
        mov dh,1
        call gotoxy
        mov edx,offset POINTER
        call writestring
        mov levelSelect,1
    jmp  start_level

    level2Label:
        mov dl,50
        mov dh,10
        call gotoxy
        mov edx,offset POINTER
        call writestring
        mov levelSelect,2
    jmp  start_level

    level3Label:
        mov dl,50
        mov dh,20
        call gotoxy
        mov edx,offset POINTER
        call writestring
        mov levelSelect,3
    jmp  start_level

    ;-----------------------------------------
    ;   <---display context of level manu--->
    ;----------------------------------------
    start_level:
     
    mov dl,0
    mov dh,1
    call gotoxy
    mov edx,offset LEVEL1_LOGO
    call writestring

    mov dl,0
    mov dh,10
    call gotoxy
    mov edx,offset LEVEL2_LOGO
    call writestring

    mov dl,0
    mov dh,20
    call gotoxy
    mov edx,offset LEVEL3_LOGO 
    call writestring
    

    call readchar
    call clrscr
    cmp al,ESC_KEY
    je start_tab
    cmp al,'1'
    je level1Label
    cmp al,'2'
    je level2Label
    cmp al,'3'
    je level3Label
    cmp al,13
    je selectionLevel


  selectionLevel:
    cmp levelSelect,1
    je  level1Start
    cmp levelSelect,2
    je level2Start
    cmp levelSelect,3
    je level3Start 


level1Start:
    mov onGoingLevel,1
    mov dh,18
    mov dl,45
    call gotoXY
    mov eax,white
    call setTextColor


    call clrscr
    call PrintCircle;
    mov ballXPos,20
    mov ballYPos,20
    mov level1Completion,0
    call Gamelevel1
    call DrawBoundary
    mov eax,3
    mov paddleXCord,10
    mov paddleYCord,28
    call DrawPlayer
    
    
    mov eax,0
    call setTextColor

    mov dl,xBallPos
    mov dh,yBallPos
    call GotoXY
    call DrawBall
    mov eax,Green
    call setTextcolor
    mov al,'0'

    mov dh,18
    mov dl,45
    call gotoXY
    mov eax,white
    call setTextColor

    mov brickNum,0
    mov edx,offset StartPrompt
    call WriteString
    againL1:
    call readChar
    cmp al,'s'
    jne againL1

    mov dh,18
    mov dl,45
    call gotoXY
    mov edx,offset removeStart
    call writeString
    jmp L1
level2Start:
    mov onGoingLevel,2  
    mov padleWidth,8

    call clrscr
    call PrintCircle;
    mov ballXPos,20
    mov ballYPos,20
    mov level1Completion,0
    call Gamelevel2
    call DrawBoundary
    mov eax,3
    mov paddleXCord,10
    mov paddleYCord,28
    call DrawPlayer
    
    
    mov dl,xBallPos
    mov dh,yBallPos
    call GotoXY
    call DrawBall
    mov eax,Green
    call setTextcolor
    mov al,'0'

    mov dh,18
    mov dl,45
    call gotoXY
    mov eax,white
    call setTextColor

    mov brickNum,0
    mov edx,offset StartPrompt
    call WriteString
    againL2:
    call readChar
    cmp al,'s'
    jne againL2

    mov dh,18
    mov dl,45
    call gotoXY
    mov edx,offset removeStart
    call writeString

    jmp L1


level3Start:
    mov onGoingLevel,3  
    mov padleWidth,6

    call clrscr
    call PrintCircle;
    mov ballXPos,20
    mov ballYPos,20
    mov level1Completion,0
    mov level2Completion,0
    call Gamelevel3
    call DrawBoundary
    mov eax,3
    mov paddleXCord,10
    mov paddleYCord,28
    call DrawPlayer
    
    
    mov dl,xBallPos
    mov dh,yBallPos
    call GotoXY
    call DrawBall
    mov eax,Green
    call setTextcolor
    mov al,'0'

    mov dh,18
    mov dl,45
    call gotoXY
    mov eax,white
    call setTextColor

    mov brickNum,0
    mov edx,offset StartPrompt
    call WriteString
    againL3:
    call readChar
    cmp al,'s'
    jne againL3

    mov dh,18
    mov dl,45
    call gotoXY
    mov edx,offset removeStart
    call writeString

    jmp L1



; Main game loop
L1:
    call printplayerLife
    ;========================Check Ongoing Level=======
    cmp onGoingLevel,1
    je level1Handling

    cmp onGoingLevel,2
    je level2Handling


    cmp onGoingLevel,3
    je level3Handling

    ;=========Level1 Handling==========
    level1Handling:
      call checkBrickL1Hitting
      ;=========Level 1 Completion chack ================
      cmp level1completion,1
      je level2Start
      jmp commonLevels
    ;=========Level2 Handling==========
    level2Handling:
       call checkBrickL2Hitting
       cmp level2Completion,1
       je level3Start

       jmp commonLevels
    ;=========Level3 Handling==========
    level3Handling:
      call checkBrickL3Hitting
      cmp level3Completion,1
      ;je exitManu

      jmp commonLevels

    ;=============Common Level Handling==============
    commonLevels:
     
    call HandleInput         ; Check and process paddle movement
    call CheckCollision      ; Detect paddle-ball collision
    call UpdateBall          ; Update ball position based on velocity
    call DrawBall            ; Redraw the ball at the new position
    call Delay               ; Add a small delay to control game speed

    ;--------Display Number of current Level------
    mov dl,105
    mov dh,8
    call gotoXY
    mov eax,green
    call setTextColor
    mov edx,offset levelPrompt
    call writeString
    movzx eax,onGoingLevel
    call writeDec
    ;-----Dispalay Name-----
    mov dl,105
    mov dh,10
    call gotoXY
    mov eax,yellow
    call setTextColor
    mov edx,offset namePrompt
    call writeString
    mov eax,Brown
    call setTextColor
    mov edx,offset names
    call writeString
    ;-----Display Score-----
    mov dl,105
    mov dh,12
    call gotoXY
    mov eax,white
    call setTextColor
    mov edx,offset ScorePrompt
    call writeString
   mov eax,blue;
    call setTextColor
    movzx eax,Score 
    call writeDec


    ;-----Display Life-----
   

    jmp L1

    ; Check for pause key
    ;call GetKeyState 
    ;test ax, 8000h

    jz ContinueGame          ; If 'P' key is not pressed, continue the game loop

    ;call PauseGame

ContinueGame:
    jmp L1

 ;--------------------
 ; <-----Exit----->
 ;--------------------
exitManu:
    call clrscr
    jmp start_level
    mov eax,Yellow
    call settextcolor


    mov edx,offset BRICK_LOGO
    call writestring
    mov eax,Red
    call settextcolor
    mov edx,offset BREAKER_LOGO
    call writestring
    mov eax,white
    call settextcolor

    call waitmsg
    call clrscr
    jmp start_tab


    ;-----------------------------------------
    ;   <----Istrcution content----->
    ;-----------------------------------------
INSTRUCTIONSSCREEN:
    mov dl,0 
    mov dh,0
    call gotoxy
    mov edx,offset CONTROLS_SCREEN
    call writestring
    call readchar
    call clrscr
    cmp al,27
    je point2
    jmp INSTRUCTIONSSCREEN

    ;-----------------------------------------
    ;   <----High Score Print ----->
    ;-----------------------------------------

  highScore:
     
     call ReadPlayerNames
     call ReadPlayerScores
     call SortLeaderboard
     call clrscr
    mov dl,0
    mov dh,0
    call gotoXY
    mov eax,brown
    call SetTextColor
    mov edx, OFFSET scoreDisplay
    call WriteString
    ; Print a newline after the score
    call Crlf
     call Crlf
    call Crlf
    mov eax,red
   call SetTextColor
     mov dl, 50
    mov dh, 7
    call gotoXY
    mov edx, OFFSET tableHeader
    
    call WriteString
     call Crlf
    ; Display player names and scores
    
    mov esi, 0 ; Start of the scores array
    mov dl, 50
    mov dh, 9
    
    mov ecx,0;
        mov eax,yellow
        call SetTextColor
        call gotoXY
       
        mov edx,Offset NA1;
        call writestring ; 1
        add edx,8;
        
         mwrite "                                      ";
        mov eax,blue
        call setTextColor
        mov al,scores[esi]
        sub al,48
        call WriteDec
        inc esi ;
        mov eax,yellow
        call setTextColor
        call Crlf
        call Crlf
        mwrite "                                                  ";
        mov edx,Offset NA2;
        call writestring ;2
        add edx,8;
         mwrite "                                      ";
        mov eax,blue
        call setTextColor
        mov al,scores[esi]
        sub al,48
        call WriteDec
        inc esi ;
        mov eax,yellow
        call setTextColor
        call Crlf;
        call Crlf;
        mwrite "                                                  ";
         mov edx,Offset NA3;
        call writestring ; 3
        add edx,8
        
         mwrite "                                      ";
        mov eax,blue
        call setTextColor
     
        
        mov al,Scores[esi]
         sub al,48
        call WriteDec
        inc esi ;
        mov eax,yellow
        call setTextColor
        call Crlf
        call Crlf
         mwrite "                                                  ";
         mov edx,Offset NA4;
		call writestring  ; 4
		add edx,8
       
         mwrite "                                      ";
        mov eax,blue
        call setTextColor
        mov al,Scores[esi]
         sub al,48
        call WriteDec
        inc esi ;
        mov eax,yellow
        call setTextColor
		call Crlf
        call Crlf
         mwrite "                                                  ";
        mov edx,Offset NA5;
		call writestring ; 5

		add edx,8
        
         mwrite "                                      ";
        mov eax,blue
        call setTextColor
        mov al,Scores[esi]
         sub al,48
        call WriteDec
       
        inc esi ;
        mov al,Scores[esi]

        mov eax,yellow
        call SetTextColor
        call Crlf
        call Crlf
        mwrite "                                                  ";
        call gotoXY
       
        mov edx,Offset NA6;
        call writestring ; 6
        add edx,8;
        
         mwrite "                                      ";
        mov eax,blue
        call setTextColor
        mov al,scores[esi]
        sub al,48
        call WriteDec
        inc esi ;
        mov eax,yellow
        call setTextColor
        call Crlf
        call Crlf
        mwrite "                                                  ";
        mov edx,Offset NA7;
        call writestring ;7
        add edx,8;
         mwrite "                                      ";
        mov eax,blue
        call setTextColor
        mov al,scores[esi]
        sub al,48
        call WriteDec
        inc esi ;
        mov eax,yellow
        call setTextColor
        call Crlf;
        call Crlf;
        mwrite "                                                  ";
         mov edx,Offset NA8;
        call writestring ; 8
        add edx,8
        
         mwrite "                                      ";
        mov eax,blue
        call setTextColor
     
        
        mov al,Scores[esi]
         sub al,48
        call WriteDec
        inc esi ;
        mov eax,yellow
        call setTextColor
        call Crlf
        call Crlf
         mwrite "                                                  ";
         mov edx,Offset NA9;
		call writestring  ; 9
		add edx,8
       
         mwrite "                                      ";
        mov eax,blue
        call setTextColor
        mov al,Scores[esi]
         sub al,48
        call WriteDec
        inc esi ;
        mov eax,yellow
        call setTextColor
		call Crlf
        call Crlf
         mwrite "                                                  ";
        mov edx,Offset NA10;
		call writestring ; 10

		add edx,8
        
         mwrite "                                      ";
        mov eax,blue
        call setTextColor
        mov al,Scores[esi]
         sub al,48
        call WriteDec
       
        inc esi ;
        mov al,Scores[esi]

        mov eax,yellow
        call setTextColor
		call Crlf
        call Crlf
       

;call DisplayPlayerNamesAndScores;

	; Display the high score
   call WritePlayerNames
   call WritePlayerScores

    call readchar
    call clrscr
    cmp al,27
    je point2
    jmp highScore
  main  ENDP;
END main;