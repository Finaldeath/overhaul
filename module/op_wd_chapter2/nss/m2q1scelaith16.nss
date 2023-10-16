// when the player has accepted Elaith's quest
#include "m2_i0_plot"

int StartingConditional()
{
    int iResult;

    iResult = GetPartyLocalInt(GetPCSpeaker(),"NW_ELAITH_PLOT") == 2;
    return iResult;
}
