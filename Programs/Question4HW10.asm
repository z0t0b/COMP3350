; Question4HW10.asm    --  Created by Zachary Eli Bedsole
; Description: This program finds the total length of characters within a string and then finds a user-input character within the string and returns the first index of it.

INCLUDE Irvine32.inc
strrlength PROTO, ptrString:PTR BYTE
findChar PROTO, ptrString:PTR BYTE, char:BYTE

.data
WelcomeMSG BYTE "Welcome! This program finds the total length of characters within a string (limit: 100 characters) and takes a user-input character to find the first index with it in the string.", 0
stringPrompt BYTE "Please enter your desired string: ", 0
charPrompt BYTE "Please enter your desired character: ", 0
stringChars1 BYTE "The string has ", 0
stringChars2 BYTE " characters.", 0
found BYTE "The character has been found at index ", 0
notFound BYTE "The character has not been found in the given string.", 0
string BYTE 101 DUP(0)
amtOfChars BYTE ?
charInput BYTE ?
charIndex BYTE ?

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
	mov edx, OFFSET charPrompt
	call WriteString
	call ReadChar
	mov charInput, al
	call crlf
	call crlf

	INVOKE strrlength, ADDR string            ; transfer control to procedure

	mov edx, OFFSET stringChars1
	call WriteString                          ; display first part of prompt
	call WriteInt                             ; display resulting length of string to screen
	mov edx, OFFSET stringChars2
	call WriteString                          ; display second part of prompt
	call crlf                                 ; formatting
	call crlf                                 ; formatting
	mov amtOfChars, al

	INVOKE findChar, ADDR string, charInput

	cmp eax, 100
	je J3
	mov edx, OFFSET found
	call WriteString
	movzx eax, charIndex
	call WriteInt
	call crlf
	jmp J4
	J3:
	mov edx, OFFSET notFound
	call WriteString
	call crlf
	J4: exit
main ENDP

strrlength PROC USES edi, ptrString:PTR BYTE
	mov edi, ptrString                        ; move passed in string to edi
	mov eax, 0
	L1:
		cmp byte ptr [edi], 0                 ; end of string?
		je J1                                 ; yes: quit
		inc edi                               ; no: point to next
		inc eax                               ; add 1 to count
		jmp L1
	J1: ret
strrlength ENDP

findChar PROC USES edi ecx, ptrString:PTR BYTE, char:BYTE
	mov edi, ptrString
	mov bl, char
	movzx ecx, amtOfChars
	mov eax, 0
	L2:
		cmp byte ptr [edi], 0
		je J2
		cmp byte ptr [edi], bl
		je J2
		inc edi
		inc eax
		loop L2
	J2:
	mov charIndex, al
	ret
findChar ENDP
END main