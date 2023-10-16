// the player has Letter to Neva
#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = HasItem(GetPCSpeaker(),"M2Q06ILETTNEVA");
    return iResult;
}
