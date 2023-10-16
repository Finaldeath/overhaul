void main()
{
    object oGem = GetItemPossessedBy(GetPCSpeaker(),"M2Q1ITGEMSETARA");

    SetLocalInt(OBJECT_SELF,"NW_L_TookSetaraGem",10);
    ActionPauseConversation();
    ActionTakeItem(oGem,GetPCSpeaker());
    ActionDoCommand(DestroyObject(oGem));
    ActionResumeConversation();
}
