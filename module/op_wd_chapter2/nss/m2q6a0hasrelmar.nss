// the player has Relmar's Journal
#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = HasItem(GetPCSpeaker(),"M2Q2GJRNRELMAR");
    return iResult;
}
