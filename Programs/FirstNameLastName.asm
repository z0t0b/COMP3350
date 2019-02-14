; FirstNameLastName.asm

TITLE My first assembly program
INCLUDE Irvine32.inc

.DATA
message BYTE "Firstname, Lastname",0

.CODE
main PROC
	mov edx, offset message
	Call WriteString
	exit
main ENDP
END main