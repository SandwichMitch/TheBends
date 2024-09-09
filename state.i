# 1 "state.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "state.c"
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
# 2 "state.c" 2
# 1 "mode0.h" 1



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
# 5 "mode0.h" 2
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 3 "state.c" 2
# 1 "mode4.h" 1
# 13 "mode4.h"
void flipPage();
void setPixel4(int x, int y, unsigned char colorIndex);
void drawRect4(int x, int y, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int x, int y, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);
void drawChar4(int x, int y, char ch, unsigned short colorIndex);
void drawString4(int x, int y, char *str, unsigned short colorIndex);
# 4 "state.c" 2
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
# 5 "state.c" 2
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
# 6 "state.c" 2
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
# 7 "state.c" 2

# 1 "loseScreen.h" 1
# 21 "loseScreen.h"
extern const unsigned short loseScreenBitmap[19200];


extern const unsigned short loseScreenPal[256];
# 9 "state.c" 2
# 1 "pauseScreen.h" 1
# 21 "pauseScreen.h"
extern const unsigned short pauseScreenBitmap[19200];


extern const unsigned short pauseScreenPal[256];
# 10 "state.c" 2
# 1 "winScreen.h" 1
# 21 "winScreen.h"
extern const unsigned short winScreenBitmap[19200];


extern const unsigned short winScreenPal[256];
# 11 "state.c" 2
# 1 "instructions2.h" 1
# 21 "instructions2.h"
extern const unsigned short instructions2Bitmap[19200];


extern const unsigned short instructions2Pal[256];
# 12 "state.c" 2
# 1 "finalprojectstartscreen.h" 1
# 21 "finalprojectstartscreen.h"
extern const unsigned short finalprojectstartscreenBitmap[19200];


extern const unsigned short finalprojectstartscreenPal[256];
# 13 "state.c" 2
# 1 "oceanbg.h" 1







extern const unsigned short oceanbgMap[1024];
# 14 "state.c" 2
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
# 15 "state.c" 2
# 1 "loopingTrack.h" 1


extern const unsigned int loopingTrack_sampleRate;
extern const unsigned int loopingTrack_length;
extern const signed char loopingTrack_data[];
# 16 "state.c" 2
# 1 "shortDing.h" 1


extern const unsigned int shortDing_sampleRate;
extern const unsigned int shortDing_length;
extern const signed char shortDing_data[];
# 17 "state.c" 2
# 1 "wavebg3TM.h" 1







extern const unsigned short wavebg3TMMap[1024];
# 18 "state.c" 2
# 1 "boatbgTM3.h" 1







extern const unsigned short boatbgTM3Map[1024];
# 19 "state.c" 2
# 1 "boatwaveTS.h" 1
# 21 "boatwaveTS.h"
extern const unsigned short boatwaveTSTiles[8192];


extern const unsigned short boatwaveTSPal[256];
# 20 "state.c" 2

# 1 "lobbybgTM.h" 1







extern const unsigned short lobbybgTMMap[2048];
# 22 "state.c" 2
# 1 "lobbybgTS.h" 1
# 21 "lobbybgTS.h"
extern const unsigned short lobbybgTSTiles[8192];


extern const unsigned short lobbybgTSPal[256];
# 23 "state.c" 2

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
# 25 "state.c" 2
# 1 "lobbybgTM2.h" 1







extern const unsigned short lobbybgTM2Map[1024];
# 26 "state.c" 2

# 1 "lobbyUITM.h" 1







extern const unsigned short lobbyUITMMap[1024];
# 28 "state.c" 2
# 1 "finalprojecttilesheetM3.h" 1
# 21 "finalprojecttilesheetM3.h"
extern const unsigned short finalprojecttilesheetM3Tiles[8192];


extern const unsigned short finalprojecttilesheetM3Pal[256];
# 29 "state.c" 2

int won;
int died;
int waveHOff;
int skyHOff;
int lobbyFrameCounter;
int oldState;
int cheatActive;

int score;
int highScore = 0;
extern BASKET basket;

char scoreBuffer[3];
char highScoreBuffer[3];

void initialize() {
    mgba_open();
    buttons = (*(volatile unsigned short*) 0x04000130);
    oldButtons = 0;
    rSeed = 0;
    goToStart();
    setupSounds();
    setupInterrupts();
    cheatActive = 0;


}

void start() {
    rSeed++;






    DMANow(3, &finalprojectstartscreenPal, ((unsigned short*) 0x5000000), 512 / 2);
    drawFullscreenImage4(finalprojectstartscreenBitmap);
    waitForVBlank();
    flipPage();
    if ((!(~(oldButtons) & ((1 << 3))) && (~(buttons) & ((1 << 3))))) {
        srand(rSeed);
        goToLobby();
    }
    if ((!(~(oldButtons) & ((1 << 2))) && (~(buttons) & ((1 << 2))))) {
        goToInstructions();
    }
}

void goToStart() {
    (*(volatile unsigned short*) 0x4000000) = ((4) & 7) | ((1 << (8 + (2 & 3)))) | (1 << 4);
    DMANow(3, &finalprojectstartscreenPal, ((unsigned short*) 0x5000000), 512 / 2);

    won = 0;
    drawFullscreenImage4(finalprojectstartscreenBitmap);
    waitForVBlank();
    flipPage();

    state = START;
}

