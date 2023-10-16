void main()
{
    ActionPauseConversation();
    ActionGiveItem(GetItemPossessedBy(OBJECT_SELF,"M1Q5DPassStone"),GetPCSpeaker());
    ActionResumeConversation();
}
