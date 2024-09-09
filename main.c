#include "gba.h"
#include "mode0.h"
#include "mode4.h"
#include "sprites.h"
#include "print.h"
#include "game.h"
#include "state.h"




//void switchMode0();



int main() {
    
    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;
        switch (state) {
            case START:
                start();
                break;
            case INSTRUCTIONS:
                instructions();
                break;
            case LOBBY:
                lobby();
                break;
            case GAMEAREA1:
                gameArea1();
                break;
            case GAMEAREA2:
                gameArea2();
                break;
            case GAMEAREA3:
                gameArea3();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }
    }    

    return 0;
}

