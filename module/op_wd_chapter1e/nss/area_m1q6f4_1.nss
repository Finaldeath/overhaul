//:://////////////////////////////////////////////
/*
    Updates M1Q6_End when player enters final area
    on the way to fight Desther
*/
//:://////////////////////////////////////////////
//:: Created By: Luke Kristjanson
//:: Created On: Feb 27, 2002
//:://////////////////////////////////////////////

#include "M1_Plot"
void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetLocalInt(oPC, "NW_JOURNAL_ENTRYM1Q6_End") > 50)
        {
            AddJournalQuestEntry("M1Q6_End", 50, oPC);
        }
    }
    AutoSave(oPC);
}

