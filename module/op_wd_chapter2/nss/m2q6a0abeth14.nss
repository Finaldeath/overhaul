#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot1 = GetLocalInt(GetPCSpeaker(),"PC_Aribeth_Meter");
    int iPlot2 = GetLocalInt(GetPCSpeaker(),"Aarin_Mention1");
    int iPCLevel = GetHitDice(GetPCSpeaker());
    if ((iPlot1 == 2) && (iPlot2 == 0) && (iPCLevel > 7))
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