void instructions() {


    drawFullscreenImage4(instructions2Bitmap);
    waitForVBlank();
    flipPage();
    if ((!(~(oldButtons) & ((1 << 2))) && (~(buttons) & ((1 << 2)))) && oldState != PAUSE) {
        goToStart();
    }
    if ((!(~(oldButtons) & ((1 << 2))) && (~(buttons) & ((1 << 2)))) && oldState == PAUSE) {
        goToPause();
    }
}

void goToInstructions() {
    (*(volatile unsigned short*) 0x4000000) = ((4) & 7) | ((1 << (8 + (2 & 3)))) | (1 << 4);
    DMANow(3, &instructions2Pal, ((unsigned short*) 0x5000000), 512 / 2);

    drawFullscreenImage4(instructions2Bitmap);
    waitForVBlank();
    flipPage();

    state = INSTRUCTIONS;
}
void lobby() {
    waitForVBlank();
    updateLobby();
    drawLobby();
    if ((!(~(oldButtons) & ((1 << 1))) && (~(buttons) & ((1 << 1))))) {
        playSoundB(shortDing_data, shortDing_length, 0);
        if (cheatActive) {
            mgba_printf("cheat disabledd");
            cheatActive = 0;
        } else {
            mgba_printf("cheat enabled");
            cheatActive = 1;
        }
    }
    if ((!(~(oldButtons) & ((1 << 3))) && (~(buttons) & ((1 << 3))))) {
        srand(rSeed);
            (*(volatile unsigned short*) 0x04000010) = 0;
    (*(volatile unsigned short*) 0x04000012) = 0;

    (*(volatile unsigned short*) 0x04000014) = 0;
    (*(volatile unsigned short*) 0x04000016) = 0;
        initArea1();
        goToGameArea1();
    }
}

void updateLobby() {
    waveHOff+=3;
    lobbyFrameCounter++;
    if (lobbyFrameCounter == 5) {
        skyHOff++;
        lobbyFrameCounter = 0;
    }
}

void drawLobby() {
    (*(volatile unsigned short*) 0x04000010) = waveHOff;
    (*(volatile unsigned short*) 0x04000018) = skyHOff;

    tilePrinter(highScoreBuffer, 10, 1, 28);
    tilePrinter(scoreBuffer, 11, 3, 28);
    for (int i = 0; i < 1024; i++) {
        ((SB*) 0x6000000)[28].tilemap[i] |= ((2 & 15) << 12);
    }
}


void goToLobby() {
    (*(volatile unsigned short*) 0x4000000) = ((0) & 7) | ((1 << (8 + (0 & 3)))) | ((1 << (8 + (1 & 3)))) | ((1 << (8 + (2 & 3)))) | ((1 << (8 + (3 & 3))));
    (*(volatile unsigned short*) 0x400000A) = ((1) << 2) | ((27) << 8) | (0 << 14) | 1;
    (*(volatile unsigned short*) 0x4000008) = ((1) << 2) | ((26) << 8) | (0 << 14) | 0;
    (*(volatile unsigned short*) 0x400000C) = ((0) << 2) | ((24) << 8) | (0 << 14)| 3;
    (*(volatile unsigned short*) 0x400000E) = ((2) << 2) | ((28) << 8) | (0 << 14) | 2;

    (*(volatile unsigned short*) 0x04000010) = 0;
    (*(volatile unsigned short*) 0x04000012) = 0;

    DMANow(3, boatwaveTSPal, ((unsigned short*) 0x5000000), 512 / 2);
    DMANow(3, lobbybgTSPal, ((unsigned short*) 0x5000000) + 16, 512 / 2);
    ((unsigned short*) 0x5000000)[34] = (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10);
    DMANow(3, boatwaveTSTiles, &((CB*) 0x6000000)[1], 16384 / 2);
    DMANow(3, lobbybgTSTiles, &((CB*) 0x6000000)[0], 16384 / 2);
    DMANow(3, finalprojecttilesheetM3Tiles, &((CB*) 0x6000000)[2], 16384 / 2);

    DMANow(3, lobbybgTM2Map, &((SB*) 0x6000000)[24], (2048) / 2);
    DMANow(3, boatbgTM3Map, &((SB*) 0x6000000)[27], (2048) / 2);
    DMANow(3, wavebg3TMMap, &((SB*) 0x6000000)[26], (2048) / 2);
    DMANow(3, lobbyUITMMap, &((SB*) 0x6000000)[28], (2048) / 2);
    for (int i = 0; i < 1024; i++) {
        ((SB*) 0x6000000)[24].tilemap[i] |= ((1 & 15) << 12);
        ((SB*) 0x6000000)[28].tilemap[i] |= ((2 & 15) << 12);
    }
    lobbyFrameCounter = 0;


    waveHOff = 0;
    skyHOff = 0;
    if (!died) {
        score = basket.totalValue;
    } else {
        score = 0;
    }
    mgba_printf("Score is %d", score);
    mgba_printf("High score before is %d", highScore);
    if (score > highScore) {
        highScore = score;
        mgba_printf("new high score!");
    }
    mgba_printf("high score is now %d", highScore);
    sprintf(scoreBuffer, "%03d", score);
    sprintf(highScoreBuffer, "%03d", highScore);
    state = LOBBY;
}

