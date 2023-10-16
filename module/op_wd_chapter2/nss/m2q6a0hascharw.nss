// the player has Charwood cultist's Journal
#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = HasItem(GetPCSpeaker(),"M2Q3G_CULTJOURN");
    return iResult;
}
