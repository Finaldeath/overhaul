#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot1 = GetLocalInt(GetPCSpeaker(),"PCEvaine_Plot");
    int iPlot2 = GetLocalInt(GetPCSpeaker(),"Evaine_Plot_Explained");
    object oRing = GetItemPossessedBy(GetPCSpeaker(),"Elynwyd_Ring");
    if ((iPlot1 == 6) && ((iPlot2 == 1) || (GetIsObjectValid(oRing))))
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
