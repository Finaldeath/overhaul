void main()
{
    SetLocalInt(OBJECT_SELF,"LItemsReturned",GetLocalInt(OBJECT_SELF,"LItemsReturned") + 1);
    SetLocalInt(OBJECT_SELF,"LJournalGiven",GetLocalInt(OBJECT_SELF,"LJournalGiven") + 1);

    ActionPauseConversation();
    ActionTakeItem(GetObjectByTag("M1Q5MarcNote"),GetPCSpeaker());
    ActionResumeConversation();
}
