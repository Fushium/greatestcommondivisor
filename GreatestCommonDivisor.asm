TITLE Greatest Common Divisor (GCD) (GreatestCommonDivisor.asm)
;Luis Selvera


INCLUDE Irvine32.inc

.data 
	array SDWORD  10,-30,18,24, 48, -144
	answer byte "Greatest Common Divisor : ",0
	prmp byte "Greatest Common Divisors of: 10 & -30, 18 & 24, and 48 & -144. ",0

.code
main PROC

	mov edx, OFFSET prmp
	call WriteString
	call crlf
	call crlf
	mov ecx, LENGTHOF array /2
	mov esi, OFFSET array

L1:
	mov edi, 2

L2:
	mov eax, [esi]
	add esi, 4
	cmp eax, 0
	jl L3
	jmp L4 

L3:
	neg eax

L4:
	push eax
	dec edi
	cmp edi, 0
	jne L2
	call CalcGcd
	mov edx, OFFSET answer
	call WriteString
	call WriteDec
	call crlf
	
	loop L1
		call WaitMsg  
		exit
		
main ENDP

CalcGcd PROC 
	pop edi
	pop eax
	pop ebx
GCD:
	mov edx, 0
	div ebx
	mov eax, ebx
	mov ebx, edx
	cmp ebx, 0
	jg GCD
	push edi
ret
CalcGcd ENDP

END main


