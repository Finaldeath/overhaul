#include "NW_I0_PLOT"
int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"Knows_Mutamin_Store");
    if (iPlot == 0)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
