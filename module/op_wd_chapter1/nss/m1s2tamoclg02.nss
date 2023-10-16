#include "NW_I0_Plot"
int StartingConditional()
{

    return GetLocalInt(GetModule(),"NW_G_M1S2BroachPlotDone") == FALSE &&
           CheckIntelligenceLow();
}

