// the player has Ganon's Journal
#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = HasItem(GetPCSpeaker(),"M2Q5CULTJRNL");
    return iResult;
}
