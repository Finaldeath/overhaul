void main()
{
    SetLocalInt(OBJECT_SELF,"LItemsReturned",GetLocalInt(OBJECT_SELF,"LItemsReturned") + 1);
    SetLocalInt(OBJECT_SELF,"LStaffGiven",GetLocalInt(OBJECT_SELF,"LStaffGiven") + 1);

    ActionPauseConversation();
    ActionTakeItem(GetObjectByTag("M1Q5A09Staff"),GetPCSpeaker());
    ActionResumeConversation();
}
