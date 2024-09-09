# 1 "fish.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "fish.c"
# 1 "fish.h" 1



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
# 5 "fish.h" 2





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
# 2 "fish.c" 2

# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 4 "fish.c" 2
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
# 5 "fish.c" 2
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
# 6 "fish.c" 2
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
# 7 "fish.c" 2
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
# 8 "fish.c" 2
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
# 9 "fish.c" 2
# 1 "digitalSound.h" 1



void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void pauseSounds();
void unpauseSounds();
void stopSounds();
# 49 "digitalSound.h"
typedef struct {
    const signed char* data;
    int dataLength;
    int frequency;
    int isPlaying;
    int looping;
    int durationInVBlanks;
    int priority;
    int vBlankCount;

} SOUND;

SOUND soundA;
SOUND soundB;
# 10 "fish.c" 2
# 1 "shortDing.h" 1


extern const unsigned int shortDing_sampleRate;
extern const unsigned int shortDing_length;
extern const signed char shortDing_data[];
# 11 "fish.c" 2

extern int vOff;
extern int hOff;
extern BOBBER bobber;
extern PLAYER player;
extern int won;
int activeFish;

void initWildA1() {
    for (int i = 0; i < 5; i++) {
        int xLower = 0;
        int xMax = 230;
        wildFishArea1[i].x = rand() % (xMax - xLower + 1) + xLower;
        wildFishArea1[i].y = 36 + 16 * i;
        wildFishArea1[i].xVel = 1;
        wildFishArea1[i].width = 16;
        wildFishArea1[i].height = 16;
        wildFishArea1[i].active = 0;
        wildFishArea1[i].hide = 1;
        wildFishArea1[i].caught = 0;
        wildFishArea1[i].direction = RIGHT;
        wildFishArea1[i].size = SMALL;
        wildFishArea1[i].sellPrice = 2;
        wildFishArea1[i].hide = 1;
        wildFishArea1[i].oamIndex = 5 + i;
        wildFishArea1[i].respawnTimer = 0;
        wildFishArea1[i].timeUntilNextFrame = 15;
        wildFishArea1[i].numFrames = 6;
    }
}

void updateWildA1() {
    activeFish = 0;
    for (int i = 0; i < 5; i++) {
        if (wildFishArea1[i].type == ANIM) {
            wildFishArea1[i].isAnimating = 1;
        }

        if (wildFishArea1[i].active) {
            wildFishArea1[i].respawnTimer = 0;
            if (wildFishArea1[i].y < (player.y - 160 / 2)) {
                wildFishArea1[i].active = 0;
                wildFishArea1[i].respawnTimer = 60;
            }
            if (wildFishArea1[i].y > (player.y + (160 / 2))) {
                wildFishArea1[i].active = 0;
                wildFishArea1[i].respawnTimer = 60;
            }
            if (wildFishArea1[i].x < 64 || wildFishArea1[i].x + wildFishArea1[i].width > 240 - 48) {
                wildFishArea1[i].hide = 1;
            } else {
                wildFishArea1[i].hide = 0;
            }


            if (collision(bobber.x + bobber.xOffset, bobber.y + bobber.yOffset, bobber.width, bobber.height, wildFishArea1[i].x, wildFishArea1[i].y, wildFishArea1[i].width, wildFishArea1[i].height)
            && !bobber.hasFish && !bobber.hide && basket.currentCapacity < 20) {
                mgba_printf("hooked!");
                if (wildFishArea1[i].type == HOSTILE && player.cheat) {
                    bobber.hasFish = 1;
                    wildFishArea1[i].caught = 1;
                } else if (wildFishArea1[i].type == HOSTILE) {
                    break;
                }
                bobber.hasFish = 1;
                wildFishArea1[i].caught = 1;

            }
            if (wildFishArea1[i].type == HOSTILE &&
            collision(player.x, player.y, player.width, player.height, wildFishArea1[i].x, wildFishArea1[i].y, wildFishArea1[i].width, wildFishArea1[i].height)
             && !wildFishArea1[i].caught && !player.hurt) {
                player.healthPoints -= 5;
                mgba_printf("hostile fish attack!");
                player.hurt = 1;
                if (wildFishArea1[i].direction == RIGHT) {
                    wildFishArea1[i].direction = LEFT;
                } else {
                    wildFishArea1[i].direction = RIGHT;
                }
            }
            if (wildFishArea1[i].caught) {
                wildFishArea1[i].x = bobber.x;
                wildFishArea1[i].y = bobber.y;
                if (bobber.hide) {
                    transferFish(&wildFishArea1[i]);
                }
            } else {
                if (wildFishArea1[i].direction == RIGHT) {
                    wildFishArea1[i].x += wildFishArea1[i].xVel;
                } else {
                    wildFishArea1[i].x -= wildFishArea1[i].xVel;
                }

                if ((wildFishArea1[i].x >= 240 - wildFishArea1[i].width) && wildFishArea1[i].direction == RIGHT) {
                    wildFishArea1[i].active = 0;

                } else if (wildFishArea1[i].x < 0 && wildFishArea1[i].direction == LEFT) {
                    wildFishArea1[i].active = 0;

                }
            }

            if (wildFishArea1[i].isAnimating) {
                wildFishArea1[i].timeUntilNextFrame--;
                if (wildFishArea1[i].timeUntilNextFrame == 0) {
                    wildFishArea1[i].currentFrame = wildFishArea1[i].currentFrame + 1;
                    if (wildFishArea1[i].currentFrame == 6) {
                        wildFishArea1[i].currentFrame = 0;
                    }
                    wildFishArea1[i].timeUntilNextFrame = 15;

                }
            }
        } else {
            wildFishArea1[i].respawnTimer--;
        }
    }
}

