#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPlot = GetItemPossessedBy(GetPCSpeaker(),"CONS_ITEM01");
    int oDone = GetLocalInt(OBJECT_SELF,"HAS_CONS_ITEM01");
    if ((!GetIsObjectValid(oPlot)) && (oDone == 0))
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
