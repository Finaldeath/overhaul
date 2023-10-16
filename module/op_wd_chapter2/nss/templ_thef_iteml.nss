#include "NW_I0_Plot"
int StartingConditional()
{
    object oItem=GetItemPossessedBy(GetPCSpeaker(),"THEFT_ITEM01");
    if(GetIsObjectValid(oItem))
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
