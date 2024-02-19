Line10			DEFB $00,10                     ; Line 10
                DEFW Line10End-Line10Text       ; Line length
Line10Text     	DEFB $EB,_A,_EQ                 ; FOR A=
                DEFB _1,$7E,$81,$00,$00,$00,$00 ; 1
                DEFB $DF                        ; TO
                DEFB _2,_4,_2,$7E,$88,$72,$00,$00,$00 ; 242
                DEFB _NL                        ; Newline
Line10End 
Line20			DEFB $00,20                     ; Line 20
                DEFW Line20End-Line20Text       ; Line length
Line20Text     	DEFB $F4                        ; POKE
                DEFB _1,_6,_4,_1,_7,$7E,$8F,$00,$42,$00,$00 ; 16417
                DEFB _CM,_A                     ; ,A
                DEFB _NL                        ; Newline
Line20End 
Line30			DEFB $00,30                     ; Line 30
                DEFW Line30End-Line30Text       ; Line length
Line30Text     	DEFB $F5,$C1                    ; PRINT AT
                DEFB _1,_0,$7E,$84,$20,$00,$00,$00 ; 10
                DEFB _CM                        ; ,
                DEFB _1,_0,$7E,$84,$20,$00,$00,$00 ; 10
                DEFB _SC                        ; ;
                DEFB _NL                        ; Newline
Line30End 
Line35			DEFB $00,35                     ; Line 35
                DEFW Line35End-Line35Text       ; Line length
Line35Text     	DEFB $F9,$D4                    ; RAND USR
				DEFB _1,_6,_5,_1,_4,$7E,$8F,$01,$04,$00,$00 ; 16514
                DEFB _NL                        ; Newline
Line35End 
Line50			DEFB $00,50                     ; Line 50
                DEFW Line50End-Line50Text       ; Line length
Line50Text     	DEFB $F5,$C1                    ; PRINT AT
                DEFB _1,_0,$7E,$84,$20,$00,$00,$00 ; 10
                DEFB _CM                        ; ,
                DEFB _1,_0,$7E,$84,$20,$00,$00,$00 ; 10
                DEFB _SC                        ; ;
                DEFB _QT                        ; "
                DEFB __,__,__,__,__,__,__,__,__,__,__,__,__,__ ; 14 blanks
                DEFB _QT                        ; "
                DEFB _NL                        ; Newline
Line50End 
Line60			DEFB $00,60                     ; Line 60
                DEFW Line60End-Line60Text       ; Line length
Line60Text     	DEFB $F3                        ; NEXT
                DEFB _A                         ; A
                DEFB _NL                        ; Newline
Line60End 