void spawnFishA1() {
    for (int i = 0; i < 5; i++) {
        if (!wildFishArea1[i].active && wildFishArea1[i].respawnTimer <= 0) {

            int freqAnim = 70;
            int freqFancy1 = 15;
            int freqFancy2 = 10;
            int freqFancy3 = 5;

            int totalFreq = 100;
            int randNum = rand() % totalFreq + 1;

            if (randNum <= freqAnim) {
                wildFishArea1[i].type = ANIM;
                wildFishArea1[i].sellPrice = 2;
            } else if (randNum <= freqAnim + freqFancy1) {
                wildFishArea1[i].type = FANCY1;
                wildFishArea1[i].sellPrice = 3;
            } else if (randNum <= freqAnim + freqFancy1 + freqFancy2) {
                wildFishArea1[i].type = FANCY2;
                wildFishArea1[i].sellPrice = 4;
            } else {
                wildFishArea1[i].type = FANCY3;
                wildFishArea1[i].sellPrice = 5;
            }
            if (treasure.hide) {
                wildFishArea1[i].type = HOSTILE;
                wildFishArea1[i].sellPrice = 50;
            }

            if (player.y > 480 && player.y < 960) {
                wildFishArea1[i].palRow = 2;
                wildFishArea1[i].sellPrice *= 2;
            } else if (player.y > 960) {
                wildFishArea1[i].palRow = 7;
                wildFishArea1[i].sellPrice *= 3;
            } else {
                wildFishArea1[i].palRow = 0;
            }
            int xLower = 0;
            int xMax = 1;
            int yLower = player.y - 240 / 2 + 20;
            int yMax = player.y + 240 / 2 - 20;
            wildFishArea1[i].y = rand() % (yMax - yLower + 1) + yLower;
            wildFishArea1[i].direction = rand() % (xMax - xLower + 1) + xLower;
            if (wildFishArea1[i].direction == LEFT) {
                wildFishArea1[i].x = 240 - wildFishArea1[i].width;
            } else {
                wildFishArea1[i].x = 0;
            }
            wildFishArea1[i].xVel = 1;
            wildFishArea1[i].hide = 1;
            wildFishArea1[i].caught = 0;
            wildFishArea1[i].active = 1;
        }
    }
}
void transferFish(FISH* fish) {
    int currIdx = basket.currentCapacity;
    playSoundB(shortDing_data, shortDing_length, 0);
    basket.totalValue += fish->sellPrice;
    if (basket.totalValue >= 999) {
        basket.totalValue = 999;
    }
    basket.fishStorage[currIdx].type = fish->type;
    basket.fishStorage[currIdx].sellPrice = fish->sellPrice;
    basket.fishStorage[currIdx].size = fish->size;
    fish->active = 0;
    fish->caught = 1;
    fish->respawnTimer = 60;
    if (fish->type == HOSTILE) {
        fish->respawnTimer = 30;
    }
    bobber.hasFish = 0;
    basket.currentCapacity++;
    mgba_printf("Bag has a current capacity of %d, total value of %d", basket.currentCapacity, basket.totalValue);
}

void initBasket() {
    basket.totalValue = 0;
    basket.currentCapacity = 0;
}
void updateBasket() {

}

void initTreasure() {
    treasure.active = 0;
    treasure.width = 8;
    treasure.height = 8;
    treasure.x = 115;
    treasure.y = 1220;
    treasure.oamIndex = 11;
    treasure.hide = 0;
}

