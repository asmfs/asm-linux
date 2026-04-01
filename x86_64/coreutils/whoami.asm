section .data
erootstr db "root", 10
erootlen equ $-erootstr
nerootstr db "user", 10
nerootlen equ $-nerootstr
section .text
global _start
_start:
mov rax, 102
syscall
cmp rax, 0
jne .ne_root
.e_root:
mov rax, 1
mov rdi, 1
mov rsi, erootstr
mov rdx, erootlen
syscall
jmp .end
.ne_root:
mov rax, 1
mov rdi, 1
mov rsi, nerootstr
mov rdx, nerootlen
syscall
.end:
mov rax, 60
syscall
