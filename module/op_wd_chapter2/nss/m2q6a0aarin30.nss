#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot1 = GetLocalInt(GetPCSpeaker(),"PC_Aarin_Meter");
    if ((iPlot1 == 0))
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
