#include "m2_i0_plot"
#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetPartyLocalInt(GetPCSpeaker(),"NW_ELAITH_PLOT");
    if (iPlot == 1)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
