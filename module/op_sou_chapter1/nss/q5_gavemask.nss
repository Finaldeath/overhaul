// Tymofarrar has already rewarded with the Mask

void main()
{
    int nReward = GetLocalInt(OBJECT_SELF, "q5_Rewards_Given");

    SetLocalInt(OBJECT_SELF, "q5_Gave_Mask", 1);
    SetLocalInt(OBJECT_SELF, "q5_Rewards_Given", (nReward + 1));
    object oMask = GetItemPossessedBy(OBJECT_SELF, "x1mask");
    if (GetIsObjectValid(oMask))
    {
        ActionPauseConversation();
        ActionGiveItem(oMask, GetPCSpeaker());
        ActionResumeConversation();
    }
}
