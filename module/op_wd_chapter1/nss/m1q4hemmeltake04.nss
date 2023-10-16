#include "NW_I0_Plot"
void main()
{
    ActionTakeItem(GetItemPossessedBy(GetPCSpeaker(),"M1Q04INOBAMULET"),GetPCSpeaker());
    if(GetLocalInt(OBJECT_SELF,"NW_L_XPGiven") == FALSE)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_XPGiven",TRUE);
        RewardXP("m1q4_Amulet",100,GetPCSpeaker());
    }
}
