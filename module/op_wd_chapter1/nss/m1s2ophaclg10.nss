#include "NW_I0_Plot"
int StartingConditional()
{
    object oSpeaker = GetPCSpeaker();
    int bCondition = ( (GetIsObjectValid(GetItemPossessedBy(oSpeaker,"M1S2Statue")) &&
                        GetLocalInt(OBJECT_SELF,"NW_L_StatueReturned") == FALSE) ||
                       (GetIsObjectValid(GetItemPossessedBy(oSpeaker,"M1S2Portrait")) &&
                        GetLocalInt(OBJECT_SELF,"NW_L_PortraitReturned") == FALSE) ||
                       (GetIsObjectValid(GetItemPossessedBy(oSpeaker,"M1S2Urn")) &&
                         GetLocalInt(OBJECT_SELF,"NW_L_UrnReturned") == FALSE) ) &&
                     GetLocalInt(OBJECT_SELF,"NW_L_M1S2ArtReturned") < 3 &&
                     CheckIntelligenceNormal();
    return bCondition;
}
