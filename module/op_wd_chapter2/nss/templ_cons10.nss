#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPlot = GetItemPossessedBy(GetPCSpeaker(),"CONS_ITEM02");
    int oDone = GetLocalInt(OBJECT_SELF,"HAS_CONS_ITEM02");
    if ((!GetIsObjectValid(oPlot)) && (oDone == 0))
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
