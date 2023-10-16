// the player has Letter to Vardoc
#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = HasItem(GetPCSpeaker(),"M2Q1VARDLET");
    return iResult;
}
