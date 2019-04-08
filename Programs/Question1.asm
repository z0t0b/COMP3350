; Question1.asm   --  Created by [REDACTED]
; Description: Allows user input for m, x, and c to calculate y = mx + c

INCLUDE Irvine32.inc

.data
mVal SWORD 0
xVal SWORD 0
cVal SWORD 0
welcomeText BYTE "Welcome! This program calculates y = mx + c based on your input.", 0
prompt1 BYTE "Please enter your value for m: ", 0
prompt2 BYTE "Please enter your value for x: ", 0
prompt3 BYTE "Please enter your value for c: ", 0
finalProduct BYTE "The final value for y is: ", 0

.code
main PROC
	mov edx, OFFSET welcomeText
	call WriteString                 ; displays welcome text
	call crlf
	call crlf

	mov edx, OFFSET prompt1
	call WriteString                 ; prompts user for m value
	call ReadInt                     ; reads user input
	mov mVal, ax                     ; moves the user input to a local variable

	mov edx, OFFSET prompt2
	call WriteString                 ; prompts user for x value
	call ReadInt                     ; reads user input
	mov xVal, ax                     ; moves the user input to a local variable

	mov edx, OFFSET prompt3
	call WriteString                 ; prompts user for c value
	call ReadInt                     ; reads user input
	mov cVal, ax                     ; moves the user input to a local variable

	movsx eax, mVal                  ; moves the m value to eax with sign extension for the next command
	imul xVal                        ; multiplies m and x and stores the product in eax
	movsx ebx, cVal
	add eax, ebx                     ; adds the c value to the previous value, storing final y value in eax
	call crlf

	mov edx, OFFSET finalProduct
	call WriteString                 ; displays text for final value
	call WriteInt                    ; displays final value to the screen
	call crlf                        ; formatting
	exit
main ENDP
END main