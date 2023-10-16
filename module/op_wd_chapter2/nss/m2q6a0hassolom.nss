// the player has Solomon's Letter
#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = HasItem(GetPCSpeaker(),"M2Q06ILETTSOLOMO");
    return iResult;
}
