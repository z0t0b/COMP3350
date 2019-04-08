; Question4HW8.asm   --  Created by [REDACTED]
; Description: Takes user input for X and Y in the form of 32-bit signed integers. Performs Z = X^2 - Y^2 and Z = (X - Y) * (X + Y) and writes both values to screen.

INCLUDE Irvine32.inc

.data
Xval SDWORD 0
Yval SDWORD 0
Zval1 SDWORD 0
Zval2 SDWORD 0
WelcomeMSG BYTE 'Welcome! This program takes user input for an X value and a Y value, then performs Z = X^2 - Y^2 and Z = (X - Y) * (X + Y)', 0dh, 0ah,
                'and writes both values to screen.', 0
PromptX BYTE "Please enter your desired X value (choose an integer between -2,147,483,648 and +2,147,483,647): ", 0
PromptY BYTE "Please enter your desired Y value (choose an integer between -2,147,483,648 and +2,147,483,647): ", 0
Zval1Result BYTE "Result for Z = X^2 - Y^2: ", 0
Zval2Result BYTE "Result for Z = (X - Y) * (X + Y): ", 0

.code
main PROC
	mov edx, OFFSET WelcomeMSG
	call WriteString            ; displays welcome message
	call crlf                   ; formatting
	call crlf                   ; formatting
	mov edx, OFFSET PromptX
	call WriteString            ; prompt user for x value
	call ReadInt                ; read user input and store in eax
	mov Xval, eax               ; store user input in Xval variable
	mov edx, OFFSET PromptY
	call WriteString            ; prompt user for y value
	call ReadInt                ; read user input and store in eax
	mov Yval, eax               ; store user input in Yval variable

	mov eax, Xval               ; temp storage for Xval so it isn't changed
	imul eax, eax               ; X^2
	mov ebx, Yval               ; temp storage for Yval so it isn't changed
	imul ebx, ebx               ; Y^2
	add Zval1, eax              ; Z = X^2
	sub Zval1, ebx              ; Z = X^2 - Y^2

	mov eax, Xval               ; temp storage for Xval so it isn't changed
	mov ebx, Yval               ; temp storage for Yval so it isn't changed
	sub eax, ebx                ; eax = (X - Y)
	mov Zval2, eax              ; Zval2 = (X - Y)
	mov eax, Xval               ; temp storage for Xval so it isn't changed
	mov ebx, Yval               ; temp storage for Yval so it isn't changed
	add eax, ebx                ; eax = (X + Y)
	mov ebx, Zval2              ; move (X - Y) to ebx for final step
	imul eax, ebx               ; eax = (X - Y) * (X + Y)
	mov Zval2, eax              ; Zval2 = (X - Y) * (X + Y)

	mov edx, OFFSET Zval1Result
	call crlf                   ; formatting
	call crlf                   ; formatting
	call WriteString            ; inform user that value will be printed to screen
	mov eax, Zval1              ; move Zval1 to eax to be printed to screen
	call WriteInt               ; display Zval1 to screen
	call crlf                   ; formatting
	mov edx, OFFSET Zval2Result
	call WriteString            ; inform user that value will be printed to screen
	mov eax, Zval2              ; move Zval2 to eax to be printed to screen
	call WriteInt               ; display Zval2 to screen
	call crlf                   ; formatting

	exit
main ENDP
END main