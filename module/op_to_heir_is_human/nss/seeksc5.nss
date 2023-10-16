#include "NW_I0_PLOT"

int StartingConditional()
{
    return GetLocalInt(GetModule(),"Heir_Plot")==80&&
           CheckIntelligenceNormal();
}

