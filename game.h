#ifndef GAME_H
#define GAME_H

#define SEA_LEVEL 16
void initGame();
void initArea1();
void updateGameArea1();
void drawGameArea1();
void tilePrinter(char* string, int x, int y, int sb);

#define XL_BG_START 26

char oxygen1Buffer[4];
char oxygen2Buffer[4];
char internalPressureBuffer[4];
char externalPressureBuffer[4];
char depthBuffer[4];
char healthPointBuffer[3];

char bagCapBuffer[4];
char bagPriceBuffer[4];


#endif