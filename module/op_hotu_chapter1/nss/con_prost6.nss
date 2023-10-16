// checks to see that the PC has 100 gp

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = (GetGold(GetPCSpeaker()) > 99);
    return iResult;
}
