; Question5HW8.asm    --  Created by [REDACTED]
; Description: Performs C = A + B using extended addition.

INCLUDE Irvine32.inc

.data
Apple QWORD	123456789ABCDE12h 
Berry QWORD	0ABCDEF123456789Ah
Cherry QWORD ?
placeholder WORD 0
WelcomeMSG BYTE 'Welcome! This program performs C = A + B using extended addition. A has the value 123456789ABCDE12h, and B has the value', 0ah, 0dh,
                '0ABCDEF123456789Ah.', 0
FinalPrompt BYTE "C = A + B = 123456789ABCDE12 + 0ABCDEF123456789A = ", 0

.code
main PROC
	mov edx, OFFSET WelcomeMSG
	call WriteString               ; displays welcome message
	mov dx, 0                      ; clears dx
	mov ax, WORD PTR Apple         ; move DE12h to ax
	mov bx, WORD PTR Berry         ; move 789Ah to bx
	add ax, bx                     ; add ax and bx together
	adc dx, 0                      ; carry flag is added to dx
	mov WORD PTR Cherry, ax        ; move ax value to end of Cherry

	mov ax, WORD PTR [Apple+2]     ; move 9ABCh to ax
	mov bx, WORD PTR [Berry+2]     ; move 3456h to bx
	add ax, dx                     ; add carry stored in dx to ax
	mov dx, 0                      ; clear dx
	add ax, bx                     ; add ax and bx together
    adc dx, 0                      ; carry flag is added to dx
	mov WORD PTR [Cherry+2], ax    ; move ax value to position before last value in Cherry variable

	mov ax, WORD PTR [Apple+4]     ; move 5678h to ax
	mov bx, WORD PTR [Berry+4]     ; move EF12h to bx
	add ax, dx                     ; add carry stored in dx to ax
	mov dx, 0                      ; clear dx
	add ax, bx                     ; add ax and bx together
	adc dx, 0                      ; carry flag is added to dx
	mov WORD PTR [Cherry+4], ax    ; move ax value to position before last value in Cherry variable

	mov ax, WORD PTR [Apple+6]     ; move 1234h to ax
	mov bx, WORD PTR [Berry+6]     ; move ABCDh to bx
	add ax, dx                     ; add carry stored in dx to ax
	mov dx, 0                      ; clear dx
	add ax, bx                     ; add ax and bx together
	adc dx, 0                      ; carry flag is added to dx
	mov WORD PTR [Cherry+6], ax    ; move ax value to position before last value in Cherry variable

	call crlf                      ; formatting      
	call crlf                      ; formatting
	mov ebx, TYPE placeholder      ; format hex outputs to 4 numbers instead of 8
	mov edx, OFFSET FinalPrompt
	call WriteString               ; display string to notify user that the final value will be displayed
	movzx eax, WORD PTR [Cherry+6] ; zero-extend first 4 hexadecimal numbers to eax
	call WriteHexB                 ; display first 4 hexadecimal numbers
	movzx eax, WORD PTR [Cherry+4] ; zero-extend second group of 4 hexadecimal numbers to eax
	call WriteHexB                 ; display second group of 4 hexadecimal numbers
	movzx eax, WORD PTR [Cherry+2] ; zero-extend third group of 4 hexadecimal numbers to eax
	call WriteHexB                 ; display third group of 4 hexadecimal numbers
	movzx eax, WORD PTR Cherry     ; zero-extend last group of 4 hexadecimal numbers to eax
	call WriteHexB                 ; display last group of 4 hexadecimal numbers
	call crlf                      ; formatting
	exit
main ENDP
END main