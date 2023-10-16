#include "NW_I0_PLOT"

int StartingConditional()
{
    object oItem = GetItemPossessedBy(GetPCSpeaker(),"2Q4_Kurth_Head");
    if (GetIsObjectValid(oItem))
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
