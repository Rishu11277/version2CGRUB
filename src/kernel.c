#define VGA_MEMORY 0xB8000
#define VGA_WIDTH 80
#define VGA_HEIGHT 25
#define WHITE_ON_BLACK 0x0F
volatile unsigned short* vga = (volatile unsigned short*)VGA_MEMORY;

void main() {
    const char* message = "Hello from C!";
    for (int i = 0; message[i] != '\0'; i++) {
        vga[i] = message[i] | (WHITE_ON_BLACK << 8);
    }

    while (1);  // Infinite loop to prevent exit
}

