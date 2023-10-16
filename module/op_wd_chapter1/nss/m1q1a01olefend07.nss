void main()
{
    SetLocalInt(GetModule(),"NW_G_M1S1ArmorReturned",TRUE);
    DestroyObject(GetItemPossessedBy(GetPCSpeaker(),"M1S1Armor"));

// Check the state of the Never's Tomb quest. Update journal entry accordingly
    object oPC = GetPCSpeaker();
    int iGoodState = GetLocalInt(GetModule(),"nw_g_m1q1oleffstate");
    int iEvilState = GetLocalInt(GetModule(),"nw_g_m1q1_Giles");

    //3 total, Giles has none
    if (iGoodState == 40)
    {
        //Finished, good has all
        AddJournalQuestEntry("m1q1_Never", 60, oPC);
        SetLocalInt(GetModule(),"nw_g_m1q1oleffstate", 60);
    }
    //3 total, Olef already has one, Giles already has one
    if (iGoodState == 30 && iEvilState == 20)
    {
        //finish, some good, some bad
        AddJournalQuestEntry("m1q1_Never", 80, oPC);
        SetLocalInt(GetModule(),"nw_g_m1q1oleffstate", 80);
    }

    //3 total, Giles has 2
    if (iGoodState < 30 && iEvilState == 30)
    {
        //Finish, some good, some bad
        AddJournalQuestEntry("m1q1_Never", 80, oPC);
        SetLocalInt(GetModule(),"nw_g_m1q1oleffstate", 80);
    }

    //2 total, Giles has none
    if (iGoodState == 30 && iEvilState < 20)
    {
        AddJournalQuestEntry("m1q1_Never", 40, oPC);
        SetLocalInt(GetModule(),"nw_g_m1q1oleffstate", 40);
    }

    //2 total, Giles has 1

    if (iGoodState < 30 && iEvilState == 20)
    {
        AddJournalQuestEntry("m1q1_Never", 30, oPC);
        SetLocalInt(GetModule(),"nw_g_m1q1oleffstate", 30);
    }

    //1 total

    if (iGoodState < 30 && iEvilState < 20)
    {
        AddJournalQuestEntry("m1q1_Never", 30, oPC);
        SetLocalInt(GetModule(),"nw_g_m1q1oleffstate", 30);
    }

}
