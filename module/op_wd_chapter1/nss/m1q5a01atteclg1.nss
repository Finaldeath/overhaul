#include "NW_I0_Plot"
int StartingConditional()
{
    int nCondition = GetLocalInt(OBJECT_SELF,"L_TALKTIMES") >= 1 &&
                     GetLocalInt(GetModule(),"NW_G_M1Q1MainPlot") == 0;
    return nCondition;
}
