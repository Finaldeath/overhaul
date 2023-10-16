#include "nw_i0_plot"

void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_L_XPGiven") == FALSE)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_XPGiven",TRUE);
        RewardXP("m1q4_Amulet",100,GetPCSpeaker());
    }
    ActionPauseConversation();
    ActionTakeItem(GetItemPossessedBy(GetPCSpeaker(),"M1Q04INOBAMULET"),GetPCSpeaker());
    ActionResumeConversation();
    AutoAlignG(DC_EASY, GetPCSpeaker());
    RewardGP(400,GetPCSpeaker());
}
