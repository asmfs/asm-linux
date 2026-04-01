section .bss
pwd resb 50
section .data
newl db 10
section .text
global _start
_start:
mov rax, 79
mov rdi, pwd
mov rsi, 64
syscall
mov rax, 1
mov rdi, 1
mov rsi, pwd
mov rdx, 64
syscall
mov rax, 1
mov rdi, 1
mov rsi, newl
mov rdx, 1
syscall
mov rax, 60
syscall
