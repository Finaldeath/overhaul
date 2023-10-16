// Bela has told the PC to go and see Oreth

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"Sent_To_Oreth");
    if (iPlot == 1)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
