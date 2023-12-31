void main()
{
    object oTome = GetItemPossessedBy(GetPCSpeaker(),"M2Q01TIMASKLIFE");
    object oShelf = GetObjectByTag("M2Q1ELTOORSHELF");

    ActionPauseConversation();
    ActionTakeItem(oTome,GetPCSpeaker());
    DestroyObject(oTome);
    CreateItemOnObject("M2Q1SRLIMASKLIFE",oShelf);
    SetLocalInt(OBJECT_SELF,"NW_L_LifeReturned",1);
    SetLocalInt(GetModule(),"NW_G_FoundImaskTome",GetLocalInt(GetModule(),"NW_G_FoundImaskTome") + 1);

    if (GetLocalInt(GetModule(),"NW_G_FoundImaskTome") == 5)
    {
        AddJournalQuestEntry("m2q1_Imaskar", 60, GetPCSpeaker());
    }

    ActionResumeConversation();
}
