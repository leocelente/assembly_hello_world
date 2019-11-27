; hello_world.asm
; Author: Leonardo Celente
; Date: nov26.19

global _start

section .data
    greeting db "Hello There!", 0x0A
    greeting_len equ $-greeting
    prefix db "You typed: ", 0x0A
    prefix_len equ $-prefix

section .bss
   input_buffer     resb 0x0F              ; 5-byte buffer (in data section)

section .text
_start:
    mov eax, 0x04               ; write syscall
    mov ebx, 0x01               ; stdout file descriptor
    mov ecx, greeting           ; message content
    mov edx, greeting_len         ; message length
    int 0x80                    ; call kernel


    mov eax, 0x03               ; write syscall
    mov ebx, 0x00               ; stdin file descriptor
    mov ecx, input_buffer       ; buffer to be written
    mov edx, 0x0F    ; buffer length
    int 0x80

    mov eax, 0x04               ; write syscall
    mov ebx, 0x01               ; stdout file descriptor
    mov ecx, prefix           ; message content
    mov edx, prefix_len        ; message length
    int 0x80                    ; call kernel


    mov eax, 0x04               ; write syscall
    mov ebx, 0x01               ; stdout file descriptor
    mov ecx, input_buffer           ; message content
    mov edx, 0x0F        ; message length
    int 0x80                    ; call kernel
 

    ;; exit
    mov eax, 0x01
    mov ebx, 0x00
    int 0x80


