//:://////////////////////////////////////////////
/*
    Updates M1Q6_One on entry to Chapter One End module area M1Q6A
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

        if (GetLocalInt(oPC, "NW_JOURNAL_ENTRYM1Q6_One") == 0)
        {
            AddJournalQuestEntry("M1Q6_One", 10, oPC);
        }
    }
    AutoSave(oPC);
}

