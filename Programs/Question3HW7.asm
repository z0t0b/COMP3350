; Question3HW7.asm    --  Created by [REDACTED]
; Description: Accepts two inputs from the user. If they both differ by no more than +/-2, then the program will print "Agree"; otherwise, it will print "Disagree". If they agree and both values are above 45, it will print "take action".

INCLUDE Irvine32.inc

.data
WelcomeMSG BYTE 'Welcome! This program accepts two inputs from the user. If they both differ by no more than +/-2, then the program will print "Agree". ',0dh,0ah,
                'Otherwise, it will print "Disagree". If they agree and both values are above 45, it will print "Take Action".', 0
Agree BYTE "Agree", 0
Disagree BYTE "Disagree", 0
TakeAction BYTE "Take Action", 0
Prompt1 BYTE "Please enter your first value (choose a value between -90 and 90): ", 0
Prompt2 BYTE "Please enter your second value (choose a value between -90 and 90): ", 0
OutOfBounds BYTE "The number you selected is out of bounds. Please restart the program and choose a number between -90 and 90.", 0
val1 SBYTE ?
val2 SBYTE ?

.code
main PROC
	mov edx, OFFSET WelcomeMSG
	call WriteString            ; display welcome message
	call crlf                   ; formatting
	call crlf                   ; formatting
	mov edx, OFFSET Prompt1
	call WriteString            ; prompt for first value
	mov eax, 0                  ; clear eax
	call ReadInt
	mov val1, al                ; store first value in val1
	mov edx, OFFSET Prompt2
	call WriteString            ; prompt for second value
	mov eax, 0                  ; clear eax
	call ReadInt                
	mov val2, al                ; store second value in val2

	cmp val1, 90
	jle J1
	mov edx, OFFSET OutOfBounds
	call crlf                   ; formatting
	call crlf                   ; formatting
	call WriteString            ; print out of bounds error message to screen
	jmp Quit                    ; jump to end of main

	J1:
	cmp val1, -90
	jge J2
	mov edx, OFFSET OutOfBounds
	call crlf                   ; formatting
	call crlf                   ; formatting
	call WriteString            ; print out of bounds error message to screen
	jmp Quit                    ; jump to end of main

	J2:
	cmp val2, 90
	jle J3
	mov edx, OFFSET OutOfBounds
	call crlf                   ; formatting
	call crlf                   ; formatting
	call WriteString            ; print out of bounds error message to screen
	jmp Quit                    ; jump to end of main

	J3:
	cmp val2, -90
	jge J4
	mov edx, OFFSET OutOfBounds
	call crlf                   ; formatting
	call crlf                   ; formatting
	call WriteString            ; print out of bounds error message to screen
	jmp Quit                    ; jump to end of main

	J4:
	movzx ax, val1              ; zero-extend val1 to ax
	movzx bx, val2              ; zero-extend val2 to bx
	sub ax, bx                  ; subtract bx from ax
	cmp ax, 2                   ; compare the result in ax to 2
	jle J5                      ; jump to J1 if less than or equal to 2

	mov edx, OFFSET Disagree
	call crlf                   ; formatting
	call crlf                   ; formatting
	call WriteString            ; print "Disagree" to screen
	jmp Quit                    ; jump to end of main

	J5:                         
	cmp ax, -2                  ; compare the result in ax to -2
	jge J6                      ; jump to J2 if greater than or equal to -2

	mov edx, OFFSET Disagree
	call crlf                   ; formatting
	call crlf                   ; formatting
	call WriteString            ; print "Disagree" to screen
	jmp Quit                    ; jump to end of main

	J6:
	mov edx, OFFSET Agree
	call crlf                   ; formatting
	call crlf                   ; formatting
	call WriteString            ; print "Agree" to screen

	cmp val1, 45                ; compare the val1 to 45
	jg J7                       ; jump to J3 if greater than or equal to 45
	jmp Quit                    ; jump to end of main
	
	J7:
	cmp val2, 45                ; compare the val2 to 45
	jg J8                       ; jump to J4 if greater than or equal to 45
	jmp Quit                    ; jump to end of main

	J8:
	mov edx, OFFSET TakeAction
	call crlf                   ; formatting
	call WriteString            ; print "Take Action" to screen

	Quit:                       ; jumps go to here to end program if a certain condition isn't satisfied
main ENDP
END main