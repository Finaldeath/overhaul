// Bela has told the PC to go and see Rhaine

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"Sent_To_Rhaine");
    if (iPlot == 1)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
