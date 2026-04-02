section .bss
nwdir resb 255
section .data
nerrlog db "xalu: directory created;", 10
nerrloglen equ $-nerrlog
errlog db "xalu: directory not created;", 10
errloglen equ $-errlog
null_log db "xalu: directory cannot be null;", 10
null_loglen equ $-null_log
section .text
global _start
_start:
.mkdir:
mov rax, 0
mov rdi, 0
mov rsi, nwdir
mov rdx, 255
syscall
dec rax
mov byte[nwdir+rax], 0
cmp [nwdir], 0x00
je .errnull
mov rax, 83
mov rdi, nwdir
mov rsi, 0o755
syscall
cmp rax, 0
jne .logerr
.lognerr:
mov rax, 1
mov rdi, 1
mov rsi, nerrlog
mov rdx, nerrloglen
syscall
jmp .mkdir
.logerr:
mov rax, 1
mov rdi, 1
mov rsi, errlog
mov rdx, errloglen
syscall
jmp .mkdir
.errnull:
mov rax, 1
mov rdi, 1
mov rsi, null_log
mov rdx, null_loglen
syscall
jmp .mkdir
