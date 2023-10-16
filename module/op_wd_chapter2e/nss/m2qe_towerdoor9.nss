//::///////////////////////////////////////////////
//:: m2qE Tower Door OnOpen script
//:: m2qE_TowerDoor9
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Update journal when the Tower Door opens.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);

    AddJournalQuestEntry("m2qE_Main", 20, oPC);
}
