#include "NW_I0_PLOT"
#include "M3PlotInclude"
int StartingConditional()
{
    return CheckIntelligenceNormal() && PlayerHasGolemPassAmulet(GetPCSpeaker());
    ////  && Check player has pass amulet (MAcAmFiGiantP3Q4)
}

