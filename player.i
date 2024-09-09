# 1 "player.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "player.c"
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
typedef void (*ihp)(void);






extern volatile unsigned short *videoBuffer;
# 48 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


void waitForVBlank();
# 67 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;
extern DMA *dma;
# 99 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 2 "player.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 3 "player.c" 2
# 1 "sprites.h" 1
# 10 "sprites.h"
typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[128];
# 64 "sprites.h"
void hideSprites();


typedef struct {
    int x;
    int y;
    int xVel;
    int yVel;
    int width;
    int height;
    int timeUntilNextFrame;
    int direction;
    int isAnimating;
    int currentFrame;
    int numFrames;
    int hide;
    u8 oamIndex;
} SPRITE;
# 4 "player.c" 2
# 1 "print.h" 1
# 25 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 26 "print.h" 2
# 35 "print.h"

# 35 "print.h"
uint8_t mgba_open(void);
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
void mgba_close(void);
# 5 "player.c" 2
# 1 "player.h" 1



void initPlayer();
void initCursor();
void initBobber();
void updateBobber();
void updatePlayer();
void fireBobber();
void drawBobber();
void drawPlayer();



enum playerDirection {
    SWIM_LEFT,
    SWIM_RIGHT,
    SWIM_UP,
};
typedef struct {
    int x;
    int y;
    int xVel;
    int yVel;
    int width;
    int height;
    int timeUntilNextFrame;
    int direction;
    int isAnimating;
    int currentFrame;
    int numFrames;
    int hide;
    int ascending;
    int oxygenLevelDsc;
    int oxygenLevelAsc;
    int bodyPressure;
    int targetPressure;
    int depth;
    int healthPoints;
    int isMovingHorizontally;
    int originalHeight;
    int originalWidth;
    int cheat;
    int hurt;
    int isDodging;
    u8 oamIndex;
} PLAYER;

typedef struct {
    int x;
    int y;
    int oldX;
    int oldY;
    int xVel;
    int yVel;
    int width;
    int height;
    int timeUntilNextFrame;
    int direction;
    int isAnimating;
    int currentFrame;
    int numFrames;
    int hide;
    int hasFish;
    int xOffset;
    int yOffset;
    int returning;
    u8 oamIndex;
} BOBBER;
# 6 "player.c" 2
# 1 "state.h" 1



unsigned short buttons;
unsigned short oldButtons;
int rSeed;

void initialize();
void start();
void goToStart();
void lobby();
void goToLobby();
void gameArea1();
void goToGameArea1();
void gameArea2();
void goToGameArea2();
void gameArea3();
void goToGameArea3();
void pause();
void goToPause();
void win();
void goToWin();


void setupTimers();
void setupInterrupts();
void setupSounds();
void interruptHandler();

void srand();

enum States {
    START,
    INSTRUCTIONS,
    LOBBY,
    GAMEAREA1,
    GAMEAREA2,
    GAMEAREA3,
    PAUSE,
    WIN,
    LOSE
} state;

enum {
    BLACK = 255
} colors;
# 7 "player.c" 2
# 1 "game.h" 1




void initGame();
void initArea1();
void updateGameArea1();
void drawGameArea1();
void tilePrinter(char* string, int x, int y, int sb);



char oxygen1Buffer[4];
char oxygen2Buffer[4];
char internalPressureBuffer[4];
char externalPressureBuffer[4];
char depthBuffer[4];
char healthPointBuffer[3];

char bagCapBuffer[4];
char bagPriceBuffer[4];
# 8 "player.c" 2
# 1 "fish.h" 1
# 10 "fish.h"
enum {
    LEFT,
    RIGHT
} direction;

enum {
    SMALL,
    MEDIUM,
    LARGE,
    LEVIATHAN
} fishSize;

enum {
    ANIM,
    FANCY1,
    FANCY2,
    FANCY3,
    HOSTILE
} fishType;

typedef struct {
    int x;
    int y;
    int xVel;
    int yVel;
    int width;
    int height;
    int timeUntilNextFrame;
    int direction;
    int isAnimating;
    int currentFrame;
    int numFrames;
    int hide;
    int active;
    int caught;
    int size;
    int type;
    int sellPrice;
    int respawnTimer;
    int palRow;
    u8 oamIndex;
} FISH;

typedef struct {
    int type;
    int size;
    int sellPrice;
} STOREDFISH;

typedef struct {
    int maxCapacity;
    int currentCapacity;
    int totalValue;
    FISH fishStorage[20];
} BASKET;

FISH wildFishArea1[5];

FISH treasure;

BASKET basket;

void initWildA1();
void updateWildA1();
void spawnFishA1();
void drawFishA1();

void initFishA2();
void initFishA3();

void initBasket();
void updateBasket();

void updateTreasure();
void drawTreasure();

void transferFish(FISH* fish);
# 9 "player.c" 2
# 24 "player.c"
PLAYER player;

BOBBER bobber;
extern FISH treasure;


int hOff;
int vOff;
int lastYBoundary;
int playerFrameCounter;
int pressureFrameCounter;
int currentSBB;

int externalPressure;
int pressureDanger;

