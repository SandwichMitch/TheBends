# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
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
# 2 "game.c" 2
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
# 3 "game.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 4 "game.c" 2
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
# 5 "game.c" 2
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
# 6 "game.c" 2
# 1 "oceanbg.h" 1







extern const unsigned short oceanbgMap[1024];
# 7 "game.c" 2
# 1 "beachocean.h" 1
# 21 "beachocean.h"
extern const unsigned short beachoceanTiles[8192];


extern const unsigned short beachoceanPal[256];
# 8 "game.c" 2
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
# 9 "game.c" 2
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
# 10 "game.c" 2
# 1 "finalprojectspritesheet.h" 1
# 21 "finalprojectspritesheet.h"
extern const unsigned short finalprojectspritesheetTiles[16384];


extern const unsigned short finalprojectspritesheetPal[256];
# 11 "game.c" 2
# 1 "finalprojecttilesheetM3.h" 1
# 21 "finalprojecttilesheetM3.h"
extern const unsigned short finalprojecttilesheetM3Tiles[8192];


extern const unsigned short finalprojecttilesheetM3Pal[256];
# 12 "game.c" 2

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
# 14 "game.c" 2
# 1 "loopingTrack.h" 1


extern const unsigned int loopingTrack_sampleRate;
extern const unsigned int loopingTrack_length;
extern const signed char loopingTrack_data[];
# 15 "game.c" 2
# 1 "shortDing.h" 1


extern const unsigned int shortDing_sampleRate;
extern const unsigned int shortDing_length;
extern const signed char shortDing_data[];
# 16 "game.c" 2
# 1 "userinterfacediving.h" 1







extern const unsigned short userinterfacedivingMap[1024];
# 17 "game.c" 2

# 1 "newoceanmapXLBIGTEST.h" 1







extern const unsigned short newoceanmapXLBIGTESTMap[5120];
# 19 "game.c" 2



extern PLAYER player;
extern int externalPressure;
extern int pressureDanger;
int frameCounter;
int totalMinutes;
int totalSeconds;

int hurtFrames;
void initGame() {
    (*(volatile unsigned short*) 0x4000000) = ((0) & 7) | ((1 << (8 + (0 & 3)))) | ((1 << (8 + (1 & 3)))) | (1 << 12);
    (*(volatile unsigned short*) 0x4000008) = ((0) << 2) | ((26) << 8) | (2 << 14) | 1;
    (*(volatile unsigned short*) 0x400000A) = ((0) << 2) | ((8) << 8) | (0 << 14) | 0;



    DMANow(3, finalprojecttilesheetM3Pal, ((unsigned short*) 0x5000000), 512 / 2);
    DMANow(3, finalprojecttilesheetM3Tiles, &((CB*) 0x6000000)[0], 16384 / 2);

    DMANow(3, userinterfacedivingMap, &((SB*) 0x6000000)[8], (2048) / 2);
    DMANow(3, newoceanmapXLBIGTESTMap, &((SB*) 0x6000000)[26], (10240) / 2);



    DMANow(3, finalprojectspritesheetTiles, &((CB*) 0x6000000)[4], 32768 / 2);
    DMANow(3, finalprojectspritesheetPal, ((u16*) 0x5000200), 256);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*) 0x7000000), 128 * 4);
    playSoundA(loopingTrack_data, loopingTrack_length, 1);
    totalMinutes = 2;
    totalSeconds = 0;


}

void initArea1() {
    hurtFrames = 15;
    initBobber();
    initBasket();
    initWildA1();
    initPlayer();
    initTreasure();
}

void updateGameArea1() {
    updatePlayer();
    if (player.hurt) {
        hurtFrames--;
        if (hurtFrames == 0) {
            player.hurt = 0;
            hurtFrames = 15;
        }
    }
    updateWildA1();
    spawnFishA1();
    updateTreasure();
    updateBobber();







    updateUI();
}

