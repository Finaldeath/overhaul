#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot1 = GetLocalInt(GetPCSpeaker(),"Working_For_Kurth");
    int iPlot2 = GetLocalInt(GetPCSpeaker(),"Working_For_Baram");
    if ((iPlot1 == 1) && (iPlot2 == 2))
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
