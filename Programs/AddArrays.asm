TITLE Add Arrays           (AddArrays.asm)
INCLUDE Irvine32.inc
; Note: This program runs in 32-bit mode and accomplishes the goal of combining numbers at even indexes of two arrays into
; a new array, then prints all of these values to the command prompt.

.data
Array1  WORD 7h, 2h, 3h, 4h, 5h, 1h, 6h, 9h, 8h, 0h ; The First Array
Array2 	WORD 4h, 3h, 1h, 7h, 2h, 9h, 0h, 6h, 5h, 8h ; The Second Array
Array3 	WORD 10 DUP (?)                             ; The Combined and Final Array
a1message BYTE "Array1 Values: ",0                  ; String for Command Prompt Output
a2message BYTE "Array2 Values: ",0                  ; String for Command Prompt Output
a3message BYTE "Array3 Values: ",0                  ; String for Command Prompt Output

.code
main PROC                  ; Beginning of Main Procedure
	mov esi, OFFSET Array1 ; Assign the offset of array1 to the ESI register
	mov ecx, 5             ; Assigns the ECX register a value of 5 so that the loop will execute 5 times
	mov edx, OFFSET Array2 ; Assign the offset of array1 to the EDX register
	mov ebx, OFFSET Array3 ; Assign the offset of array1 to the EBX register
L1:
	call ArraySum          ; Call procedure ArraySum
	add edx, TYPE DWORD    ; Transfer offset to next even value in array1
	add esi, TYPE DWORD    ; Transfer offset to next even value in array1
	mov [ebx], ax          ; Transfer sum in EAX to array3
	add ebx, TYPE DWORD    ; Transfer offset to next value in array3
	loop L1

;--------------------------------------------------------------------------------------------------------
; ALL COMMANDS IN THIS BOX WILL WRITE THE ARRAY VALUES TO THE COMMAND PROMPT                            ;
	call crlf
	mov edx, OFFSET a1message
	call WriteString
	call crlf
	movzx eax, Array1
	call WriteHex
	call crlf
	movzx eax, [Array1 + 2]
	call WriteHex
	call crlf
	movzx eax, [Array1 + 4]
	call WriteHex
	call crlf
	movzx eax, [Array1 + 6]
	call WriteHex
	call crlf
	movzx eax, [Array1 + 8]
	call WriteHex
	call crlf
	movzx eax, [Array1 + 10]
	call WriteHex
	call crlf
	movzx eax, [Array1 + 12]
	call WriteHex
	call crlf
	movzx eax, [Array1 + 14]
	call WriteHex
	call crlf
	movzx eax, [Array1 + 16]
	call WriteHex
	call crlf
	movzx eax, [Array1 + 18]
	call WriteHex
	call crlf

	call crlf
	mov edx, OFFSET a2message
	call WriteString
	call crlf
	movzx eax, Array2
	call WriteHex
	call crlf
	movzx eax, [Array2 + 2]
	call WriteHex
	call crlf
	movzx eax, [Array2 + 4]
	call WriteHex
	call crlf
	movzx eax, [Array2 + 6]
	call WriteHex
	call crlf
	movzx eax, [Array2 + 8]
	call WriteHex
	call crlf
	movzx eax, [Array2 + 10]
	call WriteHex
	call crlf
	movzx eax, [Array2 + 12]
	call WriteHex
	call crlf
	movzx eax, [Array2 + 14]
	call WriteHex
	call crlf
	movzx eax, [Array2 + 16]
	call WriteHex
	call crlf
	movzx eax, [Array2 + 18]
	call WriteHex
	call crlf

	call crlf
	mov edx, OFFSET a3message
	call WriteString
	call crlf
	movzx eax, Array3
	call WriteHex
	call crlf
	movzx eax, [Array3 + 2]
	call WriteHex
	call crlf
	movzx eax, [Array3 + 4]
	call WriteHex
	call crlf
	movzx eax, [Array3 + 6]
	call WriteHex
	call crlf
	movzx eax, [Array3 + 8]
	call WriteHex
	call crlf
	movzx eax, [Array3 + 10]
	call WriteHex
	call crlf
	movzx eax, [Array3 + 12]
	call WriteHex
	call crlf
	movzx eax, [Array3 + 14]
	call WriteHex
	call crlf
	movzx eax, [Array3 + 16]
	call WriteHex
	call crlf
	movzx eax, [Array3 + 18]
	call WriteHex
	call crlf
; THIS MARKS THE END OF THE BOX CONTAINING THE COMMANDS THAT WRITE VALUES TO THE COMMAND PROMPT
;--------------------------------------------------------------------------------------------------------

	exit
main ENDP                  ; End of Main Procedure

;-----------------------------------------------------
; ArraySum
; Calculates the sum of two values from arrays of 32-bit integers.
; Receives: ESI = array1 offset
;			EDX = array2 offset
; Returns:  EAX = sum of the two distinct array elements
;-----------------------------------------------------
ArraySum PROC USES esi
	mov eax, 0             ; Initialize EAX as 0
	add eax, [esi]         ; Add value in array1 to EAX
	add eax, [edx]         ; Add value in array2 to EAX

	ret                    ; Return value in EAX
ArraySum ENDP    		   ; End of ArraySum Procedure

END main                   ; End of Program     