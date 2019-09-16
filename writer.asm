global _start

section .data
filename db 'file00.txt', 10

section .text

_start:
push 0x0;
call makefiles
call exit

makefiles:
call create
mov ecx, [esp+4]
push ecx
cmp dword [esp+4], 0x3E8
jne makefiles
ret

create:
mov eax, 8
mov eax, 777
mov ebx, filename
mov bx,[esp+4]
push ebx
int 0x80

call open
call write
call close
ret

open:
mov eax, 5
mov ebx, [esp+4]
mov ecx, 1
int 0x80
mov ebx,eax
ret

write:
mov eax, 4
mov edx, 0x3E8
int 0x80
ret

close:
mov eax, 6
int 0x80
ret

exit:
mov eax, 0
int 0x80


