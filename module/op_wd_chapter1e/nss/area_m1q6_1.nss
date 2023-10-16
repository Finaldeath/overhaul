//:://////////////////////////////////////////////
/*
    Updates M1Q6_End upon entry to area
*/
//:://////////////////////////////////////////////
//:: Created By: Luke Kristjanson
//:: Created On: Feb 27, 2002
//:://////////////////////////////////////////////


void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetLocalInt(oPC, "NW_JOURNAL_ENTRYM1Q6_End") > 20)
        {
            AddJournalQuestEntry("M1Q6_End", 20, oPC);
        }
    }
}

