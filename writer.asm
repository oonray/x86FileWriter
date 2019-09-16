global _start

section .data
filename db './file00.txt', 12

section .text

_start:
call makefiles
call exit

makefiles:
push 0x0
call create
cmp dword [esp+4], 0x3E8
pop eax
inc eax
push eax
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
mov eax, 1
int 0x80


