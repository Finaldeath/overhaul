//::///////////////////////////////////////////////
//:: m3q3b_nax_7
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the journal entry on the PC when Nax dies.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    April 18, 2002
//:://////////////////////////////////////////////

void main()
{
    if (GetIsPC(GetLastKiller()))
    {
        object oPC = GetLastKiller();
        AddJournalQuestEntry("M3Q3BFreeNax",99,oPC);
    }
    else
    {
        object oPC =GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,PLAYER_CHAR_IS_PC);
        AddJournalQuestEntry("M3Q3BFreeNax",99,oPC);
}   }
