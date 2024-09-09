#ifndef STATE_H
#define STATE_H

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

#endif