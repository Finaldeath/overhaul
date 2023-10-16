void main()
{
    object oGem = GetItemPossessedBy(GetPCSpeaker(),"M2Q1ITGEMWANEV");

    SetLocalInt(OBJECT_SELF,"NW_L_TookWanevGem",10);
    ActionPauseConversation();
    ActionTakeItem(oGem,GetPCSpeaker());
    ActionDoCommand(DestroyObject(oGem));
    ActionResumeConversation();
}
