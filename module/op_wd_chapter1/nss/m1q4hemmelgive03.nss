void main()
{
    ActionPauseConversation();
    ActionGiveItem(GetItemPossessedBy(OBJECT_SELF,"M1Q04IAUCTION"),GetPCSpeaker());
    ActionResumeConversation();
}
