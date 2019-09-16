global _start

section .data
filename db './file0000.txt'

section .bss
data: resb 1000

section .text

_start:
mov dword[data],0
call makefiles
call exit

makefiles:
call create
call one
cmp byte [filename+6], 0x31
jne makefiles
ret

create:
mov eax, 8
mov ecx, 511
mov ebx, filename
int 0x80

call open
call write
call close
ret

open:
mov eax, 5
mov ebx, filename
mov ecx, 1
int 0x80
mov ebx,eax
ret

write:
mov eax, 4 
mov edx, 0x3E8
mov ecx, data
int 0x80
ret

close:
mov eax, 6
int 0x80
ret

exit:
mov eax, 1
int 0x80

one:
mov eax, 9
inc byte [filename+eax]
cmp byte [filename+eax], 0x3a; 9
je ten
ret

ten:
mov ebx,eax
dec eax
mov byte [filename+ebx],0x30; 0
inc byte [filename+eax]
cmp byte [filename+eax],0x3a
je hun
ret

hun:
mov ebx,eax
dec eax
mov byte [filename+ebx],0x30
inc byte [filename+eax]
cmp byte [filename+eax],0x3a
je thu
ret

thu:
mov ebx,eax
dec eax
mov byte [filename+ebx],0x30
inc byte [filename+eax]
ret

