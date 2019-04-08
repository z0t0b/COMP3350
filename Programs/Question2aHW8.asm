; Question2aHW8.asm   --  Created by [REDACTED]
; Description: Accepts user input between -2,147,483,648 and +2,147,483,647 and performs binary multiplication between that number and 45 before writing the result to the screen.

INCLUDE Irvine32.inc

.data
WelcomeMSG BYTE "Welcome! This program accepts a value between -2,147,483,648 and +2,147,483,647 and performs binary multiplication between that number and 45 before writing the result to the screen.", 0
Prompt BYTE "Please input your desired value (an integer between -2,147,483,648 and +2,147,483,647): ", 0
DisplayMSG BYTE "Your input multiplied by 45 is: ", 0
InitialVal DWORD 0

.code
main PROC
	mov edx, OFFSET WelcomeMSG
	call WriteString           ; print welcome message to screen
	call crlf                  ; formatting
	call crlf                  ; formatting
	mov edx, OFFSET Prompt
	call WriteString           ; prompt user for input
	call ReadInt               ; store user input in eax
	mov InitialVal, eax        ; store user input in InitialVal variable

	mov ebx, InitialVal        ; assign InitialVal value to ebx
	mov edx, InitialVal        ; assign InitialVal value to edx
	shl eax, 5                 ; InitialVal * 32
	shl ebx, 3                 ; InitialVal * 8
	shl edx, 2                 ; InitialVal * 4
	add eax, ebx               ; eax = (InitialVal * 32) + (InitialVal * 8) = InitialVal * 40
	add eax, edx               ; eax = (InitialVal * 32) + (InitialVal * 8) + (InitialVal * 4) = InitialVal * 44
	add eax, InitialVal        ; eax = (InitialVal * 32) + (InitialVal * 8) + (InitialVal * 4) + (InitialVal * 1) = InitialVal * 45
	mov edx, OFFSET DisplayMSG
	call crlf                  ; formatting
	call crlf                  ; formatting
	call WriteString           ; display message telling user that final value will be printed
	call WriteInt              ; print final value to screen
	call crlf                  ; formatting
	exit
main ENDP
END main