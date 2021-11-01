#include "p16F887.inc"   ; TODO INSERT CONFIG CODE HERE USING CONFIG BITS GENERATOR
 	__CONFIG	_CONFIG1,	_INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOR_OFF & _IESO_ON & _FCMEN_ON & _LVP_OFF 
 	__CONFIG	_CONFIG2,	_BOR40V & _WRT_OFF

RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program

MAIN_PROG CODE                      ; let linker place main program                      ; let linker place main program


i EQU 0x22
j EQU 0x23
bin EQU 0x24
i1 EQU 0x25
i2 EQU 0x26
i3 EQU 0x27
i4 EQU 0x28
i5 EQU 0x29
i6 EQU 0x30
i7 EQU 0x31
i8 EQU 0x32
aux EQU 0x33
ban EQU 0x34
carr EQU 0x35
g1 EQU 0x36
g2 EQU 0x37
g3 EQU 0x38
g4 EQU 0x39
g5 EQU 0x40
g6 EQU 0x41
g7 EQU 0x42
g8 EQU 0x43
y equ 0x44
t equ 0x45
k equ 0x46
m equ 0x47
 
START

    BANKSEL PORTA ;
    CLRF PORTA ;Init PORTA
    BANKSEL ANSEL ;
    CLRF ANSEL ;digital I/O
    CLRF ANSELH
    BANKSEL TRISA ;
    CLRF TRISA
    CLRF TRISB
    CLRF TRISC
    CLRF TRISD
    CLRF TRISE
    MOVLW b'00000000' 
    MOVWF TRISC
    MOVLW b'11111111' 
    MOVWF TRISD
    BCF STATUS,RP1
    BCF STATUS,RP0
    CLRF PORTA
    CLRF PORTB
    CLRF PORTC
    CLRF PORTD
    CLRF PORTE
    
    CLRF ban
    CLRF carr
    CLRF i1
    CLRF i2
    CLRF i3
    CLRF i4
    CLRF i5
    CLRF i6
    CLRF i7
    CLRF i8
    
    CLRF g1
    CLRF g2
    CLRF g3
    CLRF g4
    CLRF g5
    CLRF g6
    CLRF g7
    CLRF g8
    
    CLRF aux
      
    
INITLCD
    BCF PORTA,0		;reset
    MOVLW 0x01
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    
    MOVLW 0x0C		;first line
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
         
    MOVLW 0x3C		;cursor mode
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    
    
    CALL INTRO
    CALL clear
    CALL PASSCODE
    CALL ATTEMPT  
     
    
INICIO
    CALL ENTRY
    CALL HIDE    
    GOTO BACK

BACK:
    CALL CONTRA
    CALL COMP   
    GOTO INICIO
    
INTRO:
    INTRO_STAY:
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0xC1		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'W'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'E'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'L'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'C'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'O'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'M'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'E'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    BCF PORTA,0		;command mode
    CALL time
    MOVLW 0x91		;LCD position
    MOVWF PORTB
    CALL exec

    BSF PORTA,0		;data mode
    CALL time

    MOVLW '*'
    MOVWF PORTB
    CALL exec
    MOVLW 'P'
    MOVWF PORTB
    CALL exec
    MOVLW 'A'
    MOVWF PORTB
    CALL exec
    MOVLW 'R'
    MOVWF PORTB
    CALL exec
    MOVLW 'C'
    MOVWF PORTB
    CALL exec
    MOVLW 'I'
    MOVWF PORTB
    CALL exec
    MOVLW 'A'
    MOVWF PORTB
    CALL exec
    MOVLW 'L'
    MOVWF PORTB
    CALL exec
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    MOVLW '2'
    MOVWF PORTB
    CALL exec
    MOVLW '*'
    MOVWF PORTB
    CALL exec
   
    BCF PORTC, 0
    BSF PORTC, 1  
    BTFSC PORTD, 1
    RETURN
    GOTO INTRO_STAY
 
PASSCODE:
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x80		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'P'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'A'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'S'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'S'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'C'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'O'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'D'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'E'
    MOVWF PORTB
    CALL exec
    
    MOVLW ':'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    RETURN
 
HIDE:
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0xC8		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
ATTEMPT:
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x90		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'A'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'T'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'T'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'E'
    MOVWF PORTB
    CALL exec
   
    MOVLW 'M'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'P'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'T'
    MOVWF PORTB
    CALL exec
   
    MOVLW ':'
    MOVWF PORTB
    CALL exec
   
    RETURN 
    
PASS:    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0xC8		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    RETURN
    
