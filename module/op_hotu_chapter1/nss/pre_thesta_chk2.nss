// checks to see that the PC has 10 gp
// and that the PC is of low intelligence

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = ((GetGold(GetPCSpeaker()) > 9) && (CheckIntelligenceLow()));
    return iResult;
}
