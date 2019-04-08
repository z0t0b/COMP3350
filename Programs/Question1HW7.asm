; Question1HW7.asm   --  Created by [REDACTED]
; Description: Allows user input for an array of 10 values. This program then scans the array for any odd values, and if it finds one, it then displays the number and the indice at which it was found.

INCLUDE Irvine32.inc

.data
ArraySW SWORD 10 DUP(?)
welcomeText BYTE "Welcome! This program takes 10 signed integers as input into an array, then finds the first odd number and its indice (if it exists).", 0
prompt BYTE "Please enter your desired integer: ", 0
firstOddInteger BYTE "The first odd integer in the program is: ", 0
OddIndice BYTE ", and it is located at indice ", 0
OddIndicator BYTE "Odd integer found!", 0
NoOddIndicator BYTE "No odd integer found!", 0
OddVal SWORD 0
OddIndex WORD 0

.code
main PROC

	mov edx, OFFSET welcomeText
	call WriteString                   ; print welcome prompt
	call crlf                          ; formatting
	call crlf                          ; formatting
	mov edx, OFFSET prompt
	mov ebx, 0                         ; clear ebx
	mov ecx, 10                        ; loop counter = 10
	L1:
		call WriteString               ; prompt user for input
		call ReadInt                   ; get input
		mov ArraySW[ebx], ax           ; store input in array
		add ebx, 2                     ; advance to next spot in array
		loop L1                        ; loop

	mov eax, 0                         ; clear eax
	mov ebx, 0                         ; clear ebx
	mov ecx, 10                        ; loop counter = 10
	L2:
		movsx eax, ArraySW[ebx]        ; sign extend array value at position ebx to eax
		test ax, 1                     ; check if even or odd
		jz J1                          ; jump to J1 if even
		jnz J2                         ; jump to J2 if odd
		J1:                            ; start of J1
		add ebx, 2                     ; advance to next position in array
		mov edx, OFFSET NoOddIndicator ; set edx to indicate no odd value is found
		loop L2                        ; loop

	J2:                                ; start of J2 (breaks out of L2)
	mov ecx, 1                         ; loop counter = 1
	test ax, 1                         ; check if even or odd
	jz J3                              ; jump to J3 if even (skip next 8 lines)
	mov OddVal, ax                     ; move current odd value (first found) to OddVal
	mov eax, ebx                       ; move ebx (array indice) value to eax
	mov bx, 2                          ; move divisor 2 to bx
	div bl                             ; divide array indice in eax by 2
	mov OddIndex, ax                   ; move quotient into OddIndex
	mov edx, OFFSET OddIndicator       ; set edx to indicate odd value is found
	movsx eax, OddVal                  ; reset

	J3:                                ; start of J3 (jump to displaying values)
	call crlf                          ; formatting
	call crlf                          ; formatting
	call WriteString                   ; display whether odd value is found or not
	test ax, 1                         ; check if even or odd
	jz J4                              ; jump to J4 if even (skip next 9 lines)
	call crlf                          ; formatting
	mov edx, OFFSET firstOddInteger
	call WriteString                   ; text before displaying odd value to screen
	movsx eax, OddVal                  ; sign-extend odd value to eax
	call WriteInt                      ; display odd value to screen
	mov edx, OFFSET OddIndice
	call WriteString                   ; text before displaying odd value indice to screen
	movzx eax, OddIndex                ; zero-extend odd value indice to eax
	call WriteInt                      ; display odd value indice to screen
	J4:                                ; start of J4
	call crlf                          ; formatting
	call crlf                          ; formatting

main ENDP
END main