void gameArea1() {
    updateGameArea1();
    drawGameArea1();

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*) 0x7000000), 128 * 4);

    if (won) {
        goToWin();
    }
    if ((!(~(oldButtons) & ((1 << 3))) && (~(buttons) & ((1 << 3))))) {
        goToPause();
    }
}

void goToGameArea1() {
    initGame();
    died = 0;
    score = 0;
    state = GAMEAREA1;
}

void gameArea2() {

}

void goToGameArea2() {
    state = GAMEAREA2;
}

void gameArea3() {

}

void goToGameArea3() {
    state = GAMEAREA3;
}

void pause() {

    (*(volatile unsigned short*) 0x4000000) = ((4) & 7) | ((1 << (8 + (2 & 3)))) | (1 << 4);


    drawFullscreenImage4(pauseScreenBitmap);
    waitForVBlank();
    flipPage();
    oldState = PAUSE;
    if ((!(~(oldButtons) & ((1 << 3))) && (~(buttons) & ((1 << 3))))) {
        goToGameArea1();
    }
    if ((!(~(oldButtons) & ((1 << 2))) && (~(buttons) & ((1 << 2))))) {
        goToInstructions();
    }
}

void goToPause() {
    (*(volatile unsigned short*) 0x4000000) = ((4) & 7) | ((1 << (8 + (2 & 3)))) | (1 << 4);
    DMANow(3, &pauseScreenPal, ((unsigned short*) 0x5000000), 512 / 2);

    drawFullscreenImage4(pauseScreenBitmap);
    waitForVBlank();
    flipPage();
    state = PAUSE;
}

void win() {

    DMANow(3, &winScreenPal, ((unsigned short*) 0x5000000), 512 / 2);

    won = 1;
    score = basket.totalValue;
    drawFullscreenImage4(winScreenBitmap);

    waitForVBlank();
    flipPage();
    if ((!(~(oldButtons) & ((1 << 3))) && (~(buttons) & ((1 << 3))))) {
        goToStart();
    }
}

void goToWin() {
    (*(volatile unsigned short*) 0x4000000) = ((4) & 7) | ((1 << (8 + (2 & 3)))) | (1 << 4);
    DMANow(3, &winScreenPal, ((unsigned short*) 0x5000000), 512 / 2);

    score = basket.totalValue;
    drawFullscreenImage4(winScreenBitmap);

    waitForVBlank();
    flipPage();
    state = WIN;
}

void goToLose() {
    (*(volatile unsigned short*) 0x4000000) = ((4) & 7) | ((1 << (8 + (2 & 3)))) | (1 << 4);
    DMANow(3, &loseScreenPal, ((unsigned short*) 0x5000000), 512 / 2);

    died = 1;
    drawFullscreenImage4(loseScreenBitmap);
    waitForVBlank();
    flipPage();
    state = LOSE;
}

void lose() {



    drawFullscreenImage4(loseScreenBitmap);
    waitForVBlank();
    flipPage();
    if ((!(~(oldButtons) & ((1 << 3))) && (~(buttons) & ((1 << 3))))) {
        goToStart();
    }
}
# 344 "state.c"
void setupInterrupts() {

 (*(unsigned short*) 0x4000208) = 0;

    (*(unsigned short*) 0x4000200) = (1 << 0);
    (*(unsigned short*) 0x4000004) = 1 << 3;

    (*((ihp*) 0x03007FFC)) = &interruptHandler;
 (*(unsigned short*) 0x4000208) = 1;

}



void interruptHandler() {

    (*(unsigned short*) 0x4000208) = 0;
# 373 "state.c"
    if ((*(volatile unsigned short*) 0x4000202) & (1 << 0)) {
        if (soundA.isPlaying) {


            soundA.vBlankCount++;
            if (soundA.vBlankCount >= soundA.durationInVBlanks) {
                if (soundA.looping) {

                    playSoundA(soundA.data, soundA.dataLength, soundA.looping);
                } else {

                    soundA.isPlaying = 0;
                    (*(volatile unsigned short*) 0x4000102) = (0 << 7);
                    dma[1].cnt = 0;
                }
            }
        }

        if (soundB.isPlaying) {
            soundB.vBlankCount++;
            if (soundB.vBlankCount >= soundB.durationInVBlanks) {
                if (soundB.looping) {

                    playSoundB(soundB.data, soundB.dataLength, soundB.looping);
                } else {
                    soundB.isPlaying = 0;
                    (*(volatile unsigned short*) 0x4000106) = (0 << 7);
                    dma[2].cnt = 0;
                }
            }
        }
    }

    (*(volatile unsigned short*) 0x4000202) = (*(volatile unsigned short*) 0x4000202);
    (*(unsigned short*) 0x4000208) = 1;

}
