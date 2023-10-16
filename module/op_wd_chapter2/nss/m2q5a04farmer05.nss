#include "NW_I0_PLOT"
int StartingConditional()
{
    int iPlot1 = GetLocalInt(GetModule(),"LEAHISDEAD");
    int iPlot2 = GetLocalInt(GetModule(),"NW_G_LEAH_HOME");
    if ((iPlot1 != 10) && (iPlot2 != 20))
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
