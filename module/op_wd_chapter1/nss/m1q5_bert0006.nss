#include "nw_i0_plot"

void main()
{
    SetLocalInt(OBJECT_SELF,"LItemsReturned",GetLocalInt(OBJECT_SELF,"LItemsReturned") + 1);
    SetLocalInt(OBJECT_SELF,"LStaffSold",GetLocalInt(OBJECT_SELF,"LStaffSold") + 1);

    ActionPauseConversation();
    ActionTakeItem(GetObjectByTag("M1Q5A09Staff"),GetPCSpeaker());
    ActionResumeConversation();

    RewardGP(400,GetPCSpeaker(),FALSE);
    AutoAlignE(DC_EASY, GetPCSpeaker());
}

