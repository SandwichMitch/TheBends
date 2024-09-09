#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "player.h"
#include "state.h"
#include "game.h"
#include "fish.h"

//#include "collisionmap.h"

#define BOBBER_HEIGHT 5
#define BOBBER_Y_START 10
#define BOBBER_X_START 5
//#define BOBBER_REACH 16

#define PRESSURE_INTERVAL 30

#define MAPWIDTH 32 * 8
#define MAPHEIGHT 160 * 8

#define BOTTOM_OF_OCEAN 1200

PLAYER player;
//SPRITE cursor;
BOBBER bobber;
extern FISH treasure;
//extern int state;

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

// void initCursor() {
//     cursor.x = 120;
//     cursor.y = 80;
//     cursor.width = 16;
//     cursor.height = 16;
// }

void initBobber() {
    bobber.x = 120;
    bobber.y = BOBBER_Y_START;
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
    //player.oxygenLevelAsc = 100;
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

    //animation
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
    // if (state == GAMEAREA1) {
    //     bobber.hide = 0;
    // } else if (state == GAMEAREA2) {
    //     bobber.hide = 0;
    // } else if (state == GAMEAREA3) {
    //     bobber.hide = 0;
    // } else {
    //     bobber.hide = 1;
    // }
    // if (!bobber.hide) {
    //     // if (BUTTON_HELD(BUTTON_DOWN) && bobber.y < SCREENHEIGHT - bobber.height) {
    //     //     bobber.y += bobber.yVel;
    //     // }
    //     // if (BUTTON_HELD(BUTTON_UP) && bobber.y > BOBBER_Y_START + bobber.height) {
    //     //     bobber.y -= bobber.yVel;
    //     // }
    //     // if (BUTTON_PRESSED(BUTTON_A) && player.direction == SWIM_RIGHT) {
    //     //     //bobber.x += BOBBER_REACH;
    //     //     //if (collision)
    //     // }
    //     for (int i = 0; i < MAX_WILD_A1; i++) {
    //         // if (collision) {

    //         // }
    //     }
    //     if (player.direction == SWIM_LEFT) {
    //         bobber.x -= bobber.xVel;
    //     }
    //     if (player.direction == SWIM_RIGHT) {
    //         bobber.x += bobber.xVel;
    //     }
    //  }
            if (bobber.x < 64 || bobber.x + bobber.width > SCREENWIDTH - 64) {
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
        //mgba_printf("firing");
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
                //mgba_printf("player body depressurizing");
                //playerFrameCounter = 0;
            }
        }
        if (player.bodyPressure > player.targetPressure + 10) {
            pressureDanger = 1;
            if (playerFrameCounter % 10 == 0) {
                player.healthPoints -= 2;
                player.hurt = 1;
                //mgba_printf("taking pressure damage!");
            }
        } else {
            pressureDanger = 0;
        }
        //mgba_printf("%d", playerFrameCounter);
        if (playerFrameCounter > 120) {
            //mgba_printf("resetting");
            player.oxygenLevelDsc--;
            //mgba_printf("%d oxygen left", player.oxygenLevelDsc);
            playerFrameCounter = 0;
        }

        // int oldVOff;
        // oldVOff = vOff;
        //mgba_printf("player coord is %d, %d", player.x, player.y);
        if (BUTTON_HELD(BUTTON_DOWN)
        /* && colorAt(leftX, bottomY + player.yVel) && colorAt(rightX, bottomY + player.yVel) */) {
            pressureFrameCounter++;
            //mgba_printf("pressure frame counter %d", pressureFrameCounter);
            player.y += player.yVel;
            if (pressureFrameCounter > PRESSURE_INTERVAL && !(player.y > (MAPHEIGHT - player.height))) {
                //mgba_printf("pressure change down");
                if (player.bodyPressure < externalPressure) {
                    player.bodyPressure += 2 * pressureModifier;
                } 
                externalPressure += pressureModifier;
                pressureFrameCounter = 0;
            }

            //player.ascending = 1;
            //mgba_printf("moving down!");
        }
        if (BUTTON_HELD(BUTTON_UP)
            /* && colorAt(leftX, topY - player.yVel) && colorAt(rightX, topY - player.yVel) */) {
            player.y -= player.yVel;
            pressureFrameCounter--;
            if (pressureFrameCounter < 0 && !(player.y < 8)) {
                externalPressure -= pressureModifier;
                pressureFrameCounter = PRESSURE_INTERVAL;
            }
        }
        //mgba_printf("body pressure is %d, while external pressure is %d", player.bodyPressure, externalPressure);
        if (BUTTON_HELD(BUTTON_LEFT)
            /*    && colorAt(leftX - player.xVel, topY) && colorAt(leftX - player.xVel, bottomY) */) {
            player.direction = SWIM_LEFT;
            player.x -= player.xVel;
            player.isMovingHorizontally = 1;
            //mgba_printf("moving left");
            flip = 1;
        }
        if (BUTTON_HELD(BUTTON_RIGHT)
            /*    && colorAt(rightX + player.xVel, topY) && colorAt(rightX + player.xVel, bottomY)*/) {
            player.direction = SWIM_RIGHT;
            player.x += player.xVel;
            player.isMovingHorizontally = 1;
            flip = 0;
        }
        if (player.isMovingHorizontally) {
            player.width = 32;
            player.height = 16;
        }
        if (BUTTON_PRESSED(BUTTON_A)) {
            fireBobber();
        }
        if (BUTTON_HELD(BUTTON_B)) {
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
        if (player.x + player.width > SCREENWIDTH - 40) {
            player.x = SCREENWIDTH - 40 - player.width;
        }
        //set twilight background
        if (player.y + player.height < 320) {
            BG_PALETTE[2] = RGB(31, 26, 0);
        } else if (player.y + player.height > 320 && player.y + player.height < 640) {
            BG_PALETTE[2] = RGB(0, 31, 31);
        }else if (player.y  + player.height > 640) {
            BG_PALETTE[2] = RGB(15, 0, 31);
        }


        // //reset to shallow if ascending
        // if (player.y  + player.height < 480 && player.ascending) {
        //     REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(26) | BG_SIZE_TALL | 1;
        // }

        // //reset to twilight if ascending
        // if (player.y  + player.height < 960 && player.ascending && player.y > 480) {
        //     REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_TALL | 1;
        // }

        


    //camera management
    hOff = player.x - ((SCREENWIDTH - player.originalWidth) / 2);
    vOff = player.y - ((SCREENHEIGHT - player.originalHeight) / 2);

    currentSBB = XL_BG_START + vOff / 256; 
    // if (!player.ascending && player.direction == SWIM_UP) {
    //     vOff = oldVOff;
    // }

    //mgba_printf("x and hoff is %d, and y and voff is %d", player.x - hOff, player.y - vOff);

    if (player.x < 0) {
        player.x = 0;
    }
    if (player.y < 0) {
        goToWin();
        //player.y = 0;
    }
    if (player.x > (MAPWIDTH - player.width)) {
        player.x = MAPWIDTH - player.width;
    }
    if (player.y > (MAPHEIGHT - player.height)) {
        player.y = MAPHEIGHT - player.height;
    }

    if (hOff < 0) {
        hOff = 0;
    }
    if (vOff < 0) {
        vOff = 0;
    }

    if (hOff > (MAPWIDTH - SCREENWIDTH)) {
        hOff = (MAPWIDTH - SCREENWIDTH);
    }
    if (vOff > (MAPHEIGHT - SCREENHEIGHT)) {
        vOff = (MAPHEIGHT - SCREENHEIGHT);
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
    //mgba_printf("player x is %d, player y is %d, player width is %d, player height is %d", player.x, player.y, player.width, player.height);
}

// inline unsigned char colorAt(int x, int y){
//     return ((unsigned char * ) collisionmapBitmap)[OFFSET(x, y, 256)];
// }

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
        shadowOAM[bobber.oamIndex].attr0 = ATTR0_REGULAR | ATTR0_SQUARE | ATTR0_Y(bobber.y - vOff);
        shadowOAM[bobber.oamIndex].attr1 = ATTR1_TINY | ATTR1_X(bobber.x - hOff);
        shadowOAM[bobber.oamIndex].attr2 = ATTR2_PALROW(7) | ATTR2_TILEID(7, 13);
    } else {
        shadowOAM[bobber.oamIndex].attr0 = ATTR0_HIDE;
    }
}

