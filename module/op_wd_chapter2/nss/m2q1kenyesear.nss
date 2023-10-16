#include "nw_i0_plot"

void main()
{
    ActionPauseConversation();
    RewardGP(300, GetPCSpeaker());
    RewardXP("m2q1_Bounty",25, GetPCSpeaker());
    ActionTakeItem(GetItemPossessedBy(GetPCSpeaker(),"M2Q05IYESGAREAR"),GetPCSpeaker());
    ActionResumeConversation();
}
