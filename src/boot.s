section .text
global start  ; Make 'start' visible to the linker
start:
section .multiboot_header
header_start:
    dd 0xe85250d6                ; magic number
    dd 0                         ; protected mode code
    dd header_end - header_start ; header length
    dd 0x100000000 - (0xe85250d6 + 0 + (header_end - header_start))
    dw 0    ; type
    dw 0    ; flags
    dd 8    ; size
header_end:
section .text
global _start
extern main
_start:
    call main
    hlt ;Good manners to have this here even though the code will never come to it
