void main()
{
    ActionTakeItem(GetItemPossessedBy(GetPCSpeaker(),"M1S1Armor"),GetPCSpeaker());
    SetLocalInt(GetModule(),"NW_G_M1S1ArmorReturned",TRUE);
    SetLocalInt(OBJECT_SELF,"NW_L_M1S1ItemsGiven",GetLocalInt(OBJECT_SELF,"NW_L_M1S1ItemsGiven") + 1);
// Check the state of the Gilles Tomb quest. Update journal entry accordingly
    object oPC = GetPCSpeaker();
    int iGoodState = GetLocalInt(GetModule(),"nw_g_m1q1oleffstate");
    int iEvilState = GetLocalInt(GetModule(),"nw_g_m1q1_Giles");

    //3 total, Olef has none
    if (iEvilState == 30)
    {
        //Finished, evil has all
        AddJournalQuestEntry("m1q1_gilles", 40, oPC);
        SetLocalInt(GetModule(),"nw_g_m1q1_Giles", 40);
    }
    //3 total, Olef already has one, Giles already has one
    if (iGoodState == 30 && iEvilState == 20)
    {
        //finish, some good, some bad
        AddJournalQuestEntry("m1q1_gilles", 50, oPC);
        SetLocalInt(GetModule(),"nw_g_m1q1_Giles", 50);
    }

    //3 total, Oleff has 2
    if (iEvilState < 20 && iGoodState == 40)
    {
        //Finish, some good, some bad
        AddJournalQuestEntry("m1q1_gilles", 50, oPC);
        SetLocalInt(GetModule(),"nw_g_m1q1_Giles", 50);
    }

    //2 total, Oleff has none
    if (iGoodState < 30 && iEvilState == 20)
    {
        AddJournalQuestEntry("m1q1_gilles", 30, oPC);
        SetLocalInt(GetModule(),"nw_g_m1q1_Giles", 30);
    }

    //2 total, Oleff has 1

    if (iGoodState == 30 && iEvilState < 20)
    {
        AddJournalQuestEntry("m1q1_gilles", 20, oPC);
        SetLocalInt(GetModule(),"nw_g_m1q1_Giles", 20);
    }

    //1 total

    if (iGoodState < 30 && iEvilState < 20)
    {
        AddJournalQuestEntry("m1q1_gilles", 20, oPC);
        SetLocalInt(GetModule(),"nw_g_m1q1_Giles", 20);
    }

}

