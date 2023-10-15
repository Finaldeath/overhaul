//:://////////////////////////////////////////////
/*
    Updates the JOUR_M1Q0Training quest log when players
    enter the Training area after having encountered Aribeth and the attack
*/
//:://////////////////////////////////////////////
//:: Created By: Luke Kristjanson
//:: Created On: Feb 27, 2002
//:://////////////////////////////////////////////


void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC) && (GetLocalInt(oPC, "NW_JOURNAL_ENTRYJOUR_M1Q0Training") == 30))
    {
         AddJournalQuestEntry("JOUR_M1Q0Training", 35, oPC, TRUE, TRUE);
    }
}

