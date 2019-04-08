; Question2.asm    --  Created by [REDACTED]
; Description: Accepts 10 integer inputs and stores them within an array (stack)

INCLUDE Irvine32.inc

.data
PromptUser BYTE "Please enter a value: ", 0
WelcomeMsg BYTE "Welcome! This program accepts ten integers as input, stores them in a stack, and then displays them on the screen.", 0
DisplayInts BYTE "The integers you stored are: ", 0
ArraySW SWORD 10 DUP(?)

.code
main PROC
	mov eax, 0                    ; initialize eax to 0
	mov ebx, 0                    ; initialize indice counter to 0
	mov ecx, 10                   ; loop counter
	mov edx, OFFSET WelcomeMsg
	call WriteString              ; displays welcome message
	call crlf                     ; formatting
	call crlf                     ; formatting
	mov edx, OFFSET PromptUser

	L1:
		call WriteString          ; displays prompt for user input
		call ReadInt              ; reads user input
		mov ArraySW[ebx], ax      ; stores user input in available array indice
		add ebx, 2                ; points to next indice in array
		loop L1                   ; loops 10 times for each value

	mov ebx, 0                    ; reset indice counter
	mov ecx, 10                   ; reset loop counter
	mov edx, OFFSET DisplayInts
	call crlf                     ; formatting
	call WriteString              ; displays message indicating values will be displayed
	call crlf                     ; formatting

	L2:
		movsx eax, ArraySW[ebx]   ; sign-extend array value to eax to be displayed
		call WriteInt             ; displays int stored in eax
		call crlf                 ; formatting
		add ebx, 2                ; increments ebx to point to the next value in the array
		loop L2                   ; loops 10 times for each value

	call crlf                     ; formatting
	exit
main ENDP
END main