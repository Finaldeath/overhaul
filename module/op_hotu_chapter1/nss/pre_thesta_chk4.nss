// checks to see that the PC has 500 gp
// and that the PC is of low intelligence

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = ((GetGold(GetPCSpeaker()) > 499) && (CheckIntelligenceNormal()));
    return iResult;
}
