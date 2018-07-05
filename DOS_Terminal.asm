DATA SEGMENT
	INTRO DB 'Enter an number that executing the corresponding function.$' 
	FUN1 DB 0AH, 0DH, '1. Mirror output.$'
	FUN11 DB 0AH, 0DH, 'Now Input:$'
	
	FUN2 DB 0AH, 0DH, '2. Add Two Integer Number (less ten)$'
	FUN1BUF DB 100 DUP(?)
DATA ENDS

CODE SEGMENT
	ASSUME CS:CODE,DS:DATA
START:
	MOV AX,DATA
	MOV DS,AX

	LEA DX,INTRO
	MOV AH,09H
	INT 21H	; display INTRO

	LEA DX,FUN1
	MOV AH,09H
	INT 21H	; display FUN1

	LEA DX,FUN2
	MOV AH,09H
	INT 21H	; display FUN2

;----------------------- 
	MOV AH, 02H
	MOV DL, 0AH;20H
	INT 21H

	MOV AH, 02H
	MOV DL, 0DH
	INT 21H
;-----------------------
	MOV AH, 01H
	INT 21H
	SUB AL, 30H

	CMP AL, 01H;
	JE SHOWSTRING
SHOWSTRING:

;----------------------- 
	MOV AH, 02H
	MOV DL, 0AH;20H
	INT 21H

	MOV AH, 02H
	MOV DL, 0DH
	INT 21H
;-----------------------

; info for user inputting
	XOR DX, DX
	LEA DX, FUN11
	MOV AH, 09H
	INT 21

;----------------------- 
	MOV AH, 02H
	MOV DL, 0AH;20H
	INT 21H

	MOV AH, 02H
	MOV DL, 0DH
	INT 21H
;-----------------------

	XOR DX, DX
	LEA DX, FUN1BUF
; Input anything here and stopped by return
	MOV AH, 0AH
	INT 21H

;----------------------- 
	MOV AH, 02H
	MOV DL, 0AH;20H
	INT 21H

	MOV AH, 02H
	MOV DL, 0DH
	INT 21H
;-----------------------
	MOV AH, 09H
	INT 21H


	MOV AH,4CH
    INT 21H

CODE ENDS






END START
