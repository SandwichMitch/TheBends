#include "game.h"
#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "oceanbg.h"
#include "beachocean.h"
#include "fish.h"
#include "player.h"
#include "finalprojectspritesheet.h"
#include "finalprojecttilesheetM3.h"

#include "digitalSound.h"
#include "loopingTrack.h"
#include "shortDing.h"
#include "userinterfacediving.h"

#include "newoceanmapXLBIGTEST.h"

#define UI_SCREENBLOCK 8

extern PLAYER player;
extern int externalPressure;
extern int pressureDanger;
int frameCounter;
int totalMinutes;
int totalSeconds;

int hurtFrames;
void initGame() {
    REG_DISPCTL = MODE(0) | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(XL_BG_START) | BG_SIZE_TALL | 1; 
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(UI_SCREENBLOCK) | BG_SIZE_SMALL | 0; 



    DMANow(3, finalprojecttilesheetM3Pal, BG_PALETTE, finalprojecttilesheetM3PalLen / 2);
    DMANow(3, finalprojecttilesheetM3Tiles, &CHARBLOCK[0], finalprojecttilesheetM3TilesLen / 2);

    DMANow(3, userinterfacedivingMap, &SCREENBLOCK[UI_SCREENBLOCK], userinterfacedivingMapLen / 2);
    DMANow(3, newoceanmapXLBIGTESTMap, &SCREENBLOCK[XL_BG_START], newoceanmapXLBIGTESTMapLen / 2);
    // DMANow(3, twilightwaterMap, &SCREENBLOCK[28], shallowwaterMapLen / 2);
    // DMANow(3, deepestwaterMap, &SCREENBLOCK[30], shallowwaterMapLen / 2);

    DMANow(3, finalprojectspritesheetTiles, &CHARBLOCK[4], finalprojectspritesheetTilesLen / 2);
    DMANow(3, finalprojectspritesheetPal, SPRITE_PALETTE, 256);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    playSoundA(loopingTrack_data, loopingTrack_length, 1);
    totalMinutes = 2;
    totalSeconds = 0;
    //setupTimers();

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
    // mgba_printf("Fifo: %c %c %c %c", 
    //     ((char*) REG_FIFO_A) + 0, 
    //     ((char*) REG_FIFO_A) + 1, 
    //     ((char*) REG_FIFO_A) + 2, 
    //     ((char*) REG_FIFO_A) + 3
    // );
    //mgba_printf("timer %02d:%02d", totalMinutes, totalSeconds);
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
    //mgba_printf(healthPointBuffer);
    sprintf(oxygen1Buffer, "%03d", player.oxygenLevelDsc);
    //sprintf(oxygen2Buffer, "%03d", player.oxygenLevelAsc);

    sprintf(internalPressureBuffer, "%03d", player.bodyPressure);
    sprintf(externalPressureBuffer, "%03d", externalPressure);
    sprintf(depthBuffer, "%04d", player.y);

    sprintf(bagCapBuffer, "%03d", basket.currentCapacity);
    sprintf(bagPriceBuffer, "%03d", basket.totalValue);
}

void drawUI() {
    tilePrinter(healthPointBuffer, 2, 3, UI_SCREENBLOCK);
    tilePrinter(oxygen1Buffer, 2, 6, UI_SCREENBLOCK);
    //tilePrinter(oxygen2Buffer, 2, 9, UI_SCREENBLOCK);
    tilePrinter(internalPressureBuffer, 2, 12, UI_SCREENBLOCK);
    if (pressureDanger) {
        mgba_printf("pressure danger!");
        for (int i = 2; i < 5; i++) {
            SCREENBLOCK[UI_SCREENBLOCK].tilemap[OFFSET(i, 12, 32)] |= TILEMAP_ENTRY_PALROW(2);
        }
    } else {
        for (int i = 2; i < 5; i++) {
            SCREENBLOCK[UI_SCREENBLOCK].tilemap[OFFSET(i, 12, 32)] |= TILEMAP_ENTRY_PALROW(0);
        }
    }
    tilePrinter(externalPressureBuffer, 2, 15, UI_SCREENBLOCK);
    tilePrinter(depthBuffer, 2, 18, UI_SCREENBLOCK);

    tilePrinter(bagCapBuffer, 26, 4, UI_SCREENBLOCK);
    tilePrinter(bagPriceBuffer, 26, 7, UI_SCREENBLOCK);
}

void tilePrinter(char* string, int x, int y, int sb) {
    //mgba_printf("%s is being drawn!", string);
    int thisX = x;
    int tileID;
    while (*string != '\0') {
        char currChar = *string;
            // Convert currChar to uppercase for case-insensitive comparison
    //currChar = toupper(currChar);

    // Check each character individually and assign tileID accordingly
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
            tileID = -1; // Set tileID to some other value if currChar is not within the specified range
            break;
    }
        setTile(thisX, y, tileID, sb);
        thisX++;
        string++;
    }
}


