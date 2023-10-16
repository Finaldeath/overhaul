//:://////////////////////////////////////////////
/*
    Updates the M1Q5_Begg_2b and 3b quest log
    when the player enters the last area before Gulnan, but
    only if they are already on the plot.
    Updates the M1Q1_Begg_1 for the player, and M1Q5_NEWS quest
    log for everyone
*/
//:://////////////////////////////////////////////
//:: Created By: Luke Kristjanson
//:: Created On: Dec 16, 2001
//:://////////////////////////////////////////////
#include "M1_Plot"
void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        int iSCBState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYM1Q5_Begg_2b");
        int iGulnanState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYM1Q5_Begg_3b");

        AddJournalQuestEntry("M1Q1_Begg_1", 40, oPC);
        //AddJournalQuestEntry("M1Q5_NEWS", 50, oPC, TRUE, TRUE);

        if (iSCBState > 1&&
            !GetIsObjectValid(GetLocalObject(GetModule(),"NW_G_M1Q5C04Drawl")))
        {
            AddJournalQuestEntry("M1Q5_Begg_2b", 72, oPC);
        }
        if (iGulnanState > 1)
        {
            AddJournalQuestEntry("M1Q5_Begg_3b", 45, oPC);
        }
    }
    AutoSave(oPC);
}

