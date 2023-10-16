#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot1 = GetLocalInt(GetPCSpeaker(),"PC_Aarin_Meter");
    int iPCLevel = GetHitDice(GetPCSpeaker());
    if ((iPlot1 == 6) && (iPCLevel > 10))
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
