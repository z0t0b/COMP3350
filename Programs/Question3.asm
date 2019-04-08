; Question3.asm    --  Created by [REDACTED]
; Description: Accepts 10 integer values and stores them in an array (stack). This program then finds the maximum value and the minimum value and returns the indices at which they were found.

INCLUDE Irvine32.inc

.data
WelcomeMsg BYTE "Welcome! This program accepts ten integers as input, stores them in a stack, and then finds the maximum number and minimum number and displays them and their indice in the stack.", 0
prompt  	BYTE "Please input a value: ", 0
spacing 	BYTE ", ",0 
String1	BYTE "The minimum value is ",0  
String2	BYTE "The maximum value is ",0
String3	BYTE "and is located at index: ",0
ArraySW SWORD 10 DUP(?)
Max SWORD ?
Min SWORD ?
MaxIndice WORD ?
MinIndice WORD ?
temp WORD ?

.code
main PROC
	mov eax, 0                     ; initialize eax to 0
	mov ebx, 0                     ; initialize indice counter to 0
	mov ecx, 10                    ; loop counter
	mov edx, OFFSET WelcomeMsg
	call WriteString               ; displays welcome message
	call crlf                      ; formatting
	call crlf                      ; formatting
	mov edx, OFFSET prompt

	L1:
		call WriteString           ; displays prompt for user input
		call ReadInt               ; reads user input
		mov ArraySW[ebx], ax       ; stores user input in available array indice
		add ebx, 2                 ; points to next indice in array
		loop L1                    ; loops 10 times for each value

	mov ebx, 0                     ; clears ebx for procedure call
	mov ecx, 10                    ; resets ecx value to 10
	call crlf                      ; formatting
	call crlf                      ; formatting
	call MinMax                    ; call MinMax procedure
	mov edx, OFFSET String1
	call WriteString               ; print first part of message
	movsx eax, Min                 ; store Min value in ax for next procedure call
	call WriteInt                  ; write Min value to screen
	mov edx, OFFSET spacing
	call WriteString               ; print spacing
	mov edx, OFFSET String3
	call WriteString               ; print second part of message
	movsx eax, MinIndice           ; store MinIndice value in ax for next procedure call
	call WriteInt                  ; write MinIndice value to screen
	call crlf                      ; formatting

	mov edx, OFFSET String2
	call WriteString               ; print first part of message
	movsx eax, Max                 ; store Max value in ax for next procedure call
	call WriteInt                  ; write Max value to screen
	mov edx, OFFSET spacing
	call WriteString               ; print spacing
	mov edx, OFFSET String3
	call WriteString               ; print second part of message
	movsx eax, MaxIndice           ; store MaxIndice value in ax for next procedure call
	call WriteInt                  ; write MaxIndice value to screen
	call crlf                      ; formatting
	call crlf                      ; formatting
	exit
main ENDP                          ; end main procedure

;----------------------------------------------------------------------------------------;
; MinMax                                                                                 ;
; Finds minimum and maximum values within the array and returns their indices and values ;
; Receives: bx = 0 (index for array)                                                     ;
;           cx = 10 (number of values in array)                                          ;
; Returns:  ax = Just to end procedure                                                   ;
;----------------------------------------------------------------------------------------;
MinMax PROC USES ebx
	;---------- MAX LOOP ----------;
	movsx eax, ArraySW[ebx]        ; moves first number in array to eax with sign extension
	L1:
		cmp ax, ArraySW[ebx]       ; finds the maximum number
		jge J1                     ; jumps to J1 if ax >= ArraySW[ebx]
		mov temp, bx               ; move bx (array index) value to temp value
		mov ax, bx                 ; move bx to ax for divide procedure
		mov bx, 2                  ; make divisor (bx) 2
		div bl                     ; divide current index by 2
		mov MaxIndice, ax          ; store modified value in indice variable for later access
		mov bx, temp               ; restore bx value from temp
		movsx eax, ArraySW[ebx]    ; ax < [bx], so the next biggest number is now in eax
	J1:
		add ebx, 2                 ; points to next indice in array
		loop L1                    ; loops 10 times for each value
	movsx ebx, ax                  ; sign extend max value
	mov Max, bx                    ; stores max value in Max variable from bx

	;---------- MIN LOOP ----------;
	mov ebx, 0                     ; clears ebx
	mov ecx, 10                    ; resets ecx value to 10
	movsx eax, ArraySW[ebx]        ; moves first number in array to eax with sign extension
	L2:
		cmp ax, ArraySW[ebx]       ; finds the minimum number
		jl J2                      ; jumps to J2 if ax < ArraySW[ebx]
		mov temp, bx               ; move bx (array index) value to temp value
		mov ax, bx                 ; move bx to ax for divide procedure
		mov bx, 2                  ; make divisor (bx) 2
		div bl                     ; divide current index by 2
		mov MinIndice, ax          ; store modified value in indice variable for later access
		mov bx, temp               ; restore bx value from temp
		movsx eax, ArraySW[ebx]    ; ax >= [bx], so the next smallest number is now in eax
	J2:
		add ebx, 2                 ; points to next indice in array
		loop L2                    ; loops 10 times for each value
	movsx ebx, ax                  ; sign extend min value
	mov Min, bx                    ; stores min value in Min variable from bx
	ret                            ; returns value in eax (just to end procedure)
MinMax ENDP                        ; end MinMax procedure

END main                           ; end program