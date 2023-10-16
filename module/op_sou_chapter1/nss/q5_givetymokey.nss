// Tymofarrar gives the PC the key to the exit

void main()
{
    object oKey = GetItemPossessedBy(OBJECT_SELF, "q5_Tymo_Exit");

    ActionPauseConversation();
    ActionGiveItem(oKey, GetPCSpeaker());
    ActionResumeConversation();
}
