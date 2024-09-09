#include "fish.h"
#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "player.h"
#include "state.h"
#include "game.h"
#include "digitalSound.h"
#include "shortDing.h"

extern int vOff;
extern int hOff;
extern BOBBER bobber;
extern PLAYER player;
extern int won;
int activeFish;

void initWildA1() {
    for (int i = 0; i < MAX_WILD_A1; i++) {
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
    for (int i = 0; i < MAX_WILD_A1; i++) {
        if (wildFishArea1[i].type == ANIM) {
            wildFishArea1[i].isAnimating = 1;
        }
        //mgba_printf("%d x and %d y for this fish! Its width is %d and height is %d", wildFishArea1[i].x, wildFishArea1[i].y, wildFishArea1[i].width, wildFishArea1[i].height);
        if (wildFishArea1[i].active) {
            wildFishArea1[i].respawnTimer = 0;
            if (wildFishArea1[i].y < (player.y - SCREENHEIGHT / 2)) {
                wildFishArea1[i].active = 0;
                wildFishArea1[i].respawnTimer = 60;
            }
            if (wildFishArea1[i].y > (player.y + (SCREENHEIGHT / 2))) {
                wildFishArea1[i].active = 0;
                wildFishArea1[i].respawnTimer = 60; 
            }
            if (wildFishArea1[i].x < 64 || wildFishArea1[i].x + wildFishArea1[i].width > SCREENWIDTH - 48) {
                wildFishArea1[i].hide = 1;
            } else {
                wildFishArea1[i].hide = 0;
            }
                 
            //mgba_printf("fish is at %d, %d",wildFishArea1[i].x, wildFishArea1[i].y);
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
                
                if ((wildFishArea1[i].x >= SCREENWIDTH - wildFishArea1[i].width) && wildFishArea1[i].direction == RIGHT) {
                    wildFishArea1[i].active = 0;
                    //wildFishArea1[i].direction = LEFT;
                } else if (wildFishArea1[i].x < 0 && wildFishArea1[i].direction == LEFT) {
                    wildFishArea1[i].active = 0;
                    //wildFishArea1[i].direction = RIGHT;
                }
            }
            //activeFish++;
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
    for (int i = 0; i < MAX_WILD_A1; i++) {
        if (!wildFishArea1[i].active && wildFishArea1[i].respawnTimer <= 0) {
            //wildFishArea1[i].type = ANIM;
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
           // wildFishArea1[i].type = rand() % (typeUpper - typeLower + 1) + typeLower;
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
            int yLower = player.y - SCREENWIDTH / 2 + 20;
            int yMax = player.y + SCREENWIDTH / 2 - 20;
            wildFishArea1[i].y = rand() % (yMax - yLower + 1) + yLower; 
            wildFishArea1[i].direction = rand() % (xMax - xLower + 1) + xLower;
            if (wildFishArea1[i].direction == LEFT) {
                wildFishArea1[i].x = SCREENWIDTH - wildFishArea1[i].width;
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
    if (player.y + SCREENWIDTH / 2 - 1 >= treasure.y && !treasure.hide) {
        treasure.x = 115;
        treasure.active = 1;
        //mgba_printf("activated");
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
            shadowOAM[treasure.oamIndex].attr0 = ATTR0_REGULAR | ATTR0_SQUARE | ATTR0_Y(treasure.y- vOff);
            shadowOAM[treasure.oamIndex].attr1 = ATTR1_TINY | ATTR1_X(115);
            shadowOAM[treasure.oamIndex].attr2 = ATTR2_TILEID(13, 0);   
    } else {
        shadowOAM[treasure.oamIndex].attr0 = ATTR0_HIDE;
    }
}

void drawFishA1() {
    for (int i = 0; i < MAX_WILD_A1; i++) {
        if (wildFishArea1[i].active && !wildFishArea1[i].hide) {
            //mgba_printf("fish %d drawn", i);
            if (wildFishArea1[i].type == ANIM) {
                shadowOAM[wildFishArea1[i].oamIndex].attr0 = ATTR0_REGULAR | ATTR0_SQUARE | ATTR0_Y(wildFishArea1[i].y - vOff);
                shadowOAM[wildFishArea1[i].oamIndex].attr1 = ATTR1_SMALL | ATTR1_X(wildFishArea1[i].x - hOff);
                shadowOAM[wildFishArea1[i].oamIndex].attr2 = ATTR2_PALROW(wildFishArea1[i].palRow) | ATTR2_TILEID(wildFishArea1[i].currentFrame * 2 + 1, 6);
            } else if (wildFishArea1[i].type == FANCY1) {
                shadowOAM[wildFishArea1[i].oamIndex].attr0 = ATTR0_REGULAR | ATTR0_SQUARE | ATTR0_Y(wildFishArea1[i].y - vOff);
                shadowOAM[wildFishArea1[i].oamIndex].attr1 = ATTR1_SMALL | ATTR1_X(wildFishArea1[i].x - hOff);
                shadowOAM[wildFishArea1[i].oamIndex].attr2 = ATTR2_PALROW(wildFishArea1[i].palRow) | ATTR2_TILEID(7, 8);
            } else if (wildFishArea1[i].type == FANCY2) {
                shadowOAM[wildFishArea1[i].oamIndex].attr0 = ATTR0_REGULAR | ATTR0_SQUARE | ATTR0_Y(wildFishArea1[i].y - vOff);
                shadowOAM[wildFishArea1[i].oamIndex].attr1 = ATTR1_SMALL | ATTR1_X(wildFishArea1[i].x - hOff);
                shadowOAM[wildFishArea1[i].oamIndex].attr2 = ATTR2_PALROW(wildFishArea1[i].palRow) | ATTR2_TILEID(3, 8);
            } else if (wildFishArea1[i].type == FANCY3) {
                shadowOAM[wildFishArea1[i].oamIndex].attr0 = ATTR0_REGULAR | ATTR0_SQUARE | ATTR0_Y(wildFishArea1[i].y - vOff);
                shadowOAM[wildFishArea1[i].oamIndex].attr1 = ATTR1_SMALL | ATTR1_X(wildFishArea1[i].x - hOff);
                shadowOAM[wildFishArea1[i].oamIndex].attr2 = ATTR2_PALROW(wildFishArea1[i].palRow) | ATTR2_TILEID(3, 10);
            } else if (wildFishArea1[i].type == HOSTILE) {
                shadowOAM[wildFishArea1[i].oamIndex].attr0 = ATTR0_REGULAR | ATTR0_SQUARE | ATTR0_Y(wildFishArea1[i].y - vOff);
                shadowOAM[wildFishArea1[i].oamIndex].attr1 = ATTR1_SMALL | ATTR1_X(wildFishArea1[i].x - hOff);
                shadowOAM[wildFishArea1[i].oamIndex].attr2 = ATTR2_PALROW(wildFishArea1[i].palRow) | ATTR2_TILEID(16, 14);          
            }
            if (wildFishArea1[i].direction == LEFT && wildFishArea1[i].type == ANIM) {
                shadowOAM[wildFishArea1[i].oamIndex].attr1 |= ATTR1_HFLIP;
            } else if (wildFishArea1[i].direction == RIGHT && !(wildFishArea1[i].type == ANIM)) {
                shadowOAM[wildFishArea1[i].oamIndex].attr1 |= ATTR1_HFLIP;
            }
        } else {
            shadowOAM[wildFishArea1[i].oamIndex].attr0 = ATTR0_HIDE;
        }
    }
}



