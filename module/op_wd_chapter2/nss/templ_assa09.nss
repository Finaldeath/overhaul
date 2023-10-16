#include "NW_I0_Plot"
int StartingConditional()
{
    object oItem=GetItemPossessedBy(GetPCSpeaker(),"ASSA_HEAD01");
    if(GetIsObjectValid(oItem))
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
