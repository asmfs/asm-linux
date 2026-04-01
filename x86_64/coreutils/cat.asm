section .bss
input resb 4096
section .text
global _start
_start:
.rep:
mov rax, 0
mov rdi, 0
mov rsi, input
mov rdx, 4096
syscall
mov rdx, rax
mov rax, 1
mov rdi, 1
mov rsi, input
syscall
jmp .rep