int playerTileDepth;
int bobberReach;

int pressureModifier = 1;
int flip;

extern int cheatActive;
# 55 "player.c"
void initBobber() {
    bobber.x = 120;
    bobber.y = 10;
    bobber.xOffset = 0;
    bobber.yOffset = 0;
    bobber.xVel = 4;
    bobber.yVel = 1;
    bobber.oamIndex = 1;
    bobber.hide = 1;
    bobber.hasFish = 0;
    bobber.returning = 0;
    bobberReach = 32;

}

void initPlayer() {
    player.x = 120;
    player.y = 8;
    player.xVel = 1;
    player.yVel = 1;
    player.oamIndex = 0;
    player.width = 16;
    player.height = 32;
    player.direction = SWIM_RIGHT;
    player.hide = 0;
    playerTileDepth = 1;
    player.ascending = 0;
    player.oxygenLevelDsc = 100;

    player.healthPoints = 100;
    player.bodyPressure = 0;
    player.targetPressure = 0;
    player.isAnimating = 1;
    player.isMovingHorizontally = 0;

    player.originalHeight = player.height;
    player.originalWidth = player.width;

    pressureFrameCounter = 0;
    externalPressure = 0;
    player.hurt = 0;


    player.timeUntilNextFrame = 15;
    player.currentFrame = 1;
    player.numFrames = 6;
    player.isAnimating = 1;
    if (cheatActive) {
        player.cheat = 1;
    } else {player.cheat = 0;}

    pressureDanger = 0;
}
void updateBobber() {
# 141 "player.c"
            if (bobber.x < 64 || bobber.x + bobber.width > 240 - 64) {
                bobber.hide = 1;
            }
    if (!bobber.hide && player.direction == SWIM_RIGHT) {
        bobber.oldX = player.x;
        bobber.oldY = player.y;
        if (player.isMovingHorizontally) {
            bobber.oldX = player.x + player.width;
        }
        bobber.y = player.y;
        if (bobber.x >= bobber.oldX + bobberReach) {
            bobber.returning = 1;
        }
        if (!bobber.returning) {
            bobber.x += bobber.xVel;
        } else {
            bobber.x -= bobber.xVel;
            if (bobber.x <= bobber.oldX) {
                bobber.hide = 1;
            }
        }

    } if (!bobber.hide && player.direction == SWIM_LEFT) {
        bobber.oldX = player.x;
        bobber.oldY = player.y;
        bobber.y = player.y;
        if (bobber.x <= player.x - bobberReach) {
            bobber.returning = 1;
        }
        if (!bobber.returning) {
            bobber.x -= bobber.xVel;
        } else {
            bobber.x += bobber.xVel;
            if (bobber.x >= bobber.oldX) {
                bobber.hide = 1;
            }
        }
    }
}

