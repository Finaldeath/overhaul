#include "NW_I0_Plot"
void main()
{
    object oItem = GetInventoryDisturbItem();
    int nItemBase =  GetBaseItemType(oItem);
    if(GetLocalInt(OBJECT_SELF,"NW_L_M1S1Opened") == FALSE &&
       GetTag(oItem) == "M1S1Arrow" )
    {
        DestroyObject(oItem);
        object oDoor = GetObjectByTag("M1S1DDoor");
        AssignCommand(oDoor,ActionOpenDoor(oDoor));
        SetLocked(oDoor,FALSE);
        SetLocalInt(OBJECT_SELF,"NW_L_M1S1Opened",TRUE);
        RewardXP("m1q1_Never",50,GetPCSpeaker());
    }
}
