// Evaine has been found but not rescued, intelligence normal

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"PCEvaine_Plot");
    if (iPlot == 10)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