void drawPlayer() {
        if (player.isMovingHorizontally) {
            shadowOAM[player.oamIndex].attr0 = ATTR0_REGULAR | ATTR0_WIDE | ATTR0_Y(player.y - vOff);
        } else {
            shadowOAM[player.oamIndex].attr0 = ATTR0_REGULAR | ATTR0_TALL | ATTR0_Y(player.y - vOff);
        }
        shadowOAM[player.oamIndex].attr1 = ATTR1_MEDIUM | ATTR1_X(player.x - hOff);
        //mgba_printf("flip is %d", flip);
        if (flip) {
            //mgba_printf("flipping!");
            shadowOAM[player.oamIndex].attr1 |= ATTR1_HFLIP;
        }
        if (player.isMovingHorizontally) {
            shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(player.currentFrame * 4 + 1, 4);
        } else {
            shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(player.currentFrame * 2 + 1, 0);
        }
        if (player.cheat) {
            shadowOAM[player.oamIndex].attr2 |= ATTR2_PALROW(8);
        } else {
            shadowOAM[player.oamIndex].attr2 |= ATTR2_PALROW(0);
        }
        if (player.hurt) {
            shadowOAM[player.oamIndex].attr2 |= ATTR2_PALROW(6);
        }

        REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(currentSBB) | BG_SIZE_TALL | 1; ;
        //REG_BG0HOFF = hOff;
        REG_BG0VOFF = vOff % 256;
}