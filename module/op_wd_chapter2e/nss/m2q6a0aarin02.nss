#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetPCSpeaker(),"Aribeth_Explained_Orders");
    if (iPlot == 1)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
