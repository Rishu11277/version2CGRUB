OUTPUT_FORMAT(elf32-i386)
ENTRY(_start)

SECTIONS {
    . = 1M;   /* Load the kernel at 1MB, which GRUB expects */

    .multiboot_header ALIGN(8) : {
        KEEP(*(.multiboot_header))  /* Keep the multiboot header */
    }

    .text ALIGN(4K) : {
        *(.text)  /* Code section */
    }

    .rodata ALIGN(4K) : {
        *(.rodata)  /* Read-only data section */
    }

    .data ALIGN(4K) : {
        *(.data)  /* Initialized data section */
    }
}