TRY:
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0xD8		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    RETURN
    
    
ENTRY:
    CALL PASS
    CALL BOTON
    BTFSS ban, 0
    GOTO $-2
    MOVFW aux
    MOVWF g1
    
    CALL BOTON
    BTFSS ban, 0
    GOTO $-2
    MOVFW aux
    MOVWF g2
   
    CALL BOTON
    BTFSS ban, 0
    GOTO $-2
    MOVFW aux
    MOVWF g3
    
    CALL BOTON
    BTFSS ban, 0
    GOTO $-2
    MOVFW aux
    MOVWF g4
   
    CALL BOTON
    BTFSS ban, 0
    GOTO $-2
    MOVFW aux
    MOVWF g5
    
    CALL BOTON
    BTFSS ban, 0
    GOTO $-2
    MOVFW aux
    MOVWF g6 
    
    CALL BOTON
    BTFSS ban, 0
    GOTO $-2
    MOVFW aux
    MOVWF g7
    
    CALL BOTON
    BTFSS ban, 0
    GOTO $-2
    MOVFW aux
    MOVWF g8
   
    RETURN
    
CONTRA:
    
    CALL TRY
    CALL BOTON
    BTFSS ban, 0
    GOTO $-2
    MOVFW aux
    MOVWF i1
   
    CALL BOTON
    BTFSS ban, 0
    GOTO $-2
    MOVFW aux
    MOVWF i2
    
    CALL BOTON
    BTFSS ban, 0
    GOTO $-2
    MOVFW aux
    MOVWF i3
    
    CALL BOTON
    BTFSS ban, 0
    GOTO $-2
    MOVFW aux
    MOVWF i4
    
    CALL BOTON
    BTFSS ban, 0
    GOTO $-2
    MOVFW aux
    MOVWF i5
   
    CALL BOTON
    BTFSS ban, 0
    GOTO $-2
    MOVFW aux
    MOVWF i6
   
    CALL BOTON
    BTFSS ban, 0
    GOTO $-2
    MOVFW aux
    MOVWF i7
    
    CALL BOTON
    BTFSS ban, 0
    GOTO $-2
    MOVFW aux
    MOVWF i8
    
    RETURN
    
BOTON:    
    BCF ban, 0
    
    BSF PORTC, 0     
    BTFSC PORTD, 0
    CALL one
    
    BCF PORTC, 0
    
    BSF PORTC, 1   
    BTFSC PORTD, 0
    CALL two
    
    BCF PORTC, 1
    
    BSF PORTC, 2   
    BTFSC PORTD, 0
    CALL three
    
    BCF PORTC, 2
    
    BSF PORTC, 0   
    BTFSC PORTD, 1
    CALL four 
    
    BCF PORTC, 0
    
    BSF PORTC, 1   
    BTFSC PORTD, 1
    CALL five 
    
    BCF PORTC, 1
    
    BSF PORTC, 2   
    BTFSC PORTD, 1
    CALL six
    
    BCF PORTC, 2
    
    BSF PORTC, 0   
    BTFSC PORTD, 2
    CALL seven 
    
    BCF PORTC, 0
    
    BSF PORTC, 1   
    BTFSC PORTD, 2
    CALL eight 
    
    BCF PORTC, 1
    
    BSF PORTC, 2   
    BTFSC PORTD, 2
    CALL nine 
    
    BCF PORTC, 2
    
    BSF PORTC, 0   
    BTFSC PORTD, 3
    CALL DEL 
    
    BCF PORTC, 0
    
    BSF PORTC, 1   
    BTFSC PORTD, 3
    CALL zero 
    
    BCF PORTC, 1
    
    BSF PORTC, 2   
    BTFSC PORTD, 3
    CALL HASH 
    
    BCF PORTC, 2
    
    RETURN

one:     
    MOVLW b'00000001'
    MOVWF aux
    
    MOVLW '1'
    MOVWF PORTB
    CALL exec
    
    BSF ban, 0
    
    BTFSC PORTD, 0
    GOTO $-1
    RETURN  
    
two: 
    MOVLW b'00000010'
    MOVWF aux
    
    MOVLW '2'
    MOVWF PORTB
    CALL exec
    
    BSF ban, 0
    
    BTFSC PORTD, 0
    GOTO $-1
    RETURN
three:     
    MOVLW b'00000011'
    MOVWF aux
    
    MOVLW '3'
    MOVWF PORTB
    CALL exec
    
    BSF ban, 0
    
    BTFSC PORTD, 0
    GOTO $-1
    RETURN  
    
four: 
    MOVLW b'00000100'
    MOVWF aux
    
    MOVLW '4'
    MOVWF PORTB
    CALL exec
        
    BSF ban, 0
    
    BTFSC PORTD, 1
    GOTO $-1
    RETURN
    
