# 0 "gba.c"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "gba.c"
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
# 25 "gba.h"
extern volatile unsigned short* videoBuffer;
# 35 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


void waitForVBlank();
# 70 "gba.h"
void drawRectangle(int x, int y, int width, int height, volatile unsigned short color);
void fillScreen(volatile unsigned short color);
void drawChar(int x, int y, char ch, volatile unsigned short color);
void drawString(int x, int y, char *str, volatile unsigned short color);
# 89 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile void* src;
    volatile void* dest;
    unsigned int ctrl;
} DMAChannel;
# 129 "gba.h"
void DMANow(int channel, volatile void* src, volatile void* dest, unsigned int ctrl);
# 2 "gba.c" 2
# 1 "font.h" 1

extern const unsigned char fontdata[12288];
# 3 "gba.c" 2

volatile unsigned short* videoBuffer = (unsigned short *)0x6000000;


void drawRectangle(int x, int y, int width, int height, volatile unsigned short color) {
    for (int i = 0; i < height; i++) {
        DMANow(3, &color, &videoBuffer[((y + i) * (240) + (x))], width | (2 << 23) | (0 << 21));
    }
}


void fillScreen(volatile unsigned short color) {
    DMANow(3, &color, videoBuffer, 38400 | (2 << 23));
}

void waitForVBlank() {
    while ((*(volatile unsigned short *)0x4000006) >= 160);
    while ((*(volatile unsigned short *)0x4000006) < 160);
}

int collision(int xA, int yA, int widthA, int heightA, int xB, int yB, int widthB, int heightB) {
    return yA <= yB + heightB - 1 && yA + heightA - 1 >= yB && xA <= xB + widthB - 1 && xA + widthA - 1 >= xB;
}


void drawChar(int x, int y, char ch, volatile unsigned short color) {
    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 8; j++) {
            if (fontdata[(48 * ch + i + 6 * j)]) {
                (videoBuffer[((y + j) * (240) + (x + i))] = color);
            }
        }
    }
}


void drawString(int x, int y, char *str, volatile unsigned short color) {
    int i = 0;
    while (str[i] != '\0') {
        drawChar(x + (i * 6), y, str[i], color);
        i++;
    }
}


void DMANow(int channel, volatile void* src, volatile void* dest, unsigned int ctrl) {

    ((DMAChannel*)0x040000B0)[channel].ctrl = 0;


    ((DMAChannel*)0x040000B0)[channel].src = src;


    ((DMAChannel*)0x040000B0)[channel].dest = dest;


    ((DMAChannel*)0x040000B0)[channel].ctrl = ctrl | (1 << 31);
}
