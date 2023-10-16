// Tymofarrar gives the dust pouch to the PC

void main()
{
    object oGift = GetItemPossessedBy(OBJECT_SELF, "q5_Tymo_Amulet");
    if (GetIsObjectValid(oGift))
    {
        ActionPauseConversation();
        ActionGiveItem(oGift, GetPCSpeaker());
        ActionResumeConversation();
    }
}
