#include <stdlib.h>
#include <stdio.h>
#include "font.h"
#include "gba.h"
#include "game.h"

// prototypes
void initialize();

// state prototypes
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// random prototype
void srand();

// text scoreBuffer
char scoreBuffer[41];

// states
enum
{
    START,
    GAME,
    PAUSE,
    WIN,
    LOSE
};
int state;

// buttons 
unsigned short buttons;
unsigned short oldButtons;

// random seed
int rSeed;

int main()
{
    initialize();

    while (1)
    {
        // update button variables
        oldButtons = buttons;
        buttons = REG_BUTTONS;

        // state machine
        switch (state) {
            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }
    }
}

// sets up GBA
void initialize()
{
    REG_DISPCTL = MODE(3) | BG_ENABLE(2);

    buttons = REG_BUTTONS;
    oldButtons = 0;

    goToStart();
}

// sets up the start state
void goToStart() {
    fillScreen(OFFWHITE);

    // spells out GAME BOY on the start screen in different colors
    char letters[8] = {'G', 'A', 'M', 'E', ' ', 'B', 'O', 'Y'};
    int col = 72;
    int spacing = 12;
    for(int i = 0; i < 8; i++){
        drawChar(col + (i * spacing), 70, letters[i], colors[i]);
    }

    drawString(77, 96, "Atari Breakout", VIORED);

    state = START;
    // begin the seed randomization
    rSeed = 0;
}

// runs every frame of the start state
void start() {
    // locking frame rate to 60fps
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {        
        goToGame();
        initGame();
    }
}

// sets up the game state
void goToGame() {
    fillScreen(OFFWHITE);
    // draw "score:" at (180, 1) in CYAN
    drawString(180, 1, "score:", CYAN);
    
    
    state = GAME;
}

// Runs every frame of the game state
void game() {
    updateGame();

    // update the scoreBuffer string with the current score
    sprintf(scoreBuffer, "%d", score);
    

    waitForVBlank();
    // erase old score, draw new score
    drawRectangle(220, 1, 12, 8, OFFWHITE);
    drawString(220, 1, scoreBuffer, CYAN);

    drawGame();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    // win and lose conditions
    if (score == -1) {
        goToLose();
    }
    if (score == 30) {
        goToWin();
    }
}

// Sets up the pause state
void goToPause() {
    fillScreen(OFFWHITE);
    drawString(136, 8, "got too stressed?", TEAL);
    drawString(130, 18, "you're paused now!", TEAL); 
    waitForVBlank();
    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

// Sets up the win state
void goToWin() {
    fillScreen(OFFWHITE);
    drawString(154, 8, "omg you won!!!", TEAL);
    drawString(88, 18, "press start to play again", TEAL);
    waitForVBlank();
    state = WIN;
}

// Runs every frame of the win state
void win() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

// Sets up the lose state
void goToLose() {
    fillScreen(OFFWHITE);
    drawString(172, 8, "you lost :(", TEAL);
    drawString(94, 18, "better luck next time :)", TEAL);
    drawString(76, 28, "press start to try again <3", TEAL);
    waitForVBlank();
    state = LOSE;
}

// Runs every frame of the lose state
void lose() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}