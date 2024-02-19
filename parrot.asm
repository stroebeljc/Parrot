;
;       ZX81 Spoken Words
;       -----------------
;
; Speech synthesizer application
;
; By stroebeljc (2024)
; Word list taken from
;  "How to Make Your Computer Talk"
;    (C) 1985, Steven J. Veltri
;
;
; Based on original code by XAVSNAP(2014)
; ZX81+CARTE synthese vocale VTR.
; CARTE MAGECO
;

; R.I.S.T. Parrot version

;defs
#include "zx81defs.asm"
;ZX81 char codes/how to survive without ASCII
#include "charcodes.asm"
;system variables
#include "zx81sys.asm"

ENDBITPOS  EQU 7
ENDBIT     EQU (1<<ENDBITPOS)
ENDMASK    EQU (~ENDBIT)
SOUND      EQU 3    

;Line 0
;the standard REM statement that will contain our 'hex' code
Line0:          DEFB $00,0                      ; Line 0
                DEFW Line0End-Line0Text         ; Line length
Line0Text:      DEFB $EA                        ; REM


INI
       CALL WAIT
       CALL RECHE
       CALL PLAY
       RET



RECHE 
; GET WORD ID
       LD HL,UNUSED1
       LD A,(HL)
       LD HL,TXTSTART
       DEC A
       CP 0
       JR Z,RE2
       LD B,A
       LD C,0
       
RE1 
       LD A,(HL)
       BIT ENDBITPOS,A
       INC HL
       JR Z,RE1
       DJNZ RE1

RE2 
       LD A,(HL)
       LD B,A
       AND ENDMASK
       RST 10
       LD A,B
       BIT ENDBITPOS,A
       INC HL
       JR Z,RE2
       RET

PLAY
; GET ALLOPHONE ID
       LD HL,UNUSED1
       LD A,(HL)
       LD HL,ALLSTART
       DEC A
       CP 0
       JR Z,RE12
       LD B,A
       LD C,0

       
RE11 
       LD A,(HL)
       BIT ENDBITPOS,A
       INC HL
       JR Z,RE11
       DJNZ RE11

RE12 
       LD A,(HL)
       BIT ENDBITPOS,A
       JR NZ,SPEAK
       OUT (SOUND),A
       CALL WAIT
       INC HL
       JR RE12


WAIT 
       IN A,(SOUND)
       AND 1
       JR Z,WAIT
       RET
SPEAK 
       AND ENDMASK
       OUT (SOUND),A
       RET

;this is the end of line 0 - the first REM			
				DEFB _NL                        ; Newline				
Line0End       

;this  line is a REM containing the word list
Line1			DEFB $00,1                      ; Line 1
                DEFW Line1End-Line1Text         ; Line length
Line1Text     	DEFB $EA                        ; REM
;word data
#include "worddata.asm"
                DEFB _NL                        ; Newline
Line1End 

;this  line is a REM containing the allphones for each word in the list
Line2			DEFB $00,2                      ; Line 2
                DEFW Line2End-Line2Text         ; Line length
Line2Text     	DEFB $EA                        ; REM
;allophone data
#include "allophonedata.asm"
		        DEFB _NL                        ; Newline				
Line2End 


;append the BASIC code that runs the program
#include "line10.asm"
                
; ===========================================================
; code ends
; ===========================================================
;display file defintion
#include "screen.asm"               

;close out the basic program
#include "endbasic.asm"
