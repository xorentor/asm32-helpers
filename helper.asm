	global asm_strlen
asm_strlen:	
   	push	ebp
   	mov	ebp, esp

	mov	eax, [ebp + 8]
	mov	ebx, eax		; copy	

.loop:
	cmp	byte [eax], 0
	je	.end
	inc	eax

	jmp	.loop

.end:
	sub 	eax, ebx

   	mov   	esp, ebp
   	pop   	ebp

	ret	

	global asm_strcmp
asm_strcmp:
	push	ebp
	mov	ebp, esp

	mov	esi, [ebp + 8]
	mov	edi, [ebp + 0Ch]
	xor	eax, eax
	xor	ebx, ebx
.loop:
	mov	al, byte [esi]
	mov	bl, byte [edi]
	
	cmp	al, bl
	jnz	.end	
	
	cmp	al, 0
	jz	.end

	inc	esi
	inc	edi

	jmp	.loop

.end:
	sub	eax, ebx

	mov	esp, ebp
	pop	ebp
	
	ret

	global asm_memset
asm_memset:
	push	ebp
	mov	ebp, esp

	pushad

	mov	ebx, [ebp + 8]
	mov	eax, [ebp + 0Ch]
	mov	ecx, [ebp + 10h]
	
.loop:
	test	ecx, ecx
	jz	.end

	mov	byte [ebx], al

	dec	ecx
	inc	ebx

	jmp	.loop

.end:

	popad

	mov	esp, ebp
	pop	ebp
	
	ret

	global asm_memcpy
asm_memcpy:
	push	ebp
	mov	ebp, esp

	pushad

	mov	edi, [ebp + 8]
	mov	esi, [ebp + 0Ch]
	mov	ecx, [ebp + 10h]

	rep	movsb

	popad

	mov	esp, ebp
	pop	ebp
	
	ret
