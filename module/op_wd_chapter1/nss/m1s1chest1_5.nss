#include "NW_I0_Plot"
void main()
{
    object oItem = GetInventoryDisturbItem();
    int nItemBase =GetBaseItemType(oItem);
    if(GetLocalInt(OBJECT_SELF,"NW_L_M1S1Opened") == FALSE &&
       GetTag(oItem) == "M1S1Shield" )
    {
        DestroyObject(oItem);
        object oDoor = GetNearestObjectByTag("M1Q5F03_M1Q5J1");
        AssignCommand(oDoor,ActionOpenDoor(oDoor));
        SetLocked(oDoor,FALSE);
        SetLocalInt(OBJECT_SELF,"NW_L_M1S1Opened",TRUE);
        RewardXP("m1q1_Never",50,GetPCSpeaker());
    }
}
