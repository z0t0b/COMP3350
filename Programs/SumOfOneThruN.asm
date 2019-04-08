TITLE Sum Of One Through N - Program by [REDACTED]         (SumOfOneThruN.asm)
INCLUDE Irvine32.inc
; Note: This program runs in 32-bit mode and accomplishes the goal of getting a user input n and summing up every number leading up to n. The final sum will be printed to the 
; command prompt window.

.data
message1 BYTE "Please enter your desired number to be summed: ",0
message2 BYTE "Your total sum is: ",0
intVal SDWORD ?

.code
main PROC
	mov edx, OFFSET message1
	call WriteString
	call ReadInt
	mov intVal, eax
	call crlf
	mov ecx, intVal
	mov eax, 0
L1:
	add eax, ecx
	loop L1
	mov edx, OFFSET message2
	call WriteString
	call WriteInt
	call crlf
main ENDP

END main