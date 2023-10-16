#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot1 = GetLocalInt(GetPCSpeaker(),"PC_Aarin_Meter");
    int iPCLevel = GetHitDice(GetPCSpeaker());
    if ((iPlot1 == 4) && (iPCLevel > 9))
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