void updatePlayer() {
    if (!player.hide) {
        player.isMovingHorizontally = 0;
        player.width = 16;
        player.height = 32;
            int leftX = player.x;
    int rightX = player.x + player.width - 1;
    int topY = player.y;
    int bottomY = player.y + player.height - 1;
        if (player.oxygenLevelDsc <= 0) {
            player.oxygenLevelDsc = 0;
            if (playerFrameCounter % 2 == 0) {
                player.healthPoints--;
                player.hurt = 1;
            }
        }
        if (player.healthPoints <= 0) {
            goToLose();
        }
        playerFrameCounter++;
        player.targetPressure = externalPressure;
        if (player.cheat) {
            player.bodyPressure = player.targetPressure;
        }
        if (player.bodyPressure > player.targetPressure) {
            if (playerFrameCounter > 120) {
                player.bodyPressure -= 1;


            }
        }
        if (player.bodyPressure > player.targetPressure + 10) {
            pressureDanger = 1;
            if (playerFrameCounter % 10 == 0) {
                player.healthPoints -= 2;
                player.hurt = 1;

            }
        } else {
            pressureDanger = 0;
        }

        if (playerFrameCounter > 120) {

            player.oxygenLevelDsc--;

            playerFrameCounter = 0;
        }




        if ((~(buttons) & ((1 << 7)))
                                                                                                ) {
            pressureFrameCounter++;

            player.y += player.yVel;
            if (pressureFrameCounter > 30 && !(player.y > (160 * 8 - player.height))) {

                if (player.bodyPressure < externalPressure) {
                    player.bodyPressure += 2 * pressureModifier;
                }
                externalPressure += pressureModifier;
                pressureFrameCounter = 0;
            }



        }
        if ((~(buttons) & ((1 << 6)))
                                                                                              ) {
            player.y -= player.yVel;
            pressureFrameCounter--;
            if (pressureFrameCounter < 0 && !(player.y < 8)) {
                externalPressure -= pressureModifier;
                pressureFrameCounter = 30;
            }
        }

        if ((~(buttons) & ((1 << 5)))
                                                                                                   ) {
            player.direction = SWIM_LEFT;
            player.x -= player.xVel;
            player.isMovingHorizontally = 1;

            flip = 1;
        }
        if ((~(buttons) & ((1 << 4)))
                                                                                                    ) {
            player.direction = SWIM_RIGHT;
            player.x += player.xVel;
            player.isMovingHorizontally = 1;
            flip = 0;
        }
        if (player.isMovingHorizontally) {
            player.width = 32;
            player.height = 16;
        }
        if ((!(~(oldButtons) & ((1 << 0))) && (~(buttons) & ((1 << 0))))) {
            fireBobber();
        }
        if ((~(buttons) & ((1 << 1)))) {
            player.yVel = 2;
            if (playerFrameCounter % 5 == 0) {
                player.oxygenLevelDsc--;
            }
            if (playerFrameCounter % 120 == 0) {
                player.bodyPressure--;
            }
        } else {
            player.yVel = 1;
        }
        if (player.x < 64) {
            player.x = 64;
        }
        if (player.x + player.width > 240 - 40) {
            player.x = 240 - 40 - player.width;
        }

        if (player.y + player.height < 320) {
            ((unsigned short*) 0x5000000)[2] = (((31) & 31) | ((26) & 31) << 5 | ((0) & 31) << 10);
        } else if (player.y + player.height > 320 && player.y + player.height < 640) {
            ((unsigned short*) 0x5000000)[2] = (((0) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10);
        }else if (player.y + player.height > 640) {
            ((unsigned short*) 0x5000000)[2] = (((15) & 31) | ((0) & 31) << 5 | ((31) & 31) << 10);
        }
# 323 "player.c"
    hOff = player.x - ((240 - player.originalWidth) / 2);
    vOff = player.y - ((160 - player.originalHeight) / 2);

    currentSBB = 26 + vOff / 256;






    if (player.x < 0) {
        player.x = 0;
    }
    if (player.y < 0) {
        goToWin();

    }
    if (player.x > (32 * 8 - player.width)) {
        player.x = 32 * 8 - player.width;
    }
    if (player.y > (160 * 8 - player.height)) {
        player.y = 160 * 8 - player.height;
    }

    if (hOff < 0) {
        hOff = 0;
    }
    if (vOff < 0) {
        vOff = 0;
    }

    if (hOff > (32 * 8 - 240)) {
        hOff = (32 * 8 - 240);
    }
    if (vOff > (160 * 8 - 160)) {
        vOff = (160 * 8 - 160);
    }
    }

    if (player.isAnimating) {
        player.timeUntilNextFrame--;
        if (player.timeUntilNextFrame == 0) {
            player.currentFrame = (player.currentFrame + 1);
            if (player.currentFrame == 6) {
                player.currentFrame = 0;
            }
            player.timeUntilNextFrame = 15;
        }
    }

}





void fireBobber() {

    if (player.direction == SWIM_RIGHT && player.isMovingHorizontally) {
        bobber.x = player.x + player.width;
        bobber.y = player.y + player.height;
        bobber.oldX = player.x + player.width;
        bobber.oldY = player.y;
    } else {
        bobber.x = player.x;
        bobber.y = player.y;
        bobber.oldX = player.x;
        bobber.oldY = player.y;
    }
    bobber.returning = 0;
    bobber.hide = 0;

}

void drawBobber() {
    if (!bobber.hide) {
        shadowOAM[bobber.oamIndex].attr0 = (0 << 8) | (0 << 14) | ((bobber.y - vOff) & 0xFF);
        shadowOAM[bobber.oamIndex].attr1 = (0 << 14) | ((bobber.x - hOff) & 0x1FF);
        shadowOAM[bobber.oamIndex].attr2 = (((7) & 0xF) <<12) | ((((13) * (32) + (7))) & 0x3FF);
    } else {
        shadowOAM[bobber.oamIndex].attr0 = (2 << 8);
    }
}

void drawPlayer() {
        if (player.isMovingHorizontally) {
            shadowOAM[player.oamIndex].attr0 = (0 << 8) | (1 << 14) | ((player.y - vOff) & 0xFF);
        } else {
            shadowOAM[player.oamIndex].attr0 = (0 << 8) | (2 << 14) | ((player.y - vOff) & 0xFF);
        }
        shadowOAM[player.oamIndex].attr1 = (2 << 14) | ((player.x - hOff) & 0x1FF);

        if (flip) {

            shadowOAM[player.oamIndex].attr1 |= (1 << 12);
        }
        if (player.isMovingHorizontally) {
            shadowOAM[player.oamIndex].attr2 = ((((4) * (32) + (player.currentFrame * 4 + 1))) & 0x3FF);
        } else {
            shadowOAM[player.oamIndex].attr2 = ((((0) * (32) + (player.currentFrame * 2 + 1))) & 0x3FF);
        }
        if (player.cheat) {
            shadowOAM[player.oamIndex].attr2 |= (((8) & 0xF) <<12);
        } else {
            shadowOAM[player.oamIndex].attr2 |= (((0) & 0xF) <<12);
        }
        if (player.hurt) {
            shadowOAM[player.oamIndex].attr2 |= (((6) & 0xF) <<12);
        }

        (*(volatile unsigned short*) 0x4000008) = ((0) << 2) | ((currentSBB) << 8) | (2 << 14) | 1; ;

        (*(volatile unsigned short*) 0x04000012) = vOff % 256;
}
