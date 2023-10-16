#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPlot = GetItemPossessedBy(GetPCSpeaker(),"ARTI_ITEM01");
    if (!GetIsObjectValid(oPlot))
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
