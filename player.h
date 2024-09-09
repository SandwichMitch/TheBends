#ifndef PLAYER_H
#define PLAYER_H

void initPlayer();
void initCursor();
void initBobber();
void updateBobber();
void updatePlayer();
void fireBobber();
void drawBobber();
void drawPlayer();

//inline unsigned char colorAt(int x, int y);

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

#endif