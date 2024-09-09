#ifndef FISH_H
#define FISH_H

#include "gba.h"
#define MAX_FISH_CAP 20
#define MAX_WILD_A1 5
#define MAX_WILD_A2 20
#define MAX_WILD_A3 20

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
    FISH fishStorage[MAX_FISH_CAP];
} BASKET;

FISH wildFishArea1[MAX_WILD_A1];

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

#endif