five:     
    MOVLW b'00000101'
    MOVWF aux
    
    MOVLW '5'
    MOVWF PORTB
    CALL exec
    
    BSF ban, 0
    
    BTFSC PORTD, 1
    GOTO $-1
    RETURN  
    
six: 
    MOVLW b'00000110'
    MOVWF aux
    
    MOVLW '6'
    MOVWF PORTB
    
    CALL exec
    
    BSF ban, 0
    
    BTFSC PORTD, 1
    GOTO $-1
    RETURN

seven:     
    MOVLW b'00000111'
    MOVWF aux
    
    MOVLW '7'
    MOVWF PORTB
    CALL exec
    
    BSF ban, 0
    
    BTFSC PORTD, 2
    GOTO $-1
    RETURN  
    
eight: 
    MOVLW b'00001000'
    MOVWF aux
    
    MOVLW '8'
    MOVWF PORTB
    CALL exec
    
    BSF ban, 0
    
    BTFSC PORTD, 2
    GOTO $-1
    RETURN

nine: 
    MOVLW b'00001001'
    MOVWF aux
    
    MOVLW '9'
    MOVWF PORTB
    CALL exec
    
    BSF ban, 0
    
    BTFSC PORTD, 2
    GOTO $-1
    RETURN
    
zero: 
    MOVLW b'00000000'
    MOVWF aux
    
    MOVLW '0'
    MOVWF PORTB
    CALL exec
    
    BSF ban, 0
    
    BTFSC PORTD, 3
    GOTO $-1
    RETURN

HASH:
    CALL WRONG
    CLRF ban
    CLRF carr
    CLRF i1
    CLRF i2
    CLRF i3
    CLRF i4
    CLRF i5
    CLRF i6
    CLRF i7
    CLRF i8
    GOTO BACK

DEL:
    RETURN
    
WRONG:    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0xD8		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
   
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
   
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    RETURN
    
reset:
    CALL clear
    CALL PASSCODE
    CALL ATTEMPT
    CALL HIDE
    GOTO CONTRA
    RETURN
   
        
COMP:
    
    MOVFW g1
    MOVWF aux
    XORWF i1,W
    BTFSS STATUS,Z
    CALL DENIED
    
    MOVFW g2
    MOVWF aux
    XORWF i2,W
    BTFSS STATUS,Z
    CALL DENIED
    
    MOVFW g3
    MOVWF aux
    XORWF i3,W
    BTFSS STATUS,Z
    CALL DENIED
    
    MOVFW g4
    MOVWF aux
    XORWF i4,W
    BTFSS STATUS,Z
    CALL DENIED
    
    MOVFW g5
    MOVWF aux
    XORWF i5,W
    BTFSS STATUS,Z
    CALL DENIED
    
    MOVFW g6
    MOVWF aux
    XORWF i6,W
    BTFSS STATUS,Z
    CALL DENIED
    
    MOVFW g7
    MOVWF aux
    XORWF i7,W
    BTFSS STATUS,Z
    CALL DENIED
    
    MOVFW g8
    MOVWF aux
    XORWF i8,W
    BTFSS STATUS,Z
    CALL DENIED
    CALL GRANTED
    
    RETURN
  
GRANTED:
    
    CALL clear
    GRANTED_STAY:
	MOVLW b'00000001'
	MOVWF PORTE
	
	BCF PORTA,0		;command mode
	CALL time
	MOVLW 0xC1		;LCD position
	MOVWF PORTB
	CALL exec
	BSF PORTA,0		;data mode
	CALL time
	MOVLW '*'
	MOVWF PORTB
	CALL exec
	MOVLW '*'
	MOVWF PORTB
	CALL exec
	MOVLW '*'
	MOVWF PORTB
	CALL exec
	MOVLW 'A'
	MOVWF PORTB
	CALL exec
	MOVLW 'C'
	MOVWF PORTB
	CALL exec
	MOVLW 'C'
	MOVWF PORTB
	CALL exec
	MOVLW 'E'
	MOVWF PORTB
	CALL exec
	MOVLW 'S'
	MOVWF PORTB
	CALL exec
	MOVLW 'S'
	MOVWF PORTB
	CALL exec
	MOVLW '*'
	MOVWF PORTB
	CALL exec
	MOVLW '*'
	MOVWF PORTB
	CALL exec
	MOVLW '*'
	MOVWF PORTB
	CALL exec

	BCF PORTA,0		;command mode
	CALL time

	MOVLW 0x91		;LCD position
	MOVWF PORTB
	CALL exec

	BSF PORTA,0		;data mode
	CALL time

	MOVLW '*'
	MOVWF PORTB
	CALL exec
	MOVLW '*'
	MOVWF PORTB
	CALL exec
	MOVLW '*'
	MOVWF PORTB
	CALL exec
	MOVLW 'G'
	MOVWF PORTB
	CALL exec
	MOVLW 'R'
	MOVWF PORTB
	CALL exec
	MOVLW 'A'
	MOVWF PORTB
	CALL exec
	MOVLW 'N'
	MOVWF PORTB
	CALL exec
	MOVLW 'T'
	MOVWF PORTB
	CALL exec
	MOVLW 'E'
	MOVWF PORTB
	CALL exec
	MOVLW 'D'
	MOVWF PORTB
	CALL exec
	MOVLW '*'
	MOVWF PORTB
	CALL exec
	MOVLW '*'
	MOVWF PORTB
	CALL exec
    
	BSF PORTC, 0     
        BTFSC PORTD, 3 
        GOTO reset
        GOTO GRANTED_STAY
        
    
