#include "m2_i0_plot"
#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceLow() &&
              GetPartyLocalInt(GetPCSpeaker(),"NW_ELAITH_PLOT") >= 2;
    return iResult;
}