void updateTreasure() {
    if (player.y + 240 / 2 - 1 >= treasure.y && !treasure.hide) {
        treasure.x = 115;
        treasure.active = 1;

    } else {
        treasure.active = 0;
    }
    if (treasure.active && !treasure.hide) {
        mgba_printf("treasure being drawn at this x of %d", treasure.x);
    if (collision(player.x, player.y, player.width, player.height, treasure.x, treasure.y, treasure.width, treasure.height)) {
        basket.totalValue *= 2;
        if (basket.totalValue >= 999) {
            basket.totalValue = 999;
        }
        treasure.active = 0;
        treasure.hide = 1;
    }
    }
}

void drawTreasure() {
    if (treasure.active) {
            mgba_printf("Treasure being drawn at %d, %d", treasure.x, treasure.y);
            shadowOAM[treasure.oamIndex].attr0 = (0 << 8) | (0 << 14) | ((treasure.y- vOff) & 0xFF);
            shadowOAM[treasure.oamIndex].attr1 = (0 << 14) | ((115) & 0x1FF);
            shadowOAM[treasure.oamIndex].attr2 = ((((0) * (32) + (13))) & 0x3FF);
    } else {
        shadowOAM[treasure.oamIndex].attr0 = (2 << 8);
    }
}

void drawFishA1() {
    for (int i = 0; i < 5; i++) {
        if (wildFishArea1[i].active && !wildFishArea1[i].hide) {

            if (wildFishArea1[i].type == ANIM) {
                shadowOAM[wildFishArea1[i].oamIndex].attr0 = (0 << 8) | (0 << 14) | ((wildFishArea1[i].y - vOff) & 0xFF);
                shadowOAM[wildFishArea1[i].oamIndex].attr1 = (1 << 14) | ((wildFishArea1[i].x - hOff) & 0x1FF);
                shadowOAM[wildFishArea1[i].oamIndex].attr2 = (((wildFishArea1[i].palRow) & 0xF) <<12) | ((((6) * (32) + (wildFishArea1[i].currentFrame * 2 + 1))) & 0x3FF);
            } else if (wildFishArea1[i].type == FANCY1) {
                shadowOAM[wildFishArea1[i].oamIndex].attr0 = (0 << 8) | (0 << 14) | ((wildFishArea1[i].y - vOff) & 0xFF);
                shadowOAM[wildFishArea1[i].oamIndex].attr1 = (1 << 14) | ((wildFishArea1[i].x - hOff) & 0x1FF);
                shadowOAM[wildFishArea1[i].oamIndex].attr2 = (((wildFishArea1[i].palRow) & 0xF) <<12) | ((((8) * (32) + (7))) & 0x3FF);
            } else if (wildFishArea1[i].type == FANCY2) {
                shadowOAM[wildFishArea1[i].oamIndex].attr0 = (0 << 8) | (0 << 14) | ((wildFishArea1[i].y - vOff) & 0xFF);
                shadowOAM[wildFishArea1[i].oamIndex].attr1 = (1 << 14) | ((wildFishArea1[i].x - hOff) & 0x1FF);
                shadowOAM[wildFishArea1[i].oamIndex].attr2 = (((wildFishArea1[i].palRow) & 0xF) <<12) | ((((8) * (32) + (3))) & 0x3FF);
            } else if (wildFishArea1[i].type == FANCY3) {
                shadowOAM[wildFishArea1[i].oamIndex].attr0 = (0 << 8) | (0 << 14) | ((wildFishArea1[i].y - vOff) & 0xFF);
                shadowOAM[wildFishArea1[i].oamIndex].attr1 = (1 << 14) | ((wildFishArea1[i].x - hOff) & 0x1FF);
                shadowOAM[wildFishArea1[i].oamIndex].attr2 = (((wildFishArea1[i].palRow) & 0xF) <<12) | ((((10) * (32) + (3))) & 0x3FF);
            } else if (wildFishArea1[i].type == HOSTILE) {
                shadowOAM[wildFishArea1[i].oamIndex].attr0 = (0 << 8) | (0 << 14) | ((wildFishArea1[i].y - vOff) & 0xFF);
                shadowOAM[wildFishArea1[i].oamIndex].attr1 = (1 << 14) | ((wildFishArea1[i].x - hOff) & 0x1FF);
                shadowOAM[wildFishArea1[i].oamIndex].attr2 = (((wildFishArea1[i].palRow) & 0xF) <<12) | ((((14) * (32) + (16))) & 0x3FF);
            }
            if (wildFishArea1[i].direction == LEFT && wildFishArea1[i].type == ANIM) {
                shadowOAM[wildFishArea1[i].oamIndex].attr1 |= (1 << 12);
            } else if (wildFishArea1[i].direction == RIGHT && !(wildFishArea1[i].type == ANIM)) {
                shadowOAM[wildFishArea1[i].oamIndex].attr1 |= (1 << 12);
            }
        } else {
            shadowOAM[wildFishArea1[i].oamIndex].attr0 = (2 << 8);
        }
    }
}
