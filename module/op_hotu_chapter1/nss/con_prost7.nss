// checks to see that the PC has 200 gp

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = (GetGold(GetPCSpeaker()) > 199);
    return iResult;
}
