#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot1 = GetLocalInt(GetPCSpeaker(),"PC_Aribeth_Meter");
    int iPlot2 = GetLocalInt(GetPCSpeaker(),"Aarin_Mention2");
    int iPCLevel = GetHitDice(GetPCSpeaker());
    if ((iPlot1 == 6) && (iPlot2 == 0) && (iPCLevel > 9))
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
