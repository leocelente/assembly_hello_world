; hello_world.asm
; Author: Leonardo Celente
; Date: nov25.19

global _start


section .text:
_start:   
    ; setup write syscall
    mov eax, 0x04           ; its a write
    mov ebx, 0x01           ; its using the stdout
    mov ecx, message        ; this is the content
    mov edx, message_len    ; this is the length
    ; make the call
    int 0x80

    ; setup exit syscall
    mov eax, 0x01
    mov ebx, 0x00
    int 0x80




section .rodata:
    message: db "Hello World!", 0xA
    message_len: equ $-message

