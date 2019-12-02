; Question1HW9.asm    --  Created by Zachary Eli Bedsole
; Description: This program passes an array offset and array length to a procedure that then fills it with the Fibonacci sequence of numbers (1, 1, 2, 3, 5, 8, 13, 21, 34, 55).

INCLUDE Irvine32.inc
ArraySeries PROTO, ptrArrayB:PTR BYTE, ArrayBSize:BYTE

.data
ArrayB BYTE 10 DUP(0)
ArraySize BYTE 10
WelcomeMSG BYTE "Welcome! This program passes an array offset and array length to a procedure that then fills it with the Fibonacci sequence of numbers (1, 1, 2, 3, 5, 8, 13, 21, 34, 55)", 0
InitialArray BYTE "The initial array values are: ", 0
FinalArray BYTE "The final array values are: ", 0

.code
main PROC
	mov edx, OFFSET WelcomeMSG
	call WriteString                            ; prints welcome message to screen
	call crlf                                   ; formatting
	call crlf                                   ; formatting
	mov edx, OFFSET InitialArray
	call WriteString                            ; prints message indicating initial array values will be printed
	call crlf                                   ; formatting

	mov eax, 0                                  ; clear eax
	mov esi, 0                                  ; set esi to 0
	mov ecx, (LENGTHOF ArrayB)                  ; set loop counter to length of array (10)
	L1:
		mov al, ArrayB[esi]                     ; move array value to al
		call WriteInt                           ; print value in al
		call crlf                               ; formatting
		inc esi                                 ; esi = esi + 1 (points to next value in array)
		loop L1                                 ; loop

	invoke ArraySeries, ADDR ArrayB, ArraySize  ; calls the ArraySeries procedure

	call crlf                                   ; formatting
	mov edx, OFFSET FinalArray
	call WriteString                            ; prints message indicating final array values will be printed
	call crlf                                   ; formatting

	mov esi, 0                                  ; reset esi to 0
	mov ecx, LENGTHOF ArrayB                    ; set loop counter to length of array (10)
	L2:
		mov al, ArrayB[esi]                     ; move array value to al
		call WriteInt                           ; print value in al
		call crlf                               ; formatting
		inc esi                                 ; esi = esi + 1 (points to next value in array)
		loop L2                                 ; loop

	exit
main ENDP

;----------------------------------------------------------------------------------------;
; ArraySeries                                                                            ;
; Fills an array with the Fibonacci sequence of numbers                                  ;
; Receives: ADDR ArrayB = OFFSET of ArrayB                                               ;
;           ArraySize = Size of ArrayB (10)                                              ;
; Returns:  ax = Just to end procedure                                                   ;
;----------------------------------------------------------------------------------------;
ArraySeries PROC, ptrArrayB:PTR BYTE, ArrayBSize:BYTE
	mov esi, ptrArrayB                                 ; move byte pointer to esi
	mov eax, 1                                         ; move first value (1) to eax
	mov [esi], eax                                     ; set first value in array to 1
	inc esi                                            ; esi = esi + 1 (points to next value in array)
	mov [esi], eax                                     ; set second value in array to 1
	inc esi                                            ; esi = esi + 1 (points to next value in array)
	mov cl, ArrayBSize - 2                             ; set loop counter to remaining length of array (8)
	L3:
		mov al, [esi - 2]                              ; move value 2 spaces below current value in ArrayB to al
		mov bl, [esi - 1]                              ; move value 1 space below current value in ArrayB to bl
		add al, bl                                     ; add bl to al
		mov [esi], al                                  ; move resulting value from al to current value in ArrayB
		inc esi                                        ; esi = esi + 1 (points to next value in array)
		loop L3                                        ; loop
	ret                                                ; return to where this procedure was invoked
ArraySeries ENDP
END main