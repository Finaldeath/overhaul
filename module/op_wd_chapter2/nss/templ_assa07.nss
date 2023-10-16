#include "NW_I0_Plot"
int StartingConditional()
{
    object oItem=GetItemPossessedBy(GetPCSpeaker(),"ASSA_ITEM01");
    if(GetIsObjectValid(oItem))
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
