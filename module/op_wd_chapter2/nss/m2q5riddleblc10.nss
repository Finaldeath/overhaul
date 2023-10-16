#include "nw_i0_plot"

void main()
{
    SetLocalInt(GetPCSpeaker(),"NW_L_M2Q5RiddleB",10);
    ActionGiveItem(GetItemPossessedBy(OBJECT_SELF,"M2Q05ICRYSFROG"),GetPCSpeaker());
    RewardXP("m2q5_Mutamin",25, GetPCSpeaker());
}
