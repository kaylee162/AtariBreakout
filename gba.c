#include "gba.h"
#include "font.h"

volatile unsigned short* videoBuffer = (unsigned short *)0x6000000;

// drawRectangle using DMA
void drawRectangle(int x, int y, int width, int height, volatile unsigned short color) {
    for (int i = 0; i < height; i++) {
        DMANow(3, &color, &videoBuffer[OFFSET(x, y + i, SCREENWIDTH)], width | DMA_SOURCE_FIXED | DMA_DESTINATION_INCREMENT);
    }
}

// fillScreen using DMA
void fillScreen(volatile unsigned short color) {
    DMANow(3, &color, videoBuffer, 38400 | DMA_SOURCE_FIXED);
}

void waitForVBlank() {
    while (REG_VCOUNT >= 160);
    while (REG_VCOUNT < 160);
}

int collision(int xA, int yA, int widthA, int heightA, int xB, int yB, int widthB, int heightB) {
    return yA <= yB + heightB - 1 && yA + heightA - 1 >= yB && xA <= xB + widthB - 1 && xA + widthA - 1 >= xB;
}

// Draws the specified character at the specified location in Mode 3
void drawChar(int x, int y, char ch, volatile unsigned short color) {
    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 8; j++) {
            if (fontdata[(48 * ch + i + 6 * j)]) {
                setPixel(x + i, y + j, color);
            }
        }
    }
}

// Draws the specified string at the specified location in Mode 3
void drawString(int x, int y, char *str, volatile unsigned short color) {
    int i = 0;
    while (str[i] != '\0') {
        drawChar(x + (i * 6), y, str[i], color);
        i++;
    }
}

// Immediately begins a DMA transfer using parameters
void DMANow(int channel, volatile void* src, volatile void* dest, unsigned int ctrl) {
    // Clear ctrl in the specified DMA channel
    DMA[channel].ctrl = 0;    

    // Set the src of the specified dma channel to the passed in src
    DMA[channel].src = src;

    // Set the dest of the specified dma channel to the passed in dest
    DMA[channel].dest = dest;

    // Set the ctrl of the specified dma channel to the passed in ctrl and turn the dma channel on
    DMA[channel].ctrl = ctrl | DMA_ON;
}