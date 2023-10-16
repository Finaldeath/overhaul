// Ferran gives the PC his bow

void main()
{
    object oBow = GetItemPossessedBy(OBJECT_SELF, "q1foot_bow");
    ActionPauseConversation();
    ActionUnequipItem(oBow);
    ActionGiveItem(oBow, GetPCSpeaker());
    ActionResumeConversation();
}
