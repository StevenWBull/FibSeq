; First 7 numbers in Fibonacci Sequence
; Steven Bull

.386
.model flat, stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
fibArr dword 7 dup (0) ; setup an array of length 7 with default values of 0
fibArrLength dword LENGTHOF fibArr
index dword 0
.code

main proc

	mov esi, index
	mov ecx, fibArrLength	; move length of array into ecx to track how many numbers we want

	mov fibArr[esi], 0		; move 0 into array at index 0 since the first index will be zero
	add esi, 4				; increment index by 4 bytes due to dword
	dec ecx					; decrement ecx by one because we supplied one integer

	mov fibArr[esi], 1		; move 1 into array at index 1 since the first index will be one
	add esi, 4				; increment index by 4 bytes due to dword
	dec ecx					; decrement ecx by one because we supplied one integer

l1:
	mov eax, fibArr[esi-8]
	mov ebx, fibArr[esi-4]
	add eax, ebx
	mov fibArr[esi], eax
	add esi, 4

	loop l1

	invoke ExitProcess, 0

main endp
end main