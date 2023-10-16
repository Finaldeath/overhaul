//::///////////////////////////////////////////////
//:: bk_playerenter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If a player enters Chapter 3 without
    a reaper relic, give them one and a rogue stone
    too.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();

    //Strip the Relic of the Reaper
    if (GetIsObjectValid(GetItemPossessedBy(oPC, "x2_p_reaper")) == FALSE)
    {
                 //CreateItemOnObject("x2_p_reaper", oPC);
                 //CreateItemOnObject("x2_p_rogue", oPC);
    }

    //Add initial journal entry
    AddJournalQuestEntry("XP2_Main", 10, oPC, TRUE, TRUE);
}
