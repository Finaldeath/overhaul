//:://////////////////////////////////////////////
/*
    Updates the M1Q5_NEWS quest log when players
    enter the Beggar's Nest for the first time.
*/
//:://////////////////////////////////////////////
//:: Created By: Luke Kristjanson
//:: Created On: Dec 16, 2001
//:://////////////////////////////////////////////

#include "M1_Plot"
void main()
{
    object oPC = GetEnteringObject();
    /*
    if (GetIsPC(oPC))
    {
        int iNEWSState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYM1Q5_NEWS");

        if (iNEWSState < 10)
        {
            AddJournalQuestEntry("M1Q5_NEWS", 10, oPC, TRUE, TRUE);
        }
    }
    */
    if(GetTag(oPC) == "Walters104a")
    {
        SetLocalInt(oPC,"NW_L_M1Q5C2Location", 1);
    }
    AutoSave(oPC);

}