DENIED:
    
    CALL clear
    
    DENIED_STAY: 
	MOVLW b'00000010'
	MOVWF PORTE
    
	 BCF PORTA,0		;command mode
	    CALL time
	    MOVLW 0xC1		;LCD position
	    MOVWF PORTB
	    CALL exec
	    BSF PORTA,0		;data mode
	    CALL time
	    MOVLW '*'
	    MOVWF PORTB
	    CALL exec
	    MOVLW '*'
	    MOVWF PORTB
	    CALL exec
	    MOVLW '*'
	    MOVWF PORTB
	    CALL exec
	    MOVLW 'A'
	    MOVWF PORTB
	    CALL exec
	    MOVLW 'C'
	    MOVWF PORTB
	    CALL exec
	    MOVLW 'C'
	    MOVWF PORTB
	    CALL exec
	    MOVLW 'E'
	    MOVWF PORTB
	    CALL exec
	    MOVLW 'S'
	    MOVWF PORTB
	    CALL exec
	    MOVLW 'S'
	    MOVWF PORTB
	    CALL exec
	    MOVLW '*'
	    MOVWF PORTB
	    CALL exec
	    MOVLW '*'
	    MOVWF PORTB
	    CALL exec
	    MOVLW '*'
	    MOVWF PORTB
	    CALL exec

	    BCF PORTA,0		;command mode
	    CALL time

	    MOVLW 0x91		;LCD position
	    MOVWF PORTB
	    CALL exec

	    BSF PORTA,0		;data mode
	    CALL time

	    MOVLW '*'
	    MOVWF PORTB
	    CALL exec
	    MOVLW '*'
	    MOVWF PORTB
	    CALL exec
	    MOVLW '*'
	    MOVWF PORTB
	    CALL exec
	    MOVLW 'D'
	    MOVWF PORTB
	    CALL exec
	    MOVLW 'E'
	    MOVWF PORTB
	    CALL exec
	    MOVLW 'N'
	    MOVWF PORTB
	    CALL exec
	    MOVLW 'I'
	    MOVWF PORTB
	    CALL exec
	    MOVLW 'E'
	    MOVWF PORTB
	    CALL exec
	    MOVLW 'D'
	    MOVWF PORTB
	    CALL exec
	    MOVLW '*'
	    MOVWF PORTB
	    CALL exec
	    MOVLW '*'
	    MOVWF PORTB
	    CALL exec
	     MOVLW '*'
	    MOVWF PORTB
	    CALL exec

	BSF PORTC, 0     
	BTFSC PORTD, 3
	GOTO reset
	GOTO DENIED_STAY  
    
LCDPOS:
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x88		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    RETURN
   
exec

    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    RETURN
    
time
    CLRF i
    MOVLW d'10'
    MOVWF j
ciclo    
    MOVLW d'80'
    MOVWF i
    DECFSZ i
    GOTO $-1
    DECFSZ j
    GOTO ciclo
    RETURN
    
clear
    BCF PORTA,0		;reset
    MOVLW 0x01
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    
    MOVLW 0x0C		;first line
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
         
    MOVLW 0x3C		;cursor mode
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    
    RETURN
    
DELAY_MS:
    movlw d'37' ;establecer valor de la variable k
    movwf m
mloop:
    decfsz m,f
    goto mloop
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    movlw d'239' ;establecer valor de la variable i
    movwf y
iloop:
    nop ;NOPs de relleno (ajuste de tiempo)
    movlw d'235' ;establecer valor de la variable j
    movwf t
jloop:
    nop ;NOPs de relleno (ajuste de tiempo)
    movlw d'28' ;establecer valor de la variable k
    movwf k
kloop:
    decfsz k,f
    goto kloop
    decfsz t,f
    goto jloop
    decfsz y,f
    goto iloop
    
    RETURN
    
    END
    
   
   
    
    
