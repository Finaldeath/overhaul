#include "NW_I0_plot"
void main()
{
    RewardGP(GetLocalInt(OBJECT_SELF,"NW_L_GoldRewarded"),GetPCSpeaker());
    if(GetLocalInt(OBJECT_SELF,"NW_L_ItemRewarded"))
    {
        object oReward = CreateItemOnObject("nw_wswmls002");
        ActionPauseConversation();
        ActionGiveItem(oReward,GetPCSpeaker());
        ActionResumeConversation();
    }
    SetLocalInt(OBJECT_SELF,"NW_L_RewardGiven",TRUE);
}
