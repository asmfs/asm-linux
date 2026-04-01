section .data
txtss db "xalu: removed file;", 10
sslen equ $-txtss
section .bss
filevp resb 4096
section .text
global _start
_start:
mov rax, 0
mov rdi, 0
mov rsi, filevp
mov rdx, 4096
syscall
dec rax
mov byte[filevp+rax], 0
mov rax, 87
mov rdi, filevp
syscall
mov rax, 1
mov rdi, 1
mov rsi, txtss
mov rdx, sslen
syscall
xor rdi, rdi
mov rax, 60
syscall
