#include "NW_I0_Plot"
int StartingConditional()
{
    object oItem1=GetItemPossessedBy(GetPCSpeaker(),"ASSA_ITEM01");
    object oItem2=GetItemPossessedBy(GetPCSpeaker(),"ASSA_HEAD01");
    if ((!GetIsObjectValid(oItem1)) && (!GetIsObjectValid(oItem2)))
    {
        object oVictim=GetObjectByTag("AssaVictimGEN1");
        if (!GetIsObjectValid(oVictim))
        {
            return CheckIntelligenceNormal();
        }
        return FALSE;
    }
    return FALSE;
}
