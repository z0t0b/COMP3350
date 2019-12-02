; Question2HW10.asm    --  Created by Zachary Eli Bedsole
; Description: This program finds the total length of characters within a string.

INCLUDE Irvine32.inc
strrlength PROTO, ptrString:PTR BYTE

.data
WelcomeMSG BYTE "Welcome! This program finds the total length of characters within a string (limit: 100 characters).", 0
stringPrompt BYTE "Please enter your desired string: ", 0
stringChars1 BYTE "The string has ", 0
stringChars2 BYTE " characters.", 0
string BYTE 101 DUP(0)
amtOfChars BYTE ?

.code
main PROC

	mov edx, OFFSET WelcomeMSG
	call WriteString                          ; display welcome message
	call crlf                                 ; formatting
	call crlf                                 ; formatting
	
	mov edx, OFFSET stringPrompt
	call WriteString                          ; prompt user for string
	mov edx, OFFSET string
	mov ecx, SIZEOF string
	call ReadString                           ; reads string and places result in string variable
	mov eax, 0                                ; clears eax so length of string is unknown

	INVOKE strrlength, ADDR string            ; transfer control to procedure

	mov edx, OFFSET stringChars1
	call WriteString                          ; display first part of prompt
	call WriteInt                             ; display resulting length of string to screen
	mov edx, OFFSET stringChars2
	call WriteString                          ; display second part of prompt
	call crlf                                 ; formatting
	call crlf                                 ; formatting
	exit
main ENDP

strrlength PROC USES edi, ptrString:PTR BYTE
	mov edi, ptrString                        ; move passed in string to edi

	L1:
		cmp byte ptr [edi], 0                 ; end of string?
		je J1                                 ; yes: quit
		inc edi                               ; no: point to next
		inc eax                               ; add 1 to count
		jmp L1
	J1: ret
strrlength ENDP
END main