TITLE Addressing Modes			(HW5Question2.asm)
INCLUDE Irvine32.inc
.data
alpha 	DWORD		70405046h, 50607080h  
beta 		DWORD		91A3B2C7h, 0D0E0F012h
gamma  	DWORD 	0CDABh

.code		
main PROC	
	mov eax, 0A1C3h;			Immediate
	mov ecx, eax;			Register to Register	
	mov edi, OFFSET beta;		Immediate	
	mov [gamma], eax; 		Direct	
	mov esi, gamma;			Direct	
	mov esi, 4;  			Immediate	
	mov eax, beta[esi];		Indirect-offset	
	mov ebx, OFFSET alpha;		Immediate	
	mov eax, [ebx];  			Indirect	
	mov eax, 4[ebx]; 			Indirect-displacement	
	mov eax, 4[ebx][esi];  		Base-Indirect-displacement	
exit
main ENDP
END main
