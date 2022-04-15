[BITS 32]

section .asm

global _start

_start:
    ; print message1
    mov eax, message1
    call print_pop

    ; wait for a keypress
    call getkey

    ; print message2
    mov eax, message2
    call print_pop

    ; infinite loop
    jmp $

print_pop:
    push eax ; 1st argument is passed in eax
    mov eax, 1 ; kernel print command
    int 0x80
    add esp, 4 ; pop argument
    ret

getkey:
    mov eax, 2 ; kernel getkey command
    int 0x80
    cmp eax, 0 ; compare the return value with zero
    je getkey ; if it's zero, then do a busy wait (i.e. check again)
    ret

section .data
message1: db 'User Process: press any key to continue.', 10, 0
message2: db 'User Process: thank you for pushing a key!', 10, 0
