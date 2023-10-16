#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot1 = GetLocalInt(GetPCSpeaker(),"PC_Aribeth_Meter");
    if (iPlot1 == 8)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
