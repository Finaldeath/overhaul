void main()
{
    ActionPauseConversation();
    ActionGiveItem(GetItemPossessedBy(OBJECT_SELF,"M1Q04ILocket"),GetPCSpeaker());
    SetCustomToken(427,GetName(GetPCSpeaker()));
    ActionResumeConversation();
}
