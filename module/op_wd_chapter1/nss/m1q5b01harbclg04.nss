#include "NW_I0_Plot"
int StartingConditional()
{

    int bCondition = GetLocalInt(GetModule(),"M1Q1MainPlot") == 0 &&
                     CheckIntelligenceNormal();
    return bCondition;
}
