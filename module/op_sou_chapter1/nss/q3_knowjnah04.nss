// the PC doesn't know what J'Nah seeks but has high INT

#include "NW_I0_PLOT"

int StartingConditional()
{
    int nPlot = GetLocalInt(GetPCSpeaker(), "q3_Know_Jnah_Artifacts");
    if ((nPlot == 0) && (CheckIntelligenceHigh()))
    {
        return TRUE;
    }
    return FALSE;
}
