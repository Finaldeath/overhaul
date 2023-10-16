#include "NW_I0_Plot"
int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_G_M1Q5PlotCult") >= 10 &&
                      CheckIntelligenceLow();
    return bCondition;
}
