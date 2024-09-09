#include "state.h"
#include "mode0.h"
#include "mode4.h"
#include "sprites.h"
#include "print.h"
#include "game.h"
//#include "menuScreen.h"
#include "loseScreen.h"
#include "pauseScreen.h"
#include "winScreen.h"
#include "instructions2.h"
#include "finalprojectstartscreen.h"
#include "oceanbg.h"
#include "digitalSound.h"
#include "loopingTrack.h"
#include "shortDing.h"
#include "wavebg3TM.h"
#include "boatbgTM3.h"
#include "boatwaveTS.h"

#include "lobbybgTM.h"
#include "lobbybgTS.h"

#include "fish.h"
#include "lobbybgTM2.h"

#include "lobbyUITM.h"
#include "finalprojecttilesheetM3.h"

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
    buttons = REG_BUTTONS;
    oldButtons = 0;
    rSeed = 0;
    goToStart();
    setupSounds();
    setupInterrupts();
    cheatActive = 0;
    //initGame();
    //goToGameArea1();
}

void start() {
    rSeed++;
    // if (BUTTON_PRESSED(BUTTON_START)) {
    //     srand(rSeed);
    //     initArea1();
    //     goToGameArea1();
    // }

    DMANow(3, &finalprojectstartscreenPal, BG_PALETTE, finalprojectstartscreenPalLen / 2);
    drawFullscreenImage4(finalprojectstartscreenBitmap);
    waitForVBlank();
    flipPage();
    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(rSeed);
        goToLobby();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToInstructions();
    }
}

void goToStart() {
    REG_DISPCTL = MODE(4) | BG2_ENABLE | DISP_BACKBUFFER;
    DMANow(3, &finalprojectstartscreenPal, BG_PALETTE, finalprojectstartscreenPalLen / 2);

    won = 0;
    drawFullscreenImage4(finalprojectstartscreenBitmap);
    waitForVBlank();
    flipPage();

    state = START;
}

void instructions() {
    //DMANow(3, &instructions2Bitmap, BG_PALETTE, instructions2BitmapLen / 2);

    drawFullscreenImage4(instructions2Bitmap);
    waitForVBlank();
    flipPage();
    if (BUTTON_PRESSED(BUTTON_SELECT) && oldState != PAUSE) {
        goToStart();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT) && oldState == PAUSE) {
        goToPause();
    }
}

void goToInstructions() {
    REG_DISPCTL = MODE(4) | BG2_ENABLE | DISP_BACKBUFFER;
    DMANow(3, &instructions2Pal, BG_PALETTE, instructions2PalLen / 2);

    drawFullscreenImage4(instructions2Bitmap);
    waitForVBlank();
    flipPage();

    state = INSTRUCTIONS;
}
void lobby() {
    waitForVBlank();
    updateLobby();
    drawLobby();
    if (BUTTON_PRESSED(BUTTON_B)) {
        playSoundB(shortDing_data, shortDing_length, 0);
        if (cheatActive) {
            mgba_printf("cheat disabledd");
            cheatActive = 0;
        } else {
            mgba_printf("cheat enabled");
            cheatActive = 1;
        }
    }
    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(rSeed);
            REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    REG_BG1HOFF = 0;
    REG_BG1VOFF = 0;       
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
    REG_BG0HOFF = waveHOff;
    REG_BG2HOFF = skyHOff;

    tilePrinter(highScoreBuffer, 10, 1, 28);
    tilePrinter(scoreBuffer, 11, 3, 28);
    for (int i = 0; i < 1024; i++) {
        SCREENBLOCK[28].tilemap[i] |= TILEMAP_ENTRY_PALROW(2);
    }
}


void goToLobby() {
    REG_DISPCTL = MODE(0) | BG0_ENABLE | BG1_ENABLE | BG2_ENABLE | BG3_ENABLE;
    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(27) | BG_SIZE_SMALL | 1;
    REG_BG0CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(26) | BG_SIZE_SMALL | 0; 
    REG_BG2CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(24) | BG_SIZE_SMALL| 3;
    REG_BG3CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(28) | BG_SIZE_SMALL | 2;

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    DMANow(3, boatwaveTSPal, BG_PALETTE, boatwaveTSPalLen / 2);
    DMANow(3, lobbybgTSPal, BG_PALETTE + 16, lobbybgTSPalLen / 2);
    BG_PALETTE[34] = RGB(31, 31, 31);
    DMANow(3, boatwaveTSTiles, &CHARBLOCK[1], boatwaveTSTilesLen / 2);
    DMANow(3, lobbybgTSTiles, &CHARBLOCK[0], lobbybgTSTilesLen / 2);
    DMANow(3, finalprojecttilesheetM3Tiles, &CHARBLOCK[2], finalprojecttilesheetM3TilesLen / 2);
    
    DMANow(3, lobbybgTM2Map, &SCREENBLOCK[24], lobbybgTM2MapLen / 2);
    DMANow(3, boatbgTM3Map, &SCREENBLOCK[27], boatbgTM3MapLen / 2);
    DMANow(3, wavebg3TMMap, &SCREENBLOCK[26], wavebg3TMMapLen / 2);
    DMANow(3, lobbyUITMMap, &SCREENBLOCK[28], lobbyUITMMapLen / 2);
    for (int i = 0; i < 1024; i++) {
        SCREENBLOCK[24].tilemap[i] |= TILEMAP_ENTRY_PALROW(1);
        SCREENBLOCK[28].tilemap[i] |= TILEMAP_ENTRY_PALROW(2);
    }
    lobbyFrameCounter = 0;
    //waitForVBlank();
    //DMANow(3, shadowOAM, OAM, 128 * 4);
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
    DMANow(3, shadowOAM, OAM, 128 * 4);

    if (won) {
        goToWin();
    }
    if (BUTTON_PRESSED(BUTTON_START)) {
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
    //drawFullscreenImage4(menuScreenBitmap);
    REG_DISPCTL = MODE(4) | BG2_ENABLE | DISP_BACKBUFFER;
    //DMANow(3, &pauseScreenPal, BG_PALETTE, pauseScreenPalLen / 2);

    drawFullscreenImage4(pauseScreenBitmap);
    waitForVBlank();
    flipPage();
    oldState = PAUSE;
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGameArea1();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToInstructions();
    }
}

