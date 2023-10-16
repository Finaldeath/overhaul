#include "NW_I0_Plot"
int StartingConditional()
{
    int l_iResult;

    l_iResult = CheckIntelligenceNormal() &&
                (GetLocalInt(GetModule(),"NW_G_M1Q5PlotSCB") < 10 ||
                 GetLocalInt(GetModule(),"NW_G_M1Q5PlotCult") < 10);
    return l_iResult;
}
