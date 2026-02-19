#include "gba.h"
#include "game.h"
#include <stdlib.h>

// variables
PLAYER player;
BALL ball;

// Initialize the blocks array here
BLOCK blocks[BLOCKCOUNT];


unsigned short colors[8] = {RED, ORANGE, YELLOW, GREEN, BLUE, CYAN, TEAL, MAGENTA};

// score
int score;
int spawned;

// initializing game
void initGame() {
    // setting initial score
    score = 0;

    // initializing structs
    initPlayer();
    initBall();
    initBlocks();
}

// initializing player struct
void initPlayer() {
    player.y = 154;
    player.x = 117;
    player.oldY = player.y;
    player.oldX = player.x;
    player.xVelocity = 0;
    player.height = 5;
    player.width = 35;
    player.color = BRULEE;
}

// initializing ball struct 
void initBall() {
    ball.y = 150; 
    ball.x = 128;
    ball.oldY = ball.y;
    ball.oldX = ball.x;
    if (rand() & 1) {
        ball.xVelocity = 1;
    } else {
        ball.xVelocity = -1;
    }
    ball.yVelocity = -3;
    ball.height = 3;
    ball.width = 3;
    ball.color = PORTAGE;
}

// initializing block struct array
void initBlocks() { 
    for (int i = 0; i < BLOCKCOUNT; i++) {
        blocks[i].y = 10 + (i/6)*6;
        blocks[i].width = 36;
        blocks[i].height = 4;
        blocks[i].color = colors[i % 8];
    // initialize active block member here
        blocks[i].active = 1;    
    }

    // These loops are initializing the x position of each block in the array, depending on which index it is located at
    for (int i = 0; i < 6; i++) {
        blocks[i].x = 2 + (blocks[i].width * (i) + (i*4));
    }
     for (int i = 6; i < 12; i++) {
        blocks[i].x = 2 + (blocks[i].width * (i-6) + ((i-6)*4));
    }
    for (int i = 12; i < 18; i++) {
        blocks[i].x = 2 + (blocks[i].width * (i-12) + ((i-12)*4));
    }
     for (int i = 18; i < 24; i++) {
        blocks[i].x = 2 + (blocks[i].width * (i-18) + ((i-18)*4));
    }
     for (int i = 24; i < 30; i++) {
        blocks[i].x = 2 + (blocks[i].width * (i-24) + ((i-24)*4));
    }
}

// updating game
void updateGame() {
    // update structs
    updatePlayer();
    updateBall();
    // call updateBlocks()
    updateBlocks();


    if (score > 0 && !(score % 5)) {
        if (!spawned) {
            activateBlock();
            spawned = 1;
        }
    } else {
        spawned = 0;
    }
}

// update player struct
void updatePlayer() {
    // boundary/button
    if (BUTTON_HELD(BUTTON_LEFT) && (player.x-1 > 0)) {
        player.xVelocity = -3;
    }
    else if (BUTTON_HELD(BUTTON_RIGHT) && (player.x + player.width < SCREENWIDTH-1)) {
        player.xVelocity = 3;
    } else {
        player.xVelocity = 0;
    }
    // updating player position based on speed
    player.oldX = player.x;
    player.x += player.xVelocity;
}

// update ball struct
void updateBall() {
    // boundary checks
    if (ball.y <=10) {
        ball.yVelocity = 2;
    }
    if (ball.y + ball.height >= 159) { 
        ball.yVelocity = -2;
        // lose if ball falls to bottom of screen
        score = -1;
    }
    if (ball.x <= 1) {
        ball.xVelocity = 1;
    }
    if (ball.x + ball.width >= 239) {
        ball.xVelocity = -1;
    }
    // collision with player, depends on which half of the player the ball hits
    if (collision(ball.x, ball.y, ball.width, ball.height, player.x, player.y, player.width/2, player.height)) {
        ball.yVelocity *= -1;
        ball.xVelocity = -1;
    } else if (collision(ball.x, ball.y, ball.width, ball.height, (player.x+player.width/2), player.y, player.width/2, player.height)) {
        ball.yVelocity *= -1;
        ball.xVelocity = 1;
    }
    // update ball position based on speed
    ball.oldY = ball.y;
    ball.oldX = ball.x;
    ball.y += ball.yVelocity;
    ball.x += ball.xVelocity;
}

// update block struct
void updateBlocks() {
    for (int i = 0; i < BLOCKCOUNT; i++) {
        if (blocks[i].active == 1) {
             if (collision(ball.x, ball.y, ball.width, ball.height, blocks[i].x, blocks[i].y, blocks[i].width, blocks[i].height)) {
                 if (collision(ball.x, ball.y, ball.width, ball.height, blocks[i].x, blocks[i].y, ((blocks[i].width)/2), blocks[i].height)) {
                    ball.yVelocity *= -1;
                    ball.xVelocity = -1;
                 } else if (collision(ball.x, ball.y, ball.width, ball.height, (blocks[i].x+(blocks[i].width/2)), blocks[i].y, blocks[i].width/2, blocks[i].height)) {
                    ball.yVelocity *= -1;
                    ball.xVelocity = 1;
                 }
    
        // set the block's active member to 0 and needToErase member to 1, and increment the score
                blocks[i].active = 0;
                blocks[i].needToErase = 1;
                score++;
             }   
        }
    }
}

// drawing the game
void drawGame() {
    drawPlayer();
    drawBall();

    // call drawBlocks()
    drawBlocks();
    
}

// drawing the player
void drawPlayer() {
    drawRectangle(player.oldX, player.oldY, player.width, player.height, OFFWHITE);
    drawRectangle(player.x, player.y, player.width, player.height, player.color);
}

// drawing the ball
void drawBall() {
    drawRectangle(ball.oldX, ball.oldY, ball.width, ball.height, OFFWHITE);
    drawRectangle(ball.x, ball.y, ball.width, ball.height, ball.color);
}

// drawing the blocks
void drawBlocks() {
    for (int i=0; i < BLOCKCOUNT; i++) {
        if (blocks[i].active) {
            drawRectangle(blocks[i].oldX, blocks[i].oldY, blocks[i].width, blocks[i].height, OFFWHITE);
            drawRectangle(blocks[i].x, blocks[i].y, blocks[i].width, blocks[i].height, blocks[i].color);
        } else if (blocks[i].needToErase) {
            drawRectangle(blocks[i].x, blocks[i].y, blocks[i].width, blocks[i].height, OFFWHITE);
            blocks[i].needToErase = 0;
        }
    }
}


void activateBlock() {
    spawned = 1; 
    // iterate through each block in your block array to find the first inactive block
    // once found, set it to active, and break out of the loop
    for (int i=0; i < BLOCKCOUNT; i++) {
        if (blocks[i].active == 0) {
            blocks[i].active = 1;
            blocks[i].needToErase = 0;
            break;
        }
    }
}