void drawGameArea1() {
    drawPlayer();
    drawFishA1();
    drawBobber();
    drawTreasure();
    drawUI();
}

void updateUI() {
    sprintf(healthPointBuffer, "%03d", player.healthPoints);

    sprintf(oxygen1Buffer, "%03d", player.oxygenLevelDsc);


    sprintf(internalPressureBuffer, "%03d", player.bodyPressure);
    sprintf(externalPressureBuffer, "%03d", externalPressure);
    sprintf(depthBuffer, "%04d", player.y);

    sprintf(bagCapBuffer, "%03d", basket.currentCapacity);
    sprintf(bagPriceBuffer, "%03d", basket.totalValue);
}

void drawUI() {
    tilePrinter(healthPointBuffer, 2, 3, 8);
    tilePrinter(oxygen1Buffer, 2, 6, 8);

    tilePrinter(internalPressureBuffer, 2, 12, 8);
    if (pressureDanger) {
        mgba_printf("pressure danger!");
        for (int i = 2; i < 5; i++) {
            ((SB*) 0x6000000)[8].tilemap[((12) * (32) + (i))] |= ((2 & 15) << 12);
        }
    } else {
        for (int i = 2; i < 5; i++) {
            ((SB*) 0x6000000)[8].tilemap[((12) * (32) + (i))] |= ((0 & 15) << 12);
        }
    }
    tilePrinter(externalPressureBuffer, 2, 15, 8);
    tilePrinter(depthBuffer, 2, 18, 8);

    tilePrinter(bagCapBuffer, 26, 4, 8);
    tilePrinter(bagPriceBuffer, 26, 7, 8);
}

void tilePrinter(char* string, int x, int y, int sb) {

    int thisX = x;
    int tileID;
    while (*string != '\0') {
        char currChar = *string;




    switch (currChar) {
        case '0':
            tileID = 257;
            break;
        case '1':
            tileID = 259;
            break;
        case '2':
            tileID = 261;
            break;
        case '3':
            tileID = 263;
            break;
        case '4':
            tileID = 265;
            break;
        case '5':
            tileID = 267;
            break;
        case '6':
            tileID = 269;
            break;
        case '7':
            tileID = 271;
            break;
        case '8':
            tileID = 273;
            break;
        case '9':
            tileID = 275;
            break;
        case 'A':
            tileID = 106;
            break;
        case 'B':
            tileID = 108;
            break;
        case 'C':
            tileID = 110;
            break;
        case 'D':
            tileID = 112;
            break;
        case 'E':
            tileID = 114;
            break;
        case 'F':
            tileID = 116;
            break;
        case 'G':
            tileID = 118;
            break;
        case 'H':
            tileID = 120;
            break;
        case 'I':
            tileID = 122;
            break;
        case 'J':
            tileID = 124;
            break;
        case 'K':
            tileID = 170;
            break;
        case 'L':
            tileID = 172;
            break;
        case 'M':
            tileID = 174;
            break;
        case 'N':
            tileID = 176;
            break;
        case 'O':
            tileID = 178;
            break;
        case 'P':
            tileID = 180;
            break;
        case 'Q':
            tileID = 182;
            break;
        case 'R':
            tileID = 184;
            break;
        case 'S':
            tileID = 186;
            break;
        case 'T':
            tileID = 188;
            break;
        case 'U':
            tileID = 234;
            break;
        case 'V':
            tileID = 236;
            break;
        case 'W':
            tileID = 238;
            break;
        case 'X':
            tileID = 240;
            break;
        case 'Y':
            tileID = 242;
            break;
        case 'Z':
            tileID = 244;
            break;
        case ':':
            tileID = 252;
        default:
            tileID = -1;
            break;
    }
        (((SB*) 0x6000000)[sb].tilemap[((y) * (32) + (thisX))] = (tileID));
        thisX++;
        string++;
    }
}
