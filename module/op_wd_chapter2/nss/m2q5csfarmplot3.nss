#include "nw_i0_plot"

void main()
{
    SetLocalInt(GetModule(), "NW_G_M2Q05PLOTDERG", 20);

    ActionPauseConversation();
    ActionTakeItem(GetItemPossessedBy(GetPCSpeaker(),"M2Q5DERGIABHEAD"),GetPCSpeaker());
    RewardGP(150, GetPCSpeaker());
    RewardXP("m2q5_Gerrol",100, GetPCSpeaker());
    ActionResumeConversation();
}
