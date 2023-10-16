//:://////////////////////////////////////////////
/*
    Updates the M1Q5_Begg_2b and 3b quest log
    when the player speaks to Jared, but only if they are
    already on the respective plot.
*/
//:://////////////////////////////////////////////
//:: Created By: Luke Kristjanson
//:: Created On: Dec 16, 2001
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    int iSCBState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYM1Q5_Begg_2b");
    int iGulnanState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYM1Q5_Begg_3b");

    if (iSCBState > 1 &&
       GetIsObjectValid(GetLocalObject(GetModule(),"NW_G_M1Q5C04Drawl")))
    {
        AddJournalQuestEntry("M1Q5_Begg_2b", 80, oPC);
    }
    if (iGulnanState > 1)
    {
        AddJournalQuestEntry("M1Q5_Begg_3b", 60, oPC);
    }

}

