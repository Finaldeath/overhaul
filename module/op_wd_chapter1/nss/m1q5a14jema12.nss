#include "nw_I0_Plot"
void main()
{
    ActionPauseConversation();
    ActionTakeItem(GetItemPossessedBy(GetPCSpeaker(),"M1Q5Signet1"),GetPCSpeaker());
    ActionResumeConversation();
    RewardXP("M1Q5_Begg_Bro",100,GetPCSpeaker());
    SetLocalInt(OBJECT_SELF,"RingGiven", TRUE);
}
