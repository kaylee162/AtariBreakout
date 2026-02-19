
// structs

typedef struct {
    int x;
    int y;
    int oldX;
    int oldY;
    int xVelocity;
    int width;
    int height;
    unsigned short color;
} PLAYER;

typedef struct {
    int x;
    int y;
    int oldX;
    int oldY;
    int xVelocity;
    int yVelocity;
    int width;
    int height;
    unsigned short color;
} BALL;

// block struct
typedef struct {
    int x;
    int y;
    int oldX;
    int oldY;
    int xVelocity;
    int width;
    int height;
    unsigned short color;
    int active;
    int needToErase;
} BLOCK;


// constants
#define BLOCKCOUNT 30

// variables
extern PLAYER player;
extern BALL ball;

// create an array of BLOCKS of size BLOCKCOUNT and initialize it in game.c
extern BLOCK blocks[BLOCKCOUNT];
extern BALL ball;


extern int score;
extern unsigned short colors[8];

// function prototypes
void initGame();
void initPlayer();
void initBall();
void initBlocks();
void updateGame();
void updatePlayer();
void updateBall();
void updateBlocks();
void drawGame();
void drawPlayer();
void drawBall();
void drawBlocks();
void activateBlock();