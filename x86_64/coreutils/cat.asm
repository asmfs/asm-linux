section .bss
file resb 512
section .data
cmd_e db "exit"
newl db 10
section .text
global _start
_start:
.src:
mov rax, 0
mov rdi, 0
mov rsi, file
mov rdx, 55
syscall
dec rax
mov byte[file+rax], 0
mov eax, [file]
mov ebx, [cmd_e]
cmp eax, ebx
je .cmd_e_src
mov rax, 2
mov rdi, file
mov rsi, 0
mov rdx, 0
syscall
mov rdi, rax
mov rax, 0
mov rsi, file
mov rdx, 512
syscall
mov rdx, rax
mov rax, 1
mov rdi, 1
mov rsi, file
syscall
mov rax, 1
mov rdi, 1
mov rsi, newl
mov rdx, 1
syscall
jmp .src
.cmd_e_src:
mov rax, 60
mov rdi, 1
syscall
