; Question2bHW8.asm    --  Created by [REDACTED]
; Description: This program takes the value C78A2BF8h and groups it into sets of 2 hexadecimal integers. The sets will be added into DH and DL, with 2 sets in each one. 
;              For example, C7h and 8Ah will be added into DH, and 2Bh and F8h will be added into DL.

INCLUDE Irvine32.inc

.data
WelcomeMSG BYTE "Welcome! This program takes the value C78A2BF8h and stores the first 2 decimal numbers in dh, and also stores the last 2 decimal numbers in dl.", 0
dhValuePrompt BYTE "DH has the decimal value: ", 0
dlValuePrompt BYTE "DL has the decimal value: ", 0
dhValue WORD ?
dlValue WORD ?

.code
main PROC
	mov edx, OFFSET WelcomeMSG
	call WriteString              ; display welcome message
	call crlf                     ; formatting
	call crlf                     ; formatting
	mov eax, 0C78A2BF8h           ; initial value (eax = 1100 0111 1000 1010 0010 1011 1111 1000)
	mov edx, 0                    ; clear edx

	and al, 00001111b             ; eax = 1100 0111 1000 1010 0010 1011 0000 1000
	and ah, 11110000b             ; eax = 1100 0111 1000 1010 0010 0000 0000 1000
	ror al, 4                     ; eax = 1100 0111 1000 1010 0010 0000 1000 0000
	ror ah, 4                     ; eax = 1100 0111 1000 1010 0000 0010 1000 0000
	ror ax, 4                     ; eax = 1100 0111 1000 1010 0000 0000 0010 1000
	shr ax, 1                     ; eax = 1100 0111 1000 1010 0000 0000 0001 0100
	mov dlValue, ax               ; dlValue = 20
	shl al, 1                     ; eax = 1100 0111 1000 1010 0000 0000 0001 1000
	and ax, 00001111b             ; eax = 1100 0111 1000 1010 0000 0000 0000 1000
	add dlValue, ax               ; dlValue = 20 + 8 = 28

	and al, 00000000b             ; clear ax
	shr eax, 16                   ; eax = 0000 0000 0000 0000 1100 0111 1000 1010
	and al, 11110000b             ; eax = 0000 0000 0000 0000 1100 0111 1000 0000
	and ah, 00001111b             ; eax = 0000 0000 0000 0000 0000 0111 1000 0000
	ror ax, 4                     ; eax = 0000 0000 0000 0000 0000 0000 0111 1000
	and ax, 00001111b             ; eax = 0000 0000 0000 0000 0000 0000 0000 1000
	mov dhValue, ax               ; dhValue = 8
	and ax, 00000000b             ; eax = 0000 0000 0000 0000 0000 0000 0000 0000
	or ax, 01000110b              ; eax = 0000 0000 0000 0000 0000 0000 0100 0110
	add dhValue, ax               ; dhValue = 8 + 70 = 78

	mov edx, OFFSET dhValuePrompt 
	call WriteString              ; prompt user that dh value will be displayed
	movzx eax, dhValue            ; zero-extend dhValue to eax for display
	call WriteInt                 ; display dh value
	call crlf                     ; formatting
	mov edx, OFFSET dlValuePrompt
	call WriteString              ; prompt user that dl value will be displayed
	movzx eax, dlValue            ; zero-extend dlValue to eax for display
	call WriteInt                 ; display dl value
	call crlf                     ; formatting

	exit
main ENDP
END main