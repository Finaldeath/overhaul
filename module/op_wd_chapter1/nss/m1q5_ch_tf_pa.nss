#include "NW_I0_Plot"
int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_G_M1Q5MainPlot") < 100 &&
                CheckCharismaHigh() &&
                GetLocalInt(OBJECT_SELF,"L_TALKTIMES") < 1;
    return bCondition;
}
