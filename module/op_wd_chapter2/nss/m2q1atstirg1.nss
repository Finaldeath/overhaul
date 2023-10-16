void main()
{
    ActionPauseConversation();
    ActionGiveItem(GetItemPossessedBy(OBJECT_SELF,"M2Q03ISTIRGEEAR"),GetPCSpeaker());
    ActionResumeConversation();
}
