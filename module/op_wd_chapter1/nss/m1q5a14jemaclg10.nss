#include "NW_I0_Plot"
void main()
{
    object oPC = GetPCSpeaker();
    if(GetLocalInt(OBJECT_SELF,"NW_L_RewardGiven") == FALSE)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_RewardGiven",TRUE);
        ActionPauseConversation();
        ActionGiveItem(GetItemPossessedBy(OBJECT_SELF,"M1Q5Signet1"),oPC);
        ActionResumeConversation();
        RewardGP(100,oPC);
    }

}
