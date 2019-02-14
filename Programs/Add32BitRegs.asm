; Add32BitRegs.asm 

	.386
	.model flat, stdcall
	.stack 4096
	ExitProcess PROTO, dwExitCode:DWORD

	.data
	firstval SBYTE 123
	secondval SBYTE -3
	thirdval SBYTE 1
	sum DWORD 0

	.code
	main PROC
		movzx eax, firstval  ; eax = 123
		movsx ebx, secondval
		add eax, ebx         ; eax = 120
		movzx edx, thirdval
		add eax, edx         ; eax = 121
		mov sum, eax         ; sum = 121

		INVOKE ExitProcess, 0
	main ENDP
	END main