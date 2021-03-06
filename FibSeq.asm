; First 7 numbers in Fibonacci Sequence
; Steven Bull

.386
.model flat, stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
fibArr dword 7 dup (0)					; setup an array of length 7 with default values of 0
fibArrLength dword LENGTHOF fibArr		; get length of the array to determine how many intergers we need to calculate

.code

main proc

	mov esi, 0				; set the esi register to 0 to point to the first index address in fibArr
	mov ecx, fibArrLength	; move length of array into ecx to track how many integers we want

	mov fibArr[esi], 0		; move 0 into array at index 0 since the first index will be zero
	add esi, 4				; increment index by 4 bytes due to dword
	dec ecx					; decrement ecx by one because we supplied one integer

	mov fibArr[esi], 1		; move 1 into array at index 1 since the second index will be one
	add esi, 4				; increment index by 4 bytes due to dword
	dec ecx					; decrement ecx by one because we supplied one integer

l1:
	mov eax, fibArr[esi-8]	; eax = Fib(n - 2)
	mov ebx, fibArr[esi-4]	; ebx = Fib(n - 1)
	add eax, ebx			; eax = Fib(n - 1) + Fib(n - 2)
	mov fibArr[esi], eax	; store sum of Fib(n - 1) + Fib(n - 2) at next index in fibArr
	add esi, 4				; increment index by 4 bytes due to dword

	loop l1

	invoke ExitProcess, 0

main endp
end main