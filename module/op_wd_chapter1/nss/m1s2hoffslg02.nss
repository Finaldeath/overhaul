#include "nw_i0_plot"
void main()
{
    SetLocalInt(GetModule(),"NW_G_M1S2BroachPlotDone",2);
    ActionPauseConversation();
    ActionTakeItem(GetItemPossessedBy(GetPCSpeaker(),"M1S2Broach"),GetPCSpeaker());
    RewardGP(200,GetPCSpeaker());
    ActionResumeConversation();
}
