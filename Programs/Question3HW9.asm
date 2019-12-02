; Question3HW9.asm    --  Created by Zachary Eli Bedsole
; Description: This program computes the area of the first two terms of a series of triangles inside of one another and the area of the closed form sum.

INCLUDE Irvine32.inc

.data
triangleArea BYTE (12 * 20)/2
WelcomeMSG BYTE "Welcome! This program computes the area of a series of triangles inside of one another with base 12 and height 20 on the outside triangle. It will compute the area of the first two terms of the series and the area of the closed form sum.", 0
firstMSG BYTE "The area of the first two terms is: ", 0
secondMSG BYTE "The area of the closed form sum is: ", 0

.code
main PROC
	mov edx, OFFSET WelcomeMSG
	call WriteString            ; display welcome messaage
	call crlf                   ; formatting
	call crlf                   ; formatting
	mov edx, 0                  ; clear edx
	mov eax, 0                  ; clear eax

	mov al, triangleArea        ; al = 120
	mov bl, triangleArea        ; bl = 120
	shr bl, 2                   ; bl = 30
	add al, bl                  ; al = 150

	mov edx, OFFSET firstMSG
	call WriteString            ; display first message
	call WriteInt               ; write 150 to screen
	call crlf                   ; formatting
	 
	mov eax, 0                  ; clear eax
	mov al, triangleArea        ; al = 120
	push eax                    
	L1:
		pop ebx
		shr bl, 2               ; divide number in bl by 4
		jz emptyVal             ; jump to emptyVal if bl is empty
		add al, bl              ; if not: add it to area sum
		push ebx
		jmp L1                  ; continuous jump until bl is 0

	emptyVal:
	mov edx, OFFSET secondMSG
	call WriteString            ; display second message
	call WriteInt               ; write 158 to screen
	call crlf                   ; formatting

	exit
main ENDP
END main