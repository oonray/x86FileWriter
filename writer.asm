global _start

section .data
filename db './file00.txt', 12

section .bss
counter: resb 1
data: resb 1000

section .text

_start:
mov counter, 0x0
mov data, 0x0
call makefiles
call exit

makefiles:
call create
cmp counter, 0x3E8
inc counter
mov [filename+7], counter
jne makefiles
ret

create:
mov eax, 8
mov ecx, 777
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


