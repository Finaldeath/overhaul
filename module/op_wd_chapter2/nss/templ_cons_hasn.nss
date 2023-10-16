#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPlot1 = GetItemPossessedBy(GetPCSpeaker(),"CONS_ITEM01");
    object oPlot2 = GetItemPossessedBy(GetPCSpeaker(),"CONS_ITEM02");
    object oPlot3 = GetItemPossessedBy(GetPCSpeaker(),"CONS_ITEM03");
    if ((GetIsObjectValid(oPlot1)) || (GetIsObjectValid(oPlot2)) || (GetIsObjectValid(oPlot3)))
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
