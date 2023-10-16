#include "nw_i0_plot"

void main()
{
    SetLocalInt(GetModule(), "NW_G_LEAH_HOME", 20);

    ActionPauseConversation();
    ActionTakeItem(GetItemPossessedBy(GetPCSpeaker(),"M2Q05ILEAHRING"),GetPCSpeaker());
    RewardGP(150, GetPCSpeaker());
    RewardXP("m2q5_Gerrol",50, GetPCSpeaker());
    ActionResumeConversation();
}