void goToPause() {
    REG_DISPCTL = MODE(4) | BG2_ENABLE | DISP_BACKBUFFER;
    DMANow(3, &pauseScreenPal, BG_PALETTE, pauseScreenPalLen / 2);

    drawFullscreenImage4(pauseScreenBitmap);
    waitForVBlank();
    flipPage();
    state = PAUSE;
}

void win() {
    //drawFullscreenImage4(menuScreenBitmap);
    DMANow(3, &winScreenPal, BG_PALETTE, winScreenPalLen / 2);

    won = 1;
    score = basket.totalValue;
    drawFullscreenImage4(winScreenBitmap);
    //drawString4(score, 50, 65, 12);
    waitForVBlank();
    flipPage();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToWin() {
    REG_DISPCTL = MODE(4) | BG2_ENABLE | DISP_BACKBUFFER;
    DMANow(3, &winScreenPal, BG_PALETTE, winScreenPalLen / 2);

    score = basket.totalValue;
    drawFullscreenImage4(winScreenBitmap);
    //drawString4(basket.totalValue, 50, 65, BLACK);
    waitForVBlank();
    flipPage();
    state = WIN;
}

void goToLose() {
    REG_DISPCTL = MODE(4) | BG2_ENABLE | DISP_BACKBUFFER;
    DMANow(3, &loseScreenPal, BG_PALETTE, loseScreenPalLen / 2);

    died = 1;
    drawFullscreenImage4(loseScreenBitmap);
    waitForVBlank();
    flipPage();
    state = LOSE;
}

void lose() {

    //DMANow(3, &loseScreenPal, BG_PALETTE, loseScreenPalLen / 2);

    drawFullscreenImage4(loseScreenBitmap);
    waitForVBlank();
    flipPage();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

// void setupTimers() {

//     REG_IME = 0;

//     // Activity 1.0: Enable timer interrupts
//     REG_IE = IRQ_TIMER(0) | IRQ_TIMER(1);

//     REG_INTERRUPT = &interruptHandler;
//     REG_IME = 1;

//     // Activity 1.1: Setup second timer
//     REG_TM0D = 65536 - 65536;
//     REG_TM0CNT = TIMER_ON | TM_IRQ | TM_FREQ_256;

//     // Activity 1.2: Setup minute timer
//     REG_TM1D = 65536 - 60;
//     REG_TM1CNT = TIMER_ON | TM_IRQ | TM_CASCADE;

// }

void setupInterrupts() {

	REG_IME = 0;

    REG_IE = IRQ_VBLANK;
    REG_DISPSTAT = DISPSTAT_VBLANK;

    REG_INTERRUPT = &interruptHandler;
	REG_IME = 1;

} 

//#define INTERRUPT_FLAGGED(flag) (REG_IF & (flag))

void interruptHandler() {

    REG_IME = 0;

    // if (REG_IF & IRQ_TIMER(0)) {
    //     totalSeconds += 1;
    //     totalSeconds %= 60;
    //     player.oxygenLevel--;
    // }

    // if (REG_IF & IRQ_TIMER(1)) {
    //     totalMinutes += 1;
    //     totalMinutes %= 60;
    // }

    if (REG_IF & IRQ_VBLANK) {
        if (soundA.isPlaying) {
            // mgba_printf("interrupt being handled for sound A");

            soundA.vBlankCount++;
            if (soundA.vBlankCount >= soundA.durationInVBlanks) {
                if (soundA.looping) {
                    //loop sound
                    playSoundA(soundA.data, soundA.dataLength, soundA.looping);
                } else {
                    //stop sound
                    soundA.isPlaying = 0;
                    REG_TM0CNT = TIMER_OFF;
                    dma[1].cnt = 0;
                }
            }
        }

        if (soundB.isPlaying) {
            soundB.vBlankCount++;
            if (soundB.vBlankCount >= soundB.durationInVBlanks) {
                if (soundB.looping) {
                    //loop sound
                    playSoundB(soundB.data, soundB.dataLength, soundB.looping);
                } else {
                    soundB.isPlaying = 0;
                    REG_TM1CNT = TIMER_OFF;
                    dma[2].cnt = 0;
                }
            }
        }
    }

    REG_IF = REG_IF;
    REG_IME = 1;

}
// void switchMode0() {
//     REG_DISPCTL = MODE(0) | BG0_ENABLE | BG1_ENABLE;
// }