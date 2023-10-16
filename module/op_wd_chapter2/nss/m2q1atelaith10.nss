void main()
{
    object oGem = GetItemPossessedBy(GetPCSpeaker(),"M2Q1ITGEMSHART");

    SetLocalInt(OBJECT_SELF,"NW_L_TookZamithraGem",10);
    ActionPauseConversation();
    ActionTakeItem(oGem,GetPCSpeaker());
    ActionDoCommand(DestroyObject(oGem));
    ActionResumeConversation();
}
